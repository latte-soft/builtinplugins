local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v3.UI.KeyboardListener;
local l_Separator_0 = v3.UI.Separator;
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v11 = require(l_script_FirstAncestor_0.Src.Components.DopeSheetController);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Curves.CurveEditorController);
local v13 = require(l_script_FirstAncestor_0.Src.Components.TimelineContainer);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ZoomBar);
local v15 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Scrubber);
local v16 = require(l_script_FirstAncestor_0.Src.Components.Toast.NoticeToast);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetEditorMode);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetHorizontalScrollZoom);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v20 = require(l_script_FirstAncestor_0.Src.Actions.SetVerticalScrollZoom);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.SnapToNearestFrame);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.SnapToNearestKeyframe);
local v23 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.SwitchEditorMode);
local v25 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v26 = v1.PureComponent:extend("TrackEditor");
v26.init = function(v27)
    v27.ctrlHeld = false;
    v27.dragging = false;
    v27.updateSize = function(v28)
        v27:setState({
            AbsoluteSize = v28.AbsoluteSize, 
            AbsolutePosition = v28.AbsolutePosition
        });
    end;
    v27.inputChanged = function(_, v30)
        local l_props_0 = v27.props;
        local l_HorizontalZoom_0 = l_props_0.HorizontalZoom;
        local l_HorizontalScroll_0 = l_props_0.HorizontalScroll;
        local l_X_0 = v27.state.AbsoluteSize.X;
        local l_X_1 = v27.state.AbsolutePosition.X;
        if v30.UserInputType == Enum.UserInputType.MouseWheel then
            local v36 = math.clamp(l_HorizontalScroll_0 + ((v30.Position.X - l_X_1) / l_X_0 - l_HorizontalScroll_0) * (1 - l_HorizontalZoom_0), 0, 1);
            if not v27.ctrlHeld then
                l_props_0.OnScroll(v30.Position.Z);
                return ;
            elseif v30.Position.Z > 0 then
                l_props_0.SetHorizontalScrollZoom(v36, (math.clamp(l_HorizontalZoom_0 + v8.ZOOM_INCREMENT, 0, 1)));
                return ;
            elseif v30.Position.Z < 0 then
                l_props_0.SetHorizontalScrollZoom(v36, (math.clamp(l_HorizontalZoom_0 - v8.ZOOM_INCREMENT, 0, 1)));
                return ;
            end;
        elseif not (not (v30.UserInputType == Enum.UserInputType.MouseMovement) or not v27.dragging) then
            l_props_0.SetHorizontalScrollZoom(math.clamp(l_HorizontalScroll_0 + (-v30.Delta.X / l_X_0) * (1 / math.max(0.01, l_HorizontalZoom_0)), 0, 1), l_HorizontalZoom_0);
        end;
    end;
    v27.startDragging = function()
        v27.dragging = true;
    end;
    v27.stopDragging = function()
        v27.dragging = false;
    end;
    v27.getPlayheadPositionX = function()
        local l_props_1 = v27.props;
        return v27.getTrackPadding() * 0.5 + v9.getScaledKeyframePosition(l_props_1.Playhead, l_props_1.StartTick, l_props_1.EndTick, (v27.state.AbsoluteSize or Vector2.new()).X - v27.getTrackPadding());
    end;
    v27.stepAnimation = function(v38)
        local l_props_2 = v27.props;
        if l_props_2.PlayState == v8.PLAY_STATE.Pause then
            l_props_2.StepAnimation(v38);
        end;
    end;
    v27.inputBegan = function(_, v41)
        if v27.props.Mouse and v41.UserInputType == Enum.UserInputType.MouseButton3 then
            v27.props.Mouse:__pushCursor("ClosedHand");
            v27.startDragging();
        end;
    end;
    v27.inputEnded = function(_, v43)
        if not ((not v27.props.Mouse or not v27.dragging) or v43.UserInputType ~= Enum.UserInputType.MouseMovement) or v43.UserInputType == Enum.UserInputType.MouseButton3 then
            v27.props.Mouse:__popCursor();
            v27.stopDragging();
        end;
    end;
    v27.getTrackPadding = function()
        local v44 = (math.max(v27.props.LastTick, v27.props.EndTick) * v27.props.FrameRate) / v8.TICK_FREQUENCY;
        if v44 < 100 then
            return v8.TRACK_PADDING_SMALL;
        elseif v44 < 1000 then
            return v8.TRACK_PADDING_MEDIUM;
        else
            return v8.TRACK_PADDING_LARGE;
        end;
    end;
    v27.toggleEditorClicked = function()
        if not v27.props.IsChannelAnimation then
            if not v27.props.ReadOnly then
                v27.props.OnPromoteRequested();
            end;
            return ;
        elseif v27.props.EditorMode == v8.EDITOR_MODE.CurveCanvas then
            v27.props.SwitchEditorMode(v8.EDITOR_MODE.DopeSheet, v27.props.Analytics);
            return ;
        else
            v27.props.SwitchEditorMode(v8.EDITOR_MODE.CurveCanvas, v27.props.Analytics);
            return ;
        end;
    end;
end;
v26.render = function(v45)
    local l_props_3 = v45.props;
    local l_state_0 = v45.state;
    local l_StartTick_0 = l_props_3.StartTick;
    local l_EndTick_0 = l_props_3.EndTick;
    local l_LastTick_0 = l_props_3.LastTick;
    local l_SnapMode_0 = l_props_3.SnapMode;
    local l_FrameRate_0 = l_props_3.FrameRate;
    local v53 = if not v25() then l_props_3.ShowAsSeconds else nil;
    local l_TimelineUnit_0 = l_props_3.TimelineUnit;
    local l_HorizontalScroll_1 = l_props_3.HorizontalScroll;
    local l_HorizontalZoom_1 = l_props_3.HorizontalZoom;
    local l_VerticalScroll_0 = l_props_3.VerticalScroll;
    local l_VerticalZoom_0 = l_props_3.VerticalZoom;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_ZIndex_0 = l_props_3.ZIndex;
    local l_Size_0 = l_props_3.Size;
    local l_TopTrackIndex_0 = l_props_3.TopTrackIndex;
    local l_ShowEvents_0 = l_props_3.ShowEvents;
    local l_Playhead_0 = l_props_3.Playhead;
    local l_IsChannelAnimation_0 = l_props_3.IsChannelAnimation;
    local l_ColorsPosition_0 = l_props_3.ColorsPosition;
    local l_Localization_0 = l_props_3.Localization;
    local l_SnapToNearestKeyframe_0 = l_props_3.SnapToNearestKeyframe;
    local l_SnapToNearestFrame_0 = l_props_3.SnapToNearestFrame;
    local v70 = l_state_0.AbsoluteSize or Vector2.new();
    local v71 = l_state_0.AbsolutePosition or Vector2.new();
    local v72 = v45.getTrackPadding();
    local v73 = false;
    if l_StartTick_0 <= l_Playhead_0 then
        v73 = l_Playhead_0 <= l_EndTick_0;
    end;
    local v74 = l_props_3.EditorMode == v8.EDITOR_MODE.DopeSheet;
    local v75 = l_props_3.EditorMode == v8.EDITOR_MODE.CurveCanvas;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        [v1.Change.AbsoluteSize] = v45.updateSize, 
        [v1.Event.InputBegan] = v45.inputBegan, 
        [v1.Event.InputEnded] = v45.inputEnded, 
        [v1.Event.MouseLeave] = v45.stopDragging
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TimelineContainer = v1.createElement(v13, {
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            LastTick = l_LastTick_0, 
            SnapMode = l_SnapMode_0, 
            TrackPadding = v72, 
            FrameRate = l_FrameRate_0, 
            ShowAsSeconds = if not v25() then v53 else nil, 
            TimelineUnit = l_TimelineUnit_0, 
            LayoutOrder = 0, 
            ParentSize = v70, 
            ParentPosition = v71, 
            StepAnimation = v45.stepAnimation, 
            SnapToNearestKeyframe = l_SnapToNearestKeyframe_0, 
            SnapToNearestFrame = l_SnapToNearestFrame_0, 
            AnimationData = l_props_3.AnimationData, 
            Playhead = l_Playhead_0, 
            ZIndex = 2, 
            EditorMode = l_props_3.EditorMode, 
            OnToggleEditorClicked = v45.toggleEditorClicked
        }), 
        DopeSheetController = not not v74 and v1.createElement(v11, {
            ShowEvents = l_ShowEvents_0, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            TrackPadding = v72, 
            TopTrackIndex = l_TopTrackIndex_0, 
            Size = UDim2.new(1, 0, 1, -v8.TIMELINE_HEIGHT - v8.SCROLL_BAR_SIZE), 
            ShowAsSeconds = if not v25() then v53 else nil, 
            TimelineUnit = l_TimelineUnit_0, 
            IsChannelAnimation = l_IsChannelAnimation_0, 
            ColorsPosition = l_ColorsPosition_0, 
            ZIndex = 1, 
            OnInputChanged = v45.inputChanged
        }) or nil, 
        CurveEditorController = not not v75 and v1.createElement(v12, {
            ShowEvents = l_ShowEvents_0, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            TrackPadding = v72, 
            Size = UDim2.new(1, 0, 1, -v8.TIMELINE_HEIGHT - v8.SCROLL_BAR_SIZE), 
            ShowAsSeconds = if not v25() then v53 else nil, 
            TimelineUnit = l_TimelineUnit_0, 
            Playhead = l_Playhead_0, 
            ZIndex = 1, 
            OnInputChanged = v45.inputChanged
        }) or nil, 
        CannotPasteToast = not not l_props_3.CannotPasteError and v1.createElement(v16, {
            Text = l_Localization_0:getText("Toast", "CannotPasteError"), 
            OnClose = l_props_3.CloseCannotPasteToast
        }) or nil, 
        IgnoreLayout = v1.createElement("Folder", {}, {
            TimelineBorder = v1.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0, v8.TIMELINE_HEIGHT), 
                DominantAxis = Enum.DominantAxis.Width, 
                Weight = 1, 
                Padding = 0, 
                ZIndex = 2
            }), 
            Scrubber = v73 and v1.createElement(v15, {
                Position = UDim2.new(0, v45.getPlayheadPositionX(), 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Height = v70.Y, 
                ShowHead = true, 
                HeadSize = UDim2.new(0, 5, 0, 5), 
                ZIndex = 3, 
                Thickness = 1
            }), 
            HorizontalZoomBar = v1.createElement(v14, {
                Size = UDim2.new(0, (v70.X - v8.SCROLL_BAR_PADDING) + 1, 0, v8.SCROLL_BAR_SIZE), 
                Position = UDim2.new(0, 0, 1, -v8.SCROLL_BAR_SIZE), 
                Direction = v14.HORIZONTAL, 
                ZIndex = 4, 
                LayoutOrder = 2, 
                ContainerSize = Vector2.new(v70.X, v70.Y), 
                AdjustScrollZoom = l_props_3.SetHorizontalScrollZoom, 
                Scroll = l_HorizontalScroll_1, 
                Zoom = l_HorizontalZoom_1, 
                Min = v71.X + 1
            }), 
            VerticalZoomBar = v75 and v1.createElement(v14, {
                Size = UDim2.new(0, v8.SCROLL_BAR_SIZE, 0, (((v70.Y - v8.SCROLL_BAR_SIZE) - v8.SCROLL_BAR_PADDING) - v8.TIMELINE_HEIGHT) + 1), 
                Position = UDim2.new(1, 0, 0, v8.TIMELINE_HEIGHT), 
                Direction = v14.VERTICAL, 
                ZIndex = 4, 
                LayoutOrder = 2, 
                ContainerSize = Vector2.new(v70.X, (v70.Y - v8.SCROLL_BAR_SIZE) - v8.TIMELINE_HEIGHT), 
                AdjustScrollZoom = l_props_3.SetVerticalScrollZoom, 
                Scroll = l_VerticalScroll_0, 
                Zoom = l_VerticalZoom_0, 
                Min = (v71.Y + v8.TIMELINE_HEIGHT) + 1
            }), 
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(v76)
                    if v10.isControl(v76.KeyCode) then
                        v45.ctrlHeld = true;
                    end;
                end, 
                OnKeyReleased = function(v77)
                    if v10.isControl(v77.KeyCode) then
                        v45.ctrlHeld = false;
                    end;
                end
            })
        })
    });
end;
return v2.connect(function(v78)
    return {
        AnimationData = v78.AnimationData, 
        CannotPasteError = v78.Notifications.CannotPasteError, 
        EditorMode = v78.Status.EditorMode, 
        IsPlaying = v78.Status.IsPlaying, 
        PlayState = v78.Status.PlayState, 
        SnapMode = v78.Status.SnapMode, 
        ReadOnly = v78.Status.ReadOnly
    };
end, function(v79)
    return {
        CloseCannotPasteToast = function()
            v79(v19("CannotPasteError", false));
        end, 
        SetHorizontalScrollZoom = function(v80, v81)
            v79(v18(v80, v81));
        end, 
        SetVerticalScrollZoom = function(v82, v83)
            v79(v20(v82, v83));
        end, 
        StepAnimation = function(v84)
            v79(v23(v84));
        end, 
        SnapToNearestKeyframe = function(v85, v86)
            v79(v22(v85, v86));
        end, 
        SnapToNearestFrame = function(v87)
            v79(v21(v87));
        end, 
        SetEditorMode = function(v88)
            v79(v17(v88));
        end, 
        SwitchEditorMode = function(v89, v90)
            v79(v24(v89, v90));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v26)));
