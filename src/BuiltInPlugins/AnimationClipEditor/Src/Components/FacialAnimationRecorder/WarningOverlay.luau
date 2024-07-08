local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v2.Util.StyleModifier;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local _ = v2.UI.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = l_UI_0.Container;
local _ = l_UI_0.Tooltip;
local _ = l_UI_0.HoverArea;
local _ = l_UI_0.LoadingIndicator;
local v14 = v1.PureComponent:extend("WarningOverlay");
v14.init = function(_)
end;
v14.render = function(v16)
    local l_props_0 = v16.props;
    local l_TitleText_0 = l_props_0.TitleText;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Image_0 = l_props_0.Image;
    local l_Position_0 = l_props_0.Position;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v25 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        Padding = {
            Left = 10, 
            Right = 10, 
            Top = 5, 
            Bottom = 5
        }, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = 8, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        ZIndex = 1, 
        Style = "RoundBox", 
        ImageTransparency = 0.1, 
        LayoutOrder = l_LayoutOrder_0
    };
    local v26 = {};
    local v27 = false;
    if l_Image_0 ~= nil then
        v27 = false;
        if l_Image_0 ~= "" then
            v27 = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 15, 0, 15), 
                Position = UDim2.new(0, 19, 0, 5), 
                Image = l_Image_0
            });
        end;
    end;
    v26.Image = v27;
    v26.Message = v1.createElement(l_TextLabel_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = l_TitleText_0, 
        BackgroundTransparency = 1, 
        TextWrapped = true, 
        LayoutOrder = 1
    });
    return l_createElement_0(l_l_Pane_0_0, v25, v26);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14));
