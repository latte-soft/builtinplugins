local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.TerrainEnums);
return (v1.createReducer({
    autoMaterial = false, 
    baseSize = v3.INITIAL_BRUSH_SIZE, 
    baseSizeHeightLocked = true, 
    brushShape = v4.BrushShape.Sphere, 
    editPlaneMode = false, 
    fixedPlane = false, 
    flattenMode = v4.FlattenMode.Both, 
    height = v3.INITIAL_BRUSH_SIZE, 
    heightPicker = false, 
    ignoreParts = true, 
    ignoreWater = false, 
    material = Enum.Material.Grass, 
    pivot = v4.PivotType.Center, 
    planeCFrame = nil, 
    planeLock = v4.PlaneLockType.Off, 
    planePositionY = v3.INITIAL_PLANE_POSITION_Y, 
    planeLockActive = true, 
    position = {
        X = 0, 
        Y = 0, 
        Z = 0
    }, 
    ReplaceMode = v4.ReplaceMode.Box, 
    size = {
        X = 1024, 
        Y = 512, 
        Z = 1024
    }, 
    snapToVoxels = false, 
    strength = v3.INITIAL_BRUSH_STRENGTH, 
    SourceMaterial = Enum.Material.Brick, 
    TargetMaterial = Enum.Material.CrackedLava
}, {
    ChangeBaseSize = function(v5, v6)
        return v2.Dictionary.join(v5, {
            baseSize = v6.baseSize
        });
    end, 
    ChangeHeight = function(v7, v8)
        return v2.Dictionary.join(v7, {
            height = v8.height
        });
    end, 
    ChangePivot = function(v9, v10)
        return v2.Dictionary.join(v9, {
            pivot = v10.pivot
        });
    end, 
    ChangePlanePositionY = function(v11, v12)
        return v2.Dictionary.join(v11, {
            planePositionY = v12.planePositionY
        });
    end, 
    ChangePosition = function(v13, v14)
        return v2.Dictionary.join(v13, {
            position = v14.position
        });
    end, 
    ChangeSize = function(v15, v16)
        return v2.Dictionary.join(v15, {
            size = v16.size
        });
    end, 
    ChangeStrength = function(v17, v18)
        return v2.Dictionary.join(v17, {
            strength = v18.strength
        });
    end, 
    ChooseBrushShape = function(v19, v20)
        return v2.Dictionary.join(v19, {
            brushShape = v20.brushShape
        });
    end, 
    ChooseFlattenMode = function(v21, v22)
        return v2.Dictionary.join(v21, {
            flattenMode = v22.flattenMode
        });
    end, 
    SetAutoMaterial = function(v23, v24)
        return v2.Dictionary.join(v23, {
            autoMaterial = v24.autoMaterial
        });
    end, 
    SetBaseSizeHeightLocked = function(v25, v26)
        return v2.Dictionary.join(v25, {
            baseSizeHeightLocked = v26.locked
        });
    end, 
    SetEditPlaneMode = function(v27, v28)
        return v2.Dictionary.join(v27, {
            editPlaneMode = v28.editPlaneMode
        });
    end, 
    SetFixedPlane = function(v29, v30)
        return v2.Dictionary.join(v29, {
            fixedPlane = v30.fixedPlane
        });
    end, 
    SetHeightPicker = function(v31, v32)
        return v2.Dictionary.join(v31, {
            heightPicker = v32.heightPicker
        });
    end, 
    SetIgnoreParts = function(v33, v34)
        return v2.Dictionary.join(v33, {
            ignoreParts = v34.ignoreParts
        });
    end, 
    SetIgnoreWater = function(v35, v36)
        return v2.Dictionary.join(v35, {
            ignoreWater = v36.ignoreWater
        });
    end, 
    SetMaterial = function(v37, v38)
        return v2.Dictionary.join(v37, {
            material = v38.material
        });
    end, 
    SetPlaneCFrame = function(v39, v40)
        return v2.Dictionary.join(v39, {
            planeCFrame = v40.planeCFrame
        });
    end, 
    SetPlaneLock = function(v41, v42)
        return v2.Dictionary.join(v41, {
            planeLock = v42.planeLock
        });
    end, 
    SetPlaneLockActive = function(v43, v44)
        return v2.Dictionary.join(v43, {
            planeLockActive = v44.planeLockActive
        });
    end, 
    SetReplaceMode = function(v45, v46)
        return v2.Dictionary.join(v45, {
            ReplaceMode = v46.ReplaceMode
        });
    end, 
    SetSnapToVoxels = function(v47, v48)
        return v2.Dictionary.join(v47, {
            snapToVoxels = v48.snapToVoxels
        });
    end, 
    SetSourceMaterial = function(v49, v50)
        return v2.Dictionary.join(v49, {
            SourceMaterial = v50.SourceMaterial
        });
    end, 
    SetTargetMaterial = function(v51, v52)
        return v2.Dictionary.join(v51, {
            TargetMaterial = v52.TargetMaterial
        });
    end
}));
