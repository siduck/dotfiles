--[[ Bling theme variables template

This file has all theme variables of the bling module.
Every variable has a small comment on what it does.
You might just want to copy that whole part into your theme.lua and start adjusting from there.

--]]


-- window swallowing
theme.dont_swallow_classname_list    = {"firefox", "Gimp"}      -- list of class names that should not be swallowed
theme.dont_swallow_filter_activated  = true                     -- whether the filter above should be active 

-- flash focus
theme.flash_focus_start_opacity = 0.6       -- the starting opacity
theme.flash_focus_step = 0.01               -- the step of animation

-- tabbed
theme.tabbed_spawn_in_tab = false           -- whether a new client should spawn into the focused tabbing container 

-- tabbar general
theme.tabbar_ontop  = false
theme.tabbar_radius = 0                     -- border radius of the tabbar
theme.tabbar_style = "default"              -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = "Sans 11"               -- font of the tabbar
theme.tabbar_size = 40                      -- size of the tabbar
theme.tabbar_position = "top"               -- position of the tabbar
theme.tabbar_bg_normal = "#000000"          -- background color of the focused client on the tabbar
theme.tabbar_fg_normal = "#ffffff"          -- foreground color of the focused client on the tabbar
theme.tabbar_bg_focus  = "#1A2026"          -- background color of unfocused clients on the tabbar
theme.tabbar_fg_focus  = "#ff0000"          -- foreground color of unfocused clients on the tabbar

-- mstab
theme.mstab_bar_ontop = false               -- whether you want to allow the bar to be ontop of clients
theme.mstab_dont_resize_flaves = false      -- whether the tabbed stack windows should be smaller than the
                                            -- currently focused stack window (set it to true if you use
                                            -- transparent terminals. False if you use shadows on solid ones
theme.mstab_bar_padding = "default"         -- how much padding there should be between clients and your tabbar
                                            -- by default it will adjust based on your useless gaps. 
                                            -- If you want a custom value. Set it to the number of pixels (int)

-- the following variables are still for mstab
-- you only need to set them if you want your mstab layout tabbar to have a different
-- look then your tabbed module tabbar. By default they will look the same.
theme.mstab_border_radius = 0               -- border radius of the tabbar
theme.mstab_tabbar_style = "default"        -- style of the tabbar ("default", "boxes" or "modern")
theme.mstab_font = "Sans 11"                -- font of the tabbar
theme.mstab_bar_height = 40                 -- height of the tabbar
theme.mstab_tabbar_position = "top"         -- position of the tabbar (mstab currently does not support left,right)
theme.mstab_bg_focus    = "#000000"         -- background color of the focused client on the tabbar
theme.mstab_fg_focus    = "#ffffff"         -- foreground color of the focused client on the tabbar
theme.mstab_bg_normal   = "#1A2026"         -- background color of unfocused clients on the tabbar
theme.mstab_fg_normal   = "#ff0000"         -- foreground color of unfocused clients on the tabbar

-- the following variables are currently only for the "modern" tabbar style 
theme.tabbar_color_close = "#f9929b"        -- chnges the color of the close button
theme.tabbar_color_min   = "#fbdf90"        -- chnges the color of the minimize button
theme.tabbar_color_float = "#ccaced"        -- chnges the color of the float button

