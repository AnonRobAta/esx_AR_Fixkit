ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("fixkit", function(source)
    TriggerClientEvent("Anonrobata_FIXKIT:Start_SCRIPT:SHEESESHEES", source)
end)

RegisterNetEvent("Anonrobata_FIXKIT:Delete:ITem_SCRIPT:SHEESESHEES")
AddEventHandler("Anonrobata_FIXKIT:Delete:ITem_SCRIPT:SHEESESHEES", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem("fixkit", 1)
end)