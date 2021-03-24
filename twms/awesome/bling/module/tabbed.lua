--[[

This module currently works by adding a new property to each client that is tabbed.
That new property is called bling_tabbed. 
So each client in a tabbed state has the property "bling_tabbed" which is a table.
Each client that is not tabbed doesn't have that property.
In the function themselves, the same object is refered to as "tabobj" which is why
you will often see something like: "local tabobj = some_client.bling_tabbed" at the beginning
of a function.

--]]

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local helpers = require(tostring(...):match(".*bling.module") .. ".helpers")

local bar_style = beautiful.tabbar_style or "default"
local bar = require(tostring(...):match(".*bling") .. ".widget.tabbar." ..
                        bar_style)

local function copy_size(c, parent_client)
    if not c or not parent_client then return end
    if not c.valid or not parent_client.valid then return end
    c.floating = parent_client.floating
    c.x = parent_client.x
    c.y = parent_client.y
    c.width = parent_client.width
    c.height = parent_client.height
end

tabbed = {}

-- used to change focused tab relative to the currently focused one 
tabbed.iter = function(idx)
    if not idx then idx = 1 end
    if not client.focus or not client.focus.bling_tabbed then return end
    local tabobj = client.focus.bling_tabbed
    local new_idx = (tabobj.focused_idx + idx) % #tabobj.clients
    if new_idx == 0 then new_idx = #tabobj.clients end
    tabbed.switch_to(tabobj, new_idx)
end

-- removes a given client from its tab object
tabbed.remove = function(c)
    if not c or not c.bling_tabbed then return end
    local tabobj = c.bling_tabbed
    table.remove(tabobj.clients, tabobj.focused_idx)
    awful.titlebar.hide(c, bar.position)
    c.bling_tabbed = nil
    tabbed.switch_to(tabobj, 1)
end

-- removes the currently focused client from the tab object
tabbed.pop = function()
    if not client.focus or not client.focus.bling_tabbed then return end
    tabbed.remove(client.focus)
end

-- adds a client to a given tabobj
tabbed.add = function(c, tabobj)
    if c.bling_tabbed then return end
    copy_size(c, tabobj.clients[tabobj.focused_idx])
    tabobj.clients[#tabobj.clients + 1] = c
    tabobj.focused_idx = #tabobj.clients
    -- calls update even though switch_to calls update again
    -- but the new client needs to have the tabobj property 
    -- before a clean switch can happen
    tabbed.update(tabobj)
    tabbed.switch_to(tabobj, #tabobj.clients)
end

-- use xprop to select one client and make it tab in the currently focused tab
tabbed.pick = function()
    if not client.focus then return end 
    if not client.focus.bling_tabbed then tabbed.init(client.focus) end
    local tabobj = client.focus.bling_tabbed
    -- this function uses xprop to grab a client pid which is then 
    -- compared to all other client process ids

    local xprop_cmd = [[ xprop _NET_WM_PID | cut -d' ' -f3 ]]
    awful.spawn.easy_async_with_shell(xprop_cmd, function(output)
        for _, c in ipairs(client.get()) do
            if tonumber(c.pid) == tonumber(output) then
                tabbed.add(c, tabobj)
            end
        end
    end)
end

-- update everything about one tab object
tabbed.update = function(tabobj)
    local currently_focused_c = tabobj.clients[tabobj.focused_idx]
    -- update tabobj of each client and other things
    for idx, c in ipairs(tabobj.clients) do
        if c.valid then
            c.bling_tabbed = tabobj
            copy_size(c, currently_focused_c)
            -- the following handles killing a client while the client is tabbed
            c:connect_signal("unmanage", function(c) tabbed.remove(c) end)
        end
    end

    tabbed.update_tabbar(tabobj)
end

-- change docused tab by absolute index
tabbed.switch_to = function(tabobj, new_idx)
    local old_focused_c = tabobj.clients[tabobj.focused_idx]
    tabobj.focused_idx = new_idx
    for idx, c in ipairs(tabobj.clients) do
        if idx ~= new_idx then
            helpers.turn_off(c)
        else
            helpers.turn_on(c)
            c:raise()
            if old_focused_c and old_focused_c.valid then
                c:swap(old_focused_c)
            end
            copy_size(c, old_focused_c)
        end
    end
    tabbed.update(tabobj)
end

tabbed.update_tabbar = function(tabobj)
    local flexlist = bar.layout()
    -- itearte over all tabbed clients to create the widget tabbed list
    for idx, c in ipairs(tabobj.clients) do
        local buttons = gears.table.join(
                            awful.button({}, 1, function()
                tabbed.switch_to(tabobj, idx)
            end))
        wid_temp = bar.create(c, (idx == tabobj.focused_idx), buttons)
        flexlist:add(wid_temp)
    end
    -- add tabbar to each tabbed client (clients will be hided anyway)
    for _, c in ipairs(tabobj.clients) do
        local titlebar = awful.titlebar(c, {
            bg = bar.bg_normal,
            size = bar.size,
            position = bar.position
        })
        titlebar:setup{layout = wibox.layout.flex.horizontal, flexlist}
    end
end

tabbed.init = function(c)
    local tabobj = {}
    tabobj.clients = {c}
    tabobj.focused_idx = 1
    tabbed.update(tabobj)
end

if beautiful.tabbed_spawn_in_tab then
    client.connect_signal("manage", function(c)
        local s = awful.screen.focused()
        local previous_client = awful.client.focus.history.get(s, 1)
        if previous_client and previous_client.bling_tabbed then
            tabbed.add(c, previous_client.bling_tabbed)
        end
    end)
end

return tabbed
