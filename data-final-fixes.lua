local common = require("__better-quality__.common")

local function get_prototype_name(name, base_prototype)
    for type_name in pairs(defines.prototypes[base_prototype]) do
        local prototypes = data.raw[type_name]
        if prototypes and prototypes[name] then
            return type_name
        end
        if data.raw.item[name] then
            return "item"
        end
    end
    return nil
end

if common.config("bulk-recycler-enabled") then
    data:extend{
        {
            type = "recipe-category",
            name = "recycling-bulk"
        },
    }
    local bulk_recycler_internal_name = common.mod_prefix .. "bulk-recycler"
    local bulk_recycler_item = table.deepcopy(data.raw["item"]["recycler"])
    bulk_recycler_item.name = bulk_recycler_internal_name
    bulk_recycler_item.icons = {
        {
            icon = bulk_recycler_item.icon,
            tint = common.bulk_recycler_tint,
        }
    }
    bulk_recycler_item.place_result = bulk_recycler_internal_name
    data.raw.item[bulk_recycler_internal_name] = bulk_recycler_item

    local bulk_recycler_recipe = table.deepcopy(data.raw["recipe"]["recycler"])
    bulk_recycler_recipe.name = bulk_recycler_internal_name
    bulk_recycler_recipe.results[1].name = bulk_recycler_internal_name
    data.raw.recipe[bulk_recycler_internal_name] = bulk_recycler_recipe

    local bulk_recycler_entity = table.deepcopy(data.raw["furnace"]["recycler"])
    bulk_recycler_entity.name = bulk_recycler_internal_name
    bulk_recycler_entity.minable.result = bulk_recycler_internal_name
    bulk_recycler_entity.crafting_categories = {"recycling-bulk"}
    bulk_recycler_entity.cant_insert_at_source_message_key = common.mod_prefix .. "inventory-restriction.cant-be-bulk-recycled"
    for _, graphic in pairs(bulk_recycler_entity.graphics_set.animation) do
        graphic.layers[1].tint = common.bulk_recycler_tint
    end

    for _, graphic in pairs(bulk_recycler_entity.graphics_set_flipped.animation) do
        graphic.layers[1].tint = common.bulk_recycler_tint
    end
    data.raw.furnace[bulk_recycler_internal_name] = bulk_recycler_entity
    for recipe_name, recipe_value in pairs(data.raw.recipe) do
        if recipe_name:sub(-#"-recycling") == "-recycling" then
            local bulk_recycling_recipe = table.deepcopy(recipe_value)
            local item_name = bulk_recycling_recipe.ingredients[1].name
            local item_type = get_prototype_name(item_name, "item")
            if item_name == bulk_recycling_recipe.results[1].name then goto continue end
            if item_type and data.raw[item_type] and data.raw[item_type][item_name] and data.raw[item_type][item_name].flags and data.raw[item_type][item_name].flags["not-stackable"] then goto continue end
            if item_type == "armor" then goto continue end
            bulk_recycling_recipe.category = "recycling-bulk"
            bulk_recycling_recipe.energy_required = bulk_recycling_recipe.energy_required * 4
            bulk_recycling_recipe.ingredients[1].amount = 4
            bulk_recycling_recipe.name = bulk_recycling_recipe.name .. "-bulk"
            for _, result_table in pairs(bulk_recycling_recipe.results) do
                if result_table.amount then result_table.amount = result_table.amount * 4 end
                if result_table.amount_min then result_table.amount_min = result_table.amount_min * 4 end
                if result_table.amount_max then result_table.amount_max = result_table.amount_max * 4 end
                result_table.extra_count_fraction = nil
                result_table.probability = nil
            end
            data.raw.recipe[bulk_recycling_recipe.name] = bulk_recycling_recipe
        end
        ::continue::
    end
    table.insert(data.raw.technology["recycling"].effects,
    {
        type = "unlock-recipe",
        recipe = bulk_recycler_internal_name
    })
end