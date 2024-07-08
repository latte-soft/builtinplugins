local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v2.UI.DragListener;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ArrowButton);
local v8 = v1.PureComponent:extend("ZoomBar");
v8.HORIZONTAL = "Horizontal";
v8.VERTICAL = "Vertical";
v8.calculateScrollAndZoom = function(v9)
    local v10 = math.clamp(1 - (v9.MaxValue - v9.MinValue), 0, 1);
    local v11 = 0;
    if v10 > 0 then
        v11 = v9.MinValue / v10;
    end;
    if v9.props.AdjustScrollZoom then
        v9.props.AdjustScrollZoom(v11, v10);
    end;
end;
v8.getDraggableSize = function(v12)
    if v12.props.Direction == v8.HORIZONTAL then
        return (v12.props.ContainerSize.X - v3.SCROLL_BAR_PADDING) - v3.SCROLL_BAR_SIZE * 4;
    else
        return (v12.props.ContainerSize.Y - v3.SCROLL_BAR_PADDING) - v3.SCROLL_BAR_SIZE * 4;
    end;
end;
v8.isDragging = function(v13)
    return v13.state.Zooming or v13.state.Scrolling;
end;
v8.calculateMinAndMax = function(v14)
    local l_props_0 = v14.props;
    local v16 = l_props_0.Scroll or 0;
    local v17 = l_props_0.Zoom or 0;
    v14.MinValue = v16 * v17;
    v14.MaxValue = (1 - v17) + v16 * v17;
end;
v8.init = function(v18)
    v18.state = {
        Scrolling = false, 
        Zooming = false, 
        Hovering = false
    };
    v18.MinValue = 0;
    v18.MaxValue = 1;
    v18.updateMin = function(v19)
        v18.MinValue = math.clamp((((v19 - v18.props.Min) - v18.ClickOffset) + v3.SCROLL_BAR_SIZE) / v18:getDraggableSize(), 0, v18.MaxValue);
    end;
    v18.updateMax = function(v20)
        v18.MaxValue = math.clamp(((v20 - v18.props.Min) - v18.ClickOffset) / v18:getDraggableSize(), v18.MinValue, 1);
    end;
    v18.updateMiddle = function(v21)
        local l_MinValue_0 = v18.MinValue;
        v18.MinValue = math.clamp(v21, 0, l_MinValue_0 + (1 - v18.MaxValue));
        v18.MaxValue = v18.MaxValue + (v18.MinValue - l_MinValue_0);
        v18:calculateScrollAndZoom();
    end;
    v18.dragMiddle = function(v23)
        v18.updateMiddle(((v23 - v18.props.Min) - v18.ClickOffset) / v18:getDraggableSize());
    end;
    v18.onZoomBegan = function(v24, v25, v26)
        if Enum.UserInputType.MouseButton1 == v25.UserInputType then
            v18:setState({
                Zooming = true
            });
            if v18.props.Direction == v8.HORIZONTAL then
                v18.ClickOffset = (v25.Position.X - v24.AbsolutePosition.X) + v3.SCROLL_BAR_SIZE * 2;
            else
                v18.ClickOffset = (v25.Position.Y - v24.AbsolutePosition.Y) + v3.SCROLL_BAR_SIZE * 2;
            end;
            v18.ZoomFunc = v26;
        end;
    end;
    v18.onScrollBegan = function(v27, v28)
        if Enum.UserInputType.MouseButton1 == v28.UserInputType then
            v18:setState({
                Scrolling = true
            });
            if v18.props.Direction == v8.HORIZONTAL then
                v18.ClickOffset = (v28.Position.X - v27.AbsolutePosition.X) + v3.SCROLL_BAR_SIZE * 2;
                return ;
            else
                v18.ClickOffset = (v28.Position.Y - v27.AbsolutePosition.Y) + v3.SCROLL_BAR_SIZE * 2;
            end;
        end;
    end;
    v18.onInputChanged = function(v29)
        if v18:isDragging() then
            local v30 = v18.props.Direction == v8.HORIZONTAL and v29.Position.X or v29.Position.Y;
            if not v18.state.Zooming then
                if v18.state.Scrolling then
                    v18.dragMiddle(v30);
                end;
            else
                v18.ZoomFunc(v30);
                v18:calculateScrollAndZoom();
                return ;
            end;
        end;
    end;
    v18.onInputEnded = function()
        v18:setState({
            Zooming = false, 
            Scrolling = false
        });
    end;
    v18.mouseEnter = function()
        v18:setState({
            Hovering = true
        });
    end;
    v18.mouseLeave = function()
        v18:setState({
            Hovering = false
        });
    end;
end;
v8.render = function(v31)
    local l_props_1 = v31.props;
    local l_state_0 = v31.state;
    local l_zoomBarTheme_0 = l_props_1.Stylizer.zoomBarTheme;
    local l_Position_0 = l_props_1.Position;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local l_Hovering_0 = l_state_0.Hovering;
    local v40 = v31:isDragging();
    if not v40 then
        v31:calculateMinAndMax();
    end;
    local v41 = (v31.MinValue * v31:getDraggableSize() + v3.SCROLL_BAR_SIZE) + 1;
    local v42 = v3.SCROLL_BAR_SIZE * 2 + v31.MaxValue * v31:getDraggableSize();
    local v43 = v41 + v3.SCROLL_BAR_SIZE;
    local v44 = (v42 - v41) - v3.SCROLL_BAR_SIZE;
    local v45 = v31.props.Direction == v8.HORIZONTAL;
    local _ = nil;
    return v1.createElement("ImageButton", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundColor3 = l_zoomBarTheme_0.backgroundColor, 
        BorderColor3 = l_zoomBarTheme_0.borderColor, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0, 
        AutoButtonColor = false, 
        ImageTransparency = 1, 
        [v1.Event.InputBegan] = function(_, v48)
            if not v31:isDragging() and v48.UserInputType == Enum.UserInputType.MouseButton1 then
                v31.ClickOffset = v44 / 2 + v3.SCROLL_BAR_SIZE * 2;
                v31.dragMiddle(not not v45 and v48.Position.X or v48.Position.Y);
            end;
        end
    }, {
        DragTarget = v31:isDragging() and v1.createElement(l_DragListener_0, {
            OnDragMoved = v31.onInputChanged, 
            OnDragEnded = v31.onInputEnded
        }), 
        MinZoomControl = v1.createElement("ImageLabel", {
            Position = not not v45 and UDim2.new(0, v41, 0, 0) or UDim2.new(0, 0, 0, v41), 
            Size = UDim2.new(0, v3.SCROLL_BAR_SIZE, 0, v3.SCROLL_BAR_SIZE), 
            BackgroundColor3 = l_zoomBarTheme_0.controlColor, 
            BorderSizePixel = l_zoomBarTheme_0.borderSize, 
            BorderColor3 = l_zoomBarTheme_0.borderColor, 
            Image = l_zoomBarTheme_0.controlImage, 
            Rotation = not v45 and 90 or 0, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = l_zoomBarTheme_0.imageColor, 
            ZIndex = l_ZIndex_0, 
            [v1.Event.InputBegan] = function(v49, v50)
                v31.onZoomBegan(v49, v50, v31.updateMin);
            end
        }), 
        ScrollControl = v1.createElement("Frame", {
            Position = not not v45 and UDim2.new(0, v43, 0, 0) or UDim2.new(0, 0, 0, v43), 
            Size = not not v45 and UDim2.new(0, v44, 1, 0) or UDim2.new(1, 0, 0, v44), 
            BackgroundColor3 = if not v40 then if l_Hovering_0 then l_zoomBarTheme_0.hoverColor else l_zoomBarTheme_0.controlColor else l_zoomBarTheme_0.pressedColor, 
            BorderColor3 = l_zoomBarTheme_0.borderColor, 
            BorderSizePixel = l_zoomBarTheme_0.borderSize, 
            ZIndex = l_ZIndex_0, 
            [v1.Event.InputBegan] = v31.onScrollBegan, 
            [v1.Event.MouseEnter] = v31.mouseEnter, 
            [v1.Event.MouseLeave] = v31.mouseLeave
        }), 
        MaxZoomControl = v1.createElement("ImageLabel", {
            Position = not not v45 and UDim2.new(0, v42, 0, 0) or UDim2.new(0, 0, 0, v42), 
            Size = UDim2.new(0, v3.SCROLL_BAR_SIZE, 0, v3.SCROLL_BAR_SIZE), 
            BackgroundColor3 = l_zoomBarTheme_0.controlColor, 
            BorderSizePixel = l_zoomBarTheme_0.borderSize, 
            BorderColor3 = l_zoomBarTheme_0.borderColor, 
            Image = l_zoomBarTheme_0.controlImage, 
            Rotation = not v45 and 90 or 0, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = l_zoomBarTheme_0.imageColor, 
            ZIndex = l_ZIndex_0, 
            [v1.Event.InputBegan] = function(v51, v52)
                v31.onZoomBegan(v51, v52, v31.updateMax);
            end
        }), 
        MinButton = v1.createElement(v7, {
            Rotation = not v45 and 0 or 270, 
            OnActivated = function()
                v31.updateMiddle(v31.MinValue - v3.ZOOM_INCREMENT);
            end
        }), 
        MaxButton = v1.createElement(v7, {
            Rotation = not v45 and 180 or 90, 
            Position = not not v45 and UDim2.new(1, 0, 0, 0) or UDim2.new(0, 0, 1, 0), 
            AnchorPoint = not not v45 and Vector2.new(1, 0) or Vector2.new(0, 1), 
            OnActivated = function()
                v31.updateMiddle(v31.MinValue + v3.ZOOM_INCREMENT);
            end
        })
    });
end;
v8 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8);
return v8;
