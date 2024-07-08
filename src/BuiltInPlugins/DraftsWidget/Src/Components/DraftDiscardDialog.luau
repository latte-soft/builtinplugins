local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_BulletList_0 = l_UI_0.BulletList;
local l_map_0 = v2.Dash.map;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = Vector2.new(430, 200);
local v12 = UDim.new(0, 32);
local v13 = {
    PaddingLeft = UDim.new(0, 16), 
    PaddingRight = UDim.new(0, 16), 
    PaddingTop = UDim.new(0, 48), 
    PaddingBottom = UDim.new(0, 48)
};
local v14 = v1.PureComponent:extend("DraftDiscardDialog");
v14.init = function(v15)
    v15:setState({});
end;
v14.render = function(v16)
    local l_Localization_0 = v16.props.Localization;
    local l_Stylizer_0 = v16.props.Stylizer;
    local l_Drafts_0 = v16.props.Drafts;
    local l_ChoiceSelected_0 = v16.props.ChoiceSelected;
    return v1.createElement(l_StyledDialog_0, {
        Title = l_Localization_0:getText("DiscardDialog", "Title"), 
        Modal = true, 
        Buttons = {
            {
                Key = true, 
                Text = l_Localization_0:getText("Dialog", "Yes"), 
                Style = "RoundLargeText"
            }, 
            {
                Key = false, 
                Text = l_Localization_0:getText("Dialog", "No"), 
                Style = "RoundLargeTextPrimary"
            }
        }, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        OnButtonPressed = l_ChoiceSelected_0, 
        OnClose = function()
            l_ChoiceSelected_0(false);
        end, 
        MinContentSize = v11
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v12, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = v1.createElement("UIPadding", v13), 
        Header = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            Text = l_Localization_0:getText("DiscardDialog", "ConfirmQuestion"), 
            TextSize = 22, 
            Font = l_Stylizer_0.dialogUILibrary.HeaderFont, 
            TextColor = l_Stylizer_0.dialogUILibrary.HeaderTextColor
        }), 
        DraftList = v1.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Bullets = v1.createElement(l_BulletList_0, {
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Items = l_map_0(l_Drafts_0, function(v21)
                    return v21.Name;
                end)
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
