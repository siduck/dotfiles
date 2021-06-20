# :thumbsup:nice

**N.B. This branch is for Awesome v4.3 git. [You can find the branch for Awesome v4.3 stable here](https://github.com/mut-ex/awesome-wm-nice/tree/awesome-4v3-stable)**

nice is an easy to use, highly configurable extension for **[Awesome WM](https://awesomewm.org/)** that adds beautiful window decorations (and extra functionality!) to clients. It...

* ...adds a **subtle 3D look**, and soft, **rounded anti-aliased, corners** to windows
* ...picks the window **decoration color based on the client content for a seamless look** , and adjusts the window title text color accordingly
* ...**auto-generates titlebar buttons** (and their states) for you based on the colors your pick *or* you can let it pick the colors for you!
* ...allows you to customize which titlebar buttons to include, their order, and their layout
* ...adds the **ability to maximize/unmaximize** floating windows by **double clicking the titlebar**, and of course, **moving them by clicking and holding**
* ...adds the ability to **"roll up"** and **"roll down"** the client window like a **window shade**! Scroll up over the titlebar to **instantly hide the window contents but keep the title bar** right where it is. And then either scroll down or click the titlebar to make the window contents visible again!

![Preview](https://raw.githubusercontent.com/mut-ex/awesome-wm-nice/master/preview.png)

## Getting Started

### Prerequisites 

* You need **[Awesome WM](https://awesomewm.org/)** with a working basic configuration. **This branch is for Awesome v4.3 git. [You can find the branch for Awesome v4.3 stable here](https://github.com/mut-ex/awesome-wm-nice/tree/awesome-4v3-stable)**

* You also need **[picom](https://github.com/yshui/picom)**. Make sure you have `shadow-ignore-shaped = false` in your configuration otherwise picom will not draw shadows. My recommended shadow settings are given below: 

  ```
  shadow = true;
  shadow-radius = 40;
  shadow-opacity = .55;
  shadow-offset-x = -40;
  shadow-offset-y = -20;
  shadow-exclude = [
    "_NET_WM_WINDOW_TYPE:a = '_NET_WM_WINDOW_TYPE_NOTIFICATION'",
    "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'",
    "_GTK_FRAME_EXTENTS@:c"
  ];
  shadow-ignore-shaped = false
  ```

* For **GTK** applications add the following line to **~/.config/gtk-3.0/settings.ini** under the **[Settings]** section to hide client-side window control buttons:

 ```
  gtk-decoration-layout=menu:
 ```

* Within you Awesome configuration, make sure that you do not already have code in place that request default titlebars for clients. Something like this:

```lua
client.connect_signal("request::titlebars", function(c) ... end) -- Remove this
```

* Additionally, nice only adds window decorations to clients that have the `titlebars_enabled` property set to true. So configure your client rules accordingly.

### Installation

The easiest and quickest way to get started is by cloning this repository to your awesome configuration directory

```shell
$ cd ~/.config/awesome
$ git clone https://github.com/mut-ex/awesome-wm-nice.git nice
```



## Usage

To use nice, you first need to load the module. To do that, put the following line right after `beautiful.init(...)`

```lua
local nice = require("nice")
nice()
```

If you are fine using the default configuration, you are all done! 

nice will automatically detect and change the window decoration color to match the client. However...

* To pick the window decoration color yourself, right-click the titlebar and select **'Manually Pick Color'**
* To update the window decoration colors, right-click on the titlebar and select **'Redo Window Decorations'**
* Scroll-up with your mouse over the titlebar to "roll up" the window shade. Scroll-down over the titlebar, or left-click to "roll down" the window shade
* nice saves its color rules in the **color_rules** file within the module directory. If you wish you can manually edit it, or delete the file if you want to start again.



## Configuration

You can override the defaults by passing your own configuration. For example

```lua
local nice = require("nice")
nice {
    titlebar_color = "#00ff00",
    
    -- You only need to pass the parameter you are changing
    context_menu_theme = {
        width = 300, 
    },
    
    -- Swap the designated buttons for resizing, and opening the context menu
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
}
```

Below you will find further details explaining the configuration parameters for nice.

| Parameter          | Type | Description | Default             |
| --------------------- | :--: | ----------- | ------------------- |
| `titlebar_height`       | integer | The height of the titlebar | `38`                  |
| `titlebar_radius`       | integer | The radius of the top left and top right corners of the titlebar. Should be `>= 3` and `<= titlebar_height` | `9`                   |
| `titlebar_color`        | string | The default color of the titlebar and window decorations. Should be a hex color string | `"#1e1e24"`         |
| `titlebar_padding_left` | integer | The padding on the left side of the titlebar | `0`                   |
| `titlebar_padding_right` | integer | The padding on the right side of the titlebar | `0`                   |
| `titlebar_font`         | string | The font and font size for text within the titlebar. See the default value for an example of the format | `"Sans 11"`           |
| `win_shade_enabled`     | boolean | Whether the window shade feature should be enabled | `true`                |
| `no_titlebar_maximized` | boolean | Whether the titlebar should be hidden for maximized windows | `false`               |
| `mb_move`               | integer or named constant | Mouse button to move a window. | `nice.MB_LEFT`        |
| `mb_contextmenu`        | integer or named constant | Mouse button to open the nice context menu | `nice.MB_MIDDLE`      |
| `mb_resize`             | integer or named constant | Mouse button to resize a window | `nice.MB_RIGHT`       |
| `mb_win_shade_rollup`   | integer or named constant | Mouse button to roll up/hide window contents | `nice.MB_SCROLL_UP`   |
| `mb_win_shade_rolldown` | integer or named constant | Mouse button to roll down/show window contents | `nice.MB_SCROLL_DOWN` |
| `button_size` | integer | The size (diameter) of the titlebar buttons | 16 |
| `button_margin_horizontal` | integer | The horizontal margin around each titlebar button. `button_margin_left` and `button_margin_right`can override this parameter. | 5 |
| `button_margin_vertical` | integer | The vertical margin above and below each titlebar button. `button_margin_top` and `button_margin_bottom` can override this parameter. | nil |
| `button_margin_top` | integer | The margin above each titlebar button | 2 |
| `button_margin_bottom` | integer | The margin below each titlebar button | nil |
| `button_margin_left` | integer | The margin to the left of each titlebar button | 0 |
| `button_margin_right` | integer | The margin to the right of each titlebar button | 0 |
| `tooltips_enabled` | boolean | If tooltip hints should be shown when the mouse cursor is hovered over a titlebar button | nil |
| `close_color` | string | The base color for the close button | "#ee4266" |
| `minimize_color` | string | The base color for the minimize button | "#ffb400" |
| `maximize_color` | string | The base color for the maximize button | "#4cbb17" |
| `floating_color` | string | The base color for the floating mode toggle button | "#f6a2ed" |
| `ontop_color` | string | The base color for the on top mode toggle button | "#f6a2ed" |
| `sticky_color` | string | The base color for the sticky mode toggle  button | "#f6a2ed" |

In addition to the above mentioned parameters, there some more parameters that require a little more explanation:

### titlebar_items

`titlebar_items` — Specifies the titlebar items to include	

* It should be a table with the following keys:
  * `left` — Specifies the item(s) to place on the left side of the titlebar
  * `middle` — Specifies the item(s) to place in the middle of the titlebar
  * `right` — Specifies the items(s) to place on the right side of the titlebar
* Multiple items should be passed as an array of identifiers. For a single item simply passing the identifier is sufficient
* Valid titlebar item identifiers are:
  * `"close"` 
  * `"minimize"`
  * `"maximize"`
  * `"floating"`
  * `"ontop"`
  * `"sticky"`
  * `"title"`
* Default value for `titlebar_items` is:

```lua
titlebar_items = {
    left = {"close", "minimize", "maximize"},
    middle = "title",
    right = {"sticky", "ontop", "floating"},
}
```

### context_menu_theme

`context_menu_theme` — Specifies theming parameters for the context (default right-click) menu

* It should be a table with the following keys:
  * `​bg_focus` — Background color of focused menu item
  * `bg_normal` — Background color of not-focused menu items
  * `​border_color` — Color of the border around the entire menu
  * `​border_width` — Width of the border around the entire menu
  * `​fg_focus` — Foreground color of focused menu item
  * `​fg_normal` — Foreground color of not-focused menu items
  * `​font` — Font used for menu text
  * `​height` — Height of each menu list item
  * `​width` — Width of the menu
* Default value for `context_menu_theme` is:

```lua
context_menu_theme = {
    bg_focus = "#aed9e0",
    bg_normal = "#5e6472",
    border_color = "#00000000",
    border_width = 0,
    fg_focus = "#242424",
    fg_normal = "#fefefa",
    font = "Sans 11",
    height = 27.5,
    width = 250,
}
```

### tooltip_messages

`tooltip_messages` — Specifies the hints that are shown when the mouse cursor is hovered over a titlebar button

* It should be a table with the following keys:
  * `close` — Text shown when hovering over the close button
  * `minimize` — Text shown when hovering over the minimize button
  * `maximize_active` — Text shown when hovering over the maximize button when the window is maximized
  * `maximize_inactive` — Text shown when hovering over the maximize button when the window is not maximized
  * `floating_active` — Text shown when hovering over the floating button when the window is floating
  * `floating_inactive` — Text shown when hovering over the floating button when the window is tiled
  * `ontop_active` — Text shown when hovering over the ontop button when the window is set to be above other windows
  * `ontop_inactive` — Text shown when hovering over the ontop button when the window is not set to be above other windows
  * `sticky_active` — Text shown when hovering over the sticky button when the window is set to be available on all tags
  * `sticky_inactive` — Text shown when hovering over the sticky button when the window is not to be available on all tags

The default value for `tooltip_messages` is:

```lua
tooltip_messages = {
    close = "close",
    minimize = "minimize",
    maximize_active = "unmaximize",
    maximize_inactive = "maximize",
    floating_active = "enable tiling mode",
    floating_inactive = "enable floating mode",
    ontop_active = "don't keep above other windows",
    ontop_inactive = "keep above other windows",
    sticky_active = "disable sticky mode",
    sticky_inactive = "enable sticky mode",
}
```



## Using

nice will automatically detect and change the window decoration color to match the client. However...

* If nice doesn't pick the right color or you want to specify it yourself, right-click the titlebar and select 'Manually Pick Color'
* If the client theme changes (for example if you change your terminal emulator colors), to update the window decoration colors, right-click on the titlebar and select 'Redo Window Decorations'
* Scroll-up with your mouse over the titlebar to "roll-up" the window shade. Scroll-down over the titlebar, or left-click to "roll-down" the window shade
* nice saves its color rules in the color_rules file within the module directory. If you wish you can manually edit it, or delete the file if you want to start again.



## Issues

If you face any bugs or issues (or have a feature request), please feel free to open an issue on here



## License

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)



