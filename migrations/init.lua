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

for _, surface in pairs(game.surfaces) do
    for prototype_name, prototype_value in pairs(CHANGED_ENTITIES) do
        for entity_name, entity_value in pairs(prototype_value) do
            log(entity_name)
            for index, entity in pairs(surface.find_entities_filtered({name=entity_name})) do
                if entity.quality.level ~= 0 and check_entity(entity.name) then
                    log(entity_name)
                    local info = {
                        name = "sSashaQuality-" .. entity.quality.name .. "-" .. entity.name,
                        position = entity.position,
                        direction = entity.direction,
                        quality = entity.quality,
                        force = entity.force,
                        fast_replace = true,
                        player = entity.last_user,
                    }
                    local has_recipe = HasRecipe(entity)
                    local has_modules = HasModules(entity)
                    local recipe, qual, modules
                    if has_recipe then
                        recipe, qual = entity.get_recipe()
                    end
                    if has_modules then
                        modules = entity.get_module_inventory().get_contents()
                    end
                    entity.destroy()
                    local new_entity = surface.create_entity(info)
                    if has_recipe then
                        new_entity.set_recipe(recipe, qual)
                    end
                    if has_modules then
                        for _, module in pairs(modules) do
                            new_entity.get_module_inventory().insert({name=module.name, count=module.count, quality=module.quality})
                        end
                    end
                end
            end
        end
    end
end