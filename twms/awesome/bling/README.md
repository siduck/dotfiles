# <center> 🌟 Bling - Utilities for the AwesomeWM 🌟 </center>

## ❓ Why

AwesomeWM is literally that - an awesome window manager. 

It's unique selling point has always been the widget system allowing for fancy buttons, sliders, bars, dashboards and everything you can imagine. But that feature might also be a curse. Most modules focus on the widget side of things which left the actual window managing part of awesomeWM a little underdeveloped compared to for example xmonad even though it's probably just as powerfull in that regard. 

This module is trying to fix exactly that: Adding new layouts and modules that - while making use of the widget system - don't focus on it but on new window managing features.

## 🧭 Installation and configuration
- `git clone` this repo into your `~/.config/awesome` folder
- Put ``local bling = require("bling")`` somewhere in your ``rc.lua`` (remember to put it under ``beautiful.init...``)

##### 📎 Layouts

Choose layouts from the list below and add them to to your `awful.layouts` list in your `rc.lua`.

Everyone of them supports multiple master clients and master width factor making them as easyily useable as the default layouts.
```Lua
bling.layout.mstab
bling.layout.centered
bling.layout.vertical
bling.layout.horizontal
```

##### 😋 Window swallowing

To activate and deactivate window swallowing there are the following functions. If you want to activate it, just call the `start` function once in your `rc.lua`.
```lua
bling.module.window_swallowing.start()   -- activates window swallowing
bling.module.window_swallowing.stop()    -- deactivates window swallowing
bling.module.window_swallowing.toggle()  -- toggles window swallowing
```

##### 🏬 Tiled Wallpaper 

The function to set an automatically created tiled wallpaper can be called the follwing way (you don't need to set every option in the table of the last argument since there are reasonable defaults):
```lua
awful.screen.connect_for_each_screen(function(s)  -- that way the wallpaper is applied to every screen 
    bling.module.tiled_wallpaper("x", s, {        -- call the actual function ("x" is the string that will be tiled)
        fg = "#ff0000",  -- define the foreground color
        bg = "#00ffff",  -- define the background color
        offset_y = 25,   -- set a y offset
        offset_x = 25,   -- set a x offset
        font = "Hack",   -- set the font (without the size)
        font_size = 14,  -- set the font size
        padding = 100,   -- set padding (default is 100)
        zickzack = true  -- rectangular pattern or criss cross
    })
end)
```

##### 🔦 Flash Focus

There are two ways you can use this module. You can just enable it by calling the `enable()` function:
```lua
bling.module.flash_focus.enable()
```
This connects to the focus signal of a client, which means that the flash focus will activate however you focus the client.

The other way is to call the function itself like this: `bling.module.flash_focus.flashfocus(someclient)`. This allows you to just activate on certain keybinds:
```lua
awful.key({modkey}, "Up",
    function() 
        awful.client.focus.bydirection("up")
        bling.module.flash_focus.flashfocus(client.focus)
     end, {description = "focus up", group = "client"})
```

##### 📑 Tabbing

You should bind these functions to keys in oder to use the tabbed module effectively:
```lua
bling.module.tabbed.pick()  -- makes you pick a client with your mouse to add to the tabbing group
bling.module.tabbed.pop()   -- removes the focused client from the tabbing group
bling.module.tabbed.iter()  -- iterates through the currently focused tabbing group
```


### 🌈 Theme variables
You will find a list of all theme variables that are used in bling and comments on what they do in the `theme-var-template.lua` file - ready for you to copy them into your `theme.lua`. Theme variables are not only used to change the appearance of some features but also to adjust the functionality of some modules. So it is worth it to take a look at them.

## 😲 Preview

### Tabbing
![](https://imgur.com/08AlNhQ.png)

screenshot by [javacafe](https://github.com/JavaCafe01)

### Mstab (dynamic tabbing layout)
![](https://imgur.com/HZRgApE.png)

screenshot by [javacafe](https://github.com/JavaCafe01)

### Centered
![](https://media.discordapp.net/attachments/769673106842845194/780095998239834142/unknown.png)

screenshot by [branwright](https://github.com/branwright1)

### Tiled Wallpaper
![](https://media.discordapp.net/attachments/702548913999314964/773887721294135296/tiled-wallpapers.png?width=1920&height=1080)

screenshots by me

### Flash Focus
![](https://imgur.com/5txYrlV.gif)

gif by [javacafe](https://github.com/JavaCafe01)

### Wind swallowing
![](https://media.discordapp.net/attachments/635625813143978012/769180910683684864/20-10-23-14-40-32.gif)

gif by me :)

## TODO
- [ ] Scratchpad module
- [x] Some more documentation on the tabbed module
- [x] Add a cool alternative tabbar style  
- [x] Add another cool tabbar style (we need more styles)
- [x] Make the mstab layout compatible with vertical tabbars (left and right)
- [x] Add option to mstab layout to not shrink windows down when they are in the tabbed pane and unfocused (for example for people using transparent terminals)
- [ ] Keyboard based option to add windows to a tabbing object

All naming credit goes to javacafe.

Contributions are welcomed 💛
