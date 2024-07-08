local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v4.UI.KeyboardListener;
local l_DragListener_0 = v4.UI.DragListener;
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.CurveUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Util.DragContext);
local v13 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v14 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v15 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v17 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v18 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v20 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v22 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v23 = require(l_script_FirstAncestor_0.Src.Actions.SetVerticalScrollZoom);
local v24 = require(l_script_FirstAncestor_0.Src.Components.Curves.CurveCanvas);
local v25 = require(l_script_FirstAncestor_0.Src.Components.Curves.KeyframeActions);
local v26 = require(l_script_FirstAncestor_0.Src.Components.Curves.TangentActions);
local v27 = require(l_script_FirstAncestor_0.Src.Components.EventsController);
local v28 = require(l_script_FirstAncestor_0.Src.Components.Curves.Scale);
local v29 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.ScaleControls);
local v30 = require(l_script_FirstAncestor_0.Src.Components.SelectionBox);
local v31 = require(l_script_FirstAncestor_0.Src.Components.TextEntryPrompt);
local v32 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v33 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframe);
local v34 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.GenerateCurve);
local v35 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.MoveSelectedKeyframes);
local v36 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.ScaleSelectedKeyframes);
local v37 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframeRange);
local v38 = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeTangent);
local v39 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SetSelectedKeyframeData);
local v40 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v41 = v1.Component:extend("CurveEditorController");
v41.init = function(v42)
    v42.state = {
        AbsolutePosition = Vector2.new(), 
        AbsoluteSize = Vector2.new(), 
        CanvasSize = Vector2.new(), 
        ChangingDuration = false, 
        Dragging = false, 
        DraggingScale = false, 
        DraggingSelection = false, 
        DragTick = false, 
        HasDragWaypoint = false, 
        MinValue = 0, 
        MaxValue = v10.CURVE_CANVAS_MIN_RANGE, 
        ShowKeyframeMenu = false, 
        ShotTangentMenu = false, 
        Tracks = {}
    };
    v42.isMounted = false;
    v42.dragContext = nil;
    v42.isMultiSelecting = false;
    v42.dragMode = nil;
    v42.mouseDown = false;
    v42.mouseDownInCanvas = false;
    v42.ctrlHeld = false;
    local v43, v44 = v1.createBinding(nil);
    v42.selectDragStart = v43;
    v42.updateSelectDragStart = v44;
    v43, v44 = v1.createBinding(nil);
    v42.selectDragEnd = v43;
    v42.updateSelectDragEnd = v44;
    v42.recalculateExtents = function(v45)
        v42:setState({
            AbsoluteSize = v45.AbsoluteSize, 
            CanvasSize = v45.AbsoluteSize - Vector2.new(v42.props.TrackPadding, 0), 
            AbsolutePosition = v45.AbsolutePosition
        });
    end;
    v42.onClearTangentsSelected = function()
        v42.props.SetSelectedKeyframeData({
            LeftSlope = v3.None, 
            RightSlope = v3.None
        });
    end;
    v42.setChangingDuration = function(v46)
        v42:setState({
            ChangingDuration = v46 or false
        });
    end;
    v42.onChangeDuration = function()
        spawn(function()
            v42.setChangingDuration(true);
        end);
    end;
    v42.showKeyframeMenu = function()
        v42.props.SetPlayState(v10.PLAY_STATE.Pause);
        v42:setState({
            ShowKeyframeMenu = true, 
            ShowTangentMenu = false
        });
    end;
    v42.hideKeyframeMenu = function()
        v42:setState({
            ShowKeyframeMenu = false
        });
    end;
    v42.showTangentMenu = function()
        v42.props.SetPlayState(v10.PLAY_STATE.Pause);
        v42:setState({
            ShowKeyframeMenu = false, 
            ShowTangentMenu = true
        });
    end;
    v42.hideTangentMenu = function()
        v42:setState({
            ShowTangentMenu = false
        });
    end;
    v42.onInterpolationSelected = function(v47)
        v42.props.SetSelectedKeyframeData({
            InterpolationMode = v47
        });
    end;
    v42.toCurveSpace = function(v48)
        local l_props_0 = v42.props;
        local l_state_0 = v42.state;
        local l_MinValue_0 = l_state_0.MinValue;
        local l_MaxValue_0 = l_state_0.MaxValue;
        local l_VerticalScroll_0 = l_props_0.VerticalScroll;
        local v54 = math.min(l_props_0.VerticalZoom, 0.99);
        return Vector2.new(l_props_0.StartTick + (((v48.X - v42.state.AbsolutePosition.X) - v42.props.TrackPadding / 2) * (l_props_0.EndTick - l_props_0.StartTick)) / v42.state.CanvasSize.X, l_MaxValue_0 - (l_MaxValue_0 - l_MinValue_0) * (l_VerticalScroll_0 * v54 + ((v48.Y - v42.state.AbsolutePosition.Y) - v42.state.CanvasSize.Y * v10.CURVE_CANVAS_PADDING) / ((v42.state.CanvasSize.Y * (1 - 2 * v10.CURVE_CANVAS_PADDING)) * (1 / (1 - v54)))));
    end;
    v42.setSelectedKeyframeDuration = function(v55)
        v42.setChangingDuration();
        local v56 = v17.parseTime(v55, v42.props.FrameRate, v42.props.TimelineUnit);
        if v56 ~= nil then
            local v57, v58 = v9.getSelectionBounds(v42.props.AnimationData, v42.props.SelectedKeyframes);
            v42.props.ScaleSelectedKeyframes(v57, v56 / (v58 - v57));
        end;
    end;
    v42.addDragWaypoint = function()
        if not v42.state.HasDragWaypoint then
            v42.props.AddWaypoint();
            v42:setState({
                HasDragWaypoint = true
            });
        end;
    end;
    v42.onScaleHandleDragStarted = function(v59)
        v42.dragContext = v12.new(v42.props.AnimationData, v42.props.SelectedKeyframes, v59, nil);
        v42:setState({
            DraggingScale = true, 
            DragTick = v59, 
            HasDragWaypoint = false
        });
    end;
    v42.onScaleHandleDragMoved = function(v60)
        local v61 = v15.getNearestTick(v42.toCurveSpace(v60.Position).X);
        if v42.props.SnapMode ~= v10.SNAP_MODES.None then
            v61 = v15.getNearestFrame(v61, v42.props.FrameRate);
        end;
        if not (not (v42.state.DragTick ~= v61) or not v42.dragContext) then
            v42.addDragWaypoint();
            v42.dragContext:scaleKeyframes(v61, v42.props.StartTick);
            v42.props.ScaleSelectedKeyframes(v42.dragContext.pivotTick, v42.dragContext.scale, v42.dragContext);
            v42:setState({
                DragTick = v61
            });
        end;
    end;
    v42.onScaleHandleDragEnded = function()
        v42.dragContext = nil;
        v42:setState({
            DraggingScale = false, 
            DragTick = v1.None, 
            HasDragWaypoint = false
        });
    end;
    v42.onSelectDragStarted = function(v62)
        if not ((v42.state.ShowKeyframeMenu or v42.state.ShowTangentMenu) or v42.props.ReadOnly) then
            v42.updateSelectDragStart(v62.Position);
            v42.updateSelectDragEnd(v62.Position);
            v42:setState({
                DraggingSelection = true
            });
        end;
    end;
    v42.onSetTangent = function(v63, v64, v65, v66, v67)
        v42.props.AddWaypoint();
        v42.props.SetKeyframeTangent(v63, v64, v65, v66, v67 or v3.None);
    end;
    v42.onSelectDragMoved = function(v68)
        local l_state_1 = v42.state;
        local l_props_1 = v42.props;
        local l_Position_0 = v68.Position;
        v42.updateSelectDragEnd(l_Position_0);
        local v72 = v42.selectDragStart:getValue();
        local l_Tracks_0 = l_state_1.Tracks;
        local v74 = v42.toCurveSpace(Vector2.new(math.min(l_Position_0.X, v72.X), (math.max(l_Position_0.Y, v72.Y))));
        local v75 = v42.toCurveSpace(Vector2.new(math.max(l_Position_0.X, v72.X), (math.min(l_Position_0.Y, v72.Y))));
        local v76 = {};
        for _, v78 in ipairs(l_Tracks_0) do
            local l_Instance_0 = v78.Instance;
            for v80, v81 in pairs(v78.Data) do
                local v82 = false;
                if v78.Type == v10.TRACK_TYPES.Quaternion then
                    local v83;
                    if v74.Y <= 1 then
                        v83 = true;
                        if not (v75.Y < 1) then
                            goto label0;
                        end;
                    end;
                    v83 = false;
                    if v74.Y <= 0 then
                        v83 = v75.Y >= 0;
                    end;
                    ::label0::;
                    v82 = v83;
                else
                    local v84 = false;
                    if v74.Y <= v81.Value then
                        v84 = v81.Value <= v75.Y;
                    end;
                    v82 = v84;
                end;
                if not (not (v74.X <= v80 and v80 <= v75.X) or not v82) then
                    if not v76[l_Instance_0] then
                        v76[l_Instance_0] = {};
                    end;
                    local v85 = v76[l_Instance_0];
                    local v86 = nil;
                    for _, v88 in ipairs(v78.Path) do
                        if v86 then
                            v86.Components = v86.Components or {};
                            v85 = v86.Components;
                        end;
                        if v85 then
                            v85[v88] = v85[v88] or {};
                            v86 = v85[v88];
                        end;
                    end;
                    if v86 then
                        if not v86.Selection then
                            v86.Selection = {
                                [v80] = true
                            };
                        else
                            v86.Selection[v80] = true;
                        end;
                    end;
                end;
            end;
        end;
        l_props_1.SetSelectedKeyframes(v76);
    end;
    v42.onSelectDragEnded = function()
        v42:setState({
            DraggingSelection = v1.None
        });
        v42.updateSelectDragStart(nil);
        v42.updateSelectDragEnd(nil);
    end;
    v42.onKeyframeDragStarted = function(v89, v90)
        v42.dragContext = v12.new(v42.props.AnimationData, v42.props.SelectedKeyframes, v89, v90);
        v42:setState({
            Dragging = true, 
            DragTick = v89, 
            HasDragWaypoint = false
        });
    end;
    v42.onTangentDragStarted = function(v91, v92, v93, v94)
        v42.dragContext = v12.newTangentContext(v42.props.AnimationData, v91, v92, v93, v94);
        v42:setState({
            Dragging = true, 
            DragTick = v93, 
            HasDragWaypoint = false
        });
    end;
    v42.onDragMoved = function(v95)
        local l_dragContext_0 = v42.dragContext;
        if l_dragContext_0 then
            local v97 = v42.toCurveSpace(v95.Position);
            local l_X_0 = v97.X;
            local l_y_0 = v97.y;
            if l_dragContext_0.dragMode == v10.DRAG_MODE.Keyframe then
                l_X_0 = v15.getNearestTick(l_X_0);
                if v42.props.SnapMode ~= v10.SNAP_MODES.None then
                    l_X_0 = v15.getNearestFrame(l_X_0, v42.props.FrameRate);
                end;
                if not (l_X_0 == l_dragContext_0.newTick) or l_y_0 ~= l_dragContext_0.newValue then
                    v42.addDragWaypoint();
                    l_dragContext_0:moveKeyframes(l_X_0, l_y_0);
                    v42.props.MoveSelectedKeyframes(v42.dragContext.pivotTick, v42.dragContext.newTick, v42.dragContext.pivotValue, v42.dragContext.newValue, v42.dragContext);
                    v42:setState({
                        DragTick = l_X_0
                    });
                    return ;
                end;
            elseif l_dragContext_0.dragMode == v10.DRAG_MODE.Tangent then
                local l_value_0 = l_dragContext_0.value;
                if l_dragContext_0.side == v10.SLOPES.Left then
                    if l_dragContext_0.tck <= l_X_0 then
                        return ;
                    elseif l_dragContext_0.trackType == v10.TRACK_TYPES.Quaternion then
                        l_value_0 = 1;
                    end;
                elseif l_dragContext_0.side == v10.SLOPES.Right then
                    if l_X_0 <= l_dragContext_0.tck then
                        return ;
                    elseif l_dragContext_0.trackType == v10.TRACK_TYPES.Quaternion then
                        l_value_0 = 0;
                    end;
                end;
                local v101 = (l_y_0 - l_value_0) / (l_X_0 - l_dragContext_0.tck);
                v42.addDragWaypoint();
                v42.props.SetKeyframeTangent(l_dragContext_0.instance, l_dragContext_0.path, l_dragContext_0.tck, l_dragContext_0.side, v101);
            end;
            return ;
        else
            return ;
        end;
    end;
    v42.onDragEnded = function()
        v42.mouseDown = false;
        v42.dragContext = nil;
        v42:setState({
            Dragging = false, 
            DragTick = v1.None, 
            HasDragWaypoint = false
        });
    end;
    v42.handleKeyframeRightClick = function(v102, v103, v104)
        if v14(v42.props.SelectedKeyframes) then
            v42.props.SelectKeyframeRange(v102, v103, v104, v104, false);
        end;
        v42.showKeyframeMenu();
    end;
    v42.handleKeyframeInputBegan = function(v105, v106, v107, v108, v109)
        if not v42.props.ReadOnly and v109.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = true;
            if not v108 then
                v42.props.SelectKeyframeRange(v105, v106, v107, v107, v42.isMultiSelecting);
            elseif v42.isMultiSelecting then
                v42.props.DeselectKeyframe(v105, v106, v107);
                return ;
            end;
        end;
    end;
    v42.handleKeyframeInputEnded = function(v110, v111, v112, v113)
        if not ((not (v113.UserInputType == Enum.UserInputType.MouseMovement) or not v112) or not v42.mouseDown) then
            v42.onKeyframeDragStarted(v110, v111);
            v42.onDragMoved(v113);
            v42.mouseDown = false;
        end;
        if v113.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = false;
        end;
    end;
    v42.handleTangentRightClick = function(v114, v115, v116, v117)
        v42.props.SetRightClickContextInfo({
            InstanceName = v114, 
            Path = v115, 
            Tick = v116, 
            Side = v117
        });
        v42.showTangentMenu();
    end;
    v42.handleTangentInputBegan = function(v118)
        if not v42.props.ReadOnly and v118.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = true;
        end;
    end;
    v42.handleTangentInputEnded = function(v119, v120, v121, v122, v123)
        if not (not (v123.UserInputType == Enum.UserInputType.MouseMovement) or not v42.mouseDown) then
            v42.onTangentDragStarted(v119, v120, v121, v122);
            v42.onDragMoved(v123);
            v42.mouseDown = false;
        end;
        if v123.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = false;
        end;
    end;
end;
v41.updateCanvasExtents = function(v124, v125)
    local v126 = nil;
    local v127 = nil;
    if v125 then
        for _, v129 in pairs(v125) do
            v18.traverseTracks(nil, v129, function(v130, _, _)
                local v133 = nil;
                local v134 = nil;
                if not (not v130.Keyframes or v14(v130.Keyframes)) then
                    for _, v136 in ipairs(v130.Keyframes) do
                        local v137 = v130.Data[v136];
                        local v138 = nil;
                        local v139 = nil;
                        if v133 then
                            local v140 = v15.getSlope(v130, v133, v10.SLOPES.Right);
                            local v141 = v15.getSlope(v130, v136, v10.SLOPES.Left);
                            if v130.Type == v10.TRACK_TYPES.Quaternion then
                                local v142, v143 = v11.getYExtents(v133, 0, v140, v136, 1, v141);
                                v138 = v142;
                                v139 = v143;
                            else
                                local v144, v145 = v11.getYExtents(v133, v134.Value, v140, v136, v137.Value, v141);
                                v138 = v144;
                                v139 = v145;
                                if v130.Type == v10.TRACK_TYPES.Facs then
                                    v138 = math.clamp(v138, 0, 1);
                                    v139 = math.clamp(v139, 0, 1);
                                end;
                            end;
                        elseif v130.Type == v10.TRACK_TYPES.Quaternion then
                            v138 = 0;
                            v139 = 1;
                        else
                            local l_Value_0 = v137.Value;
                            v138 = l_Value_0;
                            v139 = l_Value_0;
                        end;
                        v126 = if not v126 then v138 else math.min(v126, v138);
                        v127 = if not v127 then v139 else math.max(v127, v139);
                        v134 = v137;
                        v133 = v136;
                    end;
                end;
            end, true);
        end;
    end;
    v126 = v126 or 0;
    v127 = v127 or 1;
    if v126 == v127 then
        v126 = v126 - 0.5;
        v127 = v127 + 0.5;
    end;
    v124:setState({
        MinValue = v126, 
        MaxValue = v127
    });
end;
v41.updateTracks = function(v147, v148)
    local l_props_2 = v147.props;
    local v150 = {};
    if not ((not l_props_2.SelectedTracks or not l_props_2.AnimationData) or not l_props_2.AnimationData.Instances) then
        local v151 = {};
        for _, v153 in pairs(l_props_2.SelectedTracks) do
            local v154 = v9.getTrack(l_props_2.AnimationData, "Root", v153);
            if v154 then
                v18.traverseTracks(nil, v154, function(v155, _, v157)
                    local v158 = v3.List.join(v153, v157);
                    local v159 = table.concat(v158, ".");
                    if not v151[v159] then
                        table.insert(v150, v3.Dictionary.join(v155, {
                            Path = v158, 
                            Instance = "Root"
                        }));
                        v151[v159] = true;
                    end;
                end, true);
            end;
        end;
        v147:setState({
            Tracks = v150
        });
    end;
    if l_props_2.SelectedTracks ~= v148.SelectedTracks then
        v147:updateCanvasExtents(v150);
    end;
end;
v41.didUpdate = function(v160, v161)
    local l_props_3 = v160.props;
    if not (v161.AnimationData == l_props_3.AnimationData) or v161.SelectedTracks ~= l_props_3.SelectedTracks then
        v160:updateTracks(v161);
    end;
end;
v41.addAction = function(v163, v164, v165)
    if v164 then
        v164.Enabled = true;
        table.insert(v163.Actions, v164);
        table.insert(v163.Connections, v164.Triggered:Connect(v165));
    end;
end;
v41.didMount = function(v166)
    v166.isMounted = true;
    v166:updateTracks({});
    local l_PluginActions_0 = v166.props.PluginActions;
    v166.Connections = {};
    v166.Actions = {};
    v166:addAction(l_PluginActions_0:get("ResizeCanvas"), function()
        v166:updateCanvasExtents(v166.state.Tracks);
        v166.props.SetVerticalScrollZoom(0, 0);
    end);
end;
v41.willUnmount = function(v168)
    v168.isMounted = false;
    if v168.Connections then
        for _, v170 in ipairs(v168.Connections) do
            v170:Disconnect();
        end;
        v168.Connections = {};
    end;
    if v168.Actions then
        for _, v172 in ipairs(v168.Actions) do
            v172.Enabled = false;
        end;
    end;
end;
v41.hasSelectedKeyframes = function(v173)
    local v174 = not not v173.dragContext and v173.dragContext.selectedKeyframe or v173.props.SelectedKeyframes;
    local v175 = false;
    if v174 ~= nil then
        v175 = not v14(v174);
    end;
    return v175;
end;
v41.multipleFramesSelected = function(v176)
    local v177 = not not v176.dragContext and v176.dragContext.animationData or v176.props.AnimationData;
    local v178 = not not v176.dragContext and v176.dragContext.selectedKeyframes or v176.props.SelectedKeyframes;
    local v179, v180 = v9.getSelectionBounds(v177, v178);
    return v178 and v179 ~= v180;
end;
v41.handleCanvasInputBegan = function(v181, v182, _)
    if v182.UserInputType == Enum.UserInputType.Keyboard then
        if v13.isMultiSelectKey(v182.KeyCode) then
            v181.isMultiSelecting = true;
        end;
        if v13.isControl(v182.KeyCode) then
            v181.ctrlHeld = true;
            return ;
        end;
    elseif v182.UserInputType == Enum.UserInputType.MouseButton1 then
        v181.props.DeselectAllKeyframes();
        v181.mouseDownInCanvas = true;
        v181.onSelectDragStarted(v182);
    end;
end;
v41.handleCanvasInputChanged = function(v184, v185)
    if not (v185.UserInputType == Enum.UserInputType.MouseWheel) or v184.ctrlHeld then
        if v184.props.OnInputChanged then
            v184.props.OnInputChanged(nil, v185);
        end;
    else
        local l_Y_0 = v184.toCurveSpace(Vector2.new(0, v185.Position.Y)).Y;
        local v187 = 1 + v10.CANVAS_ZOOM_INCREMENT;
        if v185.Position.Z > 0 then
            v184:setState({
                MinValue = l_Y_0 + (v184.state.MinValue - l_Y_0) / v187, 
                MaxValue = l_Y_0 + (v184.state.MaxValue - l_Y_0) / v187
            });
            return ;
        elseif v185.Position.Z < 0 then
            v184:setState({
                MinValue = l_Y_0 + (v184.state.MinValue - l_Y_0) * v187, 
                MaxValue = l_Y_0 + (v184.state.MaxValue - l_Y_0) * v187
            });
            return ;
        end;
    end;
end;
v41.handleCanvasInputEnded = function(v188, v189)
    if v189.UserInputType == Enum.UserInputType.Keyboard then
        if v13.isMultiSelectKey(v189.KeyCode) then
            v188.isMultiSelecting = false;
        end;
        if v13.isControl(v189.KeyCode) then
            v188.ctrlHeld = false;
            return ;
        end;
    elseif v189.UserInputType == Enum.UserInputType.MouseButton1 then
        v188.mouseDownInCanvas = false;
        return ;
    elseif v189.UserInputType == Enum.UserInputType.MouseButton2 then
        v188.showKeyframeMenu();
    end;
end;
v41.render = function(v190)
    local l_props_4 = v190.props;
    local l_state_2 = v190.state;
    local l_AnimationData_0 = l_props_4.AnimationData;
    local l_isMounted_0 = v190.isMounted;
    local l_AbsoluteSize_0 = l_state_2.AbsoluteSize;
    local l_CanvasSize_0 = l_state_2.CanvasSize;
    local l_AbsolutePosition_0 = l_state_2.AbsolutePosition;
    local l_StartTick_0 = l_props_4.StartTick;
    local l_EndTick_0 = l_props_4.EndTick;
    local l_TrackPadding_0 = l_props_4.TrackPadding;
    local l_ShowEvents_0 = l_props_4.ShowEvents;
    local l_Active_0 = l_props_4.Active;
    local l_SelectedKeyframes_0 = l_props_4.SelectedKeyframes;
    local l_ShowKeyframeMenu_0 = l_state_2.ShowKeyframeMenu;
    local l_ShowTangentMenu_0 = l_state_2.ShowTangentMenu;
    local l_ChangingDuration_0 = l_state_2.ChangingDuration;
    local v207 = v190:hasSelectedKeyframes() and v190:multipleFramesSelected();
    local l_Localization_0 = l_props_4.Localization;
    local l_FrameRate_0 = l_props_4.FrameRate;
    local v210 = if not v40() then l_props_4.ShowAsSeconds else nil;
    local l_TimelineUnit_0 = l_props_4.TimelineUnit;
    local l_Dragging_0 = l_state_2.Dragging;
    local l_DraggingScale_0 = l_state_2.DraggingScale;
    local l_Tracks_1 = l_state_2.Tracks;
    local l_MinValue_1 = l_state_2.MinValue;
    local l_MaxValue_1 = l_state_2.MaxValue;
    local l_DraggingSelection_0 = l_state_2.DraggingSelection;
    local v218 = (not not l_AnimationData_0 and l_AnimationData_0.Events) and l_AnimationData_0.Events.NamedKeyframes or {};
    local v219 = nil;
    if l_ChangingDuration_0 then
        local v220, v221 = v9.getSelectionBounds(v190.props.AnimationData, v190.props.SelectedKeyframes);
        v219 = ((v221 - v220) * l_FrameRate_0) / v10.TICK_FREQUENCY;
    end;
    return v1.createElement("Frame", {
        Size = l_props_4.Size, 
        Position = l_props_4.Position, 
        BackgroundTransparency = 1, 
        ZIndex = l_props_4.ZIndex
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Events = l_ShowEvents_0 and v1.createElement(v27, {
            AbsolutePosition = l_AbsolutePosition_0 - Vector2.new(0, v10.TRACK_HEIGHT), 
            AbsoluteSize = Vector2.new(l_AbsoluteSize_0.X, v10.TRACK_HEIGHT), 
            AnimationData = l_AnimationData_0, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            TrackPadding = l_TrackPadding_0
        }), 
        CanvasContainer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, not not l_ShowEvents_0 and -v10.TRACK_HEIGHT or 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v1.Change.AbsoluteSize] = v190.recalculateExtents, 
            [v1.Event.InputBegan] = function(_, v223)
                if v223.UserInputType ~= Enum.UserInputType.Keyboard then
                    v190:handleCanvasInputBegan(v223);
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v225)
                if v225.UserInputType ~= Enum.UserInputType.Keyboard then
                    v190:handleCanvasInputEnded(v225);
                end;
            end, 
            [v1.Event.InputChanged] = function(_, v227)
                v190:handleCanvasInputChanged(v227);
            end
        }, {
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(v228, v229)
                    v190:handleCanvasInputBegan(v228, v229);
                end, 
                OnKeyReleased = function(v230)
                    v190:handleCanvasInputEnded(v230);
                end
            }), 
            KeyframeActions = not not l_Active_0 and v1.createElement(v25, {
                ShowMenu = l_ShowKeyframeMenu_0, 
                MultipleSelected = v207, 
                OnMenuOpened = v190.hideKeyframeMenu, 
                OnClearTangentsSelected = v190.onClearTangentsSelected, 
                OnGenerateCurve = v190.props.GenerateCurve, 
                OnChangeDuration = v190.onChangeDuration, 
                OnInterpolationSelected = v190.onInterpolationSelected
            }) or nil, 
            TangentActions = not not l_Active_0 and v1.createElement(v26, {
                ShowMenu = l_ShowTangentMenu_0, 
                OnMenuOpened = v190.hideTangentMenu, 
                OnSetTangent = v190.onSetTangent
            }) or nil, 
            PositionScale = v1.createElement(v28, {
                Size = UDim2.new(0, l_props_4.TrackPadding / 2, 1, 0), 
                Width = l_props_4.TrackPadding / 2, 
                ParentSize = l_CanvasSize_0, 
                Position = UDim2.new(0, 0, 0, 0), 
                TickWidthScale = 0.7, 
                SmallTickWidthScale = 0.3, 
                MinValue = l_MinValue_1, 
                MaxValue = l_MaxValue_1, 
                VerticalScroll = l_props_4.VerticalScroll, 
                VerticalZoom = l_props_4.VerticalZoom, 
                ScaleType = v10.SCALE_TYPE.Number, 
                ZIndex = 3
            }), 
            CurveCanvas = not not l_isMounted_0 and v1.createElement(v24, {
                Size = UDim2.new(1, -l_props_4.TrackPadding, 1, 0), 
                Position = UDim2.new(0, l_props_4.TrackPadding / 2, 0, 0), 
                AbsoluteSize = l_CanvasSize_0, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                MinValue = l_MinValue_1, 
                MaxValue = l_MaxValue_1, 
                Tracks = l_Tracks_1, 
                VerticalScroll = l_props_4.VerticalScroll, 
                VerticalZoom = l_props_4.VerticalZoom, 
                SelectedKeyframes = l_SelectedKeyframes_0, 
                NamedKeyframes = v218, 
                Playhead = l_props_4.Playhead, 
                ShowTooltips = not l_Dragging_0, 
                ZIndex = 1, 
                OnKeyRightClick = v190.handleKeyframeRightClick, 
                OnKeyInputBegan = v190.handleKeyframeInputBegan, 
                OnKeyInputEnded = v190.handleKeyframeInputEnded, 
                OnTangentRightClick = v190.handleTangentRightClick, 
                OnTangentInputBegan = v190.handleTangentInputBegan, 
                OnTangentInputEnded = v190.handleTangentInputEnded
            }) or nil, 
            RotationScale = v1.createElement(v28, {
                Size = UDim2.new(0, l_props_4.TrackPadding / 2, 1, 0), 
                Width = l_props_4.TrackPadding / 2, 
                ParentSize = l_CanvasSize_0, 
                Position = UDim2.new(1, -l_props_4.TrackPadding / 2, 0, 0), 
                TickWidthScale = 0.7, 
                SmallTickWidthScale = 0.3, 
                MinValue = math.deg(l_MinValue_1), 
                MaxValue = math.deg(l_MaxValue_1), 
                VerticalScroll = l_props_4.VerticalScroll, 
                VerticalZoom = l_props_4.VerticalZoom, 
                ScaleType = v10.SCALE_TYPE.Angle, 
                ZIndex = 4
            }) or nil, 
            ScaleControls = (v207 and not l_DraggingSelection_0) and v1.createElement(v29, {
                SelectedKeyframes = l_SelectedKeyframes_0, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                UseFullHeight = true, 
                TrackPadding = l_TrackPadding_0, 
                Dragging = l_DraggingScale_0 or l_Dragging_0, 
                ShowAsSeconds = v210, 
                TimelineUnit = l_TimelineUnit_0, 
                FrameRate = l_FrameRate_0, 
                DopeSheetWidth = l_CanvasSize_0.X, 
                ZIndex = 2, 
                ShowSelectionArea = true, 
                IsChannelAnimation = true, 
                OnScaleHandleDragStart = v190.onScaleHandleDragStarted, 
                OnScaleHandleDragEnd = v190.onScaleHandleDragEnded, 
                OnScaleHandleDragMoved = v190.onScaleHandleDragMoved
            }), 
            DragTarget = l_Dragging_0 and v1.createElement(l_DragListener_0, {
                OnDragMoved = v190.onDragMoved, 
                OnDragEnded = v190.onDragEnded
            }), 
            MultiSelectBox = l_DraggingSelection_0 and v1.createElement(v30, {
                OnDragMoved = v190.onSelectDragMoved, 
                OnDragEnded = v190.onSelectDragEnded, 
                SelectionStart = v190.selectDragStart, 
                SelectionEnd = v190.selectDragEnd, 
                SourceExtents = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0)
            }), 
            ChangeDurationPrompt = v219 and v1.createElement(v31, {
                PromptText = l_Localization_0:getText("Title", "ChangeDuration"), 
                InputText = l_Localization_0:getText("Title", "NewDuration"), 
                NoticeText = l_Localization_0:getText("Title", "CurrentDuration_Migrated", {
                    currentDuration = v219
                }), 
                Text = v219, 
                Buttons = {
                    {
                        Key = false, 
                        Text = l_Localization_0:getText("Dialog", "Cancel"), 
                        Style = "Round"
                    }, 
                    {
                        Key = true, 
                        Text = l_Localization_0:getText("Dialog", "Save"), 
                        Style = "RoundPrimary"
                    }
                }, 
                OnTextSubmitted = v190.setSelectedKeyframeDuration, 
                OnClose = v190.setChangingDuration
            })
        })
    });
end;
return v2.connect(function(v231)
    local l_Status_0 = v231.Status;
    return {
        AnimationData = v231.AnimationData, 
        Active = l_Status_0.Active, 
        FrameRate = l_Status_0.FrameRate, 
        ReadOnly = l_Status_0.ReadOnly, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        SnapMode = l_Status_0.SnapMode, 
        VerticalScroll = l_Status_0.VerticalScroll, 
        VerticalZoom = l_Status_0.VerticalZoom
    };
end, function(v233)
    return {
        AddWaypoint = function()
            v233(v32());
        end, 
        DeselectAllKeyframes = function()
            v233(v22({}));
            v233(v21({}));
        end, 
        DeselectKeyframe = function(v234, v235, v236)
            v233(v32());
            v233(v33(v234, v235, v236));
            v233(v20({}));
        end, 
        GenerateCurve = function(v237, v238)
            v233(v32());
            v233(v34(v237, v238));
        end, 
        MoveSelectedKeyframes = function(v239, v240, v241, v242, v243)
            v233(v35(v239, v240, v241, v242, v243));
        end, 
        ScaleSelectedKeyframes = function(v244, v245, v246)
            v233(v36(v244, v245, v246));
        end, 
        SelectKeyframeRange = function(v247, v248, v249, v250, v251)
            v233(v21({}));
            v233(v37(v247, v248, v249, v250, v251));
        end, 
        SetKeyframeTangent = function(v252, v253, v254, v255, v256)
            v233(v38(v252, v253, v254, v255, v256));
        end, 
        SetPlayState = function(v257)
            v233(v19(v257));
        end, 
        SetRightClickContextInfo = function(v258)
            v233(v20(v258));
        end, 
        SetSelectedKeyframes = function(v259)
            v233(v22(v259));
        end, 
        SetSelectedKeyframeData = function(v260)
            v233(v32());
            v233(v39(v260));
        end, 
        SetVerticalScrollZoom = function(v261, v262)
            v233(v23(v261, v262));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Stylizer = l_ContextServices_0.Stylizer
})(v41)));
