local quality_lib = require('__quality-lib__.module')
local common = require("__better-quality__.common")

local method, value

    -- Transport/Underground Belts, Splitters, Loaders --

method = common.config("belt-speed-quality-scaling-method").value
value = common.config("belt-speed-quality-scaling-value").value
if method ~= "disabled" then
    quality_lib.add(
        {
            ["transport-belt"]={
                ["@all"]={
                    ["speed"]={[method] = value},
                }
            },
            ["underground-belt"]={
                ["@all"]={
                    ["speed"]={[method] = value},
                }
            },
            ["splitter"]={
                ["@all"]={
                    ["speed"]={[method] = value},
                }
            },
            ["loader"]={
                ["@all"]={
                    ["speed"]={[method] = value},
                }
            },
            ["loader-1x1"]={ 
                ["@all"]={
                    ["speed"]={[method] = value},
                },
            },
        }
    )
end

    -- Storage Tanks --

method = common.config("storage-tank-size-quality-scaling-method").value
value = common.config("storage-tank-size-quality-scaling-value").value
if method ~= "disabled" then
    quality_lib.add(
        {
            ["storage-tank"]={
                ["@all"]={
                    ["fluid_box"]={
                        ["volume"]={[method] = value},
                    }
                }
            },
        }
    )
end

    -- Locomotives --

method = common.config("locomotive-speed-quality-scaling-method").value
value = common.config("locomotive-speed-quality-scaling-value").value
if method ~= "disabled" then
    quality_lib.add(
        {
            ["locomotive"]={
                ["@all"]={
                    ["max_speed"]={[method] = value},
                }
            },
        }
    )
end

method = common.config("locomotive-efficiency-quality-scaling-method").value
value = common.config("locomotive-efficiency-quality-scaling-value").value
if method ~= "disabled" then
    quality_lib.add(
        {
            ["locomotive"]={
                ["@all"]={
                    ["energy_source"]={
                        ["effectivity"]={[method] = value},
                    }
                }
            },
        }
    )
end

    -- Cargo/Fluid Wagons --

method = common.config("wagon-size-quality-scaling-method").value
value = common.config("wagon-size-quality-scaling-value").value
if method ~= "disabled" then
    quality_lib.add(
        {
            ["cargo-wagon"]={
                ["@all"]={
                    ["inventory_size"]={[method] = value},
                }
            },
            ["fluid-wagon"]={
                ["@all"]={
                    ["capacity"]={[method] = value},
                }
            },
        }
    )
end

    -- Mining Drills/Pumpjacks --

method = common.config("miner-speed-quality-scaling-method").value
value = common.config("miner-speed-quality-scaling-value").value
if method ~= "disabled" then
    quality_lib.add(
        {
            ["mining-drill"]={
                ["@all"]={
                    ["mining_speed"]={[method] = value},
                },
            },
        }
    )
end

    -- Roboport --

if common.config("tileable-legendary-roboport").value then
    quality_lib.add(
        {
            ["roboport"]={
                ["roboport"]={
                    ["logistics_radius"]={26, 28, 30, 32, 32},
                    ["construction_radius"]={57, 58, 61, 64, 64},
                },
            },
        }
    )
end

    -- Substation --

if common.config("tileable-legendary-substation").value then
    log("bingus")
    quality_lib.add(
        {
            ["electric-pole"]={
                ["substation"]={
                    ["supply_area_distance"]={9, 10, 10, 11, 11},
                    ["maximum_wire_distance"]={19, 20, 21, 22, 22},
                },
            },
        }
    )
end

    -- Big Electric Pole --

if common.config("tileable-legendary-big-electric-pole").value then
    quality_lib.add(
        {
            ["electric-pole"]={
                ["big-electric-pole"]={
                    ["maximum_wire_distance"]={38, 42, 48, 54, 54},
                },
            },
        }
    )
end