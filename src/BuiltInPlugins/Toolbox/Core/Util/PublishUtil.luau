local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Parent_0.Packages.Dash);
local v3 = require(l_Util_0.AssetConfigConstants);
local v4 = require(l_Parent_0.Core.Util.AssetConfigUtil);
local v5 = require(l_Parent_0.Core.Types.ConfigTypes);
local _ = require(l_Parent_0.Core.Types.AssetMediaTypes);
local _ = require(l_Parent_0.Core.Types.PublishingRequirementsType);
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local l_DisableUGCBodyUploadValidation1_0 = game:GetFastFlag("DisableUGCBodyUploadValidation1");
local v11 = {
    isValidAssetMedia = function(v10)
        if not (v10 ~= nil) or v10.ThumbnailOrderToChange == nil then
            return true;
        else
            return #v10.ThumbnailOrderToChange <= v3.additionalImages.MaxThumbnails;
        end;
    end
};
v11.checkCanSave = function(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21)
    if not v5:isOverride(v16) then
        if not v5:isPermissions(v16) then
            local v22 = v12 and next(v12) ~= nil;
            local v23 = false;
            if #v13 <= v3.NAME_CHARACTER_LIMIT then
                v23 = tostring(v13) ~= "";
            end;
            local v24 = #v14 <= v3.DESCRIPTION_CHARACTER_LIMIT;
            if not (not v4.isCatalogAsset(v18) and not v4.isUGCBundleType(v18)) then
                v24 = v24 and tostring(v14) ~= "";
            end;
            local v25 = (((v23 and v24) and v15) and v11.isValidAssetMedia(v19)) and v21;
            if v17 == v3.FLOW_TYPE.UPLOAD_FLOW then
                if v18 == nil then
                    return false;
                else
                    if not (not v4.isCatalogAsset(v18) and not v4.isUGCBundleType(v18)) then
                        v25 = v25 and (v20 or l_DisableUGCBodyUploadValidation1_0);
                    end;
                    return v25;
                end;
            else
                return v25 and v22;
            end;
        else
            return (v12 and next(v12) ~= nil) and (v12.permissions and next(v12.permissions) ~= nil);
        end;
    else
        return v12 and v12.OverrideAssetId;
    end;
end;
if v8() then
    v11.isRestrictionAppealable = function(v26)
        if v26 == "SafetyStatus" then
            return true;
        else
            return false;
        end;
    end;
    v11.getDisplayTextForRestriction = function(v27, v28)
        if v28 == nil then
            return nil;
        elseif v27 == v3.RESTRICTION_TYPE.SafetyStatus then
            return v28:getText("AssetConfigCopy", "AssetMayViolateCommunityStandards");
        elseif v27 == v3.RESTRICTION_TYPE.AssetType then
            return v28:getText("AssetConfigCopy", "AssetTypeNotAvailable");
        elseif v27 == v3.RESTRICTION_TYPE.Authorization then
            return v28:getText("AssetConfigCopy", "NoPermissionToDistributeAsset");
        else
            return nil;
        end;
    end;
    v11.getRestrictionThatAppliesToAsset = function(v29)
        if not (v29 ~= nil) or #v29 == 0 then
            return nil;
        elseif not v2.includes(v29, v3.RESTRICTION_TYPE.SafetyStatus) then
            if not v2.includes(v29, v3.RESTRICTION_TYPE.AssetType) then
                if not v2.includes(v29, v3.RESTRICTION_TYPE.Authorization) then
                    return nil;
                else
                    return v3.RESTRICTION_TYPE.Authorization;
                end;
            else
                return v3.RESTRICTION_TYPE.AssetType;
            end;
        else
            return v3.RESTRICTION_TYPE.SafetyStatus;
        end;
    end;
end;
return v11;
