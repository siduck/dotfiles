local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local helpers = require(tostring(...):match(".*bling.module") .. ".helpers")

-- It might actually swallow too much, that's why there is a filter option by classname
-- without the don't-swallow-list it would also swallow for example 
-- file pickers or new firefox windows spawned by an already existing one

local window_swallowing_activated = false

-- you might want to add or remove applications here
local dont_swallow_classname_list = beautiful.dont_swallow_classname_list or {"firefox", "Gimp"} 
local activate_dont_swallow_filter = beautiful.dont_swallow_filter_activated or true

-- makes c the same size and position as parent_client
local function copy_size(c, parent_client)
    if not c or not parent_client then
        return
    end
    if not c.valid or not parent_client.valid then
        return
    end
    c.floating = parent_client.floating
    c.x = parent_client.x;
    c.y = parent_client.y;
    c.width = parent_client.width;
    c.height = parent_client.height;
    -- TODO that function should also support "copying" the 
    -- index of the parent_client to the new c 
end

-- checks if client classname matches with any entry of the dont-swallow-list
local function check_if_swallow(c) 
    if not activate_dont_swallow_filter then 
        return true 
    end 
    for _, classname in ipairs(dont_swallow_classname_list) do 
        if classname == c.class then 
            return false
        end 
    end 
    return true
end 

-- the function that will be connected to / disconnected from the spawn client signal
local function manage_clientspawn(c)
    -- get the last focused window to check if it is a parent window
    local parent_client=awful.client.focus.history.get(c.screen, 1)
    if not parent_client then return end 
    
    -- io.popen is normally discouraged. Should probably be changed 
    local handle = io.popen([[pstree -T -p -a -s ]] .. tostring(c.pid) ..  [[ | sed '2q;d' | grep -o '[0-9]*$' | tr -d '\n']])
    local parent_pid = handle:read("*a")
    handle:close()

    if (tostring(parent_pid) == tostring(parent_client.pid)) and check_if_swallow(c) then 

        c:connect_signal("unmanage", function()
            helpers.turn_on(parent_client)
            copy_size(parent_client, c)
        end)

        copy_size(c, parent_client)
        helpers.turn_off(parent_client)

    end
end

-- without the following functions that module would be autoloaded by require("bling") 
-- a toggle window swallowing hotkey is also possible that way

local function start()
    client.connect_signal("manage", manage_clientspawn)
    window_swallowing_activated = true
end 

local function stop()
    client.disconnect_signal("manage", manage_clientspawn)
    window_swallowing_activated = false
end 

local function toggle()
    if window_swallowing_activated then 
        stop()
    else 
        start()
    end 
end 

return {
    start = start,
    stop = stop,
    toggle = toggle
}

