data:extend({

    -- Speed Modules --

    {
		type="double-setting",
		name="speed-module-1-quality-penalty",
		setting_type="startup",
		default_value=1.0,
	},
    {
		type="double-setting",
		name="speed-module-2-quality-penalty",
		setting_type="startup",
		default_value=1.5,
	},
    {
		type="double-setting",
		name="speed-module-3-quality-penalty",
		setting_type="startup",
		default_value=2.5,
	},

    -- Quality Modules --

    {
		type="double-setting",
		name="quality-module-1-quality-bonus",
		setting_type="startup",
		default_value=1.0,
	},
    {
		type="double-setting",
		name="quality-module-2-quality-bonus",
		setting_type="startup",
		default_value=1.5,
	},
    {
		type="double-setting",
		name="quality-module-3-quality-bonus",
		setting_type="startup",
		default_value=2.5,
	},

    -- Centrifuge 2 --
    {
        type="bool-setting",
        name="centrifuge-2-enabled",
        setting_type="startup",
        default_value=false,
    }
})
