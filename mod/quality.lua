local quality_lib = require('__quality-lib__.module')

quality_lib.add(
    {
        ["storage-tank"]={
            ["@all"]={
                ["fluid_box"]={
                    ["volume"]={delta_additive = 0.2}
                }
            }
        },
        ["transport-belt"]={
            ["@all"]={
                ["speed"]={delta_additive = 0.2}
            }
        },
        ["underground-belt"]={
            ["@all"]={
                ["speed"]={delta_additive = 0.2}
            }
        },
        ["splitter"]={
            ["@all"]={
                ["speed"]={delta_additive = 0.2}
            }
        },
        ["loader"]={
            ["@all"]={
                ["speed"]={delta_additive = 0.2}
            }
        },
        ["loader-1x1"]={ 
            ["@all"]={
                ["speed"]={delta_additive = 0.2}
            },
        },
        ["locomotive"]={
            ["@all"]={
                ["max_speed"]={delta_constant = 0.05},
                ["energy_source"]={
                    ["effectivity"]={delta_additive = 0.2}
                }
            }
        },
        ["cargo-wagon"]={
            ["@all"]={
                ["inventory_size"]={delta_additive = 0.2}
            }
        },
        ["fluid-wagon"]={
            ["@all"]={
                ["capacity"]={delta_additive = 0.2}
            }
        },
        ["mining-drill"]={
            ["@all"]={
                ["mining_speed"]={delta_additive = 0.2}
            },
        }
    }
)