local v0 = {
    FlagExists = {}, 
    FlagValue = {}
};
local function v4(v1)
    if v0.FlagExists[v1] == nil then
        local l_status_0, l_result_0 = pcall(function()
            return settings():GetFFlag(v1);
        end);
        v0.FlagExists[v1] = l_status_0;
        if l_status_0 then
            v0.FlagValue[v1] = l_result_0;
        end;
    end;
    return v0.FlagExists[v1] and v0.FlagValue[v1];
end;
v0.isBundleConfigurationEnabled = function(_)
    return (v4("DebugAvatarImporterBundleConfiguration"));
end;
return v0;
