local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Thunks.UpdatePlugin);
return function(v3)
    return function(v4)
        for _, v6 in pairs(v4:getState().Management.plugins) do
            if not l_StudioService_0:IsPluginUpToDate(v6.assetId, v6.latestVersion) then
                v4:dispatch(v2(v6, v3));
            end;
        end;
    end;
end;
