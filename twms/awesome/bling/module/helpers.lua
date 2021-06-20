local awful = require("awful")
local gears = require("gears")

local helpers = {}

-- Turn off passed client (remove current tag from window's tags)
helpers.turn_off = function(c)
    local current_tag = awful.tag.selected(c.screen)
    local ctags = {}
    for k, tag in pairs(c:tags()) do
        if tag ~= current_tag then table.insert(ctags, tag) end
    end
    c:tags(ctags)
end

-- Turn on passed client
helpers.turn_on = function(c)
    local current_tag = awful.tag.selected(c.screen)
    ctags = {current_tag}
    for k, tag in pairs(c:tags()) do
        if tag ~= current_tag then table.insert(ctags, tag) end
    end
    c:tags(ctags)
    c:raise()
    client.focus = c
end

-- Create rounded rectangle shape (in one line)

helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

-- Create partially rounded rect

helpers.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl,
                                           radius)
    end
end

return helpers
