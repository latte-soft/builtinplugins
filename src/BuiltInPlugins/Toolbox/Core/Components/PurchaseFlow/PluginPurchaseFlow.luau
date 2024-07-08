local v0 = Vector2.new(150, 150);
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local _ = l_Parent_0.Core.Util;
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local v7 = require(l_Parent_0.Core.Components.PurchaseFlow.BuyPluginDialog);
local v8 = require(l_Parent_0.Core.Components.PurchaseFlow.BuyRobuxDialog);
local v9 = require(l_Packages_0.Framework);
local v10 = require(l_Parent_0.Core.Util.Urls);
local l_withContext_0 = v9.ContextServices.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = require(l_Parent_0.Core.Networking.Requests.GetRobuxBalance);
local v14 = require(l_Parent_0.Core.Networking.Requests.PurchaseAssetRequest);
local _ = require(l_Parent_0.Core.Actions.SetPurchaseStatus);
local _ = require(l_Parent_0.Core.Types.PurchaseStatus);
local v17 = v5.PureComponent:extend("PurchaseFlow");
v17.init = function(v18)
    v18.cancel = function()
        v18.props.Cancel();
    end;
    v18.onPurchaseClicked = function(v19)
        return v18.props.OnPurchaseClicked(v19);
    end;
    v18.onBuyRobuxClicked = function(v20)
        if v20 then
            l_GuiService_0:OpenBrowserWindow(v10.getRobuxPurchaseUrl());
        end;
        v18.props.Cancel();
    end;
end;
v17.didMount = function(v21)
    local _ = v21.props;
    v21.props.getRobuxBalance(v21.props.Network.networkInterface);
end;
v17.render = function(v23)
    local l_props_1 = v23.props;
    local _ = v23.state;
    assert(type(l_props_1.Cancel) == "function", "PurchaseFlow expects a Cancel callback.");
    local l_AssetData_0 = l_props_1.AssetData;
    local l_Asset_0 = l_AssetData_0.Asset;
    local v28 = v10.constructAssetThumbnailUrl(l_Asset_0.Id, v0.X, v0.Y);
    local l_Name_0 = l_Asset_0.Name;
    local l_Name_1 = l_AssetData_0.Creator.Name;
    local l_Product_0 = l_AssetData_0.Product;
    local v32 = not not l_Product_0 and l_Product_0.Price or 0;
    local v33 = v32 > 0;
    local v34 = l_props_1.Balance or "---";
    local v35 = v32 <= v34;
    return v33 and v5.createFragment({
        BuyPlugin = v35 and v5.createElement(v7, {
            Name = l_Name_0, 
            Creator = l_Name_1, 
            Cost = v32, 
            Balance = v34, 
            Thumbnail = v28, 
            OnClose = v23.cancel, 
            OnButtonClicked = v23.onPurchaseClicked
        }), 
        BuyRobux = not v35 and v5.createElement(v8, {
            Name = l_Name_0, 
            Creator = l_Name_1, 
            Cost = v32, 
            Balance = v34, 
            Thumbnail = v28, 
            OnClose = v23.cancel, 
            OnButtonClicked = v23.onBuyRobuxClicked
        })
    });
end;
return v6.connect(function(v36, _)
    v36 = v36 or {};
    local l_purchase_0 = v36.purchase;
    return {
        Balance = l_purchase_0.robuxBalance, 
        PurchaseStatus = l_purchase_0.status, 
        SearchId = v36.pageInfo.searchId
    };
end, function(v39)
    return {
        getRobuxBalance = function(v40)
            v39(v13(v40));
        end, 
        purchaseAsset = function(v41, v42, v43, v44, v45, v46, v47)
            v39(v14(v41, v42, v43, v44, v45, v46, v47));
        end
    };
end)((l_withContext_0({
    Network = v12
})(v17)));
