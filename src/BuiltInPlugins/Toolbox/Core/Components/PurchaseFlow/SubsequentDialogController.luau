local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Core.Hooks.useDispatch);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local v6 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.GenericDialog);
local v7 = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.PurchaseSuccessDialog);
local v8 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local _ = require(l_script_FirstAncestor_0.Core.Util.Images);
local _ = require(l_script_FirstAncestor_0.Core.Util.Urls);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local _ = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v15 = require(l_script_FirstAncestor_0.Core.Types.SubsequentDialogStatus);
local v16 = require(l_script_FirstAncestor_0.Core.Actions.DequeueSubsequentDialog);
return function()
    local v17 = l_Stylizer_0:use();
    local v18 = l_ContextServices_0.Localization:use();
    local v19 = v4();
    local v21 = v5(function(v20)
        if not v20.dialog or not v20.dialog.subsequentDialogQueue then
            return nil;
        else
            return v20.dialog.subsequentDialogQueue[1];
        end;
    end);
    local v23 = v5(function(v22)
        if not v22.purchase then
            return nil;
        else
            return v22.purchase.robuxBalance;
        end;
    end);
    local v25 = v3.useCallback(function(_)
        v19(v16());
    end, {
        v19
    });
    if v21 then
        local l_assetData_0 = v21.assetData;
        local l_status_0 = v21.status;
        local v28 = if not l_assetData_0 then nil else l_assetData_0.Asset;
        local v29 = if not l_assetData_0 then nil else l_assetData_0.FiatProduct;
        local v30 = nil;
        local v31 = nil;
        if not v29 then
            if not (v2() or not l_assetData_0) then
                v30 = (not not l_assetData_0.Product and l_assetData_0.Product.Price or 0) == 0;
            end;
        else
            v31 = v29 and v29.PurchasePrice;
            v30 = v29 and v8.isFree(v31);
        end;
        local v32 = not v28 and "" or v28.Name;
        if l_status_0 == v15.ExcessiveTransactions then
            return v3.createElement(v6, {
                Description = v18:getText("Purchase", "ExcessiveTransactionsDetails"), 
                Header = v18:getText("Purchase", "ExcessiveTransactionsHeader"), 
                Image = v17.dialog.errorIcon, 
                OnClose = v25
            });
        elseif l_status_0 == v15.PriceChanged then
            return v3.createElement(v6, {
                Description = v18:getText("Purchase", "PriceChangedDetails", {
                    name = v32, 
                    price = not v31 and "" or v8.displayStringFromMoney(v31)
                }), 
                Header = v18:getText("Purchase", "FailedHeader"), 
                Image = v17.dialog.errorIcon, 
                OnClose = v25
            });
        elseif l_status_0 == v15.PurchaseFailed then
            return v3.createElement(v6, {
                Description = v18:getText("Purchase", "FailedDetails", {
                    name = v32
                }), 
                Header = v18:getText("Purchase", "FailedHeader"), 
                Image = v17.dialog.errorIcon, 
                OnClose = v25
            });
        elseif l_status_0 == v15.PurchaseSuccess then
            if not v31 then
                return v3.createElement(v7, {
                    Balance = v23, 
                    IsFree = v30, 
                    Name = v32, 
                    OnClose = v25
                });
            else
                return v3.createElement(v6, {
                    Description = v18:getText("Purchase", "SuccessDetails", {
                        name = v32
                    }), 
                    Header = if not v30 then v18:getText("Purchase", "SuccessHeader") else v18:getText("Purchase", "FreeSuccessHeader"), 
                    OnClose = v25, 
                    Title = if not v30 then v18:getText("Purchase", "BuyTitle") else v18:getText("Purchase", "FreeTitle")
                });
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
