local l_Parent_0 = script.Parent.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.DraggerFramework.Utility.Colors);
local v4 = require(l_Parent_0.Packages.DraggerFramework.Components.MoveHandleView);
local v5 = require(l_Parent_0.Src.Utility.setWorldPivot);
local v6 = require(l_Parent_0.Src.Utility.computeSnapPointsForInstance);
local v7 = require(l_Parent_0.Src.Components.SnapPoints);
local v8 = require(l_DraggerFramework_0.Components.DraggedPivot);
local v9 = require(l_Parent_0.Src.Utility.classifyInstancePivot);
local v10 = table.freeze({
    MinusZ = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), (Vector3.new(0, 1, 0))), 
        Color = v3.Z_AXIS
    }, 
    PlusZ = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), (Vector3.new(0, -1, 0))), 
        Color = v3.Z_AXIS
    }, 
    MinusY = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), (Vector3.new(1, 0, 0))), 
        Color = v3.Y_AXIS
    }, 
    PlusY = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), (Vector3.new(-1, 0, 0))), 
        Color = v3.Y_AXIS
    }, 
    MinusX = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), (Vector3.new(0, 0, 1))), 
        Color = v3.X_AXIS
    }, 
    PlusX = {
        Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), (Vector3.new(0, 0, -1))), 
        Color = v3.X_AXIS
    }
});
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13)
    return (setmetatable({
        _draggerContext = v12, 
        _analyticsName = v13
    }, v11));
end;
local function _(v14, v15)
    if v15 == 0 then
        return 0;
    else
        return v14 / v15;
    end;
end;
local function _(v17, v18)
    local l_X_0 = v17.X;
    local l_X_1 = v18.X;
    local v21 = l_X_1 == 0 and 0 or l_X_0 / l_X_1;
    l_X_1 = v17.Y;
    local l_Y_0 = v18.Y;
    l_X_0 = l_Y_0 == 0 and 0 or l_X_1 / l_Y_0;
    l_Y_0 = v17.Z;
    local l_Z_0 = v18.Z;
    return (Vector3.new(v21, l_X_0, l_Z_0 == 0 and 0 or l_Y_0 / l_Z_0));
end;
v11._getRelativeLocationInBoundingBox = function(v25)
    local v26 = nil;
    local v27 = nil;
    if not v25._primaryObject:IsA("BasePart") then
        if not v25._primaryObject:IsA("Model") then
            error("Bad primary object type `" .. v25._primaryObject.ClassName .. "`");
        else
            local l_BoundingBox_0, v29 = v25._primaryObject:GetBoundingBox();
            v26 = l_BoundingBox_0;
            v27 = v29;
        end;
    else
        v26 = v25._primaryObject.CFrame;
        v27 = v25._primaryObject.Size;
    end;
    local v30 = v26:ToObjectSpace(v25._initialPivot);
    local l_Position_0 = v30.Position;
    local v32 = v30 - l_Position_0;
    local l_v27_0 = v27;
    local l_X_2 = l_Position_0.X;
    local l_X_3 = l_v27_0.X;
    local v36 = l_X_3 == 0 and 0 or l_X_2 / l_X_3;
    l_X_3 = l_Position_0.Y;
    local l_Y_1 = l_v27_0.Y;
    l_X_2 = l_Y_1 == 0 and 0 or l_X_3 / l_Y_1;
    l_Y_1 = l_Position_0.Z;
    local l_Z_1 = l_v27_0.Z;
    return Vector3.new(v36, l_X_2, l_Z_1 == 0 and 0 or l_Y_1 / l_Z_1), v32;
end;
v11._selectedIsActive = function(v39)
    if not v39._draggerContext:shouldShowActiveInstanceHighlight() then
        return false;
    else
        return v39._selection[#v39._selection] == v39._primaryObject;
    end;
end;
v11.beginDrag = function(v40, v41, v42)
    v40._selection = v41;
    v40._initialPivot = v42:getBoundingBox();
    v40._lastPivot = v40._initialPivot;
    v40._primaryObject = v42:getPrimaryObject();
    v40._snapPoints = v6(v40._primaryObject);
    local v43, v44 = v40:_getRelativeLocationInBoundingBox();
    v40._initialRelativePosition = v43;
    v40._initialRelativeRotation = v44;
end;
v11.updateDrag = function(v45, v46)
    if v45._primaryObject then
        local v47 = (v46 * v45._initialPivot):Orthonormalize();
        v5(v45._primaryObject, v47);
        v45._lastPivot = v47;
        v45._snapPoints = v6(v45._primaryObject);
        return v46;
    else
        return v46;
    end;
end;
v11.endDrag = function(v48)
    if v48._primaryObject then
        v48._draggerContext:getAnalytics():sendEvent("setPivot", {
            gridSize = v48._draggerContext:getGridSize(), 
            rotateIncrement = v48._draggerContext:getRotateIncrement(), 
            toolName = v48._analyticsName, 
            handleId = "Rotate", 
            pivotType = v9(v48._primaryObject)
        });
    end;
end;
v11.getSnapPoints = function(v49)
    if not v49._draggerContext:shouldSnapPivotToGeometry() then
        return nil;
    else
        return v49._snapPoints;
    end;
end;
v11.render = function(v50, _)
    local v52 = {};
    local l__lastPivot_0 = v50._lastPivot;
    local v54 = v50._draggerContext:getHandleScale(l__lastPivot_0.Position);
    for v55, v56 in pairs(v10) do
        v52[v55] = v2.createElement(v4, {
            Axis = l__lastPivot_0 * v56.Offset, 
            Color = v56.Color, 
            Outset = 0.5, 
            Thin = true, 
            Scale = v54, 
            AlwaysOnTop = true
        });
    end;
    if v50._draggerContext:shouldSnapPivotToGeometry() then
        v52.SnapPoints = v2.createElement(v7, {
            Focus = l__lastPivot_0.Position, 
            SnapPoints = v50._snapPoints, 
            DraggerContext = v50._draggerContext
        });
        v52.DraggedPivot = v2.createElement(v8, {
            DraggerContext = v50._draggerContext, 
            CFrame = v50._lastPivot, 
            IsActive = v50:_selectedIsActive()
        });
    end;
    return v2.createFragment(v52);
end;
return v11;
