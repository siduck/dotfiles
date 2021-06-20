local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")

local bg_normal = beautiful.tabbar_bg_normal or beautiful.bg_normal or "#ffffff"
local fg_normal = beautiful.tabbar_fg_normal or beautiful.fg_normal or "#000000"
local bg_focus  = beautiful.tabbar_bg_focus  or beautiful.bg_focus  or "#000000"
local fg_focus  = beautiful.tabbar_fg_focus  or beautiful.fg_focus  or "#ffffff"
local font      = beautiful.tabbar_font      or beautiful.font      or "Hack 15"
local size      = beautiful.tabbar_size or 20
local position = beautiful.tabbar_orientation or "top"

local function create(c, focused_bool, buttons)
    local flexlist = wibox.layout.flex.horizontal()
    local title_temp = c.name or c.class or "-"
    local bg_temp = bg_normal
    local fg_temp = fg_normal
    if focused_bool then 
        bg_temp = bg_focus
        fg_temp = fg_focus
    end
    local text_temp = wibox.widget.textbox()
    text_temp.align = "center"
    text_temp.valign = "center"
    text_temp.font = font
    text_temp.markup = "<span foreground='" .. fg_temp .. "'>" .. title_temp.. "</span>"
    c:connect_signal("property::name", function(_)
        local title_temp = c.name or c.class or "-"
        text_temp.markup = "<span foreground='" .. fg_temp .. "'>" .. title_temp.. "</span>"
    end)
    local wid_temp = wibox.widget({
        text_temp,
        buttons = buttons,
        bg = bg_temp,
        widget = wibox.container.background()
    })
    return wid_temp
end 


return {
    layout = wibox.layout.flex.horizontal,
    create = create,
    position = "top",
    size = size,
    bg_normal = bg_normal,
    bg_focus  = bg_focus
}
