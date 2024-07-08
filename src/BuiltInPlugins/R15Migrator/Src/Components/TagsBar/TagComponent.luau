local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v2.Dash.join;
local l_UI_0 = v2.UI;
local _ = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v14 = v1.PureComponent:extend("TagComponent");
v14.render = function(v15)
    local _ = v15.state;
    local l_props_0 = v15.props;
    return v1.createElement(l_Pane_0, {
        Padding = l_props_0.Padding, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Padding = {
            Left = 6, 
            Right = 6
        }, 
        Spacing = 6, 
        [v1.Tag] = "Secondary"
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = l_props_0.Tag.Label
        }), 
        CloseButton = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(12, 12), 
            Image = "rbxasset://textures/StudioSharedUI/clear-hover.png", 
            [v1.Event.MouseButton1Click] = function()
                v15.props.OnClosed(l_props_0.Tag);
            end
        })
    });
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v2.Style.Stylizer
})(v14));
