local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local v5 = require(l_Parent_0.Src.Util.MouseCursorManager);
local v6 = require(l_Parent_0.Src.Components.ImageDragger);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Pane_0 = v2.UI.Pane;
local v12 = v1.PureComponent:extend("ImageEditor");
local v13 = v4.Left.rawValue();
local v14 = v4.Right.rawValue();
local v15 = v4.Top.rawValue();
local v16 = v4.Bottom.rawValue();
local v17 = v4.Undefined.rawValue();
v12.init = function(v18, v19)
    v18.draggerHandlingMovement = false;
    v18.dragOrientation = v17;
    v18:setState({
        hoveringDraggerOrientation = -1
    });
    if math.max(v19.pixelDimensions.X, v19.pixelDimensions.Y) <= 0 then
        v18.leftPos = 0;
        v18.rightPos = 1;
        v18.topPos = 0;
        v18.bottomPos = 1;
    else
        local l_pixelDimensions_0 = v19.pixelDimensions;
        assert(l_pixelDimensions_0.X > 0);
        assert(l_pixelDimensions_0.Y > 0);
        local l_sliceRect_0 = v19.sliceRect;
        v18.leftPos = math.clamp(l_sliceRect_0[v13] / l_pixelDimensions_0.X, 0, 1);
        v18.rightPos = math.clamp(l_sliceRect_0[v14] / l_pixelDimensions_0.X, 0, 1);
        v18.topPos = math.clamp(l_sliceRect_0[v15] / l_pixelDimensions_0.Y, 0, 1);
        v18.bottomPos = math.clamp(l_sliceRect_0[v16] / l_pixelDimensions_0.Y, 0, 1);
    end;
    v18.backgroundImageRef = v1.createRef();
    v18.onDragging = function(v22, v23)
        if v18.dragOrientation == v17 then
            return ;
        else
            v18.draggerHandlingMovement = true;
            v18.dragOrientation = v23;
            v18.updateDraggedPosition(v22);
            return ;
        end;
    end;
    v18.disconnectMouseMoveInputObject = function()
        if v18.mouseMoveInputObjectConnection then
            v18.mouseMoveInputObjectConnection:Disconnect();
            v18.mouseMoveInputObjectConnection = nil;
        end;
    end;
    v18.setDraggingState = function(v24)
        v18.dragging = v24;
        v18:setState({
            dragging = v24
        });
    end;
    v18.setDraggingState(false);
    v18.onDragBegin = function(v25, v26, v27, v28)
        v18.obj = v25;
        v18.draggerHandlingMovement = true;
        v18.dragOrientation = v26;
        v18.mousePosition = v27;
        v18.draggerPosition = v28;
        v18.setDraggingState(true);
        v5.setLocked(v18.props.Mouse, true);
        local l_lastMouseMoveInputObject_0 = v18.lastMouseMoveInputObject;
        if l_lastMouseMoveInputObject_0 ~= nil then
            v18.disconnectMouseMoveInputObject();
            v18.mouseMoveInputObjectConnection = l_lastMouseMoveInputObject_0:GetPropertyChangedSignal("Position"):Connect(function()
                if v18.dragging then
                    v18.onDragging(l_lastMouseMoveInputObject_0.Position, v26);
                end;
            end);
        end;
    end;
    v18.onDragEnd = function(v30, _)
        local l_sliceRect_1 = v18.props.sliceRect;
        local l_pixelDimensions_1 = v18.props.pixelDimensions;
        if v30.UserInputType == Enum.UserInputType.MouseButton1 then
            local v34 = nil;
            if v18.dragOrientation == v13 then
                v34 = {
                    math.round(v18.leftPos * l_pixelDimensions_1.X), 
                    l_sliceRect_1[v14], 
                    l_sliceRect_1[v15], 
                    l_sliceRect_1[v16]
                };
            elseif v18.dragOrientation == v14 then
                v34 = {
                    l_sliceRect_1[v13], 
                    math.round(v18.rightPos * l_pixelDimensions_1.X), 
                    l_sliceRect_1[v15], 
                    l_sliceRect_1[v16]
                };
            elseif v18.dragOrientation == v15 then
                v34 = {
                    l_sliceRect_1[v13], 
                    l_sliceRect_1[v14], 
                    math.round(v18.topPos * l_pixelDimensions_1.Y), 
                    l_sliceRect_1[v16]
                };
            elseif v18.dragOrientation == v16 then
                v34 = {
                    l_sliceRect_1[v13], 
                    l_sliceRect_1[v14], 
                    l_sliceRect_1[v15], 
                    (math.round(v18.bottomPos * l_pixelDimensions_1.Y))
                };
            end;
            if v34 then
                v18.props.setSliceRect(v34, true);
            end;
            v18.disconnectMouseMoveInputObject();
            v18.setDraggingState(false);
            v18.uncertainDragStarted = false;
            v18.updateHoverDragger();
            v5.setLocked(v18.props.Mouse, false);
        end;
        v18.draggerHandlingMovement = false;
    end;
    v18.priorityDragCandidates = {};
    v18.getBestPriorityDragCandidate = function()
        local v35 = nil;
        local v36 = nil;
        for _, v38 in pairs(v18.priorityDragCandidates) do
            if not (v35 ~= nil) or v35 < v38.priority then
                v35 = v38.priority;
                v36 = v38;
            end;
        end;
        return v36;
    end;
    v18.uncertainDragCandidates = {};
    v18.getBestUncertainDragCandidate = function()
        local v39 = nil;
        for _, v41 in pairs(v18.uncertainDragCandidates) do
            if not (v39 ~= nil) or v39 < v41.priority then
                v39 = v41.priority;
            end;
        end;
        local v42 = nil;
        local v43 = nil;
        for _, v45 in pairs(v18.uncertainDragCandidates) do
            if v45.priority == v39 and (not (v42 ~= nil) or v45.distance < v42) then
                v42 = v45.distance;
                v43 = v45;
            end;
        end;
        return v43;
    end;
    v18.uncertainDragStarted = false;
    v18.startUncertainDrag = function(v46)
        if not v18.uncertainDragStarted then
            v18.uncertainDragStarted = true;
            local v47 = v18.getBestUncertainDragCandidate();
            if v47 then
                local l_instance_0 = v47.instance;
                v18.onDragBegin(l_instance_0, v47.orientation, v46, (Vector2.new(l_instance_0.Position.X.Scale, l_instance_0.Position.Y.Scale)));
                v18.draggerHandlingMovement = false;
            end;
            return ;
        else
            return ;
        end;
    end;
    v18.priorityHoverOrientation = nil;
    v18.updateHoverDragger = function(_, _)
        if not v18.dragging then
            local v51 = -1;
            local v52 = v18.getBestPriorityDragCandidate();
            if not v52 then
                local v53 = v18.getBestUncertainDragCandidate();
                if v53 then
                    v51 = v53.orientation;
                end;
            else
                v51 = v52.orientation;
            end;
            v18:setState({
                hoveringDraggerOrientation = v51
            });
            if not (v51 ~= v13) or v51 == v14 then
                v5.setCursor(v18.props.Mouse, v3.MOUSE_CURSORS.EW);
            elseif not (v51 ~= v15) or v51 == v16 then
                v5.setCursor(v18.props.Mouse, v3.MOUSE_CURSORS.NS);
            end;
            if v51 == -1 then
                v5.resetCursor(v18.props.Mouse);
            end;
            return ;
        else
            return ;
        end;
    end;
    v18.addDragCandidateWithId = function(v54, v55, v56, v57, v58)
        v18.uncertainDragCandidates[v54] = {
            distance = v56, 
            instance = v57, 
            orientation = v55, 
            priority = v58 or 0
        };
        v18.updateHoverDragger();
    end;
    v18.removeDragCandidateWithId = function(v59)
        v18.uncertainDragCandidates[v59] = nil;
        v18.updateHoverDragger();
    end;
    v18.onBackgroundInputChanged = function(_, v61)
        if v18.dragging and v61.UserInputType == Enum.UserInputType.MouseMovement then
            if not v18.draggerHandlingMovement then
                v18.updateDraggedPosition(v61.Position);
            else
                return ;
            end;
        end;
    end;
    v18.onBackgroundInputEnded = function(_, v63)
        if not (not (v63.UserInputType == Enum.UserInputType.MouseButton1) or not v18.uncertainDragStarted) then
            v18.onDragEnd(v63, v18.dragOrientation);
        end;
    end;
    v18.updateDraggedPosition = function(v64)
        local l_sliceRect_2 = v18.props.sliceRect;
        local v66 = Vector2.new(v64.X, v64.Y) - v18.mousePosition;
        local l_fitImageSize_0 = v18.state.fitImageSize;
        if l_fitImageSize_0 then
            v18.newPosition = v18.draggerPosition + v66 / l_fitImageSize_0;
            local l_pixelDimensions_2 = v18.props.pixelDimensions;
            if v18.dragOrientation == v13 then
                v18.leftPos = math.clamp(v18.newPosition.X, 0, l_sliceRect_2[v14] / l_pixelDimensions_2.X);
                v18.obj.Position = UDim2.fromScale(v18.leftPos, v18.obj.Position.Y.Scale);
                return ;
            elseif v18.dragOrientation == v14 then
                v18.rightPos = math.clamp(v18.newPosition.X, l_sliceRect_2[v13] / l_pixelDimensions_2.X, 1);
                v18.obj.Position = UDim2.fromScale(v18.rightPos, v18.obj.Position.Y.Scale);
                return ;
            elseif v18.dragOrientation == v15 then
                v18.topPos = math.clamp(v18.newPosition.Y, 0, l_sliceRect_2[v16] / l_pixelDimensions_2.Y);
                v18.obj.Position = UDim2.fromScale(v18.obj.Position.X.Scale, v18.topPos);
                return ;
            else
                if v18.dragOrientation == v16 then
                    v18.bottomPos = math.clamp(v18.newPosition.Y, l_sliceRect_2[v15] / l_pixelDimensions_2.Y, 1);
                    v18.obj.Position = UDim2.fromScale(v18.obj.Position.X.Scale, v18.bottomPos);
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    v18.addPriorityDragCandidate = function(v69, v70, v71)
        v18.priorityDragCandidates[v69] = {
            priority = v70, 
            instance = v71, 
            orientation = v69
        };
        v18.updateHoverDragger();
    end;
    v18.removePriorityDragCandidate = function(v72)
        v18.priorityDragCandidates[v72] = nil;
        v18.updateHoverDragger();
    end;
    v18.setMostRecentMouseMoveInputObject = function(v73)
        v18.lastMouseMoveInputObject = v73;
    end;
    v18.onFitImageSizeChanged = function(v74)
        local l_pixelDimensions_3 = v18.props.pixelDimensions;
        local v76 = false;
        if l_pixelDimensions_3 then
            v76 = l_pixelDimensions_3.X < v74.AbsoluteSize.X;
        end;
        v18:setState({
            fitImageSize = v74.AbsoluteSize, 
            isEnlarged = v76
        });
    end;
end;
v12.createDragger = function(v77, v78)
    return v1.createElement(v6, {
        orientation = v78, 
        pixelDimensions = v77.props.pixelDimensions, 
        sliceRect = v77.props.sliceRect, 
        onDragBegin = v77.onDragBegin, 
        onDragging = v77.onDragging, 
        onDragEnd = v77.onDragEnd, 
        addDragCandidateWithId = v77.addDragCandidateWithId, 
        removeDragCandidateWithId = v77.removeDragCandidateWithId, 
        isHovering = v77.state.hoveringDraggerOrientation == v78, 
        isDragging = v77.state.dragging, 
        addPriorityDragCandidate = v77.addPriorityDragCandidate, 
        removePriorityDragCandidate = v77.removePriorityDragCandidate, 
        startUncertainDrag = v77.startUncertainDrag, 
        setMostRecentMouseMoveInputObject = v77.setMostRecentMouseMoveInputObject
    });
end;
v12.didMount = function(v79)
    v79.onFitImageSizeChanged(v79.backgroundImageRef:getValue());
end;
v12.render = function(v80)
    local l_props_0 = v80.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_selectedObject_0 = l_props_0.selectedObject;
    local l_pixelDimensions_4 = l_props_0.pixelDimensions;
    assert(l_selectedObject_0);
    assert(l_pixelDimensions_4);
    local v85 = false;
    if l_pixelDimensions_4.X > 0 then
        v85 = l_pixelDimensions_4.Y > 0;
    end;
    assert(v85);
    return v1.createElement(l_Pane_0, {
        Position = l_props_0.position, 
        Size = l_props_0.size, 
        Style = "RoundBox", 
        BackgroundColor = l_Stylizer_0.PaneBackgroundColor, 
        Padding = v3.IMAGE_PREVIEW_WINDOW_PADDING
    }, {
        BackgroundCheckboardImage = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Image = v3.IMAGES.BACKGROUND_GRID, 
            ScaleType = Enum.ScaleType.Tile, 
            Size = UDim2.fromScale(1, 1), 
            TileSize = UDim2.fromOffset(v3.BACKGROUND_TILE_SIZE, v3.BACKGROUND_TILE_SIZE), 
            [v1.Event.InputChanged] = v80.onBackgroundInputChanged, 
            [v1.Event.InputEnded] = v80.onBackgroundInputEnded, 
            LayoutOrder = l_props_0.layoutOrder, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            [v1.Change.AbsoluteSize] = v80.onFitImageSizeChanged, 
            [v1.Ref] = v80.backgroundImageRef
        }, {
            AspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = l_pixelDimensions_4.X / l_pixelDimensions_4.Y, 
                AspectType = Enum.AspectType.FitWithinMaxSize, 
                DominantAxis = Enum.DominantAxis.Width
            }), 
            ImagePreview = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_selectedObject_0.Image, 
                ImageColor3 = l_props_0.imageColor3, 
                Position = UDim2.fromScale(0, 0), 
                ScaleType = Enum.ScaleType.Fit, 
                ResampleMode = not not v80.state.isEnlarged and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default, 
                ImageRectOffset = l_props_0.imageRectOffset, 
                ImageRectSize = l_props_0.imageRectSize, 
                Size = UDim2.fromScale(1, 1)
            }, {
                LeftDragSlider = v80:createDragger(v13), 
                RightDragSlider = v80:createDragger(v14), 
                TopDragSlider = v80:createDragger(v15), 
                BottomDragSlider = v80:createDragger(v16)
            }), 
            border = v1.createElement("UIStroke", {
                Thickness = 1, 
                Color = l_Stylizer_0.PaneBorderColor, 
                Transparency = 0
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v12));
