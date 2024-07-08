local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("TimelineTick");
local v5 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v6 = UDim2.new(0, 25, 0, 15);
local v7 = UDim2.new(0, 5, 0, 0);
v4.render = function(v8)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_timelineTheme_0 = l_Stylizer_0.timelineTheme;
    local l_Time_0 = l_props_0.Time;
    local l_Height_0 = l_props_0.Height;
    local l_Position_0 = l_props_0.Position;
    local v15 = l_props_0.LabelSize or v6;
    local v16 = l_props_0.LabelPosition or v7;
    local v17 = l_props_0.TickHeightScale or 0.7;
    local l_ShowTime_0 = l_props_0.ShowTime;
    local l_Highlight_0 = l_props_0.Highlight;
    local l_PastEnd_0 = l_props_0.PastEnd;
    local l_TimeInSeconds_0 = l_props_0.TimeInSeconds;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, l_Height_0, 0, l_Height_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Position = l_Position_0
    }, {
        TimeLabel = v1.createElement("TextLabel", {
            TextColor3 = not not l_PastEnd_0 and l_timelineTheme_0.dimmedColor or l_timelineTheme_0.textColor, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            TextSize = l_timelineTheme_0.textSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_Stylizer_0.font, 
            Text = l_Time_0, 
            Position = v16, 
            Size = v15, 
            Visible = l_ShowTime_0
        }), 
        TickLine = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(0, 1, v17, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = not not l_PastEnd_0 and l_timelineTheme_0.dimmedColor or l_timelineTheme_0.lineColor
        }, {
            Tooltip = l_TimeInSeconds_0 and v1.createElement(v5, {
                Text = l_TimeInSeconds_0, 
                ShowDelay = 0
            })
        }), 
        LowerTick = v1.createElement("Frame", {
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(0, 1, 50, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_timelineTheme_0.lineColor, 
            BackgroundTransparency = not not l_Highlight_0 and l_timelineTheme_0.lowerBrightTransparency or l_timelineTheme_0.lowerTransparency
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
