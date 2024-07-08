local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.React);
local v3 = require(l_Packages_0.Framework);
local l_UI_0 = v3.UI;
local l_Pane_0 = v3.UI.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Core.Components.PurchaseFlow.PurchaseDialog);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.LayoutOrderIterator);
local l_Dialog_0 = v10.Dialog;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local l_ContextServices_0 = v3.ContextServices;
local _ = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Types.MarketplaceFiatServiceTypes);
return function(v17)
    local v18 = l_ContextServices_0.Localization:use();
    local v19 = l_Stylizer_0:use();
    local l_CreatorName_0 = v17.CreatorName;
    local l_Name_0 = v17.Name;
    local l_OnButtonClicked_0 = v17.OnButtonClicked;
    local l_OnClose_0 = v17.OnClose;
    local l_Price_0 = v17.Price;
    local l_Thumbnail_0 = v17.Thumbnail;
    local v26 = v11.new();
    return v2.createElement(l_StyledDialog_0, {
        Buttons = {
            {
                Key = false, 
                Text = v18:getText("Purchase", "Cancel")
            }, 
            {
                Key = true, 
                Style = "RoundPrimary", 
                Text = v18:getText("Purchase", "Buy")
            }
        }, 
        MinContentSize = Vector2.new(l_Dialog_0.IMAGE_SIZE.X.Offset + l_Dialog_0.PROMPT_SIZE.X.Offset, l_Dialog_0.PROMPT_SIZE.Y.Offset + l_Dialog_0.BALANCE_SIZE.Y.Offset), 
        OnButtonPressed = l_OnButtonClicked_0, 
        OnClose = l_OnClose_0, 
        Title = v18:getText("Purchase", "BuyTitle")
    }, {
        Container = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v17.LayoutOrder, 
            Spacing = 12, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Thumbnail = v2.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_Thumbnail_0, 
                LayoutOrder = v26:getNextOrder(), 
                Size = l_Dialog_0.IMAGE_SIZE
            }), 
            Prompt = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0, l_Dialog_0.PROMPT_SIZE.X.Offset, 0, 0), 
                LayoutOrder = v26:getNextOrder(), 
                Text = v18:getText("Purchase", "FiatBuyPrompt", {
                    name = l_Name_0, 
                    creator = l_CreatorName_0, 
                    price = l_Price_0
                }), 
                TextColor = v19.purchaseDialog.promptText, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        })
    });
end;
