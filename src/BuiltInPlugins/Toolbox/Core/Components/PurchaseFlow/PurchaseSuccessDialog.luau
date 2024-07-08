local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyledDialog_0 = v3.UI.StyledDialog;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v8 = require(l_Parent_0.Core.Util.Images);
local v9 = require(l_Parent_0.Core.Util.Constants);
local l_Dialog_0 = v9.Dialog;
local v11 = v2.PureComponent:extend("PurchaseDialog");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_Name_0 = l_props_0.Name;
    local v16 = l_props_0.Balance or "---";
    local l_IsFree_0 = l_props_0.IsFree;
    local l_Stylizer_0 = v12.props.Stylizer;
    return v2.createElement(l_StyledDialog_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Title = if not l_IsFree_0 then l_props_0.Localization:getText("Purchase", "BuyTitle") else l_props_0.Localization:getText("Purchase", "FreeTitle"), 
        MinContentSize = Vector2.new(l_Dialog_0.PROMPT_SIZE.X.Offset, l_Dialog_0.DETAILS_SIZE.Y.Offset + l_Dialog_0.BALANCE_SIZE.Y.Offset), 
        Buttons = {
            {
                Key = true, 
                Text = l_props_0.Localization:getText("Common", "OK"), 
                Style = "RoundPrimary"
            }
        }, 
        OnButtonPressed = l_OnClose_0, 
        OnClose = l_OnClose_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = l_Dialog_0.HEADER_SIZE, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Text = if not l_IsFree_0 then l_props_0.Localization:getText("Purchase", "SuccessHeader") else l_props_0.Localization:getText("Purchase", "FreeSuccessHeader"), 
            TextSize = v9.FONT_SIZE_TITLE, 
            Font = v9.FONT_BOLD, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Stylizer_0.purchaseDialog.promptText
        }), 
        Details = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = l_Dialog_0.DETAILS_SIZE, 
            Position = l_Dialog_0.DETAILS_POSITION, 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Text = l_props_0.Localization:getText("Purchase", "SuccessDetails", {
                name = l_Name_0
            }), 
            TextSize = v9.FONT_SIZE_LARGE, 
            Font = v9.FONT, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_Stylizer_0.purchaseDialog.promptText, 
            TextWrapped = true
        }), 
        Balance = v2.createElement("Frame", {
            Size = l_Dialog_0.BALANCE_SIZE, 
            Position = UDim2.new(0, 0, 1, 10), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = l_Dialog_0.BALANCE_PADDING
            }), 
            Text = v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(0, l_GetTextSize_0(l_props_0.Localization:getText("Purchase", "RobuxBalance"), v9.FONT_SIZE_MEDIUM, nil, Vector2.new(0, 0)).X, 1, 0), 
                BackgroundTransparency = 1, 
                Text = l_props_0.Localization:getText("Purchase", "RobuxBalance"), 
                TextSize = v9.FONT_SIZE_MEDIUM, 
                Font = v9.FONT, 
                TextColor3 = l_Stylizer_0.purchaseDialog.balanceText
            }), 
            Icon = v2.createElement("ImageLabel", {
                LayoutOrder = 2, 
                Size = l_Dialog_0.ROBUX_SIZE, 
                BackgroundTransparency = 1, 
                Image = v8.ROBUX_SMALL, 
                ImageColor3 = l_Stylizer_0.purchaseDialog.balanceText
            }), 
            Robux = v2.createElement("TextLabel", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v16, 
                TextSize = v9.FONT_SIZE_MEDIUM, 
                Font = v9.FONT, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = l_Stylizer_0.purchaseDialog.balanceText
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
