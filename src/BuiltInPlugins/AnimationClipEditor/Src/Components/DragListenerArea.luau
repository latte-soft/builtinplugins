local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v2.UI.DragListener;
local v6 = v1.PureComponent:extend("DragListenerArea");
v6.init = function(v7)
    v7.state = {
        Dragging = false
    };
    v7.onMouseEnter = function()
        if v7.props.Mouse then
            v7.props.Mouse:__pushCursor(v7.props.Cursor);
        end;
    end;
    v7.onMouseLeave = function()
        if not (not v7.props.Mouse or v7.state.Dragging) then
            v7.props.Mouse:__popCursor();
        end;
    end;
    v7.startDragging = function()
        if v7.props.OnDragBegan then
            v7.props.OnDragBegan();
        end;
        v7:setState({
            Dragging = true
        });
    end;
    v7.onDragMoved = function(v8)
        if v7.props.OnDragMoved then
            v7.props.OnDragMoved(v8);
        end;
    end;
end;
v6.didMount = function(v9)
    local l_Mouse_0 = v9.props.Mouse;
    v9.stopDragging = function()
        l_Mouse_0:__resetCursor();
        v9:setState({
            Dragging = false
        });
        if v9.props.OnDragEnded then
            v9.props.OnDragEnded();
        end;
    end;
end;
v6.willUnmount = function(v11)
    v11.props.Mouse:__resetCursor();
end;
v6.render = function(v12)
    local l_state_0 = v12.state;
    local l_props_0 = v12.props;
    return v1.createElement("ImageButton", {
        Size = l_props_0.Size or UDim2.new(1, 0, 1, 0), 
        AnchorPoint = l_props_0.AnchorPoint or Vector2.new(), 
        ImageTransparency = 1, 
        BackgroundTransparency = 1, 
        [v1.Event.MouseEnter] = v12.onMouseEnter, 
        [v1.Event.MouseLeave] = v12.onMouseLeave, 
        [v1.Event.MouseButton1Down] = v12.startDragging
    }, {
        Target = l_state_0.Dragging and v1.createElement(l_DragListener_0, {
            OnDragMoved = v12.onDragMoved, 
            OnDragEnded = v12.stopDragging
        })
    });
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse
})(v6));
