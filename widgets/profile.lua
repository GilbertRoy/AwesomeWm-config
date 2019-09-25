local setmetatable 	= setmetatable
local unpack 		= unpack or table.unpack
local awful         = require("awful")
local wibox     	= require("wibox")
local beautiful 	= require("beautiful")
local gears		 	= require("gears")
local read_cmd 		= require("utilities.read")
local backg 		= require("utilities.background")


-----------------------------------------------------------------------------------------------------------------------
local profile = { mt = {} }

-----------------------------------------------------------------------------------------------------------------------
local function default_style()
	local style = {
		width   = 150,
		dmargin = { 2, 0, 5, 5 },
	}
	return style
end


function profile.getUserName()
	local stdout        = read_cmd.output("whoami")
	return tostring(string.upper(stdout))
end

-----------------------------------------------------------------------------------------------------------------------
function profile.new()
	-- Initialize vars
	--------------------------------------------------------------------------------
	local style = default_style()
	--------------------------------------------------------------------------------
	local name = profile.getUserName()
	local text = backg("paranoid73","roboto 10 ",beautiful.color.green,beautiful.color.white)
	--------------------------------------------------------------------------------
	local layout = wibox.layout.fixed.horizontal()
    layout:add(text)
	--------------------------------------------------------------------------------
	local dash = wibox.widget.imagebox("/home/paranoid73/Pictures/logo/React-icon.svg")

	layout:add(wibox.container.margin(dash, unpack(style.dmargin)))
	--------------------------------------------------------------------------------
	local widg = wibox.container.constraint(layout, "exact", style.width)

	return widg
end

-----------------------------------------------------------------------------------------------------------------------
function profile.mt:__call(...)
	return profile.new(...)
end
return setmetatable(profile, profile.mt)