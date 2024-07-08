local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_ReplaceMode_0 = v4.ReplaceMode;
local l_BrushShape_0 = v4.BrushShape;
local l_PivotType_0 = v4.PivotType;
local l_PlaneLockType_0 = v4.PlaneLockType;
local _ = l_PlaneLockType_0.Off;
return (v1.createReducer({
    position = {
        X = 0, 
        Y = 0, 
        Z = 0
    }, 
    size = {
        X = 1024, 
        Y = 512, 
        Z = 1024
    }, 
    SourceMaterial = Enum.Material.Brick, 
    TargetMaterial = Enum.Material.CrackedLava, 
    ReplaceMode = l_ReplaceMode_0.Box, 
    brushShape = l_BrushShape_0.Sphere, 
    baseSize = v3.INITIAL_BRUSH_SIZE, 
    height = v3.INITIAL_BRUSH_SIZE, 
    baseSizeHeightLocked = true, 
    pivot = l_PivotType_0.Center, 
    planeLock = l_PlaneLockType_0.Off, 
    editPlaneMode = false, 
    snapToVoxels = false, 
    ignoreWater = true, 
    ignoreParts = true
}, {
    ChangePosition = function(v10, v11)
        return v2.Dictionary.join(v10, {
            position = v11.position
        });
    end, 
    ChangeSize = function(v12, v13)
        return v2.Dictionary.join(v12, {
            size = v13.size
        });
    end, 
    SetSourceMaterial = function(v14, v15)
        return v2.Dictionary.join(v14, {
            SourceMaterial = v15.SourceMaterial
        });
    end, 
    SetTargetMaterial = function(v16, v17)
        return v2.Dictionary.join(v16, {
            TargetMaterial = v17.TargetMaterial
        });
    end, 
    SetReplaceMode = function(v18, v19)
        return v2.Dictionary.join(v18, {
            ReplaceMode = v19.ReplaceMode
        });
    end, 
    ChooseBrushShape = function(v20, v21)
        return v2.Dictionary.join(v20, {
            brushShape = v21.brushShape
        });
    end, 
    ChangeBaseSize = function(v22, v23)
        return v2.Dictionary.join(v22, {
            baseSize = v23.baseSize
        });
    end, 
    ChangeHeight = function(v24, v25)
        return v2.Dictionary.join(v24, {
            height = v25.height
        });
    end, 
    ChangePivot = function(v26, v27)
        return v2.Dictionary.join(v26, {
            pivot = v27.pivot
        });
    end, 
    SetPlaneLock = function(v28, v29)
        return v2.Dictionary.join(v28, {
            planeLock = v29.planeLock
        });
    end, 
    SetPlaneCFrame = function(v30, v31)
        return v2.Dictionary.join(v30, {
            planeCFrame = v31.planeCFrame
        });
    end, 
    SetEditPlaneMode = function(v32, v33)
        return v2.Dictionary.join(v32, {
            editPlaneMode = v33.editPlaneMode
        });
    end, 
    SetSnapToVoxels = function(v34, v35)
        return v2.Dictionary.join(v34, {
            snapToVoxels = v35.snapToVoxels
        });
    end, 
    SetIgnoreWater = function(v36, v37)
        return v2.Dictionary.join(v36, {
            ignoreWater = v37.ignoreWater
        });
    end, 
    SetIgnoreParts = function(v38, v39)
        return v2.Dictionary.join(v38, {
            ignoreParts = v39.ignoreParts
        });
    end, 
    SetBaseSizeHeightLocked = function(v40, v41)
        return v2.Dictionary.join(v40, {
            baseSizeHeightLocked = v41.locked
        });
    end
}));
