local common = require("__better-quality__.common")

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
            if bulk_recycling_recipe.ingredients[1].name == bulk_recycling_recipe.results[1].name then goto continue end
            bulk_recycling_recipe.category = "recycling-bulk"
            bulk_recycling_recipe.energy_required = bulk_recycling_recipe.energy_required * 4
            bulk_recycling_recipe.ingredients[1].amount = 4
            bulk_recycling_recipe.name = bulk_recycling_recipe.name .. "-bulk"
            for _, result_table in pairs(bulk_recycling_recipe.results) do
                result_table.amount = result_table.amount * 4
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