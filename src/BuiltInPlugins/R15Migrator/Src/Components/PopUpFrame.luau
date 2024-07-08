local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v8 = v2.PureComponent:extend("PopUpFrame");
v8.init = function(v9)
    v9.ref = v2.createRef();
    v9.state = {
        position = UDim2.new(), 
        closeHovered = false
    };
    v9.onMouseEnter = function()
        v9:setState({
            closeHovered = true
        });
    end;
    v9.onMouseLeave = function()
        v9:setState({
            closeHovered = false
        });
    end;
    v9.reposition = function()
        if v9.ref.current == nil then
            return ;
        else
            v9:setState({
                position = v9.getPosition()
            });
            return ;
        end;
    end;
    v9.getPosition = function()
        local l_props_0 = v9.props;
        local l_ExpandedHeight_0 = l_props_0.ExpandedHeight;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_current_0 = v9.ref.current;
        local v14 = Vector2.new();
        local v15 = Vector2.new();
        if l_current_0 then
            v14 = l_current_0.parent.AbsolutePosition;
            v15 = l_current_0.parent.AbsoluteSize;
        end;
        return UDim2.fromOffset(v14.X, (v14.Y - (l_ExpandedHeight_0 + l_Stylizer_0.TopBarHeight)) + v15.Y);
    end;
    v9.changeTokens = {};
end;
v8.didUpdate = function(v16, v17)
    if v16.props.Hide ~= v17.Hide then
        if not v16.props.Hide then
            v16.reposition();
        end;
        v16:setState({
            closeHovered = false
        });
    end;
end;
v8.didMount = function(v18)
    local l_Parent_0 = v18.ref.current.Parent;
    table.insert(v18.changeTokens, l_Parent_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(v18.reposition));
    table.insert(v18.changeTokens, l_Parent_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(v18.reposition));
end;
v8.willUnmount = function(v20)
    for _, v22 in ipairs(v20.changeTokens) do
        v22:Disconnect();
    end;
end;
v8.renderTopBar = function(v23, v24)
    local l_state_0 = v23.state;
    local l_props_1 = v23.props;
    local l_closeHovered_0 = l_state_0.closeHovered;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Size_0 = l_Stylizer_1.Arrow.Size;
    return v2.createElement(l_Pane_0, {
        BackgroundColor3 = l_Stylizer_1.TopBarColor, 
        BorderSizePixel = 0, 
        LayoutOrder = v24, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.TopBarHeight), 
        Padding = l_Stylizer_1.TopBarPadding, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        CloseButton = v2.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
            ImageColor3 = if not l_closeHovered_0 then l_Stylizer_1.Arrow.Color else l_Stylizer_1.Arrow.HoverColor, 
            Image = l_Stylizer_1.Arrow.Image, 
            ImageRectOffset = l_Stylizer_1.Arrow.Offset, 
            ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
            [v2.Event.MouseButton1Click] = l_props_1.OnFocusLost, 
            [v2.Event.MouseEnter] = v23.onMouseEnter, 
            [v2.Event.MouseLeave] = v23.onMouseLeave
        })
    });
end;
v8.renderFrame = function(v30)
    local l_state_1 = v30.state;
    local l_props_2 = v30.props;
    local l_Stylizer_2 = l_props_2.Stylizer;
    local l_position_0 = l_state_1.position;
    local v35 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Position = l_position_0, 
        Size = UDim2.new(1, 0, 0, l_props_2.ExpandedHeight + l_Stylizer_2.TopBarHeight), 
        BackgroundColor3 = l_Stylizer_2.BackgroundColor, 
        BorderSizePixel = 0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TopBar = v30:renderTopBar(v35:getNextOrder()), 
        Content = l_props_2.RenderContent(v35:getNextOrder())
    });
end;
v8.render = function(v36)
    local l_props_3 = v36.props;
    local v38 = not l_props_3.Hide;
    return v2.createElement(l_Pane_0, {
        ForwardRef = v36.ref, 
        Size = UDim2.fromScale(1, 0)
    }, {
        PortalToRoot = v38 and v2.createElement(l_CaptureFocus_0, {
            OnFocusLost = l_props_3.OnFocusLost
        }, {
            Frame = v38 and v36:renderFrame()
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
