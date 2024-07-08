local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Components.PurchaseFlow.PurchaseDialog);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("BuyPluginDialog");
v7.render = function(v8)
    local l_props_0 = v8.props;
    return v2.createElement(v4, {
        Buttons = {
            {
                Key = false, 
                Text = l_props_0.Localization:getText("Purchase", "Cancel")
            }, 
            {
                Key = true, 
                Text = l_props_0.Localization:getText("Purchase", "Buy"), 
                Style = "RoundPrimary"
            }
        }, 
        OnButtonClicked = l_props_0.OnButtonClicked, 
        OnClose = l_props_0.OnClose, 
        Title = l_props_0.Localization:getText("Purchase", "BuyTitle"), 
        Prompt = l_props_0.Localization:getText("Purchase", "BuyPrompt", {
            name = l_props_0.Name, 
            creator = l_props_0.Creator, 
            robux = l_props_0.Cost
        }), 
        Thumbnail = l_props_0.Thumbnail, 
        Balance = l_props_0.Balance
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v7));
