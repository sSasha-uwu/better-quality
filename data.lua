local common = require("__better-quality__.common")

local quality_lib = require('__quality-lib__.module')

if common.config("alternative-recycler-output-location") then
    data.raw["furnace"]["recycler"]["vector_to_place_result"] = {1.3, -0.5}
end

local speed_module_1 = data.raw["module"]["speed-module"]
local speed_module_2 = data.raw["module"]["speed-module-2"]
local speed_module_3 = data.raw["module"]["speed-module-3"]

local quality_module_1 = data.raw["module"]["quality-module"]
local quality_module_2 = data.raw["module"]["quality-module-2"]
local quality_module_3 = data.raw["module"]["quality-module-3"]

speed_module_1.effect.quality = tonumber(common.config("speed-module-1-quality-penalty").value) / 10 * -1
speed_module_2.effect.quality = tonumber(common.config("speed-module-2-quality-penalty").value) / 10 * -1
speed_module_3.effect.quality = tonumber(common.config("speed-module-3-quality-penalty").value) / 10 * -1

quality_module_1.effect.quality = tonumber(common.config("quality-module-1-quality-bonus").value) / 10
quality_module_2.effect.quality = tonumber(common.config("quality-module-2-quality-bonus").value) / 10
quality_module_3.effect.quality = tonumber(common.config("quality-module-3-quality-bonus").value) / 10

if common.config("centrifuge-2-enabled").value then
    local item_centrifuge_2 = table.deepcopy(data.raw["item"]["centrifuge"])
    item_centrifuge_2.name = common.mod_prefix .. "centrifuge-2"
    item_centrifuge_2.place_result = common.mod_prefix .. "centrifuge-2"
    item_centrifuge_2.icons = {{
        icon = item_centrifuge_2.icon,
        tint = common.centrifuge_2_tint,
    }}
    data.raw.item[common.mod_prefix .. "centrifuge-2"] = item_centrifuge_2

    local recipe_centrifuge_2 = table.deepcopy(data.raw["recipe"]["centrifuge"])
    recipe_centrifuge_2.name = common.mod_prefix .. "centrifuge-2"
    recipe_centrifuge_2.ingredients =
    {
        {type = "item", name = "speed-module", amount = 4},
        {type = "item", name = "centrifuge", amount = 2}
    }
    recipe_centrifuge_2.results = {{type="item", name=common.mod_prefix .. "centrifuge-2", amount=1}}
    data.raw.recipe[common.mod_prefix .. "centrifuge-2"] = recipe_centrifuge_2

    local entity_centrifuge_2 = table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
    entity_centrifuge_2.name = common.mod_prefix .. "centrifuge-2"
    entity_centrifuge_2.max_health = 400
    entity_centrifuge_2.minable["result"] = common.mod_prefix .. "centrifuge-2"
    entity_centrifuge_2.crafting_speed = 1.25
    entity_centrifuge_2.energy_usage = "875kW"
    entity_centrifuge_2.module_slots = 4
    for _, graphic in pairs(entity_centrifuge_2.graphics_set.idle_animation) do
        graphic[1].tint = common.centrifuge_2_tint
        graphic[3].tint = common.centrifuge_2_tint
        graphic[5].tint = common.centrifuge_2_tint
    end
    data.extend({entity_centrifuge_2})

    table.insert(data.raw.technology["automation-3"].effects,
    {
        type = "unlock-recipe",
        recipe = common.mod_prefix .. "centrifuge-2"
    })
end

quality_lib.add(
    {
        ["storage-tank"]={
            ["storage-tank"]={
                ["fluid_box"]={
                    ["volume"]={30000, 35000, 40000, 45000, 50000}
                }
            }
        },
        ["transport-belt"]={
            ["transport-belt"]={
                ["speed"]={0.0375, 0.04375, 0.047916, 0.05625, 0.0625} -- 18, 21, 24, 27, 30 items/s
            },
            ["fast-transport-belt"]={
                ["speed"]={0.075, 0.0875, 0.1, 0.1125, 0.125} -- 36, 42, 48, 54, 60 items/s
            },
            ["express-transport-belt"]={
                ["speed"]={0.1125, 0.13125, 0.15, 0.16875, 0.1875} -- 54, 63, 72, 81, 90 items/s
            },
            ["turbo-transport-belt"]={
                ["speed"]={0.15, 0.175, 0.2, 0.225, 0.25} -- 72, 84, 96, 108, 120 items/s
            }
        },
        ["underground-belt"]={
            ["underground-belt"]={
                ["speed"]={0.0375, 0.04375, 0.047916, 0.05625, 0.0625} -- 18, 21, 24, 27, 30 items/s
            },
            ["fast-underground-belt"]={
                ["speed"]={0.075, 0.0875, 0.1, 0.1125, 0.125} -- 36, 42, 48, 54, 60 items/s
            },
            ["express-underground-belt"]={
                ["speed"]={0.1125, 0.13125, 0.15, 0.16875, 0.1875} -- 54, 63, 72, 81, 90 items/s
            },
            ["turbo-underground-belt"]={
                ["speed"]={0.15, 0.175, 0.2, 0.225, 0.25} -- 72, 84, 96, 108, 120 items/s
            }
        },
        ["splitter"]={
            ["splitter"]={
                ["speed"]={0.0375, 0.04375, 0.047916, 0.05625, 0.0625} -- 18, 21, 24, 27, 30 items/s
            },
            ["fast-splitter"]={
                ["speed"]={0.075, 0.0875, 0.1, 0.1125, 0.125} -- 36, 42, 48, 54, 60 items/s
            },
            ["express-splitter"]={
                ["speed"]={0.1125, 0.13125, 0.15, 0.16875, 0.1875} -- 54, 63, 72, 81, 90 items/s
            },
            ["turbo-splitter"]={
                ["speed"]={0.15, 0.175, 0.2, 0.225, 0.25} -- 72, 84, 96, 108, 120 items/s
            }
        },
        ["loader"]={
            ["loader"]={
                ["speed"]={0.0375, 0.04375, 0.047916, 0.05625, 0.0625} -- 18, 21, 24, 27, 30 items/s
            },
            ["fast-loader"]={
                ["speed"]={0.075, 0.0875, 0.1, 0.1125, 0.125} -- 36, 42, 48, 54, 60 items/s
            },
            ["express-loader"]={
                ["speed"]={0.1125, 0.13125, 0.15, 0.16875, 0.1875} -- 54, 63, 72, 81, 90 items/s
            },
            ["turbo-loader"]={
                ["speed"]={0.15, 0.175, 0.2, 0.225, 0.25} -- 72, 84, 96, 108, 120 items/s
            }
        },
        ["locomotive"]={
            ["locomotive"]={
                ["max_speed"]={1.25, 1.3, 1.35, 1.4, 1.45},
                ["max_power"]={"540kW", "480kW", "420kW", "360kW", "300kW"}
            }
        },
        ["cargo-wagon"]={
            ["cargo-wagon"]={
                ["inventory_size"]={48, 56, 64, 72, 80}
            }
        },
        ["fluid-wagon"]={
            ["fluid-wagon"]={
                ["capacity"]={60000, 70000, 80000, 90000, 100000}
            }
        },
        ["mining-drill"]={
            ["burner-mining-drill"]={
                ["mining_speed"]={0.30, 0.35, 0.40, 0.45, 0.50}
            },
            ["electric-mining-drill"]={
                ["mining_speed"]={0.6, 0.7, 0.8, 0.9, 1.0}
            },
            ["big-mining-drill"]={
                ["mining_speed"]={3.0, 3.5, 4.0, 4.5, 5.0}
            },
            ["pumpjack"]={
                ["mining_speed"]={1.2, 1.4, 1.6, 1.8, 2.0}
            },
        }
    }
)

if mods["aai-loaders"] then
    quality_lib.add(
        {
            ["loader-1x1"]={ 
                ["aai-loader"]={
                    ["speed"]={0.0375, 0.04375, 0.047916, 0.05625, 0.0625} -- 18, 21, 24, 27, 30 items/s
                },
                ["aai-fast-loader"]={
                    ["speed"]={0.075, 0.0875, 0.1, 0.1125, 0.125} -- 36, 42, 48, 54, 60 items/s
                },
                ["aai-express-loader"]={
                    ["speed"]={0.1125, 0.13125, 0.15, 0.16875, 0.1875} -- 54, 63, 72, 81, 90 items/s
                },
                ["aai-turbo-loader"]={
                    ["speed"]={0.15, 0.175, 0.2, 0.225, 0.25} -- 72, 84, 96, 108, 120 items/s
                }
            }
        }
    )
end