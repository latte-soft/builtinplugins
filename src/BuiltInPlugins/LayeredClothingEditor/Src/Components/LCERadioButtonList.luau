local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_Pane_0 = l_UI_0.Pane;
local l_Util_0 = v2.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v12 = v1.PureComponent:extend("LCERadioButtonList");
l_Typecheck_0.wrap(v12, script);
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_Title_0 = l_props_0.Title;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_OnClick_0 = l_props_0.OnClick;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_InitialSelectedKey_0 = l_props_0.InitialSelectedKey;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v21 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.HeaderPadding
    }, {
        Title = v1.createElement(l_TextLabel_0, {
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(1, 0, 0, 24), 
            Text = l_Title_0, 
            Font = l_Stylizer_0.FontBold, 
            LayoutOrder = v21:getNextOrder()
        }), 
        List = v1.createElement(l_RadioButtonList_0, {
            Buttons = l_Buttons_0, 
            OnClick = l_OnClick_0, 
            LayoutOrder = v21:getNextOrder(), 
            SelectedKey = l_InitialSelectedKey_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
