local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_DraggerFramework_0 = l_Packages_0.DraggerFramework;
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_DraggerFramework_0.Utility.DragHelper);
local v6 = require(l_DraggerFramework_0.Utility.Colors);
local v7 = require(l_DraggerFramework_0.Components.MoveHandleView);
local v8 = require(l_DraggerFramework_0.Components.TargetGridView);
local v9 = require(l_DraggerFramework_0.Components.TargetSoftSnapView);
local v10 = require(l_Parent_0.Src.Utility.setWorldPivot);
local v11 = require(l_Parent_0.Src.Utility.computeSnapPointsForInstance);
local v12 = require(l_Parent_0.Src.Components.SnapPoints);
local v13 = require(l_DraggerFramework_0.Components.DraggedPivot);
local v14 = require(l_Parent_0.Src.Utility.classifyInstancePivot);
local v15 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v16 = require(l_DraggerFramework_0.Flags.getFFlagDraggerSnapToPartsLua);
local v17 = Vector3.new();
local v18 = {
    MinusZ = {
        Offset = CFrame.fromMatrix(v17, Vector3.new(1, 0, 0), (Vector3.new(0, 1, 0))), 
        Color = v6.Z_AXIS
    }, 
    PlusZ = {
        Offset = CFrame.fromMatrix(v17, Vector3.new(1, 0, 0), (Vector3.new(0, -1, 0))), 
        Color = v6.Z_AXIS
    }, 
    MinusY = {
        Offset = CFrame.fromMatrix(v17, Vector3.new(0, 0, 1), (Vector3.new(1, 0, 0))), 
        Color = v6.Y_AXIS
    }, 
    PlusY = {
        Offset = CFrame.fromMatrix(v17, Vector3.new(0, 0, 1), (Vector3.new(-1, 0, 0))), 
        Color = v6.Y_AXIS
    }, 
    MinusX = {
        Offset = CFrame.fromMatrix(v17, Vector3.new(0, 1, 0), (Vector3.new(0, 0, 1))), 
        Color = v6.X_AXIS
    }, 
    PlusX = {
        Offset = CFrame.fromMatrix(v17, Vector3.new(0, 1, 0), (Vector3.new(0, 0, -1))), 
        Color = v6.X_AXIS
    }
};
local v19 = {};
v19.__index = v19;
v19.new = function(v20, v21, v22)
    local v23 = setmetatable({
        _draggerContext = v20, 
        _draggerToolModel = v21, 
        _dragInfo = v22, 
        _snapPoints = {}, 
        _originalPivot = v22.ClickedSelectable:GetPivot(), 
        _tiltRotate = CFrame.new()
    }, v19);
    v23._snapPoints = v11(v22.ClickedSelectable);
    v23._pivotOwner = v22.ClickedSelectable;
    v23._originalPivotSnapPoints = v23._snapPoints;
    v23:update();
    return v23;
end;
v19._selectedIsActive = function(v24)
    if not v24._draggerContext:shouldShowActiveInstanceHighlight() then
        return false;
    else
        return v24._pivotOwner == v24._draggerToolModel:getSelectionWrapper():getActiveSelectable();
    end;
end;
v19.render = function(v25)
    if v25._lastDragTarget == nil then
        return ;
    else
        local v26 = {};
        for v27, v28 in pairs(v18) do
            local v29 = v25._lastDragTarget.mainCFrame * v28.Offset;
            v26[v27] = v4.createElement(v7, {
                Axis = v29, 
                Color = v28.Color, 
                Outset = 0.5, 
                Scale = v25._draggerContext:getHandleScale(v29.Position), 
                AlwaysOnTop = true, 
                Thin = true
            });
        end;
        v26.DraggedPivot = v4.createElement(v13, {
            DraggerContext = v25._draggerContext, 
            CFrame = v25._lastDragTarget.mainCFrame, 
            IsActive = v25:_selectedIsActive()
        });
        if not (not v25._draggerContext:shouldSnapPivotToGeometry() or not v25._snapPoints) then
            v26.SnapPoints = v4.createElement(v12, {
                Focus = v25._lastDragTarget.mainCFrame.Position, 
                SnapPoints = v25._snapPoints, 
                DraggerContext = v25._draggerContext
            });
        end;
        if not (not v15() or v25._draggerContext:shouldSnapPivotToGeometry()) then
            local v30 = v25._draggerContext:getHandleScale(v25._lastDragTarget.targetMatrix.Position);
            if not v16() then
                v26.TargetGrid = v4.createElement(v8, {
                    DragTarget = v25._lastDragTarget, 
                    SourceSize = Vector3.one * 4, 
                    Scale = v30, 
                    GridSize = if not v25._draggerContext:getGridSnapEnabled() then nil else v25._draggerContext:getGridSize(), 
                    MajorStep = v25._draggerContext:getMajorGridIncrement(), 
                    Color = v25._draggerContext:getGridColor(), 
                    PrimaryColor = v25._draggerContext:getChosenColor()
                });
                v26.TargetSoftSnapView = v4.createElement(v9, {
                    DragTarget = v25._lastDragTarget, 
                    DraggerContext = v25._draggerContext
                });
            elseif #v25._lastDragTarget.softSnaps == 0 then
                v26.TargetGrid = v4.createElement(v8, {
                    DragTarget = v25._lastDragTarget, 
                    SourceSize = Vector3.one * 4, 
                    Scale = v30, 
                    GridSize = if not v25._draggerContext:getGridSnapEnabled() then nil else v25._draggerContext:getGridSize(), 
                    MajorStep = v25._draggerContext:getMajorGridIncrement(), 
                    Color = v25._draggerContext:getGridColor(), 
                    PrimaryColor = v25._draggerContext:getChosenColor()
                });
            else
                v26.TargetSoftSnapView = v4.createElement(v9, {
                    DragTarget = v25._lastDragTarget, 
                    DraggerContext = v25._draggerContext
                });
            end;
        end;
        return v4.createFragment(v26);
    end;
end;
v19.rotate = function(v31, v32)
    local l__originalPivot_0 = v31._originalPivot;
    local v34 = nil;
    if v31._lastDragTarget then
        v34 = v31._lastDragTarget.targetMatrix;
    end;
    v31._tiltRotate = v5.updateTiltRotate(v31._draggerToolModel._draggerContext:getCameraCFrame(), v31._draggerToolModel._draggerContext:getMouseRay(), {}, l__originalPivot_0, v34, v31._tiltRotate, v32, true);
end;
v19._updateNoSnap = function(v35)
    local v36 = nil;
    if v35._lastDragTarget then
        v36 = v35._lastDragTarget.targetMatrix;
    end;
    if not v15() then
        local v38 = v5.getDragTarget(v35._draggerToolModel._draggerContext:getMouseRay(), function(v37)
            return v35._draggerContext:snapToGridSize(v37);
        end, v17, {}, v35._originalPivot, v17, v17, v17, v35._tiltRotate, v36, true);
        if v38 then
            v35._lastDragTarget = v38;
            v10(v35._dragInfo.ClickedSelectable, v38.mainCFrame);
        end;
    else
        local v39 = v5.getDragTarget({}, v35._originalPivot, v17, v17, v17, v35._draggerToolModel._draggerContext:getMouseRay(), if not v35._draggerContext:shouldGridSnap() then nil else v35._draggerContext:getGridSize(), v35._tiltRotate, v36, true, false, v35._draggerContext:getSoftSnapMarginFactor(), if not v16() then nil else v35._draggerContext:shouldPartSnap());
        if v39 then
            v35._lastDragTarget = v39;
            v10(v35._dragInfo.ClickedSelectable, v39.mainCFrame);
            return ;
        end;
    end;
end;
v19._recomputeSnapPoints = function(v40)
    local v41 = v40._draggerContext:getMouseRay();
    local v42 = v40._draggerToolModel:getSchema();
    local v43 = v40._draggerToolModel:getSelectionWrapper():get();
    if not v15() then
        local v44 = v42.getMouseTarget(v40._draggerContext, v41, v43, true);
        if v44 then
            if v44 == v40._pivotOwner then
                v40._snapPoints = v40._originalPivotSnapPoints;
                return ;
            elseif v44 ~= l_Workspace_0.Terrain then
                v40._snapPoints = v11(v44);
            end;
        end;
    else
        local v45, v46, _, _ = v42.getMouseTarget(v40._draggerContext, v41, v43, true, false);
        if v45 then
            if not (v45 ~= v40._pivotOwner) or v46 == v40._pivotOwner then
                v40._snapPoints = v40._originalPivotSnapPoints;
                return ;
            elseif v45 ~= l_Workspace_0.Terrain then
                v40._snapPoints = v11(v45);
                return ;
            end;
        end;
    end;
end;
v19._snapToSnapPoints = function(v49)
    if v49._snapPoints then
        local v50 = v49._draggerContext:getMouseLocation();
        local v51 = nil;
        local l_huge_0 = math.huge;
        for _, v54 in ipairs(v49._snapPoints) do
            local v55, v56 = v49._draggerContext:worldToViewportPoint(v54.Position);
            if v56 then
                local l_Magnitude_0 = (Vector2.new(v55.X, v55.Y) - v50).Magnitude;
                if l_Magnitude_0 < l_huge_0 then
                    l_huge_0 = l_Magnitude_0;
                    v51 = v54;
                end;
            end;
        end;
        local v58 = v51 or v49._originalPivot;
        v49._lastDragTarget = {
            mainCFrame = v58
        };
        v10(v49._dragInfo.ClickedSelectable, v58);
        return ;
    else
        return ;
    end;
end;
v19._updateSnap = function(v59)
    v59:_recomputeSnapPoints();
    v59:_snapToSnapPoints();
end;
v19.update = function(v60)
    if not v60._draggerContext:shouldSnapPivotToGeometry() then
        v60:_updateNoSnap();
        return ;
    else
        v60:_updateSnap();
        return ;
    end;
end;
v19.destroy = function(v61)
    v61._draggerContext:getAnalytics():sendEvent("setPivot", {
        gridSize = v61._draggerContext:getGridSize(), 
        rotateIncrement = v61._draggerContext:getRotateIncrement(), 
        handleId = v61._dragInfo.HandleId, 
        pivotType = v14(v61._dragInfo.ClickedSelectable)
    });
end;
return v19;
