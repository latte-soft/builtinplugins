local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Actions.SetAllPluginPermissions);
local v3 = require(l_Parent_0.Src.Util.extractPluginsFromJsonString);
return function(v4, _)
    return function(v6)
        local v7 = v3(l_StudioService_0.InstalledPluginData);
        local v8 = {};
        for _, v10 in pairs(v7) do
            local v11 = tonumber(v10.assetId);
            if v11 == nil then
                warn("assetId is nil or non-numeric for installedPlugin", v10.assetId);
            else
                v8[v11] = v4:GetPermissions(v10.assetId);
            end;
        end;
        v6:dispatch(v2(v8));
    end;
end;
