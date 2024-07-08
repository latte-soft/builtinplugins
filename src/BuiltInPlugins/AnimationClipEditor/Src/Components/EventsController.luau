local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v3.UI.DragListener;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v3.UI.KeyboardListener;
local l_Dash_0 = v3.Dash;
local l_copy_0 = l_Dash_0.copy;
local l_keys_0 = l_Dash_0.keys;
local v11 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v12 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v13 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v14 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v15 = require(l_script_FirstAncestor_0.Src.Util.DoubleClickDetector);
local v16 = require(l_script_FirstAncestor_0.Src.Util.compare);
local v17 = require(l_script_FirstAncestor_0.Src.Util.DragContext);
local v18 = require(l_script_FirstAncestor_0.Src.Components.EventTrack);
local v19 = require(l_script_FirstAncestor_0.Src.Components.SelectionBox);
local v20 = require(l_script_FirstAncestor_0.Src.Components.EventActions);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.Events.SetEvents);
local v23 = require(l_script_FirstAncestor_0.Src.Thunks.Events.SelectEvent);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.Events.DeselectEvent);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Events.DeleteSelectedEvents);
local v26 = require(l_script_FirstAncestor_0.Src.Thunks.Events.MoveSelectedEvents);
local v27 = require(l_script_FirstAncestor_0.Src.Actions.SetEventEditingTick);
local v28 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v29 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v30 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v31 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v32 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.EditEventsDialog);
local v33 = v1.PureComponent:extend("EventsController");
v33.init = function(v34)
    v34.state = {
        dragging = false, 
        draggingSelection = nil, 
        dragTick = nil, 
        showContextMenu = false, 
        eventEditingTick = nil, 
        hasDragWaypoint = false, 
        availableEvents = {}, 
        eventFilters = {}
    };
    local v35, v36 = v1.createBinding(nil);
    v34.selectDragStart = v35;
    v34.updateSelectDragStart = v36;
    v35, v36 = v1.createBinding(nil);
    v34.selectDragEnd = v35;
    v34.updateSelectDragEnd = v36;
    v34.DragContext = nil;
    v34.isMultiSelecting = false;
    v34.mouseDownOnEvent = false;
    v34.mouseDownInTimeline = false;
    v34.doubleClickDetector = v15.new();
    v34.addDragWaypoint = function()
        if not v34.state.hasDragWaypoint then
            v34.props.AddWaypoint();
            v34:setState({
                hasDragWaypoint = true
            });
        end;
    end;
    v34.getTickFromPosition = function(v37, v38)
        local v39 = v12.getKeyframeFromPosition(v37, v34.props.StartTick, v34.props.EndTick, v34.props.AbsolutePosition.X + v34.props.TrackPadding / 2, v34.props.AbsoluteSize.X - v34.props.TrackPadding);
        if v38 and v34.props.SnapMode ~= v11.SNAP_MODES.None then
            v39 = v13.getNearestFrame(v39, v34.props.FrameRate);
        end;
        return v39;
    end;
    v34.onEventDragStarted = function(v40)
        v34.DragContext = v17.newEvents(v34.props.AnimationData, v34.props.SelectedEvents, v34.state.eventFilters, v40);
        v34:setState({
            dragging = true, 
            dragTick = v40, 
            hasDragWaypoint = false
        });
    end;
    v34.onEventDragMoved = function(v41)
        local v42 = v34.getTickFromPosition(v41.Position, true);
        if not (not (v34.state.dragTick ~= v42) or not v34.DragContext) then
            v34.addDragWaypoint();
            v34.DragContext:moveEvents(v42);
            v34.props.MoveSelectedEvents(v34.DragContext);
            v34:setState({
                dragTick = v42
            });
        end;
    end;
    v34.onEventDragEnded = function()
        v34:setState({
            dragging = false, 
            dragTick = v1.None, 
            hasDragWaypoint = false
        });
        v34.DragContext = nil;
    end;
    v34.onSelectDragStarted = function(v43)
        if not v34.state.showContextMenu then
            v34.updateSelectDragStart(Vector2.new(v43.Position.X, v11.TRACK_HEIGHT));
            v34.updateSelectDragEnd(Vector2.new(v43.Position.X, v11.TRACK_HEIGHT));
            v34:setState({
                draggingSelection = true
            });
        end;
    end;
    v34.onSelectDragMoved = function(v44)
        v34.props.DeselectAllEvents();
        local l_Position_0 = v44.Position;
        local v46 = v34.selectDragStart:getValue();
        local v47 = Vector2.new(math.min(l_Position_0.X, v46.X), 0);
        local v48 = Vector2.new(math.max(l_Position_0.X, v46.X), 0);
        local v49 = Vector2.new(((v34.props.AbsoluteSize.X - v34.props.TrackPadding) / (v34.props.EndTick - v34.props.StartTick)) / 2, 0);
        local v50 = v34.getTickFromPosition(v47 + v49, false);
        local v51 = v34.getTickFromPosition(v48 - v49, false);
        for _, v53 in ipairs(v34.props.AnimationData.Events.Keyframes) do
            if v50 <= v53 and v53 <= v51 then
                v34.props.SelectEvent(v53, true);
            end;
        end;
        v34.updateSelectDragEnd(Vector2.new(l_Position_0.X, v11.TRACK_HEIGHT * 2));
    end;
    v34.onSelectDragEnded = function()
        v34:setState({
            draggingSelection = v1.None
        });
        v34.updateSelectDragStart(nil);
        v34.updateSelectDragEnd(nil);
    end;
    v34.showMenu = function()
        v34.props.SetPlayState(v11.PLAY_STATE.Pause);
        v34:setState({
            showContextMenu = true
        });
    end;
    v34.hideMenu = function()
        v34:setState({
            showContextMenu = false
        });
    end;
    v34.setEventEditingTick = function(v54)
        v34:setState({
            eventEditingTick = v54 or v1.None
        });
    end;
    v34.setEventsHandler = function(v55)
        if not v34.props.Analytics then
            return ;
        else
            return v34.props.SetEvents(v55, v34.props.Analytics);
        end;
    end;
    v34.toggleEventFilter = function(v56)
        local v57 = nil;
        v57 = l_copy_0(v34.state.eventFilters);
        v57[v56] = not v57[v56] or nil;
        v34:setState({
            eventFilters = v57
        });
    end;
    v34.clearEventFilters = function()
        v34:setState({
            eventFilters = {}
        });
    end;
    v34.setAllEventFilters = function()
        local v58 = {};
        for _, v60 in v34.state.availableEvents, nil, nil do
            v58[v60] = true;
        end;
        v34:setState({
            eventFilters = v58
        });
    end;
end;
v33.handleTimelineInputBegan = function(v61, v62, _)
    if v62.UserInputType == Enum.UserInputType.Keyboard then
        if v14.isMultiSelectKey(v62.KeyCode) then
            v61.isMultiSelecting = true;
            return ;
        end;
    elseif v62.UserInputType == Enum.UserInputType.MouseButton1 then
        v61.props.DeselectAllEvents();
        v61.mouseDownInTimeline = true;
        v61.onSelectDragStarted(v62);
    end;
end;
v33.handleTimelineInputEnded = function(v64, v65, _)
    if v65.UserInputType == Enum.UserInputType.Keyboard then
        if v14.isMultiSelectKey(v65.KeyCode) then
            v64.isMultiSelecting = false;
            return ;
        end;
    elseif v65.UserInputType == Enum.UserInputType.MouseButton2 then
        local v67 = v64.getTickFromPosition(v65.Position, true);
        v64.props.SetRightClickContextInfo({
            Tick = v67
        });
        v64.props.SelectEvent(v67, false);
        v64.showMenu();
        return ;
    elseif v65.UserInputType == Enum.UserInputType.MouseButton1 then
        local v68 = v64.getTickFromPosition(v65.Position, true);
        if v64.doubleClickDetector:isDoubleClick() then
            v64.props.DeselectAllEvents();
            v64.props.SelectEvent(v68, false);
            v64.props.SetEventEditingTick(v68);
        end;
    end;
end;
v33.handleEventRightClick = function(v69, v70)
    v69.props.SelectEvent(v70, false);
    v69.props.SetRightClickContextInfo({
        OnEvent = true, 
        Tick = v70
    });
    v69.showMenu();
end;
v33.handleEventInputBegan = function(v71, v72, v73, v74)
    if v74.UserInputType == Enum.UserInputType.MouseButton1 then
        v71.mouseDownOnEvent = true;
        if not v73 then
            v71.props.SelectEvent(v72, v71.isMultiSelecting);
        elseif v71.isMultiSelecting then
            v71.props.DeselectEvent(v72);
            return ;
        end;
    end;
end;
v33.handleEventInputEnded = function(v75, v76, v77, v78)
    if not ((not (v78.UserInputType == Enum.UserInputType.MouseMovement) or not v77) or not v75.mouseDownOnEvent) then
        v75.onEventDragStarted(v76);
        v75.mouseDownOnEvent = false;
    end;
    if v78.UserInputType == Enum.UserInputType.MouseButton1 then
        v75.mouseDownOnEvent = false;
        if not (not v77 or not v75.doubleClickDetector:isDoubleClick()) then
            v75.props.DeselectAllEvents();
            v75.props.SelectEvent(v76, false);
            v75.props.SetEventEditingTick(v76);
        end;
    end;
end;
v33.refreshEventNames = function(v79)
    local l_props_0 = v79.props;
    local l_state_0 = v79.state;
    local v82 = not not l_props_0.AnimationData and l_props_0.AnimationData.Events or nil;
    local v83 = {};
    if v82 then
        for _, v85 in v82.Data, nil, nil do
            for v86, _ in v85, nil, nil do
                v83[v86] = true;
            end;
        end;
    end;
    local v88 = l_keys_0(v83);
    table.sort(v88);
    local v89, v90 = v16(l_state_0.availableEvents, v88);
    local v91 = l_copy_0(l_state_0.eventFilters);
    for _, v93 in v89, nil, nil do
        v91[v93] = true;
    end;
    for _, v95 in v90, nil, nil do
        v91[v95] = nil;
    end;
    v79:setState({
        availableEvents = v88, 
        eventFilters = v91
    });
end;
v33.didUpdate = function(v96, v97)
    local l_props_1 = v96.props;
    if l_props_1.EventEditingTick ~= v96.state.eventEditingTick then
        if l_props_1.EventEditingTick ~= nil then
            spawn(function()
                v96.setEventEditingTick(l_props_1.EventEditingTick);
            end);
        else
            v96.setEventEditingTick(l_props_1.EventEditingTick);
        end;
    end;
    local v99 = not not l_props_1.AnimationData and l_props_1.AnimationData.Events or nil;
    local v100 = not not v97.AnimationData and v97.AnimationData.Events or nil;
    if v99 ~= v100 then
        v96:refreshEventNames(v100);
    end;
end;
v33.didMount = function(v101)
    v101:refreshEventNames();
end;
v33.render = function(v102)
    local l_props_2 = v102.props;
    local l_state_1 = v102.state;
    local l_Active_0 = l_props_2.Active;
    local l_AbsolutePosition_0 = l_props_2.AbsolutePosition;
    local l_AbsoluteSize_0 = l_props_2.AbsoluteSize;
    local l_AnimationData_0 = l_props_2.AnimationData;
    local l_StartTick_0 = l_props_2.StartTick;
    local l_EndTick_0 = l_props_2.EndTick;
    local l_dragging_0 = l_state_1.dragging;
    local l_draggingSelection_0 = l_state_1.draggingSelection;
    local l_showContextMenu_0 = l_state_1.showContextMenu;
    local l_eventEditingTick_0 = l_state_1.eventEditingTick;
    return v1.createElement("Frame", {
        LayoutOrder = 0, 
        Size = UDim2.new(1, 0, 0, v11.TRACK_HEIGHT), 
        BackgroundTransparency = 1, 
        [v1.Event.InputBegan] = function(_, v116)
            if v116.UserInputType ~= Enum.UserInputType.Keyboard then
                v102:handleTimelineInputBegan(v116);
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v118)
            if v118.UserInputType ~= Enum.UserInputType.Keyboard then
                v102:handleTimelineInputEnded(v118);
            end;
        end
    }, {
        Track = v1.createElement(v18, {
            Events = not not l_AnimationData_0 and l_AnimationData_0.Events or nil, 
            SelectedEvents = l_props_2.SelectedEvents, 
            EditingTick = l_eventEditingTick_0, 
            Size = UDim2.new(1, 0, 0, v11.TRACK_HEIGHT), 
            Width = l_AbsoluteSize_0.X - v102.props.TrackPadding, 
            TrackPadding = v102.props.TrackPadding, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            ShowBackground = true, 
            ZIndex = 1, 
            AvailableEvents = v102.state.availableEvents, 
            EventFilters = v102.state.eventFilters, 
            ToggleEventFilter = v102.toggleEventFilter, 
            ClearEventFilters = v102.clearEventFilters, 
            SetAllEventFilters = v102.setAllEventFilters, 
            OnEventRightClick = function(v119)
                v102:handleEventRightClick(v119);
            end, 
            OnEventInputBegan = function(v120, v121, v122)
                v102:handleEventInputBegan(v120, v121, v122);
            end, 
            OnEventInputEnded = function(v123, v124, v125)
                v102:handleEventInputEnded(v123, v124, v125);
            end
        }), 
        KeyboardListener = v1.createElement(l_KeyboardListener_0, {
            OnKeyPressed = function(v126, v127)
                v102:handleTimelineInputBegan(v126, v127);
            end, 
            OnKeyReleased = function(v128)
                v102:handleTimelineInputEnded(v128);
            end
        }), 
        DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
            OnDragMoved = v102.onEventDragMoved, 
            OnDragEnded = v102.onEventDragEnded
        }), 
        MultiSelectBox = l_draggingSelection_0 and v1.createElement(v19, {
            OnDragMoved = v102.onSelectDragMoved, 
            OnDragEnded = v102.onSelectDragEnded, 
            SelectionStart = v102.selectDragStart, 
            SelectionEnd = v102.selectDragEnd, 
            SourceExtents = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0)
        }), 
        EventActions = (l_Active_0 and l_AnimationData_0) and v1.createElement(v20, {
            ShowMenu = l_showContextMenu_0, 
            EventFilters = v102.state.eventFilters, 
            OnMenuOpened = v102.hideMenu, 
            OnEditEvents = l_props_2.SetEventEditingTick
        }), 
        EditEventsDialog = (l_AnimationData_0 and l_eventEditingTick_0) and v1.createElement(v32, {
            Events = l_AnimationData_0.Events, 
            Tick = l_eventEditingTick_0, 
            OnSaved = v102.setEventsHandler, 
            OnClose = l_props_2.SetEventEditingTick
        })
    });
end;
return (v2.connect(function(v129, _)
    return {
        AnimationData = v129.AnimationData, 
        Active = v129.Status.Active, 
        SelectedEvents = v129.Status.SelectedEvents, 
        EventEditingTick = v129.Status.EventEditingTick, 
        FrameRate = v129.Status.FrameRate, 
        SnapMode = v129.Status.SnapMode
    };
end, function(v131)
    return {
        AddWaypoint = function()
            v131(v21());
        end, 
        SetEvents = function(v132, v133)
            v131(v21());
            v131(v22(v132, v133));
        end, 
        SelectEvent = function(v134, v135)
            v131(v31({}));
            v131(v23(v134, v135));
        end, 
        DeselectEvent = function(v136)
            v131(v24(v136));
        end, 
        MoveSelectedEvents = function(v137)
            v131(v26(v137));
        end, 
        DeselectAllEvents = function()
            v131(v31({}));
            v131(v30({}));
        end, 
        SetRightClickContextInfo = function(v138)
            v131(v29(v138));
        end, 
        SetEventEditingTick = function(v139)
            v131(v27(v139));
        end or nil, 
        SetPlayState = function(v140)
            v131(v28(v140));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics
})(v33))));
