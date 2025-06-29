local Config = require 'config'
local ox_inventory = exports.ox_inventory

local playersHolster = {}

RegisterNetEvent('holster:setHolster', function(id)
    local src = source
    playersHolster[src] = id

    if Config.PersistHolster then
        ox_inventory:SetMetadata(src, 'holster_id', id)
    end
end)

AddEventHandler('playerDropped', function(reason)
    playersHolster[source] = nil
end)

lib.callback.register('holster:getHolster', function(source)
    if Config.PersistHolster then
        local meta = ox_inventory:GetMetadata(source, 'holster_id')
        return meta or 0
    end

    return playersHolster[source] or 0
end)
