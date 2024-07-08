local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local v6 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local v7 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.BuyAssetDialog);
local v8 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.PluginPurchaseFlow);
local v9 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v10 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v11 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local v14 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v16 = require(l_script_FirstAncestor_0.Core.Types.SubsequentDialogStatus);
local v17 = require(l_script_FirstAncestor_0.Core.Actions.EnqueueSubsequentDialog);
local v18 = require(l_script_FirstAncestor_0.Core.Networking.Requests.PurchaseAssetRequest);
local v19 = require(l_script_FirstAncestor_0.Core.Actions.SetPurchaseDialogVisibility);
local v20 = Vector2.new(150, 150);
return function(v21)
    local _ = l_Stylizer_0:use();
    local _ = l_ContextServices_0.Localization:use();
    local l_networkInterface_0 = v14.use().networkInterface;
    local v25 = v5();
    local v26 = if v21.AssetData ~= v4.None then v21.AssetData else nil;
    local v27 = if not v26 then nil else v26.Asset;
    local v28 = if not v26 then nil else v26.FiatProduct;
    local v29 = if not v28 then nil else v28.Purchasable;
    local v30 = if not v28 then nil else v28.PurchasePrice;
    local v31 = if not v30 then if not v2() then if v26 and v26.Product then v26.Product.Price else 0 else nil == 0 else v10.isFree(v30);
    local v33 = v6(function(v32)
        if not v32.purchase then
            return nil;
        else
            return v32.purchase.isPurchaseDialogVisible;
        end;
    end);
    local v34 = v3.useCallback(function()
        v25(v19(false));
        if v21.OnClose then
            v21.OnClose();
        end;
    end, {
        v25, 
        v21.OnClose
    });
    local v38 = v3.useCallback(function(v35, v36, v37)
        return v21.TryInsert(v35, false, "PreviewClickInsertButton", v36, v37);
    end, {
        v25, 
        v21.TryInsert
    });
    local v44 = v3.useCallback(function(v39)
        if not v39 then
            v34();
            return ;
        else
            local l_Id_0 = v26.Asset.Id;
            if v30 or v26.Product then
                local v41 = nil;
                local v42 = nil;
                if not v2() then
                    local l_Product_0 = v26.Product;
                    v42 = not not l_Product_0 and l_Product_0.Price or 0;
                    v41 = l_Product_0 and l_Product_0.ProductId;
                end;
                v25(v18(l_networkInterface_0, l_Id_0, v41, v42, nil, nil, v30, v38, v26));
                v34();
                return ;
            else
                if v9.shouldDebugWarnings() then
                    warn("Attempted to purchase asset without neither robux nor fiat Product: " .. tostring(l_Id_0), v26);
                end;
                v25(v17(v26, v16.PurchaseFailed));
                return ;
            end;
        end;
    end, {
        v26, 
        v25, 
        v30, 
        l_networkInterface_0, 
        v34, 
        v38
    });
    if v33 and v26 then
        if not v31 then
            if not v30 then
                return v3.createElement(v8, {
                    AssetData = v26, 
                    Cancel = v34, 
                    OnPurchaseClicked = v44
                });
            elseif not v30 or not v29 then
                if not v9.shouldDebugWarnings() then
                    return ;
                else
                    warn("Fiat asset is not purchaseable");
                    return ;
                end;
            else
                return v3.createElement(v7, {
                    Name = v27.Name, 
                    CreatorName = v26.Creator.Name, 
                    OnClose = v34, 
                    OnButtonClicked = v44, 
                    Price = v10.displayStringFromMoney(v30), 
                    Thumbnail = v11.constructAssetThumbnailUrl(v27.Id, v20.X, v20.Y)
                });
            end;
        else
            v44(true);
            return ;
        end;
    else
        return ;
    end;
end;
