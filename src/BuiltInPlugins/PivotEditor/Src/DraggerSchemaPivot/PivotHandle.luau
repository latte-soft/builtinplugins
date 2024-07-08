local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(script.Parent.FreeformDragger);
local v3 = require(l_Parent_0.Src.Components.PivotRing);
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    return (setmetatable({
        _dragging = false, 
        _draggerContext = v5
    }, v4));
end;
v4.update = function(v6, v7, v8)
    if not v6._dragging then
        v6._originalPivot = v8:getBoundingBox();
        v6._pivotOwner = v8:getPrimaryObject();
        v6._draggerToolModel = v7;
        v6._schema = v7:getSchema();
    end;
end;
v4.shouldBiasTowardsObjects = function(_)
    return false;
end;
v4.hitTest = function(v10, _, _)
    local v13, v14 = v10._draggerContext:worldToViewportPoint(v10._originalPivot.Position);
    if v14 and (Vector2.new(v13.X, v13.Y) - v10._draggerContext:getMouseLocation()).Magnitude < v3.HitTestRadius then
        return "Pivot", 0, true;
    else
        return nil;
    end;
end;
v4._selectedIsActive = function(v15)
    if not v15._draggerContext:shouldShowActiveInstanceHighlight() then
        return false;
    else
        return v15._pivotOwner == v15._draggerToolModel:getSelectionWrapper():getActiveSelectable();
    end;
end;
v4._renderPivotAdorn = function(v16, v17)
    if v16._pivotOwner then
        return v1.createElement(v3, {
            DraggerContext = v16._draggerContext, 
            Hovered = v17, 
            Pivot = v16._originalPivot, 
            IsActive = v16:_selectedIsActive()
        });
    else
        return ;
    end;
end;
v4.render = function(v18, v19)
    local v20 = {};
    if not v18._freeformDrag then
        if not v19 then
            v20.PivotAdorn = v18:_renderPivotAdorn(false);
        else
            v20.PivotAdorn = v18:_renderPivotAdorn(true);
        end;
    else
        v20.DragUI = v18._freeformDrag:render();
    end;
    return v1.createFragment(v20);
end;
v4.mouseDown = function(v21, _, _)
    if v21._pivotOwner then
        v21._freeformDrag = v2.new(v21._draggerContext, v21._draggerToolModel, {
            ClickedSelectable = v21._pivotOwner, 
            HandleId = "Pivot"
        });
        v21._freeformDrag:update();
    end;
end;
local function _(v24)
    local v25 = true;
    if v24 ~= Enum.KeyCode.LeftAlt then
        v25 = v24 == Enum.KeyCode.RightAlt;
    end;
    return v25;
end;
v4.keyDown = function(v27, v28)
    if v27._freeformDrag then
        if v28 == Enum.KeyCode.R then
            v27._freeformDrag:rotate((Vector3.new(0, 1, 0)));
            return true;
        elseif v28 == Enum.KeyCode.T then
            v27._freeformDrag:rotate((Vector3.new(1, 0, 0)));
            return true;
        else
            local v29 = true;
            if v28 ~= Enum.KeyCode.LeftAlt then
                v29 = v28 == Enum.KeyCode.RightAlt;
            end;
            if v29 then
                v27._freeformDrag:update();
                return true;
            end;
        end;
    end;
    return false;
end;
v4.keyUp = function(v30, _)
    if not v30._freeformDrag then
        return false;
    else
        v30._freeformDrag:update();
        return true;
    end;
end;
v4.mouseDrag = function(v32, _)
    if v32._freeformDrag then
        v32._freeformDrag:update();
    end;
end;
v4.mouseUp = function(v34, _)
    if v34._freeformDrag then
        v34._freeformDrag:destroy();
        v34._freeformDrag = nil;
        v34._schema.addUndoWaypoint(v34._draggerContext, "Modify Pivot");
    end;
end;
return v4;
