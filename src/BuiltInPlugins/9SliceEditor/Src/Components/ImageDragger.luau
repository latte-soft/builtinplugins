local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = v1.PureComponent:extend("ImageDragger");
local v10 = v4.Left.rawValue();
local v11 = v4.Right.rawValue();
local v12 = v4.Top.rawValue();
local v13 = v4.Bottom.rawValue();
local v14 = {
    [v10] = 1, 
    [v11] = 2, 
    [v12] = 3, 
    [v13] = 4
};
v9.init = function(v15, v16)
    v15:setState({
        dragging = false
    });
    v15.draggerInstanceRef = v1.createRef();
    v15.selectionPriority = 0;
    v15.onInputBegan = function(v17, v18)
        local l_orientation_0 = v15.props.orientation;
        if v18.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                dragging = true
            });
            v16.onDragBegin(v17, l_orientation_0, Vector2.new(v18.Position.X, v18.Position.Y), (Vector2.new(v17.Position.X.Scale, v17.Position.Y.Scale)));
            return ;
        else
            if v18.UserInputType == Enum.UserInputType.MouseMovement then
                v15.props.addPriorityDragCandidate(l_orientation_0, v17.ZIndex, v17);
                v15.props.setMostRecentMouseMoveInputObject(v18);
            end;
            return ;
        end;
    end;
    v15.onHandleInputChanged = function(v20, v21)
        local v22 = nil;
        local l_orientation_1 = v15.props.orientation;
        local v24 = v15.draggerInstanceRef:getValue();
        local l_DRAGGER_WIDTH_0 = v3.DRAGGER_WIDTH;
        local v26 = 0;
        l_DRAGGER_WIDTH_0 = v3.DRAGGER_CLICK_WINDOW_WIDTH;
        v26 = (not (l_orientation_1 ~= v11) or l_orientation_1 == v13) and 0.01 or 0;
        if not (l_orientation_1 ~= v10) or l_orientation_1 == v11 then
            v22 = math.abs(((v24.AbsolutePosition.X + v26) + l_DRAGGER_WIDTH_0 / 2) - v21.Position.X);
        elseif not (l_orientation_1 ~= v12) or l_orientation_1 == v13 then
            v22 = math.abs(((v24.AbsolutePosition.Y + v26) + l_DRAGGER_WIDTH_0 / 2) - v21.Position.Y);
        end;
        v15.props.addDragCandidateWithId(v20, v15.props.orientation, v22, v24, v15.selectionPriority);
    end;
    v15.onInputBeganOnLowPriorityHandles = function(v27, v28)
        if v28.UserInputType == Enum.UserInputType.MouseButton1 then
            v15.props.startUncertainDrag((Vector2.new(v28.Position.X, v28.Position.Y)));
            return ;
        else
            if v28.UserInputType == Enum.UserInputType.MouseMovement then
                v15.onHandleInputChanged(v27, v28);
                v15.props.setMostRecentMouseMoveInputObject(v28);
            end;
            return ;
        end;
    end;
    v15.onInputChanged = function(_, v30)
        local l_orientation_2 = v15.props.orientation;
        if v15.state.dragging and v30.UserInputType == Enum.UserInputType.MouseMovement then
            v16.onDragging(Vector2.new(v30.Position.X, v30.Position.Y), l_orientation_2);
        end;
    end;
    v15.onInputEnded = function(_, v33)
        local l_orientation_3 = v15.props.orientation;
        v16.onDragEnd(v33, l_orientation_3);
        if v33.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                dragging = false
            });
            return ;
        else
            if v33.UserInputType == Enum.UserInputType.MouseMovement then
                v15.props.removePriorityDragCandidate(l_orientation_3);
            end;
            return ;
        end;
    end;
    v15.onHandleInputEnded = function(v35, v36)
        v16.onDragEnd(v36, v15.props.orientation);
        if v36.UserInputType == Enum.UserInputType.MouseButton1 then
            v15:setState({
                dragging = false
            });
            return ;
        else
            if v36.UserInputType == Enum.UserInputType.MouseMovement then
                v15.props.removeDragCandidateWithId(v35);
            end;
            return ;
        end;
    end;
    v15.onInputBeganOnPriorityHandles = function(_, _)
        v15.selectionPriority = v14[v15.props.orientation];
    end;
    v15.onInputEndedOnPriorityHandles = function(_, _)
        v15.selectionPriority = 0;
    end;
end;
v9.render = function(v41)
    local l_props_0 = v41.props;
    local l_sliceRect_0 = l_props_0.sliceRect;
    local l_pixelDimensions_0 = l_props_0.pixelDimensions;
    local l_orientation_4 = l_props_0.orientation;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_isHovering_0 = l_props_0.isHovering;
    local v48 = l_isHovering_0 and not l_props_0.isDragging;
    local v49 = math.round(l_sliceRect_0[l_orientation_4]);
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if not (l_orientation_4 ~= v10) or l_orientation_4 == v11 then
        v51 = UDim2.fromScale(math.clamp(v49 / l_pixelDimensions_0.X, 0, 1), 0.5);
        v55 = l_Stylizer_0.EdgeHandleSize;
        local v59 = nil;
        if l_orientation_4 == v10 then
            v59 = v3.IMAGES.DRAGGER_V2.LEFT;
            v58 = UDim2.fromOffset((v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_WIDTH_V2) + v3.DRAGGER_CENTER_INSETPX, 0);
        elseif l_orientation_4 == v11 then
            v59 = v3.IMAGES.DRAGGER_V2.RIGHT;
            v58 = UDim2.fromOffset(v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_CENTER_INSETPX, 0);
        end;
        v53 = UDim2.new(0.5, 0, 0, l_Stylizer_0.EdgeHandleInsetPx);
        v54 = UDim2.new(0.5, 0, 1, -l_Stylizer_0.EdgeHandleInsetPx);
        v50 = not not v48 and v59.OUTLINED or v59.NORMAL;
        v57 = Rect.new(0, 8, 8, 8);
        v52 = UDim2.new(0, v3.DRAGGER_WIDTH_V2, 1, 0);
        v56 = UDim2.new(0, v3.DRAGGER_CLICK_WINDOW_WIDTH, 1, v3.DRAGGER_HANDLE_SIZE * 2);
    elseif not (l_orientation_4 ~= v12) or l_orientation_4 == v13 then
        local v60 = math.clamp(v49 / l_pixelDimensions_0.Y, 0, 1);
        v50 = v3.IMAGES.HORIZONTAL_DRAGGER;
        v51 = UDim2.fromScale(0.5, v60);
        v55 = UDim2.new(l_Stylizer_0.EdgeHandleSize.Y, l_Stylizer_0.EdgeHandleSize.X);
        local v61 = nil;
        if l_orientation_4 == v12 then
            v61 = v3.IMAGES.DRAGGER_V2.TOP;
            v58 = UDim2.fromOffset(0, (v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_WIDTH_V2) + v3.DRAGGER_CENTER_INSETPX);
        elseif l_orientation_4 == v13 then
            v61 = v3.IMAGES.DRAGGER_V2.BOTTOM;
            v58 = UDim2.fromOffset(0, v3.DRAGGER_CLICK_WINDOW_WIDTH / 2 - v3.DRAGGER_CENTER_INSETPX);
        end;
        v53 = UDim2.new(0, l_Stylizer_0.EdgeHandleInsetPx, 0.5, 0);
        v54 = UDim2.new(1, -l_Stylizer_0.EdgeHandleInsetPx, 0.5, 0);
        v50 = not not v48 and v61.OUTLINED or v61.NORMAL;
        v57 = Rect.new(8, 0, 8, 8);
        v52 = UDim2.new(1, 0, 0, v3.DRAGGER_WIDTH_V2);
        v56 = UDim2.new(1, v3.DRAGGER_HANDLE_SIZE * 2, 0, v3.DRAGGER_CLICK_WINDOW_WIDTH);
    end;
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v51, 
        Size = v56, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 0, 1), 
        [v1.Event.InputBegan] = v41.onInputBeganOnLowPriorityHandles, 
        [v1.Event.InputChanged] = v41.onHandleInputChanged, 
        [v1.Event.InputEnded] = v41.onHandleInputEnded, 
        [v1.Ref] = v41.draggerInstanceRef
    }, {
        Image = v1.createElement("ImageLabel", {
            Position = v58, 
            BackgroundTransparency = 1, 
            Image = v50, 
            Size = v52, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v57, 
            BorderSizePixel = 0, 
            ImageColor3 = (not not v48 and Color3.fromRGB(255, 131, 131) or (l_isHovering_0 and l_props_0.isDragging) and Color3.fromRGB(210, 0, 0)) or Color3.fromRGB(255, 0, 0), 
            ZIndex = (5 + v14[l_orientation_4]) + (not l_isHovering_0 and 0 or 100), 
            [v1.Event.InputBegan] = v41.onInputBeganOnPriorityHandles, 
            [v1.Event.InputEnded] = v41.onInputEndedOnPriorityHandles
        }, {
            Handle1 = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = v53, 
                Size = v55, 
                BorderSizePixel = 0, 
                ZIndex = 1 + v14[l_orientation_4], 
                BackgroundColor3 = Color3.new(0, 1, 0), 
                BackgroundTransparency = 1, 
                [v1.Event.InputBegan] = v41.onInputBeganOnLowPriorityHandles, 
                [v1.Event.InputChanged] = v41.onHandleInputChanged, 
                [v1.Event.InputEnded] = v41.onHandleInputEnded
            }), 
            Handle2 = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = v54, 
                Size = v55, 
                BorderSizePixel = 0, 
                ZIndex = 1 + v14[l_orientation_4], 
                BackgroundColor3 = Color3.new(0, 1, 0), 
                BackgroundTransparency = 1, 
                [v1.Event.InputBegan] = v41.onInputBeganOnLowPriorityHandles, 
                [v1.Event.InputChanged] = v41.onHandleInputChanged, 
                [v1.Event.InputEnded] = v41.onHandleInputEnded
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v9));
