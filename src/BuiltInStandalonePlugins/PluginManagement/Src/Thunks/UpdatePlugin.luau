local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Util.UpdateStatus);
local v3 = require(l_Parent_0.Src.Actions.SetPluginUpdateStatus);
return function(v4, v5)
    return function(v6)
        local l_assetId_0 = v4.assetId;
        local l_latestVersion_0 = v4.latestVersion;
        v6:dispatch(v3(l_assetId_0, v2.Updating));
        if not pcall(function()
            l_StudioService_0:TryInstallPlugin(l_assetId_0, l_latestVersion_0);
        end) then
            v5:report("UpdatePluginFailure", l_assetId_0);
            v6:dispatch(v3(l_assetId_0, v2.Error));
            return ;
        else
            v5:report("UpdatePluginSuccess", l_assetId_0);
            v6:dispatch(v3(l_assetId_0, v2.Success));
            return ;
        end;
    end;
end;
