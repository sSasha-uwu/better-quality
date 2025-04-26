local common = {}

common.mod_prefix = "sSasha__better-quality__"

common.centrifuge_2_tint = {r=0.5, g=0.5, b=0.5, a=1}
common.optimization_module_tint = {r=0.5, g=0.5, b=0.5, a=1}
common.bulk_recycler_tint = {r=0.5, g=0.5, b=0.5, a=1}

---@param name string
function common.config(name)
    return settings.startup[common.mod_prefix .. name]
end

---@param name string
---@param base_prototype string
---@return string|nil
function common.get_prototype_name(name, base_prototype)
    for type_name in pairs(defines.prototypes[base_prototype]) do
        local prototypes = data.raw[type_name]
        if prototypes and prototypes[name] then
            return type_name
        end
        if data.raw.item[name] then
            return "item"
        end
    end
    return nil
end

function common.ternary(condition, if_true, if_false)
    return (condition and {if_true} or {if_false})[1]
end

---@param err string
---@param source string
function common.error_handler(err, source)
    log("[ERROR] An error occurred in " .. source .. "\n" .. err)
end

return common