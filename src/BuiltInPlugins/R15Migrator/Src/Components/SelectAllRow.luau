local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_IconButton_0 = l_UI_0.IconButton;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v10 = v2.PureComponent:extend("SelectAllRow");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v15 = l_props_0.LayoutOrder or -1;
    local v16 = l_props_0.Padding or l_Stylizer_0.Padding;
    local v17 = l_props_0.Spacing or l_Stylizer_0.Spacing;
    local v18 = l_props_0.RowHeight or l_Stylizer_0.RowHeight;
    local l_IsChecked_0 = l_props_0.IsChecked;
    local l_OnCheckboxClick_0 = l_props_0.OnCheckboxClick;
    local l_OnResetPlugin_0 = l_props_0.OnResetPlugin;
    local v22 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, v18), 
        LayoutOrder = v15
    }, {
        v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v18), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = v16, 
            Spacing = v17
        }, {
            Checkbox = v2.createElement(l_Checkbox_0, {
                LayoutOrder = v22:getNextOrder(), 
                Checked = l_IsChecked_0, 
                OnClick = l_OnCheckboxClick_0
            }), 
            SelectAllLabel = v2.createElement(l_TextLabel_0, {
                LayoutOrder = v22:getNextOrder(), 
                Text = l_Localization_0:getText("ScriptConversion", "SelectAll"), 
                Style = l_Stylizer_0.TextConfig, 
                AutomaticSize = Enum.AutomaticSize.XY
            })
        }), 
        v2.createElement(l_IconButton_0, {
            LeftIcon = l_Stylizer_0.RefreshButton.Icon, 
            Cursor = "PointingHand", 
            OnClick = l_OnResetPlugin_0, 
            Size = l_Stylizer_0.RefreshButton.Size, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -16, 0.5, 0), 
            BackgroundStyle = l_Stylizer_0.RefreshButton.BackgroundStyle, 
            TooltipText = l_Localization_0:getText("Summary", "Refresh")
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
