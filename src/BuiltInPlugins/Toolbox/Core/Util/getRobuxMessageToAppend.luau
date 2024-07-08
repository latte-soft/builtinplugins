local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.Constants);
local v2 = require(l_Util_0.SharedFlags.getFFlagEnableCreateUGCBundleCreationFeeErrorCodes);
local v3 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
return function(v4, v5, v6)
    assert(v2());
    if v4 > 0 then
        if not v3() or not v6 then
            return "\n" .. v5:getText("AssetConfig", "CreateBundleNoRobuxDeducted");
        else
            return "\n" .. v5:getText("AssetConfig", "SomethingWentWrongMsgWithDashboardLink", {
                creatorDashboardLink = v1.CREATOR_DASHBOARD_LINK_PLACEHOLDER
            });
        end;
    else
        return "";
    end;
end;
