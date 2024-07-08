local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = v1.PureComponent:extend("ScaleTick");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_timelineTheme_0 = l_Stylizer_0.timelineTheme;
    local l_Value_0 = l_props_0.Value;
    local l_Width_0 = l_props_0.Width;
    local l_Position_0 = l_props_0.Position;
    local l_ScaleType_0 = l_props_0.ScaleType;
    local v14 = l_ScaleType_0 == v4.SCALE_TYPE.Number;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, l_Width_0, 0, l_Width_0), 
        Position = l_Position_0, 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TimeLabel = if l_Value_0 ~= "" then v1.createElement("TextLabel", {
            Position = v4.TICK_LABEL_POSITION[l_ScaleType_0], 
            Size = v4.TICK_LABEL_SIZE, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            TextColor3 = l_timelineTheme_0.textColor, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            TextSize = l_timelineTheme_0.textSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_Stylizer_0.font, 
            Text = l_Value_0, 
            Rotation = -90
        }) else nil, 
        Tick = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(not v14 and 0 or 1, 0), 
            Position = UDim2.new(not v14 and 0 or 1, 0, 1, 0), 
            Size = UDim2.new(l_props_0.TickWidthScale, 0, 0, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_timelineTheme_0.lineColor
        }) or nil, 
        Line = not not v14 and v1.createElement("Frame", {
            Position = UDim2.new(1, 0, 1, 0), 
            Size = UDim2.new(50, 0, 0, 1), 
            AnchorPoint = Vector2.new(0, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_timelineTheme_0.lineColor, 
            BackgroundTransparency = l_timelineTheme_0.lowerTransparency
        }) or nil
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
