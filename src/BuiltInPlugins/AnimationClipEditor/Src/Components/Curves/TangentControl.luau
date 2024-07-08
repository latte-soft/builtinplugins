local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = v1.PureComponent:extend("TangentControl");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Position_0 = l_props_0.Position;
    local l_Slope_0 = l_props_0.Slope;
    local l_Length_0 = l_props_0.Length;
    local v12 = l_props_0.Side == v4.SLOPES.Left;
    return v1.createElement("Frame", {
        Position = l_Position_0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(0, l_Length_0 * 2, 0, 9), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Rotation = math.deg((math.atan2(l_Slope_0, 1))), 
        ZIndex = l_props_0.ZIndex
    }, {
        Line = v1.createElement("Frame", {
            Position = UDim2.new(not v12 and 0.5 or 0, 0, 0.5, 0), 
            Size = UDim2.new(0, l_Length_0, 0, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Stylizer_0.curveTheme.tangentControlColor
        }), 
        Control = v1.createElement("ImageButton", {
            Size = UDim2.new(0, 9, 0, 9), 
            AnchorPoint = Vector2.new(not v12 and 0 or 1, 0.5), 
            Position = UDim2.new(not v12 and 1 or 0, 0, 0.5, 0), 
            Image = if not l_props_0.Auto then l_Stylizer_0.curveTheme.tangentDefinedButton else l_Stylizer_0.curveTheme.tangentAutoButton, 
            ImageColor3 = l_Stylizer_0.curveTheme.tangentControlColor, 
            ImageTransparency = 0, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Stylizer_0.curveTheme.tangentControlColor, 
            BackgroundColor3 = l_Stylizer_0.curveTheme.tangentControlColor, 
            [v1.Event.MouseButton2Click] = l_props_0.OnRightClick, 
            [v1.Event.InputBegan] = l_props_0.OnInputBegan, 
            [v1.Event.InputEnded] = l_props_0.OnInputEnded
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
