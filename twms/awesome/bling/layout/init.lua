local beautiful = require("beautiful")

local mstab = require(... .. ".mstab")
beautiful.layout_mstab = mstab.get_icon()

local vertical = require(... .. ".vertical")
beautiful.layout_vertical = vertical.get_icon()

local horizontal = require(... .. ".horizontal")
beautiful.layout_horizontal = horizontal.get_icon()

local centered = require(... .. ".centered")
beautiful.layout_centered = centered.get_icon()

local layout = {
    mstab = mstab.layout,
    centered = centered.layout,
    vertical = vertical.layout,
    horizontal = horizontal.layout
}

return layout
