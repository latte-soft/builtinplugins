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
    strength = v3.INITIAL_BRUSH_STRENGTH, 
    pivot = v4.PivotType.Center, 
    planeLock = v4.PlaneLockType.Off, 
    editPlaneMode = false, 
    snapToVoxels = false, 
    ignoreWater = true, 
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
    ChangeStrength = function(v13, v14)
        return v2.Dictionary.join(v13, {
            strength = v14.strength
        });
    end, 
    SetBrushMode = function(v15, v16)
        return v2.Dictionary.join(v15, {
            brushMode = v16.brushMode
        });
    end, 
    SetPlaneLock = function(v17, v18)
        return v2.Dictionary.join(v17, {
            planeLock = v18.planeLock
        });
    end, 
    SetEditPlaneMode = function(v19, v20)
        return v2.Dictionary.join(v19, {
            editPlaneMode = v20.editPlaneMode
        });
    end, 
    SetPlaneCFrame = function(v21, v22)
        return v2.Dictionary.join(v21, {
            planeCFrame = v22.planeCFrame
        });
    end, 
    SetSnapToVoxels = function(v23, v24)
        return v2.Dictionary.join(v23, {
            snapToVoxels = v24.snapToVoxels
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
    SetAutoMaterial = function(v29, v30)
        return v2.Dictionary.join(v29, {
            autoMaterial = v30.autoMaterial
        });
    end, 
    SetMaterial = function(v31, v32)
        return v2.Dictionary.join(v31, {
            material = v32.material
        });
    end, 
    SetBaseSizeHeightLocked = function(v33, v34)
        return v2.Dictionary.join(v33, {
            baseSizeHeightLocked = v34.locked
        });
    end
}));
