local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v2.UI.Pane;
local v6 = v1.PureComponent:extend("TimeTag");
v6.render = function(v7)
    local l_props_0 = v7.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_Pane_0, {
        Style = "BorderBox", 
        BackgroundColor3 = l_Stylizer_0.scaleControlsTheme.mainColor, 
        BorderSizePixel = 0, 
        AnchorPoint = l_props_0.AnchorPoint, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position, 
        ZIndex = l_props_0.ZIndex
    }, {
        Time = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, -4, 1, -2), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_props_0.Time, 
            TextColor3 = l_Stylizer_0.scaleControlsTheme.textColor, 
            TextSize = l_Stylizer_0.scaleControlsTheme.textSize, 
            Font = l_Stylizer_0.font
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
