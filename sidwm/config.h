/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetBrainsMono Nerd Font:style:bold:size=10",
                			"Font Awesome 5 Free-Solid:size=10",
					"Font Awesome 5 Free-Regular:size=10",
					"Font Awesome 5 Brands-Regular:size=10",
					"Material Design Icons-Regular:size=12"

};
//static char dmenufont[]             = "Iosevka Term Slab:size=10";
static const unsigned int gappih    =5;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 5;       /* vert inner gap between windows */
static const unsigned int gappoh    = 5;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 5;
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int gappx     = 5;       /* gaps between windows */
static const int vertpad            = 0;       /* vertical padding of bar */
static const int sidepad            = 0;
static const char col_gray1[]       = "#181818";
static const char col_gray2[]       = "#363636";
static const char col_gray3[]       = "#D8DEE9";    // Iosevka Term Slab
static const char col_gray4[]       = "#181818";
static const char col_cyan[]        = "#7CAFC2";

 //7e0cf5 ffd800  5fdde5  // pink efa8e4  // gray a0c1b8 abc2e8 #6886c5 // lighht purple dbc6eb // blue 00bcd4 " //#80bdab";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan },

};

/* launcher commands (They must be NULL terminated) */

static const char* rofi[]      = { "rofi","-show" , "drun" , NULL };
//static const char* wuvy[]      = { "/home/sid/.config/rofi/scripts/backlight.sh", NULL };

static const Launcher launchers[] = {
       /* command       name to display */
	{ rofi,         "" },
	//{ wuvy,          "bee |"},
       };


/* tagging */
//static const char *tags[] = { "Home","Files", "Work" , "Code","Misc"  }; 

static const char *tags[] ={" "," "," "," "," " };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "chromium",  NULL,       NULL,       1 << 8,       0,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "fibonacci.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
        { "(@)",      spiral },
	{ "[\\]",     dwindle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "rofi","-show","drun", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *picom[]   = {"picom", NULL};
static const char *termmm[]   = {"urxvt", NULL};
static const char *pcmanfm[]   = {"pcmanfm", NULL};
static const char *lel[]   = {"st", NULL};
static const char *lul[]   = {"dmenu_run", NULL};
static const char *brow[]   = {"firefox", NULL};
static const char *killtg[]   = {"killall", "-q", "telegram-desktop", NULL};
static const char* wuvy[]      = { "/home/sid/.config/rofi/scripts/backlight.sh", NULL };

 #include "movestack.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
		{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
 	    { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
        { MODKEY|ControlMask,           XK_u,      spawn,          SHCMD("maim | xclip -selection clipboard -t image/png") },
        { MODKEY,                       XK_u,      spawn,          SHCMD("maim --select | xclip -selection clipboard -t image/png") },
        
        { MODKEY|ShiftMask,             XK_y,      spawn,          {.v = picom    }},
        
         { MODKEY ,                     XK_a,      spawn,          {.v = wuvy   }},
        { MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },

	{ MODKEY,                       XK_c,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = lel } },
	{ MODKEY|ControlMask,           XK_Return, spawn,          {.v = termmm } },
        { MODKEY|ControlMask,           XK_c,      spawn,          {.v = brow } },
        { MODKEY|ControlMask,           XK_s,      spawn,          {.v = killtg } },
	{ MODKEY|ControlMask,           XK_p,      spawn,          {.v = pcmanfm } },
		{ MODKEY|ControlMask,           XK_d,      spawn,          {.v = lul} },
        { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	//{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
        { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
        { MODKEY|ControlMask,           XK_q,      setlayout,      {.v = &layouts[3]} },
        { MODKEY|ControlMask,           XK_a,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
        { MODKEY|Mod4Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask  ,  XK_u,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY,                      XK_q,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_n,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_m,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
        { MODKEY|ControlMask,           XK_w,   		setborderpx,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_e,           	setborderpx,    {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
       // { ClkWinTitle,          0,              Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

