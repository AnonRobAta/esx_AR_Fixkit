ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("Anonrobata_FIXKIT:Start_SCRIPT:SHEESESHEES")
AddEventHandler("Anonrobata_FIXKIT:Start_SCRIPT:SHEESESHEES", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    if DoesEntityExist(vehicle) then
        TriggerServerEvent("Anonrobata_FIXKIT:Delete:ITem_SCRIPT:SHEESESHEES")
        TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_BIN", 0, true)
        Citizen.Wait(1000 * 10)
        Citizen.CreateThread(function()
            SetVehicleFixed(vehicle)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true)
            ClearPedTasksImmediately(ped)
            ESX.ShowNotification('Repaired!')
        end)
    else
        ESX.ShowNotification('No vehicle nearby!')
    end
end)