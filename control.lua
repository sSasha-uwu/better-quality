require 'common'

local controlled_entities = {}
for prototype_name, prototype_value in pairs(CHANGED_ENTITIES) do
    for entity_name, entity_value in pairs(prototype_value) do
        controlled_entities[entity_name] = true
    end
end

local function check_entity(entity_name)
    if controlled_entities[entity_name] ~= nil then return true end
    return false
end

local on_built = function (data)
    local entity = data.entity
    if entity.quality.level == 0 then return end
    if not check_entity(entity.name) then return end

    local surface = entity.surface
    local info = {
        name = "sSashaQuality-" .. entity.quality.name .. "-" .. entity.name,
        position = entity.position,
        direction = entity.direction,
        quality = entity.quality,
        force = entity.force,
        fast_replace = true,
        player = entity.last_user,
    }
    entity.destroy()
    surface.create_entity(info)
end

script.on_event(defines.events.on_built_entity, on_built)
script.on_event(defines.events.on_robot_built_entity, on_built)