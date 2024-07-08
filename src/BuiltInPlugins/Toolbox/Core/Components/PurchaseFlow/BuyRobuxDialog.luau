local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Components.PurchaseFlow.PurchaseDialog);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("BuyRobuxDialog");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_OnButtonClicked_0 = l_props_0.OnButtonClicked;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_Thumbnail_0 = l_props_0.Thumbnail;
    local l_Name_0 = l_props_0.Name;
    local l_Creator_0 = l_props_0.Creator;
    local l_Cost_0 = l_props_0.Cost;
    local l_Balance_0 = l_props_0.Balance;
    return v2.createElement(v4, {
        Buttons = {
            {
                Key = false, 
                Text = l_props_0.Localization:getText("Purchase", "Cancel")
            }, 
            {
                Key = true, 
                Text = l_props_0.Localization:getText("Purchase", "BuyRobux"), 
                Style = "RoundPrimary"
            }
        }, 
        OnButtonClicked = l_OnButtonClicked_0, 
        OnClose = l_OnClose_0, 
        Title = l_props_0.Localization:getText("Purchase", "InsufficientTitle"), 
        Prompt = l_props_0.Localization:getText("Purchase", "InsufficientPrompt", {
            robux = l_Cost_0 - l_Balance_0, 
            name = l_Name_0, 
            creator = l_Creator_0
        }), 
        Thumbnail = l_Thumbnail_0, 
        Balance = l_Balance_0
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v7));
