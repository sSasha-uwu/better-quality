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
        spill = false,
    }
    log(info.name)
    local belt_to_ground = nil
    if entity.type == "underground-belt" then
        belt_to_ground = entity.belt_to_ground_type
        info.belt_to_ground = belt_to_ground
        if belt_to_ground == "output" then
            log("1before" .. info.direction) -- 0
            if info.direction == defines.direction.north then
                info.direction = defines.direction.south
            elseif info.direction == defines.direction.south then
                info.direction = defines.direction.north
            elseif info.direction == defines.direction.east then
                info.direction = defines.direction.west
            elseif info.direction == defines.direction.west then
                info.direction = defines.direction.east
            end
            log("1after" .. info.direction) -- 8
        end
    end
    if entity.type == "splitter" then
        info.splitter_filter = entity.splitter_filter
		info.splitter_input_priority = entity.splitter_input_priority
		info.splitter_output_priority = entity.splitter_output_priority
    end
    entity.destroy()
    local created_entity = surface.create_entity(info)
    log("2before" .. created_entity.direction) -- 8
    if created_entity.type == "underground-belt" and created_entity.belt_to_ground_type ~= belt_to_ground then
        log("is different")
        created_entity.rotate()
    end
    log("2after" .. created_entity.direction) -- 0
end

script.on_event(defines.events.on_built_entity, on_built)
script.on_event(defines.events.on_robot_built_entity, on_built)