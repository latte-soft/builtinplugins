local l_Parent_0 = script.Parent.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.DraggerSchemaCore.getSelectableWithCache);
local v4 = require(l_Parent_0.Src.Utility.setWorldPivot);
local v5 = require(l_Parent_0.Src.Utility.computeSnapPointsForInstance);
local v6 = require(l_Parent_0.Src.Components.SnapPoints);
local v7 = require(l_DraggerFramework_0.Components.DraggedPivot);
local v8 = require(l_Parent_0.Src.Utility.classifyInstancePivot);
local v9 = require(l_DraggerFramework_0.Utility.getSoftSnaps);
local v10 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13)
    return (setmetatable({
        _draggerContext = v12, 
        _analyticsName = v13
    }, v11));
end;
v11.getSoftSnaps = function(v14, v15, v16)
    if not v14._draggerContext:shouldSnapPivotToGeometry() then
        local v17 = v14._initialPivot * (v16 or CFrame.identity);
        local v18 = Vector3.one * 0.01;
        local v19 = v14._draggerContext:getMaxSoftSnaps();
        local v20 = {
            -1, 
            1
        };
        return v9(v17, v18, v15, {}, v20, v20, v19);
    else
        return {};
    end;
end;
v11._selectedIsActive = function(v21)
    if not v21._draggerContext:shouldShowActiveInstanceHighlight() then
        return false;
    else
        return v21._selection[#v21._selection] == v21._primaryObject;
    end;
end;
v11._setCurrentSnap = function(v22, v23)
    v22._snapPoints = v5(v23);
    v22._snapPointsAreFor = v23;
end;
v11.beginDrag = function(v24, v25, v26)
    v24._selection = v25;
    v24._initialPivot = v26:getBoundingBox();
    v24._primaryObject = v26:getPrimaryObject();
    v24:_setCurrentSnap(v24._primaryObject);
end;
local function v31(v27)
    for _, v29 in ipairs(v27) do
        local v30 = v3(v29, false, {});
        if v30 then
            return v30;
        end;
    end;
    return nil;
end;
v11._findNewSnapTargetImpl = function(v32, v33)
    local l_v33_TouchingParts_0 = v33:GetTouchingParts();
    if not v10() then
        for _, v36 in ipairs(l_v33_TouchingParts_0) do
            if v36:IsDescendantOf(v32._snapPointsAreFor) then
                return ;
            end;
        end;
    else
        for _, v38 in l_v33_TouchingParts_0, nil, nil do
            if not (v38 ~= v32._snapPointsAreFor and not v38:IsDescendantOf(v32._snapPointsAreFor)) then
                return ;
            end;
        end;
    end;
    if v10() then
        for _, v40 in l_v33_TouchingParts_0, nil, nil do
            if not (v40 ~= v32._primaryObject and not v40:IsDescendantOf(v32._primaryObject)) then
                v32:_setCurrentSnap(v32._primaryObject);
                return ;
            end;
        end;
    end;
    local v41 = v31(l_v33_TouchingParts_0);
    if v41 then
        v32:_setCurrentSnap(v41);
    end;
end;
v11._findNewSnapTargetViaCollision = function(v42, v43)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Size = Vector3.new(0.01, 0.01, 0.01);
    l_Part_0.Position = v43.Position;
    l_Part_0.Archivable = false;
    l_Part_0.Parent = workspace.Terrain;
    v42:_findNewSnapTargetImpl(l_Part_0);
    l_Part_0:Destroy();
end;
v11.updateDrag = function(v45, v46)
    if v45._primaryObject then
        local v47 = v46 * v45._initialPivot;
        v4(v45._primaryObject, v47);
        v45:_findNewSnapTargetViaCollision(v47);
    end;
    return v46;
end;
v11.endDrag = function(v48)
    if v48._primaryObject then
        v48._draggerContext:getAnalytics():sendEvent("setPivot", {
            gridSize = v48._draggerContext:getGridSize(), 
            rotateIncrement = v48._draggerContext:getRotateIncrement(), 
            toolName = v48._analyticsName, 
            handleId = "Move", 
            pivotType = v8(v48._primaryObject)
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
v11.render = function(v50, v51)
    local v52 = v51 * v50._initialPivot;
    local v53 = {
        DraggedPivot = v2.createElement(v7, {
            DraggerContext = v50._draggerContext, 
            CFrame = v52, 
            IsActive = v50:_selectedIsActive()
        })
    };
    if v50._draggerContext:shouldSnapPivotToGeometry() then
        v53.SnapPoints = v2.createElement(v6, {
            Focus = v52.Position, 
            SnapPoints = v50._snapPoints, 
            DraggerContext = v50._draggerContext
        });
    end;
    return v2.createFragment(v53);
end;
return v11;
