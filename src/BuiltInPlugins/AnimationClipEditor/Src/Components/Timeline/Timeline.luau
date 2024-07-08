local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v2.UI.DragListener;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Timeline.TimelineTick);
local v8 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v10 = v1.PureComponent:extend("Timeline");
v10.init = function(v11)
    v11.state = {
        Dragging = false
    };
    v11.onDragBegan = function(v12, v13)
        v11.props.OnInputBegan(v12, v13);
        if v13.UserInputType == Enum.UserInputType.MouseButton1 then
            v11:setState({
                Dragging = true
            });
        end;
    end;
    v11.onDragMoved = function(v14)
        if not (not v11.state.Dragging or not v11.props.OnDragMoved) then
            v11.props.OnDragMoved(v14);
        end;
    end;
    v11.onDragEnded = function()
        v11:setState({
            Dragging = false
        });
    end;
end;
v10.renderSeparator = function(_, v16, v17)
    return v1.createElement("Frame", {
        Size = UDim2.new(0, 2, 1, 0), 
        BackgroundColor3 = v16.lineColor, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0, v17, 0.5, 0), 
        BorderSizePixel = 0, 
        ZIndex = 2
    });
end;
v10.renderFirstTick = function(v18, v19)
    if math.max(v18.props.StartTick, 0) == 0 then
        return v18:renderSeparator(v19, 0);
    else
        return ;
    end;
end;
v10.renderLastTick = function(v20, v21)
    local l_props_0 = v20.props;
    local v23 = math.max(l_props_0.StartTick, 0);
    local v24 = math.max(l_props_0.EndTick, 0);
    local v25 = l_props_0.LastTick or v24;
    local l_Width_0 = l_props_0.Width;
    local v27 = (v25 - v23) / (v24 - v23);
    if v23 <= v25 and v25 <= v24 then
        return v20:renderSeparator(v21, (math.floor(v27 * l_Width_0)));
    else
        return ;
    end;
end;
v10.render = function(v28)
    local l_props_1 = v28.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_timelineTheme_0 = l_Stylizer_0.timelineTheme;
    local l_state_0 = v28.state;
    local v33 = math.max(l_props_1.StartTick, 0);
    local v34 = math.max(l_props_1.EndTick, 0);
    local v35 = l_props_1.LastTick or v34;
    local v36 = math.clamp(l_props_1.MajorInterval, 1, 300);
    local v37 = math.clamp(l_props_1.MinorInterval, 1, 300);
    local l_Position_0 = l_props_1.Position;
    local l_AnchorPoint_0 = l_props_1.AnchorPoint;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local l_Height_0 = l_props_1.Height;
    local l_Width_1 = l_props_1.Width;
    local l_TickLabelSize_0 = l_props_1.TickLabelSize;
    local l_TickLabelPosition_0 = l_props_1.TickLabelPosition;
    local l_TickHeightScale_0 = l_props_1.TickHeightScale;
    local l_SmallTickHeightScale_0 = l_props_1.SmallTickHeightScale;
    local v47 = if not v9() then l_props_1.ShowAsTime else nil;
    local l_TimelineUnit_0 = l_props_1.TimelineUnit;
    local v49 = l_props_1.FrameRate or v6.DEFAULT_FRAMERATE;
    local v50 = l_props_1[v1.Children] or {};
    local v51 = 0;
    if v33 > 0 and v33 % v37 ~= 0 then
        v51 = v37 - v33 % v37;
    end;
    for v52 = v33 + v51, v34, v37 do
        local v53 = (v52 - v33) / (v34 - v33);
        local v54 = v52 % v36 == 0;
        local v55 = math.floor(v52 / v49);
        local v56 = v52 - v55 * v49;
        v50[v52] = v1.createElement(v7, {
            Time = if not v9() then v47 and tostring(v55 .. ":" .. string.format("%02d", v56)) or v52 else v8.formatTime((v52 * v6.TICK_FREQUENCY) / v49, v49, l_TimelineUnit_0), 
            Highlight = v56 == 0, 
            Height = l_Height_0, 
            Position = UDim2.new(0, math.floor(v53 * l_Width_1), 0, 0), 
            Font = l_Stylizer_0.font, 
            LabelSize = l_TickLabelSize_0, 
            LabelPosition = l_TickLabelPosition_0, 
            TickHeightScale = not not v54 and l_TickHeightScale_0 or l_SmallTickHeightScale_0, 
            ShowTime = v54, 
            PastEnd = v35 < v52, 
            TimeInSeconds = v8.formatTimeInSeconds(v56, v49)
        });
    end;
    v50.DragTarget = l_state_0.Dragging and v1.createElement(l_DragListener_0, {
        OnDragMoved = v28.onDragMoved, 
        OnDragEnded = v28.onDragEnded
    });
    local _ = nil;
    return v1.createElement("Frame", {
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        Size = UDim2.new(0, l_Width_1, 0, l_Height_0), 
        BackgroundTransparency = 1, 
        ZIndex = l_ZIndex_0, 
        [v1.Event.InputBegan] = v28.onDragBegan
    }, {
        Ticks = v1.createElement("Frame", {
            Size = UDim2.new(0, math.min(if not v35 then l_Width_1 else math.max(0, (l_Width_1 * (v35 - v33)) / (v34 - v33)), l_Width_1), 1, 0), 
            BackgroundColor3 = l_timelineTheme_0.barColor, 
            BorderSizePixel = 0
        }, v50), 
        FirstTick = v28:renderFirstTick(l_timelineTheme_0), 
        LastTick = v28:renderLastTick(l_timelineTheme_0)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
