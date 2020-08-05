--[[
 
COLOR_BLACK = 0
COLOR_BLUE = 5
COLOR_GREEN = 18
COLOR_LIGHTGREEN = 66
COLOR_DARKBROWN = 78
COLOR_LIGHTBLUE = 89
COLOR_MAYABLUE = 95
COLOR_DARKRED = 108
COLOR_DARKPURPLE = 112
COLOR_BROWN = 120
COLOR_GREY = 129
COLOR_TEAL = 143
COLOR_DARKPINK = 152
COLOR_PURPLE = 154
COLOR_DARKORANGE = 156
COLOR_RED = 180
COLOR_PINK = 190
COLOR_ORANGE = 192
COLOR_DARKYELLOW = 205
COLOR_YELLOW = 210
COLOR_WHITE = 215
COLOR_NONE = 255
]]
 
 
local _new = {
 
	{text = "Monsters", pos = {x=994, y=1000, z=7}, color = COLOR_ORANGE},
	{text = "Training", pos = {x=994, y=998, z=7}, color = COLOR_ORANGE},
	{text = "City's", pos = {x=1006, y=999, z=7}, color = COLOR_ORANGE},
	{text = "Depot", pos = {x=1006, y=1001, z=7}, color = COLOR_ORANGE},
	{text = "VIP", pos = {x=1005, y=995, z=7}, color = COLOR_ORANGE},
	{text = "Temple", pos = {x=1032, y=1001, z=7}, color = COLOR_ORANGE},
}
 
 
function onThink(interval, lastExecution)
	for _,v in pairs(_new) do       
		doSendAnimatedText(v.pos,v.text,v.color)
 	end
return TRUE
end