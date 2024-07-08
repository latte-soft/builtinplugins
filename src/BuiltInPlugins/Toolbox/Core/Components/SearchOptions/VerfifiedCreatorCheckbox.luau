local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Images);
local l_Checkbox_0 = v3.UI.Checkbox;
local l_UI_0 = v3.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v14 = v2.PureComponent:extend("VerfifiedCreatorCheckbox");
v14.render = function(v15)
    local l_props_0 = v15.props;
    local l_searchOptions_0 = l_props_0.Stylizer.searchOptions;
    local l_Localization_0 = l_props_0.Localization;
    local v19 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedDescription");
    local v20 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedHeader");
    local v21 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedTooltip");
    local v22 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Spacing = 3
    }, {
        IncludeUnverifiedToggle = v2.createElement(l_Checkbox_0, {
            Checked = l_props_0.IsChecked, 
            LayoutOrder = v22:getNextOrder(), 
            OnClick = l_props_0.OnClick, 
            Text = v20, 
            TextWrapped = true
        }), 
        VerifiedDescriptionContainer = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v22:getNextOrder(), 
            Padding = {
                Left = 24
            }, 
            Spacing = 6, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Image = v2.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = v4.WARNING_ICON_SMALL, 
                ImageColor3 = l_searchOptions_0.warningIconColor, 
                LayoutOrder = v22:getNextOrder(), 
                Size = UDim2.fromOffset(16, 16)
            }, {
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = v21, 
                    Priority = 11
                })
            }), 
            VerifiedDescription = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v22:getNextOrder(), 
                Style = "SubText", 
                Text = v19, 
                TextSize = 14, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
