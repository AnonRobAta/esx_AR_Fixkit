ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem("fixkit", function(source)
    local _source = source
    TriggerClientEvent("esx_AR-RepairKit:UseRepairKit", _source)
end)

RegisterNetEvent("esx_AR-RepairKit:RemoveRepairKit")
AddEventHandler("esx_AR-RepairKit:RemoveRepairKit", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem("fixkit", 1)
end)


