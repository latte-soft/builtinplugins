local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Actions.SetPluginEnabledState);
return function(v3, v4)
    return function(v5)
        local l_assetId_0 = v3.assetId;
        l_StudioService_0:SetPluginEnabled(l_assetId_0, v4);
        v5:dispatch(v2(l_assetId_0, v4));
    end;
end;
