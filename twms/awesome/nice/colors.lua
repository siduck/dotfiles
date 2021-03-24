-- => Colors
-- Provides utility functions for handling colors
-- ============================================================
local math = math
local floor = math.floor
local max = math.max
local min = math.min
local pow = math.pow
local random = math.random
local gcolor = require("gears.color")
local parse_color = gcolor.parse_color

-- Returns a value that is clipped to interval edges if it falls outside the interval
local function clip(num, min_num, max_num) return
    max(min(num, max_num), min_num) end

-- Converts the given hex color to normalized rgba
local function hex2rgb(color)
    -- color = color:gsub("#", "")
    -- local strlen = color:len()
    -- if strlen == 6 then
    --     return tonumber("0x" .. color:sub(1, 2)) / 255,
    --            tonumber("0x" .. color:sub(3, 4)) / 255,
    --            tonumber("0x" .. color:sub(5, 6)) / 255, 1
    -- end
    -- if strlen == 8 then
    --     return tonumber("0x" .. color:sub(1, 2)) / 255,
    --            tonumber("0x" .. color:sub(3, 4)) / 255,
    --            tonumber("0x" .. color:sub(5, 6)) / 255,
    --            tonumber("0x" .. color:sub(7, 8)) / 255
    -- end
    return parse_color(color)
end

-- Converts the given hex color to hsv
local function hex2hsv(color)
    local r, g, b = hex2rgb(color)
    local C_max = max(r, g, b)
    local C_min = min(r, g, b)
    local delta = C_max - C_min
    local H, S, V
    if delta == 0 then
        H = 0
    elseif C_max == r then
        H = 60 * (((g - b) / delta) % 6)
    elseif C_max == g then
        H = 60 * (((b - r) / delta) + 2)
    elseif C_max == b then
        H = 60 * (((r - g) / delta) + 4)
    end
    if C_max == 0 then
        S = 0
    else
        S = delta / C_max
    end
    V = C_max
    return H, S * 100, V * 100
end

-- Converts the given hsv color to hex
local function hsv2hex(H, S, V)
    S = S / 100
    V = V / 100
    if H > 360 then H = 360 end
    if H < 0 then H = 0 end
    local C = V * S
    local X = C * (1 - math.abs(((H / 60) % 2) - 1))
    local m = V - C
    local r_, g_, b_ = 0, 0, 0
    if H >= 0 and H < 60 then
        r_, g_, b_ = C, X, 0
    elseif H >= 60 and H < 120 then
        r_, g_, b_ = X, C, 0
    elseif H >= 120 and H < 180 then
        r_, g_, b_ = 0, C, X
    elseif H >= 180 and H < 240 then
        r_, g_, b_ = 0, X, C
    elseif H >= 240 and H < 300 then
        r_, g_, b_ = X, 0, C
    elseif H >= 300 and H < 360 then
        r_, g_, b_ = C, 0, X
    end
    local r, g, b = (r_ + m) * 255, (g_ + m) * 255, (b_ + m) * 255
    return ("#%02x%02x%02x"):format(floor(r), floor(g), floor(b))
end

-- Calculates the relative luminance of the given color
local function relative_luminance(color)
    local r, g, b = hex2rgb(color)
    local function from_sRGB(u)
        return u <= 0.0031308 and 25 * u / 323 or
                   pow(((200 * u + 11) / 211), 12 / 5)
    end
    return 0.2126 * from_sRGB(r) + 0.7152 * from_sRGB(g) + 0.0722 * from_sRGB(b)
end

-- Calculates the contrast ratio between the two given colors
local function contrast_ratio(fg, bg)
    return (relative_luminance(fg) + 0.05) / (relative_luminance(bg) + 0.05)
end

-- Returns true if the contrast between the two given colors is suitable
local function is_contrast_acceptable(fg, bg)
    return contrast_ratio(fg, bg) >= 7 and true
end

-- Returns a bright-ish, saturated-ish, color of random hue
local function rand_hex(lb_angle, ub_angle)
    return hsv2hex(random(lb_angle or 0, ub_angle or 360), 70, 90)
end

-- Rotates the hue of the given hex color by the specified angle (in degrees)
local function rotate_hue(color, angle)
    local H, S, V = hex2hsv(color)
    angle = clip(angle or 0, 0, 360)
    H = (H + angle) % 360
    return hsv2hex(H, S, V)
end

-- Lightens a given hex color by the specified amount
local function lighten(color, amount)
    local r, g, b
    r, g, b = hex2rgb(color)
    r = 255 * r
    g = 255 * g
    b = 255 * b
    r = r + floor(2.55 * amount)
    g = g + floor(2.55 * amount)
    b = b + floor(2.55 * amount)
    r = r > 255 and 255 or r
    g = g > 255 and 255 or g
    b = b > 255 and 255 or b
    return ("#%02x%02x%02x"):format(r, g, b)
end

-- Darkens a given hex color by the specified amount
local function darken(color, amount)
    local r, g, b
    r, g, b = hex2rgb(color)
    r = 255 * r
    g = 255 * g
    b = 255 * b
    r = max(0, r - floor(r * (amount / 100)))
    g = max(0, g - floor(g * (amount / 100)))
    b = max(0, b - floor(b * (amount / 100)))
    return ("#%02x%02x%02x"):format(r, g, b)
end

return {
    clip = clip,
    hex2rgb = hex2rgb,
    hex2hsv = hex2hsv,
    hsv2hex = hsv2hex,
    relative_luminance = relative_luminance,
    contrast_ratio = contrast_ratio,
    is_contrast_acceptable = is_contrast_acceptable,
    rand_hex = rand_hex,
    rotate_hue = rotate_hue,
    lighten = lighten,
    darken = darken,
}
