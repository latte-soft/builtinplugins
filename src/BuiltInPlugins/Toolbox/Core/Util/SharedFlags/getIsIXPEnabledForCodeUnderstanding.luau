local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.getIsIXPVariableEnabled);
local v4 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
return function(v5)
    if not ((not v4() or not v2.shouldDebugWarnings()) or v5) then
        warn("ixp was undefined for FFlagToolboxUseIXPForCodeUnderstanding");
    end;
    return v4() and v3(v5, "MarketplaceModelsCodeUnderstanding", "MarketplaceModelsCodeUnderstandingEnabled");
end;
