local config = {
positions = {
["Welcome"] = { x = 1000, y = 1000, z = 7 },
["Shop"] = { x = 993, y = 1000, z = 7 },
["Teleports"] = { x = 997, y = 996, z = 7 },
["Quest"] = { x = 1003, y = 997, z = 7 },
["TrainerS"] = { x = 994, y = 997, z = 7 },
["Depo"] = { x = 992, y = 998, z = 7 },
["Mana"] = { x = 994, y = 1003, z = 7 },
["Health"] = { x = 995, y = 1003, z = 7 },
["VIP"] = { x = 1000, y = 995, z = 7 },
["VIP "] = { x = 999, y = 995, z = 7 },
["Events"] = { x = 994, y = 997, z = 6 },
["GM Room"] = { x = 1006, y = 1000, z = 6 },
["Arena"] = { x = 1005, y = 1003, z = 7 },
["Houses"] = { x = 998, y = 995, z = 6 },
["Jail"] = { x = 1001, y = 995, z = 6 },
["Exp"] = { x = 1026, y = 997, z = 7 },
["Trainers"] = { x = 1035, y = 996, z = 7 },
["Temple."] = { x = 1035, y = 997, z = 7 },
["Temple!!"] = { x = 532, y = 946, z = 7 },
["Powrot!"] = { x = 999, y = 994, z = 10 },
["Start Exp"] = { x = 1003, y = 1003, z = 7 },
["Exp Vip"] = { x = 1159, y = 1057, z = 7 },
["Temple"] = { x = 1154, y = 1057, z = 7 },
["GM SHOP!"] = { x = 1154, y = 1064, z = 7 },
["Mana Vip"] = { x = 1159, y = 1064, z = 7 },
["Health vip"] = { x = 1159, y = 1063, z = 7 },
["Powrot"] = { x = 1175, y = 1066, z = 7 },
["Exp 2 ViP"] = { x = 1175, y = 1063, z = 7 },
["Exp 2 VIP"] = { x = 1175, y = 1062, z = 7 },
["Explvl755"] = { x = 999, y = 1006, z = 10 },
},

effects = {
CONST_ME_MAGIC_BLUE,
CONST_ME_MAGIC_GREEN,
CONST_ME_MORTAREA
},

colors = {
TEXTCOLOR_WHITE,
TEXTCOLOR_ORANGE,
TEXTCOLOR_GREEN,
TEXTCOLOR_BLUE
}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendMagicEffect(pos, config.effects[math.random(1, #config.effects)])
doSendAnimatedText(pos, text, config.colors[math.random(1, #config.colors)])
end
return TRUE
end
