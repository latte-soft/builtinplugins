local l_GuiService_0 = game:GetService("GuiService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local v6 = require(l_Util_0.DebugFlags);
local v7 = require(l_Util_0.FiatUtil);
local v8 = require(l_Util_0.ToolboxUtilities);
local v9 = require(l_Parent_0.Core.Actions.NetworkError);
local v10 = require(l_Parent_0.Core.Actions.EnqueueSubsequentDialog);
local v11 = require(l_Parent_0.Core.Actions.SetExcessiveTransactionUserId);
local v12 = require(l_Parent_0.Core.Actions.SetOwnsAsset);
local v13 = require(l_Parent_0.Core.Actions.SetPurchaseStatus);
local v14 = require(l_Parent_0.Core.Actions.UpdateAssetData);
local v15 = require(l_Parent_0.Core.Networking.Requests.GetOwnsAssetRequest);
local v16 = require(l_Parent_0.Core.Networking.Requests.GetRobuxBalance);
local v17 = require(l_Parent_0.Core.Types.PurchaseStatus);
local v18 = require(l_Parent_0.Core.Types.ProductPurchaseResponseReasons);
local v19 = require(l_Parent_0.Core.Types.PurchaseTransactionStatus);
local v20 = require(l_Parent_0.Core.Types.SubsequentDialogStatus);
local v21 = v8.getOwnershipPollingMaxRetries();
local v22 = v8.getOwnershipPollingWaitTimeInSec();
local function v28(v23, v24, v25)
    local l_status_0, l_result_0 = pcall(function()
        if not l_MemStorageService_0 then
            if v6.shouldDebugUrls() then
                warn("MemStorageService not found");
            end;
            return ;
        else
            l_MemStorageService_0:Fire("AddToolboxAssetToInventory", (v23:jsonEncode({
                assetId = v24, 
                assetTypeId = v25
            })));
            return ;
        end;
    end);
    if not (l_status_0 or not v6.shouldDebugWarnings()) then
        warn(("Asset id %s was not added to inventory after purchase. Error: "):format(v24), l_result_0);
    end;
    return l_status_0, l_result_0;
end;
local function v38(_, v30, v31, v32, v33)
    local v34, v35 = v33(v30, v32, v31);
    local v36 = (v30 and v30.Asset) and v30.Asset.Id;
    local v37 = ((v30 and v30.Asset) and v30.Asset.TypeId) == Enum.AssetType.Plugin.Value;
    if not (not v34 or not v37) then
        l_StudioService_0:UpdatePluginManagement();
    end;
    if not (v34 or not v6.shouldDebugWarnings()) then
        warn(("Asset id %s was not inserted correctly after purchase. Error: "):format(v36), v35);
    end;
    return v34;
end;
local function v48(v39, v40, v41, v42, v43, v44, v45, v46)
    v28(v40, v41, v43);
    v39:dispatch(v12(true, v41));
    v38(v40, v42, v44, v46, v45);
    v39:dispatch(v10(v42, v20.PurchaseSuccess));
    local v47 = v39:getState();
    if v47.assets and v47.assets.previewAssetId == v41 then
        v39:dispatch(v13(v17.Success));
    end;
end;
local function _(v49, v50)
    local v51 = if not not v49.purchase and v49.purchase.cachedOwnedAssets then v49.purchase.cachedOwnedAssets else nil;
    if not v51 then
        return false;
    else
        return v51[tostring(v50)];
    end;
end;
local function _(v53, v54)
    local v55 = v53:getState();
    if v55.assets and v55.assets.previewAssetId == v54 then
        v53:dispatch(v13(v17.Failed));
    end;
end;
local function v65(v57, v58, v59)
    local v60 = 0;
    local v61 = v57:getState();
    local v62 = if not not v61.purchase and v61.purchase.cachedOwnedAssets then v61.purchase.cachedOwnedAssets else nil;
    local v63 = not not v62 and v62[tostring(v59)];
    while not v63 and v60 < v21 do
        wait(v22);
        v62 = v57:getState();
        v57:dispatch(v15(v58, v59)):andThen(function(v64)
            v63 = v64;
            v60 = v60 + 1;
        end);
    end;
    return v63;
end;
return function(v66, v67, v68, v69, v70, v71, v72, v73, v74)
    return function(v75)
        local v76 = nil;
        local v77 = nil;
        local v78 = v75:getState();
        local l_assets_0 = v78.assets;
        v74 = if not v74 then (if not l_assets_0 then {} else l_assets_0.idToAssetMap)[v67] else v74;
        if not (v74 or not v6.shouldDebugWarnings()) then
            warn(("Asset data for id %s was not found in the idToAssetMap."):format(v67));
        end;
        v70 = if not not v74 and v74.Asset then v74.Asset.TypeId else nil;
        v71 = if not v78.pageInfo then nil else v78.pageInfo.searchId;
        v77 = if not l_assets_0 then nil else l_assets_0.previewSwimlaneName;
        local v80 = if not v78.assets then nil else v78.assets.previewPluginData;
        v76 = if not v80 then nil else v80.versionId;
        v75:dispatch(v13(v17.Waiting));
        local v81 = if not v72 then {
            expectedPrice = v69, 
            assetId = v67, 
            assetType = v70, 
            searchId = v71
        } else {
            expectedPrice = v72, 
            productKey = {
                productNamespace = "PRODUCT_NAMESPACE_CREATOR_MARKETPLACE_ASSET", 
                productType = v7.convertAssetTypeToProductType(v70), 
                productTargetId = tostring(v67)
            }
        };
        local function v86(v82)
            if v6.shouldDebugWarnings() then
                warn(("Could not purchase using %s assetID %s versionID %s"):format(not v72 and "robux" or "fiat", v67, v76), v82);
            end;
            v75:dispatch(v10(v74, v20.PurchaseFailed));
            local l_v75_0 = v75;
            local l_v67_0 = v67;
            local v85 = l_v75_0:getState();
            if v85.assets and v85.assets.previewAssetId == l_v67_0 then
                l_v75_0:dispatch(v13(v17.Failed));
            end;
            v75:dispatch(v9(v82));
        end;
        if not v72 then
            return v66:purchaseAsset(v68, v81, v70):andThen(function(v87)
                local l_purchased_0 = v87.responseBody.purchased;
                local l_reason_0 = v87.responseBody.reason;
                if l_purchased_0 or l_reason_0 == v18.AlreadyOwned then
                    v75:dispatch(v12(true, v67));
                    v75:dispatch(v16(v66));
                    v28(v66, v67, v70);
                    v38(v66, v74, v76, v77, v73);
                end;
                v75:dispatch(v10(v74, if not l_purchased_0 then v20.PurchaseFailed else v20.PurchaseSuccess));
                v75:dispatch(v13(if not l_purchased_0 then v17.Failed else v17.Success));
            end, v86);
        else
            return v66:purchaseAsset(nil, v81, v70):andThen(function(v90)
                local l_responseBody_0 = v90.responseBody;
                local l_checkoutUrl_0 = l_responseBody_0.checkoutUrl;
                local l_purchaseTransactionStatus_0 = l_responseBody_0.purchaseTransactionStatus;
                if l_purchaseTransactionStatus_0 == v19.Success then
                    if not l_checkoutUrl_0 then
                        v48(v75, v66, v67, v74, v70, v76, v73, v77);
                        return ;
                    else
                        l_GuiService_0:OpenBrowserWindow(l_checkoutUrl_0);
                        spawn(function()
                            if v65(v75, v66, v67) then
                                v48(v75, v66, v67, v74, v70, v76, v73, v77);
                            end;
                        end);
                        return ;
                    end;
                elseif l_purchaseTransactionStatus_0 == v19.AlreadyOwned then
                    v48(v75, v66, v67, v74, v70, v76, v73, v77);
                    return ;
                else
                    if l_purchaseTransactionStatus_0 == v19.PriceChanged then
                        local l_actualPrice_0 = l_responseBody_0.actualPrice;
                        if not (not l_actualPrice_0 or not v74.FiatProduct) then
                            v74 = l_deepCopy_0(v74);
                            v74.FiatProduct.PurchasePrice = l_actualPrice_0;
                            v75:dispatch(v14(v67, v74));
                        end;
                        v75:dispatch(v10(v74, v20.PriceChanged));
                        local l_v75_1 = v75;
                        local l_v67_1 = v67;
                        local v97 = l_v75_1:getState();
                        if v97.assets and v97.assets.previewAssetId == l_v67_1 then
                            l_v75_1:dispatch(v13(v17.Failed));
                            return ;
                        end;
                    elseif l_purchaseTransactionStatus_0 == v19.ExcessiveTransactions then
                        local v98 = if not not v74.Creator and v74.Creator.Id then v74.Creator.Id else nil;
                        if v98 then
                            v75:dispatch(v11(v98));
                        end;
                        v75:dispatch(v10(v74, v20.ExcessiveTransactions));
                        local l_v75_2 = v75;
                        local l_v67_2 = v67;
                        local v101 = l_v75_2:getState();
                        if v101.assets and v101.assets.previewAssetId == l_v67_2 then
                            l_v75_2:dispatch(v13(v17.Failed));
                            return ;
                        end;
                    else
                        v86();
                    end;
                    return ;
                end;
            end, v86);
        end;
    end;
end;
