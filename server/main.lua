----------------------------------
-- Player Logger, Made by invakid404 --
-- Other commands down = by me --
-- [thanks for ur support my real g] --
----------------------------------

fileName = "Player-Logs" -- Name of the txt file. Do not include .txt
resourceDirectory = "resources/[sesx]/RPChat/" -- keep in mind that if ur resource is not in this foldier to CHANGE it, example : resources/rpchat/  ---> !!![Don't forget to add "/" after rpchat]
saveInResource = true -- Save the Player-Logs.txt into the resource. Having this off leaves it in the server-data folder. //// i suggest you to use it as true, better option, low cpu usage

-- the writelog function
function writeLog(name, identifierSteam, action)
    local time = os.date("%m/%d/%Y %I:%M %p")

    if action == nil then
        action = "N/A"
    end
    if saveInResource == true then
        file = io.open(resourceDirectory .. fileName .. ".txt", "a")
    else
        file = io.open(fileName .. ".txt", "a")
    end
    if file then
        file:write("[" .. time .. "] Name: " .. name .. " -> ID: " .. identifierSteam .. " (Action: " .. action .. ") \r\n")
    end
    file:close()
end

-- commands in ur chat [you can change them or add new one]
  RegisterCommand('twt', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end, false)
-- deepweb  
  RegisterCommand('dw', function(source, args, rawCommand)
    local message = table.concat(args, " ")
  	TriggerClientEvent('chatMessage', -1, "^0[^1DeepWeb^0]", {255,0,0}, message)
	writeLog(GetPlayerName(source), source, message)
  end)
-- sell
  RegisterCommand('sell', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^3Sell^0]: " .. GetPlayerName(source), {255,215,0}, table.concat(args, " "))
  end, false)
-- example command [if u dont want it, remove from here]  
  RegisterCommand('examplechangeme', function(source, args, user)
  	TriggerClientEvent('chatMessage', -1, "^0[^3ExampleCommandHere^0]: " .. GetPlayerName(source), {255,215,0}, table.concat(args, " "))
  end, false)
-- [to here] , or u can change it

-- split the strings [very important]
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
