local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local rumours = {
	[1] = {"I heard about dozens of sea serpents terrorising the sea around the islands in the North. ...", "... It seems that this was the reason why nobody has discovered the Ice Islands before. Something must have happened because at a moment's notice they disappeared."},
	[2] = {"I heard about one guy, that is living in the capital of the Ice Islands, who has become crazy after searching the mines there. He always mumbles things about ancient demons and the end of the world."},
	[3] = {"I heard that the town is mostly built out of wood. The inhabitants nearly stubbed all their forests. ...", "... That must be the reason why the Carlin traders are so interested in getting there. They sense gold in selling wood."},
	[4] = {"A sailor from Carlin told me that the natives of the Ice Islands pray to different gods. I think 'Chyll' is one of them or was that the name of the northern winds?? Well, doesn't matter! Primitives!"},
	[5] = {"A friend of mine, Captain Ogden Brewboiler, travelled to the forgotten northern sea. He is an ambitious sailor but still I have a bad feeling about it. I hope he's doing well."},
	[6] = {"The Carlin Trading Syndicate is sending expedition after expedition to the new discovered islands in the north. ...", "... I heard that they dig for valuable ore which was found in an old mine. I wonder why nobody of them has returned yet."},
	[7] = {"I heard it through the grapevine that the people on the Ice Islands eat fish all the time. But not only usual fish, no. They eat red and green fishes! ...", "... The only green fish I know is the one you can buy at Permaret in Edron as a 'special offer' and that would be your last meal. Trust me!"},
	[8] = {"Some old people tell stories about the creation war and these islands in the North ruled by snow and ice. They say it once was a fertile region. Mighty magicians used a huge crystal of ice to store all the coldness inside."},
	[9] = {"I received a letter from a friend who works on the Ice Islands. ...", "... He was writing strange things about suspicious inhabitants and something about a test to become one of them. It was very hard to read the letter, I think he was drunk as hell when he wrote it."},
	[10] = {"Have you heard about the natives of the Ice Islands? It sounds very confusing to me. ...", "... I mean there are barbarians and barbarians, some are good, the others not. One call themselves 'Norsir' the others 'Raiders', but actually they are all the same."},
	[11] = {"I heard something about the fauna of the Ice Islands. The people tattle about birds that don't fly but swim!!! Isn't that ridiculous?!?!"},
	[12] = {"A sailor told me a story about female raiders. He said they can talk to the beasts that live in the wilderness of the north. ...", "... The wolves and bears protect them and tear their foes into pieces if they order them to. If you ask me, this is just gossip."},
	[13] = {"The people talk about a huge mountain of ice, several hundreds of metres thick located in the centre of the main Ice Island."},
	[14] = {"A week ago an old drunkard mumbled something about hairy elephants!! I wonder who's telling all that weird stuff. I never met someone who was in the North and returned to the main continent."},
	[15] = {"Some citizens from Venore settled on one of the islands in the North. I heard stories about exotic products they are gathering from their hunts."},
	[16] = {"I heard something about a civil war going on in the North. It seems that there are different tribes of 'raiders' making the whole area an even rougher place than it is already."},
	[17] = {"I heard something about the barbarian tribes, who live on the newly discovered Ice Islands, that are called 'raiders'. The mightiest of them is headed by a shaman witch. There are rumours that she is immortal."},
	[18] = {"A guy told me that the Carlin Trading Syndicate sent out an employee to the new market in the North to open up a new branch of their company."}
}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function thinkCallback(cid)
local rand = math.random(1,250)
        if rand == 1 then
                selfSay("Come into my tavern and share some stories!")
        end
        return true
end

function creatureSayCallback(cid, type, msg)
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
        if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and msgcontains(msg, "frodo") and (not npcHandler:isFocused(cid)) then
                npcHandler:say("Hello, hello, "..getCreatureName(cid)..". You heard about the news?", cid)
                Topic[talkUser] = 0
                npcHandler:addFocus(cid)
                return true
        elseif (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and (not npcHandler:isFocused(cid)) then
                npcHandler:say("Welcome to Frodo's Hut. You heard about the news?", cid)
                Topic[talkUser] = 0
                npcHandler:addFocus(cid)
                return true
        end
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        if msgcontains(msg, "rumour") then
                local rand = math.random(1, #rumours)
                if #rumours[rand] > 1 then
                        for i = 1, #rumours[rand] do
                                if message == nil then
                                        message = 1
                                end
                                npcHandler:say(rumours[rand][message], cid)
                                message = message + 1
                        end
                        message = nil
                else
                        npcHandler:say(rumours[rand][1], cid)
                end
                Topic[talkUser] = 0
        elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
                npcHandler:say("Please come back from time to time.", cid)
                Topic[talkUser] = 0
                npcHandler:releaseFocus(cid)
        elseif msgcontains(msg, "job") or msgcontains(msg, "saloon") then
                npcHandler:say("I am the owner of this saloon. I call it Frodo's Hut. I am also selling food.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "hut") then
                npcHandler:say("I hope you like it.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "frodo") then
                npcHandler:say("Just call me Frodo.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "time") then
                npcHandler:say("It is exactly "..getTibianTime()..".", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "king") and msgcontains(msg, "tibianus") then
                npcHandler:say("Oh, our beloved king! Thanks to him, alcohol is so cheap.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "quentin") then
                npcHandler:say("He hardly visits my humble tavern.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "lynda") then
                if getPlayerSex(cid) == 0 then
                        npcHandler:say("A very noble lady.", cid)
                else
                        npcHandler:say("Just between you and me: What a babe! A shame that she is such a prude.", cid)
                end
                Topic[talkUser] = 0
        elseif msgcontains(msg, "harkath") then
                npcHandler:say("Too disciplined to enjoy life.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "army") then
                npcHandler:say("Hehe. Great customers.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "ferumbras") then
                npcHandler:say("Uhm, do not mention him. It may scare customers away.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "general") then
                npcHandler:say("Harkath Bloodblade is the royal general.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "sam") then
                npcHandler:say("A loud neighbour, I get a lot of complaints about him.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "xodet") then
                npcHandler:say("I don't know where he gets these potions. If I could sell them here, the hut would be crowded.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "xodet") then
                npcHandler:say("I don't know where he gets these potions. If I could sell them here, the hut would be crowded.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "gorn") then
                npcHandler:say("Many of his customers visit my Hut, too.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "elane") then
                npcHandler:say("Can you believe that she actually told her guildfellows that alcohol is a bad thing?", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "muriel") then
                npcHandler:say("Muriel has never visited this place.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "lungelen") then
                npcHandler:say("A sorceress, you can find her in their guild sitting befor a book - always!", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "gregor") then
                npcHandler:say("The knights have sometimes parties here after some arena fights.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "marvik") then
                npcHandler:say("Marvik seldom leaves his guildhall at all.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "bozo") then
                npcHandler:say("I am trying to hire him for an evening or two.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "baxter") then
                npcHandler:say("He's able to drink a bottle or two.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "oswald") then
                npcHandler:say("I hate him. Each of his visits here ends with a bar brawl.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "sherry") or msgcontains(msg, "mcronald") then
                npcHandler:say("The McRonalds are a nice couple. Donald is a dear friend of mine.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "donald") then
                npcHandler:say("He is a little shy. In his youth he dreamed to become a druid.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "lugri") then
                npcHandler:say("I overheared some conversations about his evilness. That's enough to hope, that I never ever meet him.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "lugri") then
                npcHandler:say("I overheared some conversations about his evilness. That's enough to hope, that I never ever meet him.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "excalibug") then
                npcHandler:say("Nothing more than a tale for warriors.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "thais") then
                npcHandler:say("Here in Thais is the center of Tibia.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "tibia") then
                npcHandler:say("Come on! You know that our world is called Tibia.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "carlin") then
                npcHandler:say("Many travellers tell funny stories about all the emancipated women in this northern town.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "rain") and msgcontains(msg, "castle") then
                npcHandler:say("The king's residence has been renovated lately.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "galuna") then
                npcHandler:say("She makes excellent arrows and bows.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "hugo") then
                npcHandler:say("I think some time ago a stranger from Fibula with that name stayed here for some nights.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "eclesius") then
                npcHandler:say("Oh, that old guy! He's a good customer, that's for sure.", cid)
                Topic[talkUser] = 10
        elseif msgcontains(msg, "last") and Topic[talkUser] == 10 then
                npcHandler:say("Yes, he was here last evening as well.", cid)
                Topic[talkUser] = 10
        elseif msgcontains(msg, "talk") and Topic[talkUser] == 10 then
                npcHandler:say("Who he talked to? Hm... I'm not sure, there were a few people around. No girls or women though. Maybe just ask around for Eclesius.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "todd") then
                npcHandler:say("That fellow is filthy rich. He rented a room upstairs for months in advance and always orders the best beer and wine I serve.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "news") or msgcontains(msg, "rumor") then
                npcHandler:say("Some travelers from Edron told about a great treasure guarded by cruel demons in the dungeons there.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "buy") or msgcontains(msg, "sell") or msgcontains(msg, "goods") or msgcontains(msg, "wares") or msgcontains(msg, "offer") or msgcontains(msg, "food") then
                npcHandler:say("I can offer you bread, cheese, ham, or meat. If you'd like to see my offers, ask me for a {trade}.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "satanic") then
                npcHandler:say("Hmm, I have heard of a 'satanic influence' theory by someone called Newton or something like that... Maybe there's more in the Royal Archives.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "cropwell") or msgcontains(msg, "alistair") then
                npcHandler:say("No idea who that is, but maybe you'll find something in the Royal Archives...", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "archives") then
                npcHandler:say("Oh, the Royal Archives are in Rain Castle!", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "dungeon") or msgcontains(msg, "graveyard") then
                npcHandler:say("Ah yes, the graveyard dungeon. All I know is this riddle: His Grave to the south, the tree above, his soul in the shade. No idea what that means, though!", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "riddle") then
                npcHandler:say("I heard it when I was a child.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "sunset") and msgcontains(msg, "homes") then
                npcHandler:say("The sunset homes are a block of flats south of the harbour.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "one") and msgcontains(msg, "eyed") and msgcontains(msg, "stranger") then
                npcHandler:say("Yes, I remember him. His name was Berfasmur.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "berfasmur") then
                npcHandler:say("Sorry, he spoke only very little. I know nothing more about him.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "hengis") and msgcontains(msg, "wulfson") then
                npcHandler:say("He is a great bard. He often graced my hut with his presence, songs, and rhymes. I wonder what happened to him lately.", cid)
                Topic[talkUser] = 2
        elseif Topic[talkUser] == 2 and (msgcontains(msg, "died") or msgcontains(msg, "killed") or msgcontains(msg, "dead") or msgcontains(msg, "death") or msgcontains(msg, "slain")) then
                npcHandler:say("Oh, by the gods! What do you say happened to him?", cid)
                Topic[talkUser] = 3
        elseif Topic[talkUser] == 3 and msgcontains(msg, "cyclops") and (msgcontains(msg, "killed") or msgcontains(msg, "slain") or msgcontains(msg, "slay") or msgcontains(msg, "kill")) then
                npcHandler:say("That's horrible! I am in grief. I will never hear his songs again. I will even miss that strange rhyme he was obsessed with.", cid)
                Topic[talkUser] = 4
        elseif Topic[talkUser] == 4 and msgcontains(msg, "rhyme") then
                npcHandler:say("He recitated it that often that I learned it by heart myself. I would recitate it, but I am not skilled in that kind of things.", cid)
                Topic[talkUser] = 5
        elseif Topic[talkUser] == 5 and msgcontains(msg, "recitate") then
                npcHandler:say("Uhm. If you insist, but I am so awful. I will stop now and then and wait, so you can tell if I should proceed, ok?", cid)
                Topic[talkUser] = 6
        elseif Topic[talkUser] == 6 and msgcontains(msg, "yes") then
                npcHandler:say("Well ok, but don't blame me. Chhrrr... chhrrrr,... it goes like this... chhrrr: and when the dead feast at midnight...", cid)
                Topic[talkUser] = 7
        elseif Topic[talkUser] == 7 and msgcontains(msg, "proceed") then
                npcHandler:say("... the ancient enemy will no longer guard the place of his unlucky heir and the living will walk the paths of the old way...", cid)
                Topic[talkUser] = 8
        elseif Topic[talkUser] == 8 and msgcontains(msg, "proceed") then
                npcHandler:say("... Death awaits the greedy and the brave alike and many will be mourned until the long lost treasure is unearthed.", cid)
                Topic[talkUser] = 9
        elseif Topic[talkUser] == 9 and msgcontains(msg, "proceed") then
                npcHandler:say("That's all. He recitated it when he was in one of his melancholy moods.", cid)
                Topic[talkUser] = 0
        elseif msgcontains(msg, "special") then
                npcHandler:say("That would be my tavern of course... well and perhaps the royal satin that was created especially for the king but sometimes is bought by wealthy citizens as well.", cid)
                Topic[talkUser] = 0
        end
        return TRUE
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back from time to time.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, take a look at the great food I sell.")
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)