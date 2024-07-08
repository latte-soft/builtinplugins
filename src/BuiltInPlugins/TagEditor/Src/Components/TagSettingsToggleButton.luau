local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local v13 = require(l_Parent_0.Src.Actions);
local v14 = v2.PureComponent:extend("TagSettingsToggleButton");
v14.init = function(v15)
    v15.onExpandCollapseClicked = function()
        local l_props_0 = v15.props;
        l_props_0.setMinimizedSettingsPane(not l_props_0.minimizedSettingsPane);
    end;
end;
v14.render = function(v17)
    local l_props_1 = v17.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_TagSettingsToggleButton_0 = l_props_1.Stylizer.TagSettingsToggleButton;
    local v21 = l_Localization_1:getText("Info", "SettingsFor");
    local v22 = l_Localization_1:getText("Info", "TagSettings");
    local l_tagMenu_0 = l_props_1.tagMenu;
    return v2.createElement(l_Pane_0, {
        Style = "SubtleBox", 
        Size = l_TagSettingsToggleButton_0.Size, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = l_TagSettingsToggleButton_0.Spacing
    }, {
        ExpandCollapseButton = v2.createElement(l_IconButton_0, {
            Text = if l_tagMenu_0 ~= nil then v21 .. " " .. l_tagMenu_0 else v22, 
            LeftIcon = if not l_props_1.minimizedSettingsPane then l_TagSettingsToggleButton_0.OpenArrowImage else l_TagSettingsToggleButton_0.ClosedArrowImage, 
            OnClick = v17.onExpandCollapseClicked, 
            Size = l_TagSettingsToggleButton_0.Size, 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundStyle = "SubtleBox"
        })
    });
end;
return v3.connect(function(v24, _)
    return {
        tagMenu = v24.TagMenu, 
        minimizedSettingsPane = v24.MinimizedSettingsPane
    };
end, function(v26)
    return {
        setMinimizedSettingsPane = function(v27)
            v26(v13.SetMinimizedSettingsPane(v27));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14)));
