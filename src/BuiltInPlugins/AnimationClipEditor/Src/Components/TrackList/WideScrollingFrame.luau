local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v3.UI.DragListener;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ArrowButton);
local v8 = v1.PureComponent:extend("WideScrollingFrame");
v8.init = function(v9)
    v9.scrollArea = v1.createRef();
    v9.state = {
        CanvasPosition = Vector2.new(), 
        dragging = false, 
        mouseXOffset = 0, 
        hovering = false
    };
    v9.onSizeChanged = function(v10)
        if v9.props.OnSizeChanged then
            v9.props.OnSizeChanged(v10);
        end;
    end;
    v9.onCanvasPositionChanged = function(v11)
        if v11.CanvasPosition ~= v9.state.CanvasPosition then
            v9:setState({
                CanvasPosition = v11.CanvasPosition
            });
        end;
    end;
    v9.onDragStarted = function(v12, v13)
        if v13.UserInputType == Enum.UserInputType.MouseButton1 then
            v9:setState({
                mouseXOffset = v13.Position.X - v12.AbsolutePosition.X, 
                dragging = true
            });
        end;
    end;
    v9.setCanvasPosition = function(v14)
        v9:setState({
            CanvasPosition = Vector2.new(math.floor(v14 * v9.props.CanvasSize.X.Offset + 0.5), 0)
        });
    end;
    v9.onDragMoved = function(v15)
        local l_mouseXOffset_0 = v9.state.mouseXOffset;
        local l_current_0 = v9.scrollArea.current;
        v9.setCanvasPosition((math.clamp(((v15.Position.X - l_current_0.AbsolutePosition.X) - l_mouseXOffset_0) / l_current_0.AbsoluteSize.X, 0, 1)));
    end;
    v9.onDragEnded = function()
        v9:setState({
            dragging = false
        });
    end;
    v9.scroll = function(v18, v19)
        local l_props_0 = v9.props;
        v9:setState({
            mouseXOffset = ((l_props_0.Width / l_props_0.CanvasSize.X.Offset) * v18.AbsoluteSize.X) / 2
        });
        v9.onDragMoved(v19);
    end;
    v9.mouseEnter = function()
        v9:setState({
            hovering = true
        });
    end;
    v9.mouseLeave = function()
        v9:setState({
            hovering = false
        });
    end;
end;
v8.render = function(v21)
    local l_props_1 = v21.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_0 = v21.state;
    local l_Size_0 = l_props_1.Size;
    local l_AnchorPoint_0 = l_props_1.AnchorPoint;
    local l_Position_0 = l_props_1.Position;
    local l_CanvasSize_0 = l_props_1.CanvasSize;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ZIndex_0 = l_props_1.ZIndex;
    local l_Width_0 = l_props_1.Width;
    local v32 = l_props_1.BackgroundTransparency or 0;
    local l_dragging_0 = l_state_0.dragging;
    local l_hovering_0 = l_state_0.hovering;
    local l_CanvasPosition_0 = l_state_0.CanvasPosition;
    local l_scrollBarTheme_0 = l_Stylizer_0.scrollBarTheme;
    local v37 = l_CanvasSize_0.X.Offset > 0 and l_CanvasSize_0.X.Offset or 1;
    local v38 = l_Width_0 < v37;
    local v39 = math.min(l_CanvasPosition_0.X, v37 - l_Width_0);
    local _ = nil;
    return v1.createElement("Frame", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor, 
        BackgroundTransparency = v32, 
        ZIndex = l_ZIndex_0
    }, {
        Canvas = v1.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -v2.SCROLL_BAR_SIZE), 
            CanvasSize = l_CanvasSize_0, 
            CanvasPosition = l_CanvasPosition_0, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            [v1.Change.AbsoluteSize] = v21.onSizeChanged, 
            [v1.Change.CanvasPosition] = v21.onCanvasPositionChanged, 
            [v1.Event.InputBegan] = l_props_1.OnInputChanged, 
            [v1.Event.InputChanged] = l_props_1.OnInputChanged
        }, l_props_1[v1.Children]), 
        Footer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v2.SCROLL_BAR_SIZE), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_scrollBarTheme_0.backgroundColor, 
            BorderColor3 = l_scrollBarTheme_0.borderColor
        }, {
            ScrollArea = v38 and v1.createElement("Frame", {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.new(1, -v2.SCROLL_BAR_SIZE * 2 - v2.SCROLL_BAR_PADDING, 1, 0), 
                BackgroundTransparency = 1, 
                [v1.Change.AbsoluteSize] = v21.recalculateExtents, 
                [v1.Ref] = v21.scrollArea, 
                [v1.Event.InputBegan] = function(v41, v42)
                    if not l_dragging_0 and v42.UserInputType == Enum.UserInputType.MouseButton1 then
                        v21.scroll(v41, v42);
                    end;
                end
            }, {
                ScrollBar = v1.createElement("Frame", {
                    Size = UDim2.new(l_Width_0 / v37, 0, 1, 0), 
                    Position = UDim2.new(v39 / v37, 0, 0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = if not l_dragging_0 then if l_hovering_0 then l_scrollBarTheme_0.hoverColor else l_scrollBarTheme_0.controlColor else l_scrollBarTheme_0.pressedColor, 
                    [v1.Event.MouseEnter] = v21.mouseEnter, 
                    [v1.Event.mouseLeave] = v21.mouseLeave, 
                    [v1.Event.InputBegan] = v21.onDragStarted
                })
            }), 
            LeftButton = v38 and v1.createElement(v7, {
                Rotation = 270, 
                OnActivated = function()
                    v21.setCanvasPosition(0);
                end
            }), 
            RightButton = v38 and v1.createElement(v7, {
                Rotation = 90, 
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                OnActivated = function()
                    v21.setCanvasPosition(1);
                end
            }), 
            DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
                OnDragMoved = v21.onDragMoved, 
                OnDragEnded = v21.onDragEnded
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
