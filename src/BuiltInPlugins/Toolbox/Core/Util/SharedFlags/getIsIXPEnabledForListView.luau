local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.getIsIXPVariableEnabled);
local v2 = require(l_Util_0.SharedFlags.getFFlagToolboxEnableAssetRows);
game:DefineFastFlag("ToolboxListViewEnabledForAll", false);
return function(v3)
    if not game:GetFastFlag("ToolboxListViewEnabledForAll") then
        return (v3 and v2()) and v1(v3, "MarketplaceModelsListView", "MarketplaceModelsListViewEnabled");
    else
        return v2();
    end;
end;
