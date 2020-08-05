local str1 = " Log In. "
local str2 = "As: "
local groups = {
    [2] = "Tutor",
    [3] = "Senior Tutor",
    [4] = "Gamemaster",
    [5] = "Community Manager",
    [6] = "God",
    [7] = "Owner",
	[8] = "Owner",
}
 
function onLogin(cid)
    local name = getCreatureName(cid)
    for i, group in pairs(groups) do
        if(getPlayerGroupId(cid) == i) and (isPlayerGhost(cid) == false) then
            doBroadcastMessage(name .. str1 .. str2 .. group)
        end
        break
    end
    return true
end
