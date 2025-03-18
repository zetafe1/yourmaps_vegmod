local VegZones = {}
local ActiveVegModifiers = {}

local function calculateVegFlags(flags)
    local vegFlags = 0
    for _, flag in ipairs(flags) do
        vegFlags = vegFlags + flag
    end
    return vegFlags
end

local function AddVegModifierSphere(x, y, z, radius, modType, flags)
    return Citizen.InvokeNative(0xFA50F79257745E74, x, y, z, radius, modType, flags, 0)
end

local function RemoveVegModifierSphere(vegModifierSphere)
    Citizen.InvokeNative(0x9CF1836C03FB67A2, Citizen.PointerValueIntInitialized(vegModifierSphere), 0)
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local pedCoords = GetEntityCoords(playerPed)

        for k, zone in ipairs(Config.VegZones) do
            local dist = #(pedCoords - zone.coords)

            if dist <= zone.rangeDetect then
                if not ActiveVegModifiers[k] then
                    local vegFlags = calculateVegFlags(zone.Flags)
                    ActiveVegModifiers[k] = AddVegModifierSphere(zone.coords.x, zone.coords.y, zone.coords.z, zone.radius, zone.TypeModifier, vegFlags)
                end
            else
                if ActiveVegModifiers[k] then
                    RemoveVegModifierSphere(ActiveVegModifiers[k])
                    ActiveVegModifiers[k] = nil
                end
            end
        end

        Citizen.Wait(1000)
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end

    for _, vegModifierSphere in pairs(ActiveVegModifiers) do
        RemoveVegModifierSphere(vegModifierSphere)
    end
end)



