local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.TerrainEnums);
return (v1.createReducer({
    brushMode = v4.BrushMode.Add, 
    brushShape = v4.BrushShape.Sphere, 
    baseSize = v3.INITIAL_BRUSH_SIZE, 
    height = v3.INITIAL_BRUSH_SIZE, 
    baseSizeHeightLocked = true, 
    pivot = v4.PivotType.Center, 
    planeLock = v4.PlaneLockType.Auto, 
    editPlaneMode = false, 
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
    SetBrushMode = function(v13, v14)
        return v2.Dictionary.join(v13, {
            brushMode = v14.brushMode
        });
    end, 
    SetPlaneLock = function(v15, v16)
        return v2.Dictionary.join(v15, {
            planeLock = v16.planeLock
        });
    end, 
    SetEditPlaneMode = function(v17, v18)
        return v2.Dictionary.join(v17, {
            editPlaneMode = v18.editPlaneMode
        });
    end, 
    SetPlaneCFrame = function(v19, v20)
        return v2.Dictionary.join(v19, {
            planeCFrame = v20.planeCFrame
        });
    end, 
    SetSnapToVoxels = function(v21, v22)
        return v2.Dictionary.join(v21, {
            snapToVoxels = v22.snapToVoxels
        });
    end, 
    SetAutoMaterial = function(v23, v24)
        return v2.Dictionary.join(v23, {
            autoMaterial = v24.autoMaterial
        });
    end, 
    SetIgnoreWater = function(v25, v26)
        return v2.Dictionary.join(v25, {
            ignoreWater = v26.ignoreWater
        });
    end, 
    SetIgnoreParts = function(v27, v28)
        return v2.Dictionary.join(v27, {
            ignoreParts = v28.ignoreParts
        });
    end, 
    SetMaterial = function(v29, v30)
        return v2.Dictionary.join(v29, {
            material = v30.material
        });
    end, 
    SetBaseSizeHeightLocked = function(v31, v32)
        return v2.Dictionary.join(v31, {
            baseSizeHeightLocked = v32.locked
        });
    end
}));
