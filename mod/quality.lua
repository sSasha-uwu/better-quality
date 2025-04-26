local quality_lib = require('__quality-lib__.module')

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