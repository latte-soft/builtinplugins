local l_Util_0 = script.Parent.Parent.Parent.Core.Util;
local v1 = require(l_Util_0.convertArrayToTable);
local v2 = require(l_Util_0.AssetConfigConstants);
local v3 = require(l_Util_0.AssetConfigUtil);
local v4 = {};
local l_IsAssetCommentDisabled_0 = game:GetFastFlag("IsAssetCommentDisabled");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
v4.keys = v1({
    "SHOW_SALES_TAB", 
    "SHOW_VERSIONS_TAB", 
    "SHOW_OWNERSHIP", 
    "SHOW_GENRE", 
    "SHOW_COPY", 
    "SHOW_PACKAGE", 
    "SHOW_COMMENT", 
    "SHOW_ASSET_TYPE", 
    "SHOW_OVERRIDE_BUTTON", 
    "SHOW_SALE", 
    "SHOW_PRICE", 
    "SHOW_PERMISSIONS_TAB"
});
local v7 = {
    Marketplace = {}, 
    Catalog = {}
};
local l_keys_0 = v4.keys;
local v9 = {
    [v2.FLOW_TYPE.DOWNLOAD_FLOW] = {
        [v7.Marketplace] = {
            [l_keys_0.SHOW_COMMENT] = false, 
            [l_keys_0.SHOW_COPY] = false, 
            [l_keys_0.SHOW_GENRE] = false, 
            [l_keys_0.SHOW_OVERRIDE_BUTTON] = false, 
            [l_keys_0.SHOW_OWNERSHIP] = false, 
            [l_keys_0.SHOW_PRICE] = false, 
            [l_keys_0.SHOW_SALE] = false, 
            [l_keys_0.SHOW_VERSIONS_TAB] = false
        }, 
        [v7.Catalog] = {
            [l_keys_0.SHOW_COMMENT] = false, 
            [l_keys_0.SHOW_COPY] = false, 
            [l_keys_0.SHOW_GENRE] = false, 
            [l_keys_0.SHOW_OVERRIDE_BUTTON] = false, 
            [l_keys_0.SHOW_OWNERSHIP] = false, 
            [l_keys_0.SHOW_PRICE] = false, 
            [l_keys_0.SHOW_SALE] = false, 
            [l_keys_0.SHOW_VERSIONS_TAB] = false
        }
    }, 
    [v2.FLOW_TYPE.EDIT_FLOW] = {
        [v7.Marketplace] = {
            [l_keys_0.SHOW_COMMENT] = not l_IsAssetCommentDisabled_0, 
            [l_keys_0.SHOW_COPY] = true, 
            [l_keys_0.SHOW_GENRE] = true, 
            [l_keys_0.SHOW_OWNERSHIP] = true, 
            [l_keys_0.SHOW_PRICE] = false, 
            [l_keys_0.SHOW_SALE] = false, 
            [l_keys_0.SHOW_VERSIONS_TAB] = true
        }, 
        [v7.Catalog] = {
            [l_keys_0.SHOW_ASSET_TYPE] = true, 
            [l_keys_0.SHOW_OWNERSHIP] = true, 
            [l_keys_0.SHOW_SALES_TAB] = true
        }
    }, 
    [v2.FLOW_TYPE.UPLOAD_FLOW] = {
        [v7.Marketplace] = {
            [l_keys_0.SHOW_PACKAGE] = false, 
            [l_keys_0.SHOW_COMMENT] = not l_IsAssetCommentDisabled_0, 
            [l_keys_0.SHOW_COPY] = true, 
            [l_keys_0.SHOW_GENRE] = true, 
            [l_keys_0.SHOW_OVERRIDE_BUTTON] = true, 
            [l_keys_0.SHOW_OWNERSHIP] = true, 
            [l_keys_0.SHOW_PRICE] = false, 
            [l_keys_0.SHOW_SALE] = false, 
            [l_keys_0.SHOW_VERSIONS_TAB] = false
        }, 
        [v7.Catalog] = {
            [l_keys_0.SHOW_ASSET_TYPE] = true, 
            [l_keys_0.SHOW_OWNERSHIP] = true
        }
    }
};
local v10 = {
    [Enum.AssetType.Plugin] = {
        [v2.FLOW_TYPE.UPLOAD_FLOW] = {
            [l_keys_0.SHOW_ASSET_TYPE] = true, 
            [l_keys_0.SHOW_COMMENT] = false, 
            [l_keys_0.SHOW_COPY] = true, 
            [l_keys_0.SHOW_GENRE] = false, 
            [l_keys_0.SHOW_OVERRIDE_BUTTON] = true, 
            [l_keys_0.SHOW_PRICE] = false
        }, 
        [v2.FLOW_TYPE.EDIT_FLOW] = {
            [l_keys_0.SHOW_ASSET_TYPE] = true, 
            [l_keys_0.SHOW_COMMENT] = false, 
            [l_keys_0.SHOW_COPY] = true, 
            [l_keys_0.SHOW_GENRE] = false, 
            [l_keys_0.SHOW_OWNERSHIP] = true, 
            [l_keys_0.SHOW_PRICE] = false, 
            [l_keys_0.SHOW_SALE] = false, 
            [l_keys_0.SHOW_VERSIONS_TAB] = true
        }
    }, 
    [Enum.AssetType.Model] = {
        [v2.FLOW_TYPE.UPLOAD_FLOW] = {
            [l_keys_0.SHOW_PACKAGE] = l_UnifyModelPackagePublish3_0, 
            [l_keys_0.SHOW_OVERRIDE_BUTTON] = true
        }
    }, 
    [Enum.AssetType.Animation] = {
        [v2.FLOW_TYPE.UPLOAD_FLOW] = {
            [l_keys_0.SHOW_OVERRIDE_BUTTON] = true, 
            [l_keys_0.SHOW_COMMENT] = false, 
            [l_keys_0.SHOW_COPY] = false, 
            [l_keys_0.SHOW_GENRE] = false, 
            [l_keys_0.SHOW_OWNERSHIP] = true, 
            [l_keys_0.SHOW_PRICE] = false, 
            [l_keys_0.SHOW_SALE] = false, 
            [l_keys_0.SHOW_VERSIONS_TAB] = false, 
            [l_keys_0.SHOW_SALES_TAB] = false
        }
    }, 
    [v2.UGCBundleTypes.Body] = {
        [v2.FLOW_TYPE.UPLOAD_FLOW] = {
            [l_keys_0.SHOW_ASSET_TYPE] = false, 
            [l_keys_0.SHOW_OWNERSHIP] = false
        }
    }, 
    [v2.UGCBundleTypes.DynamicHead] = {
        [v2.FLOW_TYPE.UPLOAD_FLOW] = {
            [l_keys_0.SHOW_ASSET_TYPE] = false, 
            [l_keys_0.SHOW_OWNERSHIP] = false
        }
    }
};
local function _(v11)
    if v11 == nil then
        return nil;
    elseif not v3.isCatalogAsset(v11) and not v3.isUGCBundleType(v11) then
        return v7.Marketplace;
    else
        return v7.Catalog;
    end;
end;
v4.queryParam = function(v13, v14, v15)
    local v16 = if v14 == nil then nil else if v3.isCatalogAsset(v14) or v3.isUGCBundleType(v14) then v7.Catalog else v7.Marketplace;
    if v16 == nil then
        return false;
    else
        local v17 = v9[v13][v16][v15] or false;
        if v10[v14] then
            if v10[v14][v13] then
                if v10[v14][v13][v15] == nil then
                    return v17;
                else
                    return v10[v14][v13][v15];
                end;
            else
                return v17;
            end;
        else
            return v17;
        end;
    end;
end;
return v4;
