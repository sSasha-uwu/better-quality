local common = require("__better-quality__.common")

local _, err

local function alter_recycler_output_location()
    data.raw["furnace"]["recycler"]["vector_to_place_result"] = {1.3, -0.5}
end

local function generate_bulk_recycling_category()
    data:extend{
        {
            type = "recipe-category",
            name = "recycling-bulk"
        },
    }
end

---@param bulk_recycler_internal_name string
local function generate_bulk_recycler_item(bulk_recycler_internal_name)
    local bulk_recycler_item = table.deepcopy(data.raw["item"]["recycler"])
    bulk_recycler_item.name = bulk_recycler_internal_name
    bulk_recycler_item.icons = common.ternary(
        bulk_recycler_item.icon,
        {
            {
                icon = bulk_recycler_item.icon,
                tint = common.bulk_recycler_tint,
            }
        },
        nil
    )
    bulk_recycler_item.place_result = bulk_recycler_internal_name
    data.raw.item[bulk_recycler_internal_name] = bulk_recycler_item
end

---@param bulk_recycler_internal_name string
local function generate_bulk_recycler_recipe(bulk_recycler_internal_name)
    local bulk_recycler_recipe = table.deepcopy(data.raw["recipe"]["recycler"])
    bulk_recycler_recipe.name = bulk_recycler_internal_name
    bulk_recycler_recipe.results[1].name = bulk_recycler_internal_name
    data.raw.recipe[bulk_recycler_internal_name] = bulk_recycler_recipe
end

---@param bulk_recycler_internal_name string
local function generate_bulk_recycler_entity(bulk_recycler_internal_name)
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
end

---@param bulk_recycler_internal_name string
---@param recipe_name string
---@param recipe_value table
local function generate_bulk_recycling_recipe(bulk_recycler_internal_name, recipe_name, recipe_value)
    if recipe_name:sub(-#"-recycling") == "-recycling" then
        local bulk_recycling_recipe = table.deepcopy(recipe_value)
        local item_name = bulk_recycling_recipe.ingredients[1].name
        local item_type = common.get_prototype_name(item_name, "item")
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
    table.insert(data.raw.technology["recycling"].effects,
    {
        type = "unlock-recipe",
        recipe = bulk_recycler_internal_name
    })
end

if common.config("alternative-recycler-output-location") then
    _, err = pcall(alter_recycler_output_location)
    if err then common.error_handler(err, "alter_recycler_output_location()") end
end

if common.config("bulk-recycler-enabled") then
    local bulk_recycler_internal_name = common.mod_prefix .. "bulk-recycler"

    _, err = pcall(generate_bulk_recycling_category)
    if err then common.error_handler(err, "generate_bulk_recycling_category()") end

    _, err = pcall(generate_bulk_recycler_item, bulk_recycler_internal_name)
    if err then common.error_handler(err, "generate_bulk_recycler_item()") end

    _, err = pcall(generate_bulk_recycler_recipe, bulk_recycler_internal_name)
    if err then common.error_handler(err, "generate_bulk_recycler_recipe()") end

    _, err = pcall(generate_bulk_recycler_entity, bulk_recycler_internal_name)
    if err then common.error_handler(err, "generate_bulk_recycler_entity()") end
    
    for recipe_name, recipe_value in pairs(data.raw.recipe) do
        _, err = pcall(generate_bulk_recycling_recipe, bulk_recycler_internal_name, recipe_name, recipe_value)
        if err then common.error_handler(err, "generate_bulk_recycling_recipe() | Recipe: " .. recipe_name) end
    end

end