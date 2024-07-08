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
    strength = v3.INITIAL_BRUSH_STRENGTH, 
    flattenMode = v4.FlattenMode.Both, 
    planePositionY = v3.INITIAL_PLANE_POSITION_Y, 
    fixedPlane = false, 
    heightPicker = false, 
    snapToVoxels = false, 
    ignoreWater = true, 
    ignoreParts = true
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
    ChangeStrength = function(v11, v12)
        return v2.Dictionary.join(v11, {
            strength = v12.strength
        });
    end, 
    ChangePivot = function(v13, v14)
        return v2.Dictionary.join(v13, {
            pivot = v14.pivot
        });
    end, 
    ChooseFlattenMode = function(v15, v16)
        return v2.Dictionary.join(v15, {
            flattenMode = v16.flattenMode
        });
    end, 
    SetFixedPlane = function(v17, v18)
        return v2.Dictionary.join(v17, {
            fixedPlane = v18.fixedPlane
        });
    end, 
    ChangePlanePositionY = function(v19, v20)
        return v2.Dictionary.join(v19, {
            planePositionY = v20.planePositionY
        });
    end, 
    SetHeightPicker = function(v21, v22)
        return v2.Dictionary.join(v21, {
            heightPicker = v22.heightPicker
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
    SetBaseSizeHeightLocked = function(v29, v30)
        return v2.Dictionary.join(v29, {
            baseSizeHeightLocked = v30.locked
        });
    end
}));
