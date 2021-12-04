ESX = nil

local scenario = "PROP_HUMAN_BUM_BIN"

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("esx_AR-RepairKit:UseRepairKit")
AddEventHandler("esx_AR-RepairKit:UseRepairKit", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    if DoesEntityExist(vehicle) then
        TriggerServerEvent("esx_AR-RepairKit:RemoveRepairKit")
        TaskStartScenarioInPlace(ped, scenario, 0, true)
        Citizen.Wait(1000 * 10)
        Citizen.CreateThread(function()
         if IsPedUsingScenario(ped, scenario) then
            SetVehicleFixed(vehicle)                -- Fix car native.
            SetVehicleDeformationFixed(vehicle)     -- Fix car native.
            SetVehicleUndriveable(vehicle, false)   -- Fix car native.
            SetVehicleEngineOn(vehicle, true, true)
            ClearPedTasksImmediately(ped) -- stop animatio
            ESX.ShowNotification(Config.Translations.Repaired) -- info
         else
              ESX.ShowNotification(Config.Translations.EmoteAbuse22) -- info
            end
        end)
    else
        ESX.ShowNotification(Config.Translations.NoVehicles) -- info
    end
end)