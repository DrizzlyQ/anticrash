local entityCounts = {
    ped = {},
    vehicle = {},
    object = {}
}

local function trackSpawn(type)
    local now = GetGameTimer()
    table.insert(entityCounts[type], now)
    for i = #entityCounts[type], 1, -1 do
        if now - entityCounts[type][i] > Config.TimeWindow * 1000 then
            table.remove(entityCounts[type], i)
        end
    end
    if #entityCounts[type] >= Config.SpawnLimit[type] then
        TriggerServerEvent('antiCrash:logDetection', type, #entityCounts[type], "rate")
    end
end

local function checkModel(model)
    if not IsModelValid(model) or not IsModelInCdimage(model) then
        TriggerServerEvent("antiCrash:logDetection", tostring(model), 1, "invalid_model")
    end
end

local function monitorApplyForce()
    local ped = PlayerPedId()
    local velocity = GetEntityVelocity(ped)
    if math.abs(velocity.x) > 200.0 or math.abs(velocity.y) > 200.0 or math.abs(velocity.z) > 200.0 then
        TriggerServerEvent("antiCrash:logDetection", json.encode(velocity), 1, "apply_force_abuse")
    end
end

CreateThread(function()
    while true do
        Wait(100)
        trackSpawn('ped')
        trackSpawn('vehicle')
        trackSpawn('object')
        monitorApplyForce()
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        checkModel(GetEntityModel(ped))
        if veh and veh ~= 0 then
            checkModel(GetEntityModel(veh))
        end
    end
end)
