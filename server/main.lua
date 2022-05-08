ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

Citizen.CreateThread(function()

    while true do

        for k, playerid in pairs(GetPlayers()) do 
            local xPlayer = ESX.GetPlayerFromId(playerid)
            if xPlayer.getInventoryItem("phone") ~= nil then
                local phoneCount = xPlayer.getInventoryItem("phone").count
                if phoneCount > 0 then
                    -- Handyvertrag Zahlen :D
                    local price = 420
                    xPlayer.removeAccountMoney('bank', price)
                    TriggerClientEvent('handyvertrag:picturemsg', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~r~' .. price .. '~g~$ ~s~ für deinen ~g~Handyvertrag bezahlt!', 'Handyvertrag', 'Gebühren bezahlt')
        end
    end
end

        Citizen.Wait(60 * 60000)
        --Citizen.Wait(5000)
    end

end)