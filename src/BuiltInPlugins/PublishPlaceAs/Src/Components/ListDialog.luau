local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_BulletList_0 = l_UI_0.BulletList;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_StudioEnableVRToggle_0 = game:GetFastFlag("StudioEnableVRToggle");
local v10 = v1.PureComponent:extend("ListDialog");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_Header_0 = l_props_0.Header;
    local l_Entries_0 = l_props_0.Entries;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_OnButtonClicked_0 = l_props_0.OnButtonClicked;
    local l_OnClose_0 = l_props_0.OnClose;
    local v20 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_StyledDialog_0, {
        Title = l_Title_0, 
        Modal = true, 
        Buttons = l_Buttons_0, 
        MinContentSize = if not l_StudioEnableVRToggle_0 then Vector2.new(450, 220) else v11.props.minContentSize or Vector2.new(450, 220), 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Style = "LargeCenterButtons", 
        OnButtonPressed = l_OnButtonClicked_0, 
        OnClose = l_OnClose_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 45), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10), 
            PaddingLeft = UDim.new(0, 30), 
            PaddingRight = UDim.new(0, 30)
        }), 
        Header = v1.createElement("TextLabel", {
            LayoutOrder = v20:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Text = l_Header_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Font = l_Stylizer_0.listDialog.font, 
            TextSize = 22, 
            TextColor3 = l_Stylizer_0.listDialog.textColor
        }), 
        List = v1.createElement(l_BulletList_0, {
            Items = l_Entries_0, 
            LayoutOrder = v20:getNextOrder(), 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
