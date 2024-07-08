local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddBuyerStatus);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Core.Actions;
local _ = require(l_Actions_0.DequeueSubsequentDialog);
local _ = require(l_Actions_0.EnqueueSubsequentDialog);
local v8 = require(l_Parent_0.Core.Actions.SetPurchaseDialogVisibility);
local v9 = require(l_Actions_0.SetRobuxBalance);
local v10 = require(l_Actions_0.SetExcessiveTransactionUserId);
local v11 = require(l_Actions_0.SetOwnsAsset);
local v12 = require(l_Actions_0.SetPurchaseStatus);
local v13 = require(l_Actions_0.SetBuyerStatus);
local v14 = require(l_Actions_0.ClearPurchaseFlow);
local v15 = require(l_Parent_0.Core.Types.PurchaseStatus);
local _ = require(l_Parent_0.Core.Types.BuyerStatus);
return v4.createReducer({
    buyerStatus = nil, 
    robuxBalance = 0, 
    status = v15.None, 
    cachedOwnedAssets = {}, 
    assetId = nil, 
    excessiveTransactionUserIds = {}, 
    isPurchaseDialogVisible = false
}, {
    [v9.name] = function(v17, v18)
        return v3.Dictionary.join(v17, {
            robuxBalance = v18.robuxBalance
        });
    end, 
    [v14.name] = function(v19, v20)
        return v3.Dictionary.join(v19, {
            assetId = v20.assetId, 
            status = v15.None
        });
    end, 
    [v11.name] = function(v21, v22)
        return v3.Dictionary.join(v21, {
            cachedOwnedAssets = v3.Dictionary.join(v21.cachedOwnedAssets, {
                [tostring(v22.assetId)] = v22.ownsAsset
            })
        });
    end, 
    [v12.name] = function(v23, v24)
        return v3.Dictionary.join(v23, {
            status = v24.status
        });
    end, 
    [v10.name] = function(v25, v26)
        return v3.Dictionary.join(v25, {
            excessiveTransactionUserIds = v3.Dictionary.join(v25.excessiveTransactionUserIds, {
                [v26.userId] = true
            })
        });
    end, 
    [v8.name] = function(v27, v28)
        return v3.Dictionary.join(v27, {
            isPurchaseDialogVisible = v28.isVisible
        });
    end, 
    [v13.name] = if not v1() then nil else function(v29, v30)
        return v3.Dictionary.join(v29, {
            buyerStatus = v30.status
        });
    end
});
