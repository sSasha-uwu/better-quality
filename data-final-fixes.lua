require 'common'

local speed_module_1 = data.raw["module"]["speed-module"]
local speed_module_2 = data.raw["module"]["speed-module-2"]
local speed_module_3 = data.raw["module"]["speed-module-3"]

local quality_module_1 = data.raw["module"]["quality-module"]
local quality_module_2 = data.raw["module"]["quality-module-2"]
local quality_module_3 = data.raw["module"]["quality-module-3"]

speed_module_1.effect.quality = tonumber(settings.startup["speed-module-1-quality-penalty"].value) / 10 * -1
speed_module_2.effect.quality = tonumber(settings.startup["speed-module-2-quality-penalty"].value) / 10 * -1
speed_module_3.effect.quality = tonumber(settings.startup["speed-module-3-quality-penalty"].value) / 10 * -1

quality_module_1.effect.quality = tonumber(settings.startup["quality-module-1-quality-bonus"].value) / 10
quality_module_2.effect.quality = tonumber(settings.startup["quality-module-2-quality-bonus"].value) / 10
quality_module_3.effect.quality = tonumber(settings.startup["quality-module-3-quality-bonus"].value) / 10

local qualities = table.deepcopy(data.raw["quality"])

local new_entities = {}
local new_items = {}
local new_recipes = {}

for prototype_name, prototype_value in pairs(CHANGED_ENTITIES) do
    for entity_name, _ in pairs(prototype_value) do
        for quality_name, quality_value in pairs(qualities) do
            if quality_value.level > 0 then
                local new_entity = table.deepcopy(data.raw[prototype_name][entity_name])
                new_entity.localised_name = {"entity-name." .. new_entity.name}
                new_entity.localised_description = {"entity-description." .. new_entity.name}
                new_entity.hidden = false
                new_entity.name = "sSashaQuality-" .. quality_name .. "-" .. new_entity.name
                new_entity.placeable_by = {item=new_entity.name, count=1, quality=quality_value}
                new_entity.minable["result"] = new_entity.name
                if prototype_name == "transport-belt" then
                    new_entity.related_underground_belt = "sSashaQuality-" .. quality_name .. "-" .. new_entity.related_underground_belt
                end
                for stat_name, stat_value in pairs(CHANGED_ENTITIES[prototype_name][entity_name]) do
                    if IsDictionary(stat_value) then
                        for stat_table_name, stat_table_value in pairs(stat_value) do
                            new_entity[stat_name][stat_table_name] = stat_table_value[quality_value.level]
                        end
                    else
                        new_entity[stat_name] = stat_value[quality_value.level]
                    end
                end
                table.insert(new_entities, new_entity)
                local new_item = table.deepcopy(data.raw["item"][entity_name]) or table.deepcopy(data.raw["item-with-entity-data"][entity_name])
                new_item.name = "sSashaQuality-" .. quality_name .. "-" .. new_item.name
                new_item.place_result = new_entity.name
                new_item.subgroup = nil
                table.insert(new_items, new_item)
            end
        end
    end
end

if settings.startup["centrifuge-2-enabled"].value then
    local item_centrifuge_2 = table.deepcopy(data.raw["item"]["centrifuge"])
    item_centrifuge_2.name = "centrifuge-2"
    item_centrifuge_2.place_result = "centrifuge-2"
    data.extend({item_centrifuge_2})

    local recipe_centrifuge_2 = table.deepcopy(data.raw["recipe"]["centrifuge"])
    recipe_centrifuge_2.name = "centrifuge-2"
    recipe_centrifuge_2.ingredients =
    {
        {type = "item", name = "speed-module", amount = 4},
        {type = "item", name = "centrifuge", amount = 2}
    }
    recipe_centrifuge_2.results = {{type="item", name="centrifuge-2", amount=1}}
    data.extend({recipe_centrifuge_2})

    local entity_centrifuge_2 = table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
    entity_centrifuge_2.name = "centrifuge-2"
    entity_centrifuge_2.max_health = 400
    entity_centrifuge_2.minable["result"] = "centrifuge-2"
    entity_centrifuge_2.crafting_speed = 1.25
    entity_centrifuge_2.energy_usage = "875kW"
    entity_centrifuge_2.module_slots = 4
    data.extend({entity_centrifuge_2})

    table.insert(data.raw.technology["automation-3"].effects,
    {
        type = "unlock-recipe",
        recipe = "centrifuge-2"
    })
end

data.extend(new_entities)
data.extend(new_items)