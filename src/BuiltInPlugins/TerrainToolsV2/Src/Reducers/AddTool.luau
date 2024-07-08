local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.TerrainEnums);
return (v1.createReducer({
    brushShape = v4.BrushShape.Sphere, 
    baseSize = v3.INITIAL_BRUSH_SIZE, 
    height = v3.INITIAL_BRUSH_SIZE, 
    baseSizeHeightLocked = true, 
    pivot = v4.PivotType.Center, 
    planeLock = v4.PlaneLockType.Auto, 
    editPlaneMode = false, 
    planeCFrame = nil, 
    snapToVoxels = false, 
    ignoreWater = false, 
    ignoreParts = true, 
    autoMaterial = false, 
    material = Enum.Material.Grass
}, {
    ChooseBrushShape = function(v5, v6)
        return v2.Dictionary.join(v5, {
            brushShape = v6.brushShape
        });
    end, 
    ChangeBaseSize = function(v7, v8)
        return v2.Dictionary.join(v7, {
            baseSize = v8.baseSize
        });
    end, 
    ChangeHeight = function(v9, v10)
        return v2.Dictionary.join(v9, {
            height = v10.height
        });
    end, 
    ChangePivot = function(v11, v12)
        return v2.Dictionary.join(v11, {
            pivot = v12.pivot
        });
    end, 
    SetPlaneLock = function(v13, v14)
        return v2.Dictionary.join(v13, {
            planeLock = v14.planeLock
        });
    end, 
    SetEditPlaneMode = function(v15, v16)
        return v2.Dictionary.join(v15, {
            editPlaneMode = v16.editPlaneMode
        });
    end, 
    SetPlaneCFrame = function(v17, v18)
        return v2.Dictionary.join(v17, {
            planeCFrame = v18.planeCFrame
        });
    end, 
    SetSnapToVoxels = function(v19, v20)
        return v2.Dictionary.join(v19, {
            snapToVoxels = v20.snapToVoxels
        });
    end, 
    SetAutoMaterial = function(v21, v22)
        return v2.Dictionary.join(v21, {
            autoMaterial = v22.autoMaterial
        });
    end, 
    SetIgnoreWater = function(v23, v24)
        return v2.Dictionary.join(v23, {
            ignoreWater = v24.ignoreWater
        });
    end, 
    SetIgnoreParts = function(v25, v26)
        return v2.Dictionary.join(v25, {
            ignoreParts = v26.ignoreParts
        });
    end, 
    SetMaterial = function(v27, v28)
        return v2.Dictionary.join(v27, {
            material = v28.material
        });
    end, 
    SetBaseSizeHeightLocked = function(v29, v30)
        return v2.Dictionary.join(v29, {
            baseSizeHeightLocked = v30.locked
        });
    end
}));
