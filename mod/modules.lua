local common = require("__better-quality__.common")

local success, response

local function generate_optimization_module()
    local optimization_module_internal_name = common.mod_prefix .. "optimization-module"
    data:extend(
        {
        {
                type = "module-category",
                name = "optimization"
            }
        }
    )
    data.raw.beacon.beacon.allowed_effects = {"consumption", "speed", "pollution","productivity"}
    -- table.insert(data.raw["beacon"]["beacon"]["allowed_effects"], "optimization")
    local optimization_module_item = table.deepcopy(data.raw["module"]["quality-module-3"])
    optimization_module_item.category = "optimization"
    optimization_module_item.name = optimization_module_internal_name
    optimization_module_item.localised_description = {"item-description." .. optimization_module_internal_name}
    optimization_module_item.icons = {
        {
            icon = optimization_module_item.icon,
            tint = common.optimization_module_tint,
        }
    }
    optimization_module_item.order = "d[optimization]-a[optimization-module]"
    optimization_module_item.effect =
    {
        speed = common.config("optimization-module-speed-bonus").value / 100,
        productivity = common.config("optimization-module-productivity-bonus").value / 100,
        consumption = common.config("optimization-module-energy-consumption").value / 100,
        pollution = common.config("optimization-module-pollution-multiplier").value / 100,
    }
    data.raw.module[optimization_module_internal_name] = optimization_module_item

    data.raw.recipe[optimization_module_internal_name] = {
        type = "recipe",
        name = optimization_module_internal_name,
        enabled = false,
        ingredients =
        {
            {type = "item", name = "productivity-module-3", amount = 1},
            {type = "item", name = "speed-module-3", amount = 1},
        },
        energy_required = 60,
        results = {{type="item", name=optimization_module_internal_name, amount=1}}
    }

    table.insert(data.raw.technology["quantum-processor"].effects,
    {
        type = "unlock-recipe",
        recipe = optimization_module_internal_name
    })
end

local function alter_modules()
    for i=1,3 do
        local x = ""
        if i ~= 1 then x = "-" .. i end
    
        data.raw["module"]["speed-module" .. x]["effect"]["quality"] = common.config("speed-module-" .. i .. "-quality-penalty").value / 10 * -1
    
        data.raw["module"]["quality-module" .. x]["effect"]["quality"] = common.config("quality-module-" .. i .. "-quality-bonus").value / 10
    end
end

if common.config("optimization-module-enabled").value then
    success, response = pcall(generate_optimization_module)
    if not success and response then common.error_handler(response, "generate_optimization_module()") end
end

success, response = pcall(alter_modules)
if not success and response then common.error_handler(response, "alter_modules()") end