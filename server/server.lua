local current_messages = {}
local max_delay = 5


function Get_Messagedata(s)
    if current_messages[s] == nil then
        return 6
    end
    return (os.time() - current_messages[s]), max_delay + (current_messages[s] - os.time())
end


function timeCount(numSec)
    local nSeconds = numSec
    if nSeconds == 0 then
        return 0
    else
        local	nHours = math.floor(nSeconds/3600);
        local	nMins = math.floor(nSeconds/60 - (nHours*60));
        local	nSecs = math.floor(nSeconds - nHours*3600 - nMins *60);
        
        return nHours,nMins,nSecs
        
    end
end

function checkIfUserUserIsOnCoolown(author)
    if not WasEventCanceled() then
        local Msg_time, time_left = Get_Messagedata(author)
        if Msg_time <= max_delay then
            TriggerClientEvent("chatMessage", author, "^1Моля изчакай ".. time_left.. " секунди преди да изпратиш съобщение!")
            return false
        else
            current_messages[author] = os.time()
        end
    end
    return true
end


AddEventHandler('chatMessage', function(author, color, text)
    local function starts_with(str, start)
        return str:sub(1, #start) == start
    end

    if starts_with(text, "/") then
        return
    end
     
    if not checkIfUserUserIsOnCoolown(author) then
            CancelEvent()
    end
end)
