local common = require("__better-quality__.common")

data:extend({

    -- Speed Modules --

    {
		type="double-setting",
		name=common.mod_prefix .. "speed-module-1-quality-penalty",
		setting_type="startup",
		default_value=1.0,
	},
    {
		type="double-setting",
		name=common.mod_prefix .. "speed-module-2-quality-penalty",
		setting_type="startup",
		default_value=1.5,
	},
    {
		type="double-setting",
		name=common.mod_prefix .. "speed-module-3-quality-penalty",
		setting_type="startup",
		default_value=2.5,
	},

    -- Quality Modules --

    {
		type="double-setting",
		name=common.mod_prefix .. "quality-module-1-quality-bonus",
		setting_type="startup",
		default_value=1.0,
	},
    {
		type="double-setting",
		name=common.mod_prefix .. "quality-module-2-quality-bonus",
		setting_type="startup",
		default_value=1.5,
	},
    {
		type="double-setting",
		name=common.mod_prefix .. "quality-module-3-quality-bonus",
		setting_type="startup",
		default_value=2.5,
	},

    -- Optimization Modules --

    {
        type="bool-setting",
        name=common.mod_prefix .. "optimization-module-enabled",
        setting_type="startup",
        default_value=false,
    },

    {
		type="int-setting",
		name=common.mod_prefix .. "optimization-module-speed-bonus",
		setting_type="startup",
		default_value=1,
	},

    {
		type="int-setting",
		name=common.mod_prefix .. "optimization-module-productivity-bonus",
		setting_type="startup",
		default_value=2,
	},

    {
		type="int-setting",
		name=common.mod_prefix .. "optimization-module-energy-consumption",
		setting_type="startup",
		default_value=25,
	},

    {
		type="double-setting",
		name=common.mod_prefix .. "optimization-module-pollution-multiplier",
		setting_type="startup",
		default_value=5,
	},

    -- Centrifuge 2 --

    {
        type="bool-setting",
        name=common.mod_prefix .. "centrifuge-2-enabled",
        setting_type="startup",
        default_value=false,
    },

    -- Recycler --

    {
        type="bool-setting",
        name=common.mod_prefix .. "alternative-recycler-output-location",
        setting_type="startup",
        default_value=false,
    },

    {
        type="bool-setting",
        name=common.mod_prefix .. "bulk-recycler-enabled",
        setting_type="startup",
        default_value=false,
    },

    -- Transport Belts/Underground Belts/Splitters/Loaders --

    {
        type="string-setting",
        name=common.mod_prefix .. "belt-speed-quality-scaling-method",
        setting_type="startup",
        allowed_values={"disabled", "delta_constant", "delta_additive", "delta_multiplicative"},
        default_value="delta_additive"
    },

    {
		type="double-setting",
		name=common.mod_prefix .. "belt-speed-quality-scaling-value",
		setting_type="startup",
		default_value=0.2,
	},

    -- Storage Tanks --

    {
        type="string-setting",
        name=common.mod_prefix .. "storage-tank-size-quality-scaling-method",
        setting_type="startup",
        allowed_values={"disabled", "delta_constant", "delta_additive", "delta_multiplicative"},
        default_value="delta_additive"
    },

    {
		type="double-setting",
		name=common.mod_prefix .. "storage-tank-size-quality-scaling-value",
		setting_type="startup",
		default_value=0.2,
	},

    -- Locomotives --

    {
        type="string-setting",
        name=common.mod_prefix .. "locomotive-speed-quality-scaling-method",
        setting_type="startup",
        allowed_values={"disabled", "delta_constant", "delta_additive", "delta_multiplicative"},
        default_value="delta_constant"
    },

    {
		type="double-setting",
		name=common.mod_prefix .. "locomotive-speed-quality-scaling-value",
		setting_type="startup",
		default_value=0.05,
	},

    {
        type="string-setting",
        name=common.mod_prefix .. "locomotive-efficiency-quality-scaling-method",
        setting_type="startup",
        allowed_values={"disabled", "delta_constant", "delta_additive", "delta_multiplicative"},
        default_value="delta_additive"
    },

    {
		type="double-setting",
		name=common.mod_prefix .. "locomotive-efficiency-quality-scaling-value",
		setting_type="startup",
		default_value=0.2,
	},

    -- Cargo/Fluid Wagons --

    {
        type="string-setting",
        name=common.mod_prefix .. "wagon-size-quality-scaling-method",
        setting_type="startup",
        allowed_values={"disabled", "delta_constant", "delta_additive", "delta_multiplicative"},
        default_value="delta_additive"
    },

    {
		type="double-setting",
		name=common.mod_prefix .. "wagon-size-quality-scaling-value",
		setting_type="startup",
		default_value=0.2,
	},

    -- Mining Drills/Pumpjacks --

    {
        type="string-setting",
        name=common.mod_prefix .. "miner-speed-quality-scaling-method",
        setting_type="startup",
        allowed_values={"disabled", "delta_constant", "delta_additive", "delta_multiplicative"},
        default_value="delta_additive"
    },

    {
		type="double-setting",
		name=common.mod_prefix .. "miner-speed-quality-scaling-value",
		setting_type="startup",
		default_value=0.2,
	},

    -- Roboport --

    {
        type="bool-setting",
        name=common.mod_prefix .. "tileable-legendary-roboport",
        setting_type="startup",
        default_value=true,
    },

    -- Substation --

    {
        type="bool-setting",
        name=common.mod_prefix .. "tileable-legendary-substation",
        setting_type="startup",
        default_value=true,
    },

    -- Big Electric Pole --

    {
        type="bool-setting",
        name=common.mod_prefix .. "tileable-legendary-big-electric-pole",
        setting_type="startup",
        default_value=true,
    },

})
