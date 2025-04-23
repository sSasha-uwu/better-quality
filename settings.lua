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
})
