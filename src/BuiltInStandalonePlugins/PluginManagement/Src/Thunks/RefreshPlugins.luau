local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Thunks.MultiGetPluginInfoRequest);
local v3 = require(l_Parent_0.Src.Actions.SetLoadedPluginData);
local v4 = require(l_Parent_0.Src.Util.extractPluginsFromJsonString);
return function(v5, v6)
    return function(v7)
        local v8 = v4(l_StudioService_0.InstalledPluginData);
        local v9 = {};
        for v10, v11 in pairs(v8) do
            local v12 = tonumber(v11.assetId);
            if v12 == nil then
                warn("assetId is nil or non-numeric for installedPlugin on refresh", v11.assetId);
                v8[v10] = nil;
            else
                v8[v10].assetId = v12;
                v9[#v9 + 1] = v11.assetId;
            end;
        end;
        if #v9 > 0 then
            v7:dispatch(v2(v5, v6, v9, v8));
            return ;
        else
            v7:dispatch(v3({}));
            return ;
        end;
    end;
end;
