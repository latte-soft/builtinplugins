local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Pane_0 = v3.UI.Pane;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v11 = require(l_Components_0.SettingsButton);
local v12 = require(l_Components_0.TimeControls);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = v1.PureComponent:extend("Toolbar");
v14.init = function(_)
end;
v14.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    return v1.createElement(l_Pane_0, {
        Size = l_props_0.Size, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = l_props_0.LayoutOrder, 
        BackgroundColor = l_Stylizer_1.BackgroundColor
    }, {
        TimeControls = v1.createElement(v12, {
            FrameBuffer = l_props_0.FrameBuffer, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -l_Stylizer_1.ButtonSize.X.Offset, 1, 0), 
            MajorInterval = 5, 
            MinorInterval = 1
        }), 
        SettingsButton = v1.createElement(v11, {
            FrameBuffer = l_props_0.FrameBuffer, 
            LayoutOrder = 2, 
            Size = l_Stylizer_1.ButtonSize, 
            AnchorPoint = Vector2.new(1, 0.5)
        })
    });
end;
return (v2.connect(function(_, _)
    return {};
end, function(_)
    return {};
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14))));
