local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushShape_0 = v4.BrushShape;
local l_PivotType_0 = v4.PivotType;
local l_PlaneLockType_0 = v4.PlaneLockType;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
return (v1.createReducer({
    brushShape = l_BrushShape_0.Sphere, 
    baseSize = v3.INITIAL_BRUSH_SIZE, 
    height = v3.INITIAL_BRUSH_SIZE, 
    baseSizeHeightLocked = true, 
    pivot = l_PivotType_0.Center, 
    planeLock = l_PlaneLockType_0.Off, 
    editPlaneMode = false, 
    snapToVoxels = false, 
    ignoreWater = true, 
    ignoreParts = true, 
    material = Enum.Material.Grass, 
    replaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else false, 
    sourceMaterial = if not l_TerrainEditorOverhaul_0 then nil else Enum.Material.Grass, 
    targetMaterial = if not l_TerrainEditorOverhaul_0 then nil else Enum.Material.Grass
}, {
    ChooseBrushShape = function(v9, v10)
        return v2.Dictionary.join(v9, {
            brushShape = v10.brushShape
        });
    end, 
    ChangeBaseSize = function(v11, v12)
        return v2.Dictionary.join(v11, {
            baseSize = v12.baseSize
        });
    end, 
    ChangeHeight = function(v13, v14)
        return v2.Dictionary.join(v13, {
            height = v14.height
        });
    end, 
    ChangePivot = function(v15, v16)
        return v2.Dictionary.join(v15, {
            pivot = v16.pivot
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
    SetMaterial = function(v29, v30)
        return v2.Dictionary.join(v29, {
            material = v30.material
        });
    end, 
    SetReplaceMaterial = function(v31, v32)
        return v2.Dictionary.join(v31, {
            replaceMaterial = v32.replaceMaterial
        });
    end, 
    SetSourceMaterial = function(v33, v34)
        return v2.Dictionary.join(v33, {
            sourceMaterial = v34.SourceMaterial
        });
    end, 
    SetTargetMaterial = function(v35, v36)
        return v2.Dictionary.join(v35, {
            targetMaterial = v36.TargetMaterial
        });
    end, 
    SetBaseSizeHeightLocked = function(v37, v38)
        return v2.Dictionary.join(v37, {
            baseSizeHeightLocked = v38.locked
        });
    end
}));
