local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v4.UI.Button;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v4.UI.KeyboardListener;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Timeline);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v12 = require(l_script_FirstAncestor_0.Src.Components.TeachingCallout);
local v13 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v14 = v1.PureComponent:extend("TimelineContainer");
local function _(v15)
    local v16 = -1;
    while v15 > 1 do
        v16 = v16 + 1;
        v15 = v15 / 10;
    end;
    return v16;
end;
local function _(v18, v19, v20)
    local v21 = (v3.TICK_SPACING * (v20 - v19)) / v18;
    local v22 = 10;
    local l_v21_0 = v21;
    local v24 = -1;
    while l_v21_0 > 1 do
        v24 = v24 + 1;
        l_v21_0 = l_v21_0 / 10;
    end;
    local v25 = math.pow(v22, v24);
    v22 = 3 * v25;
    if v21 < v22 then
        return v25, (math.max(v25 / v3.NUM_TICKS, 1));
    else
        return v22, (math.max(v22 / v3.NUM_TICKS, 1));
    end;
end;
v14.init = function(v27)
    v27.moveToTick = function(v28)
        local l_props_0 = v27.props;
        if l_props_0.SnapMode == v3.SNAP_MODES.Keyframes then
            l_props_0.SnapToNearestKeyframe(v28, l_props_0.ParentSize.X - l_props_0.TrackPadding);
            return ;
        elseif l_props_0.SnapMode == v3.SNAP_MODES.Frames then
            l_props_0.SnapToNearestFrame(v28);
            return ;
        else
            l_props_0.StepAnimation(v28);
            return ;
        end;
    end;
    v27.onScrubberMoved = function(v30)
        if v27.props.StepAnimation then
            v27.moveToTick((math.clamp(v2.getKeyframeFromPosition(v30.Position, v27.props.StartTick, v27.props.EndTick, v27.props.ParentPosition.X + v27.props.TrackPadding / 2, v27.props.ParentSize.X - v27.props.TrackPadding), v27.props.StartTick, v27.props.EndTick)));
        end;
    end;
    v27.onTimelineClicked = function(_, v32)
        if v32.UserInputType == Enum.UserInputType.MouseButton1 then
            v27.onScrubberMoved(v32);
        end;
    end;
    v27.moveScrubberForward = function()
        v27.moveToTick((math.clamp(v27.props.Playhead + 5, v27.props.StartTick, v27.props.EndTick)));
    end;
    v27.moveScrubberBackward = function()
        v27.moveToTick((math.clamp(v27.props.Playhead - 5, v27.props.StartTick, v27.props.EndTick)));
    end;
end;
v14.render = function(v33)
    local l_props_1 = v33.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_LastTick_0 = l_props_1.LastTick;
    local l_FrameRate_0 = l_props_1.FrameRate;
    local v40 = if not v13() then l_props_1.ShowAsSeconds else nil;
    local l_TimelineUnit_0 = l_props_1.TimelineUnit;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ParentSize_0 = l_props_1.ParentSize;
    local l_AnimationData_0 = l_props_1.AnimationData;
    local v45 = l_props_1.EditorMode == v3.EDITOR_MODE.CurveCanvas;
    l_StartTick_0 = (l_StartTick_0 * l_FrameRate_0) / v3.TICK_FREQUENCY;
    l_EndTick_0 = (l_EndTick_0 * l_FrameRate_0) / v3.TICK_FREQUENCY;
    l_LastTick_0 = not not l_LastTick_0 and (l_LastTick_0 * l_FrameRate_0) / v3.TICK_FREQUENCY or nil;
    local v46 = (v3.TICK_SPACING * (l_EndTick_0 - l_StartTick_0)) / (l_ParentSize_0.X - v33.props.TrackPadding);
    local v47 = 10;
    local l_v46_0 = v46;
    local v49 = -1;
    while l_v46_0 > 1 do
        v49 = v49 + 1;
        l_v46_0 = l_v46_0 / 10;
    end;
    local v50 = math.pow(v47, v49);
    v47 = 3 * v50;
    local v51, v52;
    if v46 < v47 then
        v51 = v50;
        v52 = math.max(v50 / v3.NUM_TICKS, 1);
    else
        v51 = v47;
        v52 = math.max(v47 / v3.NUM_TICKS, 1);
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.TIMELINE_HEIGHT + 1), 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.timelineTheme.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor, 
        ZIndex = l_props_1.ZIndex
    }, {
        Timeline = v1.createElement(v10, {
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            LastTick = l_LastTick_0, 
            MajorInterval = v51, 
            MinorInterval = v52, 
            Position = UDim2.new(0, v33.props.TrackPadding / 2, 0, 0), 
            Height = v3.TIMELINE_HEIGHT, 
            Width = l_ParentSize_0.X - v33.props.TrackPadding, 
            TickHeightScale = 0.7, 
            SmallTickHeightScale = 0.3, 
            ShowAsTime = if not v13() then v40 else nil, 
            TimelineUnit = l_TimelineUnit_0, 
            OnInputBegan = v33.onTimelineClicked, 
            OnDragMoved = v33.onScrubberMoved, 
            AnimationData = l_AnimationData_0, 
            FrameRate = l_FrameRate_0, 
            ZIndex = 2
        }), 
        ToggleEditorButton = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v3.TOGGLE_EDITOR_BUTTON_WIDTH, v3.TOGGLE_EDITOR_BUTTON_HEIGHT), 
            Position = UDim2.fromOffset(v33.props.TrackPadding / 4, v3.TIMELINE_HEIGHT / 2), 
            Style = l_Stylizer_0.button.MediaControl, 
            OnClick = l_props_1.OnToggleEditorClicked
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v3.TOGGLE_EDITOR_BUTTON_WIDTH, 0, v3.TOGGLE_EDITOR_BUTTON_HEIGHT), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = if not v45 then l_Stylizer_0.curveTheme.curveEditorButton else l_Stylizer_0.curveTheme.dopesheetButton, 
                ImageColor3 = l_Stylizer_0.playbackTheme.iconColor
            }), 
            Tooltip = v1.createElement(v11, {
                TextKey = not v45 and "GoToCurveEditor" or "GoToDopesheetEditor"
            }), 
            TeachingCallout = v1.createElement(v12, {
                Offset = Vector2.new(0, 6), 
                DefinitionId = "CurveEditorCallout", 
                LocationId = "ToggleEditorButton"
            })
        }), 
        KeyboardListener = v1.createElement(l_KeyboardListener_0, {
            OnKeyPressed = function(v53)
                if v9.isLeftBracket(v53.KeyCode) then
                    v33.moveScrubberBackward();
                end;
                if v9.isRightBracket(v53.KeyCode) then
                    v33.moveScrubberForward();
                end;
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
