/*
 * hidden - A small program to listen all windows with _NET_WM_STATE set to
 * Iconic.
 *
 * Copyright (c) 2012 Michael Cardell Widerkrantz, mc at the domain
 * hack.org.
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <getopt.h>
#include <xcb/xcb.h>
#include <xcb/xcb_icccm.h>

xcb_connection_t *conn;
xcb_screen_t *screen;

xcb_atom_t wm_state;
xcb_atom_t wm_icon_name;

bool printcommand = false;
bool iconname     = false;

static uint32_t get_wm_state(xcb_drawable_t win);
static int findhidden(void);
static void init(void);
static void cleanup(void);
static xcb_atom_t getatom(char *atom_name);
static void printhelp(void);

uint32_t get_wm_state(xcb_drawable_t win)
{
    xcb_get_property_reply_t *reply;
    xcb_get_property_cookie_t cookie;
    uint32_t *statep;
    uint32_t state = 0;

    cookie = xcb_get_property(conn, false, win, wm_state, wm_state, 0,
                              sizeof (int32_t));

    reply = xcb_get_property_reply(conn, cookie, NULL);
    if (NULL == reply)
    {
        fprintf(stderr, "mcwm: Couldn't get properties for win %d\n", win);
        return -1;
    }

    /* Length is 0 if we didn't find it. */
    if (0 == xcb_get_property_value_length(reply))
    {
        goto bad;
    }

    statep = xcb_get_property_value(reply);
    state = *statep;

bad:
    free(reply);
    return state;
}

/*
 * List all hidden windows.
 *
 */
int findhidden(void)
{
    xcb_query_tree_reply_t *reply;
    int i;
    int len;
    xcb_window_t *children;
    xcb_get_window_attributes_reply_t *attr;
    uint32_t state;
    xcb_get_property_cookie_t cookie;
    xcb_icccm_get_text_property_reply_t prop;
    xcb_generic_error_t *error;

    /* Get all children. */
    reply = xcb_query_tree_reply(conn,
                                 xcb_query_tree(conn, screen->root), 0);
    if (NULL == reply)
    {
        return -1;
    }

    len = xcb_query_tree_children_length(reply);
    children = xcb_query_tree_children(reply);

    /* List all hidden windows on this root. */
    for (i = 0; i < len; i ++)
    {
        attr = xcb_get_window_attributes_reply(
            conn, xcb_get_window_attributes(conn, children[i]), NULL);

        if (!attr)
        {
            fprintf(stderr, "Couldn't get attributes for window %d.",
                    children[i]);
            continue;
        }

        /*
         * Don't bother windows in override redirect mode.
         *
         * This mode means they wouldn't have been reported to us
         * with a MapRequest if we had been running, so in the
         * normal case we wouldn't have seen them.
         */
        if (!attr->override_redirect)
        {
            state = get_wm_state(children[i]);
            if (state == XCB_ICCCM_WM_STATE_ICONIC)
            {
                uint8_t rc = 1;
                /*
                 * Example names:
                 *
                 * _NET_WM_ICON_NAME(UTF8_STRING) = 0x75, 0x72, 0x78,
                 * 0x76, 0x74 WM_ICON_NAME(STRING) = "urxvt"
                 * _NET_WM_NAME(UTF8_STRING) = 0x75, 0x72, 0x78, 0x76,
                 * 0x74 WM_NAME(STRING) = "urxvt"
                 */
                if (false == iconname)
                {
                   cookie = xcb_icccm_get_wm_name(conn, children[i]);
                   rc = xcb_icccm_get_wm_name_reply(conn, cookie, &prop, &error);
                }

                if ((true == iconname) || (1 != rc))
                {
                   /*
                    * get wm name request failed. Try to grab
                    * the icon name just in case that works
                    */
                   cookie = xcb_icccm_get_wm_icon_name(conn, children[i]);
                   rc = xcb_icccm_get_wm_icon_name_reply(conn, cookie, &prop, &error);
                }

                if (1 == rc)
                {
                  prop.name[prop.name_len] = '\0';
                }
                else
                {
                   /*
                    * get_wm_icon_name_reply returned an error, so prop
                    * doesn't point to valid memory. At best it points
                    * to the last successful request
                    */
                  fprintf(stderr, "Couldn't get name for window %d.",
                          children[i]);
                }

                if (printcommand)
                {
                    /* FIXME: Need to escape : in prop.name. */
                    printf("'%s':'xdotool windowactivate 0x%x windowraise 0x%x'\n",
                           (1 == rc)?prop.name:"(unamed)",
                           children[i], children[i]);
                }
                else
                {
                    puts((1 == rc)?prop.name:"(unamed)");
                }
            }
        } /* if not override redirect */

        free(attr);
    } /* for */

    free(reply);

    return 0;
}

void init(void)
{
    int scrno;
    xcb_screen_iterator_t iter;

    conn = xcb_connect(NULL, &scrno);
    if (!conn)
    {
        fprintf(stderr, "can't connect to an X server\n");
        exit(1);
    }

    iter = xcb_setup_roots_iterator(xcb_get_setup(conn));

    for (int i = 0; i < scrno; ++i)
    {
        xcb_screen_next(&iter);
    }

    screen = iter.data;

    if (!screen)
    {
        fprintf(stderr, "can't get the current screen\n");
        xcb_disconnect(conn);
        exit(1);
    }
}

void cleanup(void)
{
    xcb_disconnect(conn);
}

/*
 * Get a defined atom from the X server.
 */
xcb_atom_t getatom(char *atom_name)
{
    xcb_intern_atom_cookie_t atom_cookie;
    xcb_atom_t atom;
    xcb_intern_atom_reply_t *rep;

    atom_cookie = xcb_intern_atom(conn, 0, strlen(atom_name), atom_name);
    rep = xcb_intern_atom_reply(conn, atom_cookie, NULL);
    if (NULL != rep)
    {
        atom = rep->atom;
        free(rep);
        return atom;
    }

    /*
     * XXX Note that we return 0 as an atom if anything goes wrong.
     * Might become interesting.
     */
    return 0;
}

void printhelp(void)
{
    printf("hidden: Usage: hidden [-c] [-i]\n");
    printf("  -c print 9menu/xdotool compatible output.\n");
    printf("  -i print icon name instead of window name.\n");
}

int main(int argc, char **argv)
{
    int ch;                     /* Option character */

    while (1)
    {
        ch = getopt(argc, argv, "ci");
        if (-1 == ch)
        {
            /* No more options, break out of while loop. */
            break;
        }
        switch (ch)
        {
        case 'c':
            printcommand = true;
            break;

        case 'i':
            iconname = true;
            break;

        default:
            printhelp();
            exit(0);
        } /* switch ch */
    } /* while 1 */

    init();
    wm_state = getatom("_NET_WM_STATE");
    findhidden();
    cleanup();
    exit(0);
}
