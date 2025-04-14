require 'common'

data.raw["module"]["speed-module"].effect = {speed = 0.2, consumption = 0.5}
data.raw["module"]["speed-module-2"].effect = {speed = 0.3, consumption = 0.6}
data.raw["module"]["speed-module-3"].effect = {speed = 0.5, consumption = 0.7}

local qualities = table.deepcopy(data.raw["quality"])

local new_entities = {}
local new_items = {}

for prototype_name, prototype_value in pairs(CHANGED_ENTITIES) do
    for entity_name, _ in pairs(prototype_value) do
        log("base item:" .. entity_name)
        for quality_name, quality_value in pairs(qualities) do
            if quality_value.level > 0 then
                local new_entity = table.deepcopy(data.raw[prototype_name][entity_name])
                new_entity.localised_name = {"entity-name." .. new_entity.name}
                new_entity.localised_description = {"entity-description." .. new_entity.name}
                new_entity.hidden = true
                new_entity.name = "sSashaQuality-" .. quality_name .. "-" .. new_entity.name
                new_entity.placeable_by = {item=new_entity.name, count=1, quality=quality_value}
                new_entity.minable["result"] = new_entity.name
                log(new_entity.name)
                for stat_name, stat_value in pairs(CHANGED_ENTITIES[prototype_name][entity_name]) do
                    if IsDictionary(stat_value) then
                        for stat_table_name, stat_table_value in pairs(stat_value) do
                            log(stat_table_name .. "|" .. stat_table_value[quality_value.level])
                            new_entity[stat_name][stat_table_name] = stat_table_value[quality_value.level]
                        end
                    else
                        log(stat_name .. " | " .. stat_value[quality_value.level])
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

data.extend(new_entities)
data.extend(new_items)