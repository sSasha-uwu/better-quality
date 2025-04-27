local common = require("__better-quality__.common")

local success, response

local function generate_centrifuge_2()
    local centrifuge_2_internal_name = common.mod_prefix .. "centrifuge-2"
    local item_centrifuge_2 = table.deepcopy(data.raw["item"]["centrifuge"])
    item_centrifuge_2.name = centrifuge_2_internal_name
    item_centrifuge_2.place_result = centrifuge_2_internal_name
    item_centrifuge_2.icons = {{
        icon = item_centrifuge_2.icon,
        tint = common.centrifuge_2_tint,
    }}
    data.raw.item[centrifuge_2_internal_name] = item_centrifuge_2

    local recipe_centrifuge_2 = table.deepcopy(data.raw["recipe"]["centrifuge"])
    recipe_centrifuge_2.name = centrifuge_2_internal_name
    recipe_centrifuge_2.ingredients =
    {
        {type = "item", name = "speed-module", amount = 4},
        {type = "item", name = "centrifuge", amount = 2}
    }
    recipe_centrifuge_2.results = {{type="item", name=centrifuge_2_internal_name, amount=1}}
    data.raw.recipe[centrifuge_2_internal_name] = recipe_centrifuge_2

    local entity_centrifuge_2 = table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
    entity_centrifuge_2.name = centrifuge_2_internal_name
    entity_centrifuge_2.max_health = 400
    entity_centrifuge_2.minable["result"] = centrifuge_2_internal_name
    entity_centrifuge_2.crafting_speed = 1.25
    entity_centrifuge_2.energy_usage = "875kW"
    entity_centrifuge_2.module_slots = 4
    for _, graphic in pairs(entity_centrifuge_2.graphics_set.idle_animation) do
        graphic[1].tint = common.centrifuge_2_tint
        graphic[3].tint = common.centrifuge_2_tint
        graphic[5].tint = common.centrifuge_2_tint
    end
    data:extend({entity_centrifuge_2})

    table.insert(data.raw.technology["automation-3"].effects,
    {
        type = "unlock-recipe",
        recipe = centrifuge_2_internal_name
    })
end

if common.config("centrifuge-2-enabled").value then
    success, response = pcall(generate_centrifuge_2)
    if not success and response then common.error_handler(response, "generate_centrifuge_2()") end
end