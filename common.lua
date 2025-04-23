local common = {}

common.mod_prefix = "sSasha__better-quality__"

common.centrifuge_2_tint = {r=0.5, g=0.5, b=0.5, a=1}
common.optimization_module_tint = {r=0.5, g=0.5, b=0.5, a=1}
common.bulk_recycler_tint = {r=0.5, g=0.5, b=0.5, a=1}

function common.config(name)
    return settings.startup[common.mod_prefix .. name]
end

return common