local colors =
{
TEXTCOLOR_BLUE,
TEXTCOLOR_LIGHTBLUE,
TEXTCOLOR_LIGHTGREEN,
TEXTCOLOR_TEAL,
TEXTCOLOR_PURPLE,
TEXTCOLOR_PLATINUMBLUE,
TEXTCOLOR_LIGHTGREY,
TEXTCOLOR_DARKRED,
TEXTCOLOR_RED,
TEXTCOLOR_ORANGE,
TEXTCOLOR_YELLOW,
TEXTCOLOR_WHITE_EXP
}

function onSay(cid, words, param)
local playerpos = getPlayerPosition(cid)
local random = math.random(1, #colors)

            
          
          if(param == '') then
        return true
    end
doSendAnimatedText(playerpos, param, colors[random]) 
    return true
end