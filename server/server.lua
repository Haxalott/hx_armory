local ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('hx_armory:server:giveItem', function(item, amount)
    local Identifier = GetPlayerIdentifierByType(source, 'license')
    local name       = GetPlayerName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    if job.name ~= 'police' then
        sendWebhook(16777215, 'ARMORY LOGS - EXECUTOR', '**Player Name:** '.. name ..' \n **License:** '.. Identifier ..' \n **Action:** Attempted to get item with executor \n **Result:** Kicked')
        DropPlayer(source, 'Attempted to get item with an executor')
    elseif job.name == 'police' then
        exports.ox_inventory:AddItem(source, item, amount)
        sendWebhook(16777215, 'ARMORY LOGS - ADDED ITEM', '**Player Name:** '.. name ..' \n **License:** '.. Identifier ..' \n **Action:** Got out a weapon/gun \n **Item/Weapon:** '.. item ..' \n **Amount:** '.. amount)
    end
end)

RegisterNetEvent('hx_armory:server:removeItem', function(item)
    local identifier = GetPlayerIdentifierByType(source, 'license')
    local name = GetPlayerName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    if job.name ~= 'police' then
        sendWebhook(16777215, 'ARMORY LOGS - EXECUTOR', '**Player Name:** '.. name ..' \n **License:** '.. identifier ..' \n **Action:** Attempted to remove item with executor \n **Result:** Kicked')
        DropPlayer(source, 'Attempted to remove item with an executor')
    elseif job.name == 'police' then
        exports.ox_inventory:RemoveItem(source, item, 1)
        sendWebhook(16777215, 'ARMORY LOGS - REMOVED ITEM', '**Player Name:** '.. name ..' \n **License:** '.. identifier ..' \n **Action:** Removed '.. item ..' from inventory')
    end
end)