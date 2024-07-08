local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v8 = v2.PureComponent:extend("Buttons");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_OnOpen_0 = l_props_0.OnOpen;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v16 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Spacing = l_Stylizer_0.Spacing, 
        Padding = l_Stylizer_0.Padding
    }, {
        Close = v2.createElement(l_Button_0, {
            Style = "Round", 
            Text = l_Localization_0:getText("PublishingBlockedAction", "Close"), 
            Size = l_Stylizer_0.CloseButtonSize, 
            OnClick = l_OnClose_0, 
            LayoutOrder = v16:getNextOrder()
        }), 
        GoTo = v2.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = l_Localization_0:getText("PublishingBlockedAction", "GoTo"), 
            Size = l_Stylizer_0.GoToButtonSize, 
            OnClick = l_OnOpen_0, 
            LayoutOrder = v16:getNextOrder()
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8));
