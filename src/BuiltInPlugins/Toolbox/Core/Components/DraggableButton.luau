local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local v5 = v2.PureComponent:extend("DraggableButton");
v5.init = function(v6, v7)
    v6.clicked = false;
    v6.clickPosition = Vector2.new(0, 0);
    v6.willFireClickOnMouseUp = false;
    if v4.shouldDebugWarnings() then
        if v7[v2.Event.MouseButton1Down] then
            warn("MouseButton1Down should not be defined on DraggableButton. Use onMouseDown instead.");
        end;
        if v7[v2.Event.MouseMoved] then
            warn("MouseButton1Down should not be defined on DraggableButton. Use onMouseMoved instead.");
        end;
        if v7[v2.Event.MouseButton1Up] then
            warn("MouseButton1Up should not be defined on DraggableButton. Use onMouseUp instead.");
        end;
    end;
    v6.onMouseButton1Down = function(v8, v9, v10)
        v6.clicked = true;
        v6.clickPosition = Vector2.new(v9, v10);
        v6.willFireClickOnMouseUp = true;
        if v7.onMouseDown then
            v7.onMouseDown(v8, v9, v10);
        end;
    end;
    v6.onMouseMoved = function(v11, v12, v13)
        if not (not v6.clicked or not v6.willFireClickOnMouseUp) and (Vector2.new(v12, v13) - v6.clickPosition).magnitude > 4 then
            v6.willFireClickOnMouseUp = false;
            if v7.onDragStart then
                v7.onDragStart(v11, v12, v13);
            end;
        end;
        if v7.onMouseMoved then
            v7.onMouseMoved(v11, v12, v13);
        end;
    end;
    v6.onMouseButton1Up = function(v14, v15, v16)
        v6.clicked = false;
        v6.clickPosition = Vector2.new(v15, v16);
        if v6.willFireClickOnMouseUp then
            v6.willFireClickOnMouseUp = false;
            if v7.onClick then
                v7.onClick(v14, v15, v16);
            end;
        end;
        if v7.onMouseUp then
            v7.onMouseUp(v14, v15, v16);
        end;
    end;
end;
v5.render = function(v17)
    local _ = nil;
    return v2.createElement("ImageButton", (v3.Dictionary.join(v17.props, {
        [v2.Event.MouseButton1Down] = v17.onMouseButton1Down, 
        [v2.Event.MouseMoved] = v17.onMouseMoved, 
        [v2.Event.MouseButton1Up] = v17.onMouseButton1Up, 
        onDragStart = v3.None, 
        onClick = v3.None, 
        onMouseDown = v3.None, 
        onMouseMoved = v3.None, 
        onMouseUp = v3.None
    })));
end;
return v5;
