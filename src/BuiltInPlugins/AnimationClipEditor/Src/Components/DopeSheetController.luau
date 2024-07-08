local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v6.UI.DragListener;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v6.UI.KeyboardListener;
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v16 = require(l_script_FirstAncestor_0.Src.Components.DopeSheet);
local v17 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackColors);
local v18 = require(l_script_FirstAncestor_0.Src.Components.EventsController);
local v19 = require(l_script_FirstAncestor_0.Src.Components.SelectionBox);
local v20 = require(l_script_FirstAncestor_0.Src.Components.TimelineActions);
local v21 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.ScaleControls);
local v22 = require(l_script_FirstAncestor_0.Src.Components.TextEntryPrompt);
local v23 = require(l_script_FirstAncestor_0.Src.Components.Toast.NoticeToast);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v25 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframeRange);
local v26 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframe);
local v27 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframesAtTick);
local v28 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframesAtTick);
local v29 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.MoveSelectedKeyframes);
local v30 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.ScaleSelectedKeyframes);
local v31 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SetSelectedKeyframeData);
local v32 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.GenerateCurve);
local v33 = require(l_script_FirstAncestor_0.Src.Thunks.RenameKeyframe);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.QuantizeKeyframes);
local v35 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v36 = require(l_script_FirstAncestor_0.Src.Util.DragContext);
local v37 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v38 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v39 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v40 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v41 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v42 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v43 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v44 = v1.Component:extend("DopeSheetController");
v44.init = function(v45)
    v45.state = {
        AbsoluteSize = Vector2.new(), 
        AbsolutePosition = Vector2.new(), 
        dragging = false, 
        draggingScale = false, 
        draggingSelection = false, 
        dragTick = nil, 
        showContextMenu = false, 
        renamingKeyframe = nil, 
        changingDuration = nil, 
        hasDragWaypoint = false
    };
    v45.DragContext = nil;
    v45.isMultiSelecting = false;
    v45.mouseDownOnKeyframe = false;
    v45.mouseDownInTimeline = false;
    v45.tracks = {};
    local v46, v47 = v1.createBinding(nil);
    v45.selectDragStart = v46;
    v45.updateSelectDragStart = v47;
    v46, v47 = v1.createBinding(nil);
    v45.selectDragEnd = v46;
    v45.updateSelectDragEnd = v47;
    v45.lastMinTick = nil;
    v45.lastMinTrack = nil;
    v45.lastMaxTick = nil;
    v45.lastMaxTrack = nil;
    v45.getTickFromPosition = function(v48, v49)
        local v50 = v42.getKeyframeFromPosition(v48, v45.props.StartTick, v45.props.EndTick, v45.state.AbsolutePosition.X + v45.props.TrackPadding / 2, v45.state.AbsoluteSize.X - v45.props.TrackPadding);
        if v49 and v45.props.SnapMode ~= v35.SNAP_MODES.None then
            v50 = v39.getNearestFrame(v50, v45.props.FrameRate);
        end;
        return v50;
    end;
    v45.getTrackFromPosition = function(v51)
        local l_TopTrackIndex_0 = v45.props.TopTrackIndex;
        local v53 = v51.Y - v45.state.AbsolutePosition.Y;
        if not v45.props.IsChannelAnimation then
            return v42.getTrackFromPosition(v45.tracks, l_TopTrackIndex_0, v53);
        else
            local v54, v55 = v42.getTrackInfoFromPosition(v45.tracks, l_TopTrackIndex_0, v53);
            return v54 + v40.getPathValue(v40.getRelativePath(v55));
        end;
    end;
    v45.getTrackInfoFromPosition = function(v56)
        return v42.getTrackInfoFromPosition(v45.tracks, v45.props.TopTrackIndex, v56.Y - v45.state.AbsolutePosition.Y);
    end;
    v45.addDragWaypoint = function()
        if not v45.state.hasDragWaypoint then
            v45.props.AddWaypoint();
            v45:setState({
                hasDragWaypoint = true
            });
        end;
    end;
    v45.onScaleHandleDragStarted = function(v57)
        v45.DragContext = v36.new(v45.props.AnimationData, v45.props.SelectedKeyframes, v57);
        v45:setState({
            draggingScale = true, 
            dragTick = v57, 
            hasDragWaypoint = false
        });
    end;
    v45.onKeyframeDragStarted = function(v58)
        v45.DragContext = v36.new(v45.props.AnimationData, v45.props.SelectedKeyframes, v58);
        v45:setState({
            dragging = true, 
            dragTick = v58, 
            hasDragWaypoint = false
        });
    end;
    v45.onScaleHandleDragMoved = function(v59)
        local v60 = v45.getTickFromPosition(v59.Position, true);
        if not (not (v45.state.dragTick ~= v60) or not v45.DragContext) then
            v45.addDragWaypoint();
            v45.DragContext:scaleKeyframes(v60, v45.props.StartTick);
            v45.props.ScaleSelectedKeyframes(v45.DragContext.pivotTick, v45.DragContext.scale, v45.DragContext);
            v45:setState({
                dragTick = v60
            });
        end;
    end;
    v45.onKeyframeDragMoved = function(v61)
        local v62 = v45.getTickFromPosition(v61.Position, true);
        if not (not (v45.state.dragTick ~= v62) or not v45.DragContext) then
            v45.addDragWaypoint();
            v45.DragContext:moveKeyframes(v62);
            v45.props.MoveSelectedKeyframes(v45.DragContext.pivotTick, v45.DragContext.newTick, v45.DragContext);
            v45:setState({
                dragTick = v62
            });
        end;
    end;
    v45.onKeyframeDragEnded = function()
        v45.DragContext = nil;
        v45:setState({
            dragging = false, 
            dragTick = v1.None, 
            hasDragWaypoint = false
        });
    end;
    v45.onScaleHandleDragEnded = function()
        v45.DragContext = nil;
        v45:setState({
            draggingScale = false, 
            dragTick = v1.None, 
            hasDragWaypoint = false
        });
    end;
    v45.onSelectDragStarted = function(v63)
        if not (v45.state.showContextMenu or v45.props.ReadOnly) then
            v45.updateSelectDragStart(v63.Position);
            v45.updateSelectDragEnd(v63.Position);
            v45:setState({
                draggingSelection = true
            });
        end;
    end;
    v45.onSelectDragMoved = function(v64)
        local l_props_0 = v45.props;
        local l_Position_0 = v64.Position;
        v45.updateSelectDragEnd(l_Position_0);
        local v67 = v45.selectDragStart:getValue();
        local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
        local l_IsChannelAnimation_0 = l_props_0.IsChannelAnimation;
        local v70 = Vector2.new(math.min(l_Position_0.X, v67.X), (math.min(l_Position_0.Y, v67.Y)));
        local v71 = Vector2.new(math.max(l_Position_0.X, v67.X), (math.max(l_Position_0.Y, v67.Y)));
        local v72 = Vector2.new(((v45.state.AbsoluteSize.X - l_props_0.TrackPadding) / (l_props_0.EndTick - l_props_0.StartTick)) / 2, v35.TRACK_HEIGHT / 2);
        local v73 = v45.getTickFromPosition(v70 + v72, false);
        local v74 = v45.getTrackFromPosition(v70 + v72);
        local v75 = v45.getTickFromPosition(v71 - v72, false);
        local v76 = v45.getTrackFromPosition(v71 - v72);
        local v77 = v45.lastMinTick or v73;
        local v78 = v45.lastMinTrack or v74;
        local v79 = v45.lastMaxTick or v75;
        local v80 = v45.lastMaxTrack or v76;
        if not v38(l_SelectedKeyframes_0) and (not ((v77 >= v73 and v78 >= v74) and v75 >= v79) or v76 < v80) then
            l_props_0.DeselectAllKeyframes();
        end;
        for v81, v82 in ipairs(v45.tracks) do
            if not l_IsChannelAnimation_0 then
                if v74 <= v81 and v81 <= v76 then
                    l_props_0.SelectKeyframeRange(v82.Instance, {
                        v82.Name
                    }, v73, v75, true);
                end;
            else
                local v83 = {};
                v42.traverseTracks(v82.Name, v82, function(_, _, v86)
                    local v87 = v40.getPathValue(v40.getRelativePath(v86));
                    local v88 = v81 + v87;
                    if not (not v83[v87] and v88 >= v74) or v76 < v88 then
                        return ;
                    else
                        v83[v87] = true;
                        l_props_0.SelectKeyframeRange(v82.Instance, v86, v73, v75, true);
                        return ;
                    end;
                end);
            end;
        end;
        if v74 == 0 then
            local v89 = v42.getSummaryKeyframes(v45.tracks, v73, v75);
            if #v89 > 0 then
                v42.traverseKeyframeRange(v89, v73, v75, function(v90)
                    l_props_0.SelectKeyframesAtTick(v90, true);
                end);
            end;
        end;
        v45.lastMinTick = v73;
        v45.lastMinTrack = v74;
        v45.lastMaxTick = v75;
        v45.lastMaxTrack = v76;
    end;
    v45.onSelectDragEnded = function()
        v45:setState({
            draggingSelection = v1.None
        });
        v45.updateSelectDragStart(nil);
        v45.updateSelectDragEnd(nil);
        v45.lastMinTick = nil;
        v45.lastMinTrack = nil;
        v45.lastMaxTick = nil;
        v45.lastMaxTrack = nil;
    end;
    v45.recalculateExtents = function(v91)
        v45:setState({
            AbsoluteSize = v91.AbsoluteSize, 
            AbsolutePosition = v91.AbsolutePosition
        });
    end;
    v45.onEasingItemSelected = function(v92, v93)
        v45.props.SetSelectedKeyframeData({
            [v92] = v93
        });
    end;
    v45.onClearTangentsSelected = function(_, _)
        v45.props.SetSelectedKeyframeData({
            LeftSlope = v3.None, 
            RightSlope = v3.None
        });
    end;
    v45.showMenu = function()
        v45.props.SetPlayState(v35.PLAY_STATE.Pause);
        v45:setState({
            showContextMenu = true
        });
    end;
    v45.hideMenu = function()
        v45:setState({
            showContextMenu = false
        });
    end;
    v45.setRenamingKeyframe = function(v96)
        v45:setState({
            renamingKeyframe = v96 or v1.None
        });
    end;
    v45.setChangingDuration = function(v97)
        v45:setState({
            changingDuration = v97 or v1.None
        });
    end;
    v45.setSelectedKeyframeDuration = function(v98)
        v45.setChangingDuration();
        local v99 = v41.parseTime(v98, v45.props.FrameRate, v45.props.TimelineUnit);
        if v99 ~= nil then
            local v100, v101 = v5.getSelectionBounds(v45.props.AnimationData, v45.props.SelectedKeyframes);
            v45.props.ScaleSelectedKeyframes(v100, v99 / (v101 - v100));
        end;
    end;
end;
v44.hasSelectedKeyframes = function(v102)
    local v103 = not not v102.DragContext and v102.DragContext.selectedKeyframe or v102.props.SelectedKeyframes;
    local v104 = false;
    if v103 ~= nil then
        v104 = not v38(v103);
    end;
    return v104;
end;
v44.multipleFramesSelected = function(v105)
    local v106 = not not v105.DragContext and v105.DragContext.animationData or v105.props.AnimationData;
    local v107 = not not v105.DragContext and v105.DragContext.selectedKeyframes or v105.props.SelectedKeyframes;
    local v108, v109 = v5.getSelectionBounds(v106, v107);
    return v107 and v108 ~= v109;
end;
v44.handleTimelineInputBegan = function(v110, v111, _)
    if v111.UserInputType == Enum.UserInputType.Keyboard then
        if v37.isMultiSelectKey(v111.KeyCode) then
            v110.isMultiSelecting = true;
            return ;
        end;
    elseif v111.UserInputType == Enum.UserInputType.MouseButton1 then
        v110.props.DeselectAllKeyframes();
        v110.mouseDownInTimeline = true;
        v110.onSelectDragStarted(v111);
    end;
end;
v44.handleTimelineInputEnded = function(v113, v114)
    if v114.UserInputType == Enum.UserInputType.Keyboard then
        if v37.isMultiSelectKey(v114.KeyCode) then
            v113.isMultiSelecting = false;
            return ;
        end;
    elseif v114.UserInputType == Enum.UserInputType.MouseButton1 then
        v113.mouseDownInTimeline = false;
        return ;
    elseif v114.UserInputType == Enum.UserInputType.MouseButton2 then
        local v115 = nil;
        local v116 = nil;
        local v117 = nil;
        local v118 = nil;
        local v119 = nil;
        if not v113.props.IsChannelAnimation then
            v116 = v113.tracks[v113.getTrackFromPosition(v114.Position)];
            if v116 then
                v115 = {
                    v116.Name
                };
                v118 = v116.Type;
                v119 = v42.getRotationType(v116);
            end;
        else
            local v120, v121, v122, v123 = v113.getTrackInfoFromPosition(v114.Position);
            v117 = v120;
            v115 = v121;
            v118 = v122;
            v119 = v123;
            v116 = v113.tracks[v117];
        end;
        v113.props.SetRightClickContextInfo({
            Tick = v113.getTickFromPosition(v114.Position, true), 
            Path = v115, 
            TrackType = v118, 
            RotationType = v119, 
            InstanceName = not not v116 and v116.Instance or nil
        });
        v113.showMenu();
    end;
end;
v44.handleKeyframeRightClick = function(v124, v125, v126, v127, _)
    local v129 = {
        Tick = v127, 
        OnKeyframe = true
    };
    if v38(v124.props.SelectedKeyframes) then
        if v125 == nil then
            v124.props.SelectKeyframesAtTick(v127);
        else
            v124.props.SelectKeyframeRange(v125, v126, v127, v127, false);
        end;
    end;
    if v125 == nil then
        v129.SummaryKeyframe = v127;
    end;
    v124.props.SetRightClickContextInfo(v129);
    v124.showMenu();
end;
v44.handleKeyframeInputBegan = function(v130, v131, v132, v133, v134, v135)
    if not v130.props.ReadOnly and v135.UserInputType == Enum.UserInputType.MouseButton1 then
        v130.mouseDownOnKeyframe = true;
        if not v134 then
            if not v131 then
                v130.props.SelectKeyframesAtTick(v133, v130.isMultiSelecting);
            else
                v130.props.SelectKeyframeRange(v131, v132, v133, v133, v130.isMultiSelecting);
                return ;
            end;
        elseif v130.isMultiSelecting then
            if not v131 then
                v130.props.DeselectKeyframesAtTick(v133, v130.isMultiSelecting);
                return ;
            else
                v130.props.DeselectKeyframe(v131, v132, v133);
                return ;
            end;
        end;
    end;
end;
v44.handleKeyframeInputEnded = function(v136, v137, v138, v139)
    if not ((not (v139.UserInputType == Enum.UserInputType.MouseMovement) or not v138) or not v136.mouseDownOnKeyframe) then
        v136.onKeyframeDragStarted(v137);
        v136.onKeyframeDragMoved(v139);
        v136.mouseDownOnKeyframe = false;
    end;
    if v139.UserInputType == Enum.UserInputType.MouseButton1 then
        v136.mouseDownOnKeyframe = false;
    end;
end;
v44.makeTracks = function(v140)
    local l_props_1 = v140.props;
    local l_AnimationData_0 = l_props_1.AnimationData;
    local l_Tracks_0 = l_props_1.Tracks;
    local v144 = {};
    local function v145(v146, v147)
        v146.Keyframes = v147.Keyframes;
        v146.Data = v147.Data;
        v146.IsCurveTrack = v147.IsCurveTrack;
        v146.EulerAnglesOrder = v147.EulerAnglesOrder;
        local l_pairs_0 = pairs;
        local v149 = v147.Components or {};
        for v150, v151 in l_pairs_0(v149) do
            if v146.Components then
                local v152 = v146.Components[v150];
                if v152 then
                    v145(v152, v151);
                end;
            end;
        end;
    end;
    for v153, v154 in ipairs(l_Tracks_0) do
        v144[v153] = v4(v154);
        if l_AnimationData_0 then
            for _, v156 in pairs(l_AnimationData_0.Instances) do
                for v157, v158 in pairs(v156.Tracks) do
                    if v154.Name == v157 then
                        v145(v144[v153], v158);
                    end;
                end;
            end;
        end;
    end;
    return v144;
end;
v44.shouldUpdate = function(v159, v160, v161)
    if v161 ~= v159.state then
        return true;
    else
        for v162, _ in pairs(v160) do
            if v160[v162] ~= v159.props[v162] then
                return true;
            end;
        end;
        return false;
    end;
end;
v44.render = function(v164)
    local l_props_2 = v164.props;
    local l_state_0 = v164.state;
    local l_dragging_0 = l_state_0.dragging;
    local l_draggingScale_0 = l_state_0.draggingScale;
    local l_draggingSelection_0 = l_state_0.draggingSelection;
    local l_AbsoluteSize_0 = l_state_0.AbsoluteSize;
    local l_AbsolutePosition_0 = l_state_0.AbsolutePosition;
    local l_showContextMenu_0 = l_state_0.showContextMenu;
    local l_renamingKeyframe_0 = l_state_0.renamingKeyframe;
    local l_changingDuration_0 = l_state_0.changingDuration;
    local l_Active_0 = l_props_2.Active;
    local l_AnimationData_1 = l_props_2.AnimationData;
    local l_SelectedKeyframes_1 = l_props_2.SelectedKeyframes;
    local l_StartTick_0 = l_props_2.StartTick;
    local l_EndTick_0 = l_props_2.EndTick;
    local l_TrackPadding_0 = l_props_2.TrackPadding;
    local l_TopTrackIndex_1 = l_props_2.TopTrackIndex;
    local l_ShowEvents_0 = l_props_2.ShowEvents;
    local l_Localization_0 = l_props_2.Localization;
    local l_FrameRate_0 = l_props_2.FrameRate;
    local v185 = if not v43() then l_props_2.ShowAsSeconds else nil;
    local l_TimelineUnit_0 = l_props_2.TimelineUnit;
    local l_IsChannelAnimation_1 = l_props_2.IsChannelAnimation;
    local v188 = l_props_2.ColorsPosition or 0;
    local l_Tracks_1 = l_props_2.Tracks;
    local v190 = (not not l_AnimationData_1 and l_AnimationData_1.Events) and l_AnimationData_1.Events.NamedKeyframes or {};
    local _ = l_Localization_0:getText("Toast", "QuantizeWarning");
    local l_Loaded_0 = l_props_2.Loaded;
    local l_Saved_0 = l_props_2.Saved;
    local l_ClippedWarning_0 = l_props_2.ClippedWarning;
    local l_InvalidIdWarning_0 = l_props_2.InvalidIdWarning;
    local v196 = not l_ClippedWarning_0;
    local l_Size_0 = l_props_2.Size;
    local l_Position_1 = l_props_2.Position;
    local v199 = v164:hasSelectedKeyframes() and v164:multipleFramesSelected();
    local v200 = nil;
    if l_changingDuration_0 then
        local v201, v202 = v5.getSelectionBounds(v164.props.AnimationData, v164.props.SelectedKeyframes);
        v200 = ((v202 - v201) * l_props_2.FrameRate) / v35.TICK_FREQUENCY;
    end;
    v164.tracks = v164:makeTracks();
    if not l_AnimationData_1 or not l_AnimationData_1.Instances.Root then
        return v1.createElement("Frame", {
            Size = l_Size_0, 
            Position = l_Position_1, 
            BackgroundTransparency = 1, 
            [v1.Change.AbsoluteSize] = v164.recalculateExtents
        });
    else
        local l_createElement_0 = v1.createElement;
        local v204 = "Frame";
        local v205 = {
            Size = l_Size_0, 
            Position = l_Position_1, 
            BackgroundTransparency = 1, 
            ZIndex = l_props_2.ZIndex, 
            [v1.Event.InputChanged] = v164.props.OnInputChanged
        };
        local v206 = {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Events = l_ShowEvents_0 and v1.createElement(v18, {
                AbsolutePosition = l_AbsolutePosition_0 - Vector2.new(0, v35.TRACK_HEIGHT), 
                AbsoluteSize = Vector2.new(l_AbsoluteSize_0.X, v35.TRACK_HEIGHT), 
                AnimationData = l_AnimationData_1, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                TrackPadding = l_TrackPadding_0
            })
        };
        local l_createElement_1 = v1.createElement;
        local v208 = "Frame";
        local v213 = {
            Size = not not l_ShowEvents_0 and UDim2.new(1, 0, 1, -v35.TRACK_HEIGHT) or UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ClipsDescendants = true, 
            [v1.Change.AbsoluteSize] = v164.recalculateExtents, 
            [v1.Event.InputBegan] = function(_, v210)
                if v210.UserInputType ~= Enum.UserInputType.Keyboard then
                    v164:handleTimelineInputBegan(v210);
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v212)
                if v212.UserInputType ~= Enum.UserInputType.Keyboard then
                    v164:handleTimelineInputEnded(v212);
                end;
            end
        };
        local v230 = {
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(v214, v215)
                    v164:handleTimelineInputBegan(v214, v215);
                end, 
                OnKeyReleased = function(v216)
                    v164:handleTimelineInputEnded(v216);
                end
            }), 
            DopeSheet = v1.createElement(v16, {
                Size = UDim2.new(1, 0, 1, 0), 
                ParentSize = l_AbsoluteSize_0, 
                Padding = l_props_2.TrackPadding, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                TopTrackIndex = l_TopTrackIndex_1, 
                SelectedKeyframes = l_props_2.SelectedKeyframes, 
                SelectedEvents = l_props_2.SelectedEvents, 
                Tracks = v164.tracks, 
                IsChannelAnimation = l_IsChannelAnimation_1, 
                NamedKeyframes = v190, 
                TrackHeight = v35.TRACK_HEIGHT, 
                SummaryTrackHeight = v35.SUMMARY_TRACK_HEIGHT, 
                ZIndex = 1, 
                OnKeyRightClick = function(v217, v218, v219, v220)
                    v164:handleKeyframeRightClick(v217, v218, v219, v220);
                end, 
                OnKeyInputBegan = function(v221, v222, v223, v224, v225)
                    v164:handleKeyframeInputBegan(v221, v222, v223, v224, v225);
                end, 
                OnKeyInputEnded = function(v226, v227, v228)
                    v164:handleKeyframeInputEnded(v226, v227, v228);
                end
            }), 
            DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
                OnDragMoved = v164.onKeyframeDragMoved, 
                OnDragEnded = v164.onKeyframeDragEnded
            }), 
            MultiSelectBox = l_draggingSelection_0 and v1.createElement(v19, {
                OnDragMoved = v164.onSelectDragMoved, 
                OnDragEnded = v164.onSelectDragEnded, 
                SelectionStart = v164.selectDragStart, 
                SelectionEnd = v164.selectDragEnd, 
                SourceExtents = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0)
            }), 
            TimelineActions = l_Active_0 and v1.createElement(v20, {
                ShowMenu = l_showContextMenu_0, 
                MultipleSelected = v199, 
                IsChannelAnimation = l_IsChannelAnimation_1, 
                OnMenuOpened = v164.hideMenu, 
                OnItemSelected = v164.onEasingItemSelected, 
                OnClearTangentsSelected = v164.onClearTangentsSelected, 
                OnGenerateCurve = v164.props.GenerateCurve, 
                OnRenameKeyframe = function(v229)
                    spawn(function()
                        v164.setRenamingKeyframe(v229);
                    end);
                end, 
                OnChangeDuration = function()
                    spawn(function()
                        v164.setChangingDuration(true);
                    end);
                end
            }), 
            ScaleControls = (v199 and not l_draggingSelection_0) and v1.createElement(v21, {
                SelectedKeyframes = l_SelectedKeyframes_1, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                TopTrackIndex = l_TopTrackIndex_1, 
                Tracks = v164.tracks, 
                TrackPadding = l_TrackPadding_0, 
                Dragging = l_draggingScale_0 or l_dragging_0, 
                ShowAsSeconds = if not v43() then v185 else nil, 
                TimelineUnit = l_TimelineUnit_0, 
                FrameRate = l_FrameRate_0, 
                DopeSheetWidth = l_AbsoluteSize_0.X - l_props_2.TrackPadding, 
                ZIndex = 2, 
                ShowSelectionArea = true, 
                IsChannelAnimation = l_IsChannelAnimation_1, 
                OnScaleHandleDragStart = v164.onScaleHandleDragStarted, 
                OnScaleHandleDragEnd = v164.onScaleHandleDragEnded, 
                OnScaleHandleDragMoved = v164.onScaleHandleDragMoved
            })
        };
        local v231 = false;
        if l_renamingKeyframe_0 ~= nil then
            v231 = v1.createElement(v22, {
                PromptText = l_Localization_0:getText("ContextMenu", "RenameKeyframe"), 
                InputText = l_Localization_0:getText("Menu", "RenameKeyframePrompt"), 
                Text = v190[l_renamingKeyframe_0] or v35.DEFAULT_KEYFRAME_NAME, 
                Buttons = {
                    {
                        Key = "Delete", 
                        Text = l_Localization_0:getText("Dialog", "Delete"), 
                        Style = "Round"
                    }, 
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
                OnButtonClicked = function(v232)
                    if v232 == "Delete" then
                        v164.setRenamingKeyframe();
                        l_props_2.RenameKeyframe(l_renamingKeyframe_0, v35.DEFAULT_KEYFRAME_NAME, l_props_2.Analytics);
                    end;
                end, 
                OnTextSubmitted = function(v233)
                    v164.setRenamingKeyframe();
                    l_props_2.RenameKeyframe(l_renamingKeyframe_0, v233, l_props_2.Analytics);
                end, 
                OnClose = v164.setRenamingKeyframe
            });
        end;
        v230.RenameKeyframePrompt = v231;
        v230.ChangeDurationPrompt = v200 and v1.createElement(v22, {
            PromptText = l_Localization_0:getText("Title", "ChangeDuration"), 
            InputText = l_Localization_0:getText("Title", "NewDuration"), 
            NoticeText = l_Localization_0:getText("Title", "CurrentDuration_Migrated", {
                currentDuration = v200
            }), 
            Text = v200, 
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
            OnTextSubmitted = v164.setSelectedKeyframeDuration, 
            OnClose = v164.setChangingDuration
        });
        v230.ClippedToast = l_ClippedWarning_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "ClippedWarning"), 
            OnClose = l_props_2.CloseClippedToast
        });
        v230.SavedToast = l_Saved_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "Saved_Migrated", {
                savedAnimName = l_Saved_0
            }), 
            OnClose = l_props_2.CloseSavedToast
        });
        v230.LoadedToast = (v196 and l_Loaded_0) and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "Loaded_Migrated", {
                loadedAnimName = l_Loaded_0
            }), 
            OnClose = l_props_2.CloseLoadedToast
        });
        v230.InvalidId = l_InvalidIdWarning_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "InvalidAnimation"), 
            OnClose = l_props_2.CloseInvalidAnimationToast
        });
        v206.DopeSheetContainer = l_createElement_1(v208, v213, v230);
        v206.IgnoreLayout = v1.createElement("Folder", {}, {
            TrackColors = v1.createElement(v17, {
                Tracks = l_Tracks_1, 
                TopTrackIndex = l_TopTrackIndex_1, 
                Position = UDim2.new(0, 0, 0, v188), 
                MaxHeight = l_AbsoluteSize_0.Y - v188
            })
        });
        return l_createElement_0(v204, v205, v206);
    end;
end;
return v2.connect(function(v234, _)
    local l_Status_0 = v234.Status;
    return {
        Active = l_Status_0.Active, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        Clipboard = l_Status_0.Clipboard, 
        AnimationData = v234.AnimationData, 
        QuantizeWarning = v234.Notifications.QuantizeWarning, 
        Saved = v234.Notifications.Saved, 
        Loaded = v234.Notifications.Loaded, 
        ClippedWarning = v234.Notifications.ClippedWarning, 
        FrameRate = l_Status_0.FrameRate, 
        SnapMode = l_Status_0.SnapMode, 
        InvalidIdWarning = v234.Notifications.InvalidAnimation, 
        Tracks = l_Status_0.Tracks, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(v237)
    return {
        AddWaypoint = function()
            v237(v24());
        end, 
        MoveSelectedKeyframes = function(v238, v239, v240)
            v237(v29(v238, v239, nil, nil, v240));
        end, 
        ScaleSelectedKeyframes = function(v241, v242, v243)
            v237(v30(v241, v242, v243));
        end, 
        DeselectKeyframe = function(v244, v245, v246)
            v237(v26(v244, v245, v246));
        end, 
        SelectKeyframeRange = function(v247, v248, v249, v250, v251)
            v237(v15({}));
            v237(v25(v247, v248, v249, v250, v251));
        end, 
        SelectKeyframesAtTick = function(v252, v253)
            v237(v15({}));
            v237(v27(v252, v253));
        end, 
        DeselectKeyframesAtTick = function(v254, v255)
            v237(v28(v254, v255));
        end, 
        DeselectAllKeyframes = function()
            v237(v14({}));
            v237(v15({}));
        end, 
        SetRightClickContextInfo = function(v256)
            v237(v13(v256));
        end, 
        SetSelectedKeyframeData = function(v257)
            v237(v24());
            v237(v31(v257));
        end, 
        RenameKeyframe = function(v258, v259, v260)
            v237(v24());
            v237(v33(v258, v259, v260));
        end, 
        CloseSavedToast = function()
            v237(v11("Saved", false));
        end, 
        CloseLoadedToast = function()
            v237(v11("Loaded", false));
        end, 
        CloseClippedToast = function()
            v237(v11("ClippedWarning", false));
        end, 
        CloseInvalidAnimationToast = function()
            v237(v11("InvalidAnimation", false));
        end, 
        GenerateCurve = function(v261, v262)
            v237(v24());
            v237(v32(v261, v262));
        end, 
        SetPlayState = function(v263)
            v237(v12(v263));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v44)));
