local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Src.Components.Tools.BaseBrush);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.ApplyToolAction);
local v5 = require(l_Actions_0.ChangeBaseSize);
local v6 = require(l_Actions_0.ChangeHeight);
local v7 = require(l_Actions_0.ChangePivot);
local v8 = require(l_Actions_0.ChangePlanePositionY);
local v9 = require(l_Actions_0.ChangeStrength);
local v10 = require(l_Actions_0.ChooseBrushShape);
local v11 = require(l_Actions_0.ChooseFlattenMode);
local v12 = require(l_Actions_0.SetBaseSizeHeightLocked);
local v13 = require(l_Actions_0.SetFixedPlane);
local v14 = require(l_Actions_0.SetHeightPicker);
local v15 = require(l_Actions_0.SetIgnoreWater);
local v16 = require(l_Actions_0.SetIgnoreParts);
local v17 = require(l_Actions_0.SetSnapToVoxels);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
return v1.connect(function(v19, _)
    return {
        toolName = l_ToolId_0.Flatten, 
        baseSize = v19.FlattenTool.baseSize, 
        baseSizeHeightLocked = v19.FlattenTool.baseSizeHeightLocked, 
        brushShape = v19.FlattenTool.brushShape, 
        fixedPlane = v19.FlattenTool.fixedPlane, 
        flattenMode = v19.FlattenTool.flattenMode, 
        height = v19.FlattenTool.height, 
        heightPicker = v19.FlattenTool.heightPicker, 
        ignoreWater = v19.FlattenTool.ignoreWater, 
        ignoreParts = v19.FlattenTool.ignoreParts, 
        pivot = v19.FlattenTool.pivot, 
        planePositionY = v19.FlattenTool.planePositionY, 
        snapToVoxels = v19.FlattenTool.snapToVoxels, 
        strength = v19.FlattenTool.strength
    };
end, function(v21)
    local function _(v22)
        v21(v4("FlattenTool", v22));
    end;
    return {
        dispatchChangeBaseSize = function(v24)
            v21(v4("FlattenTool", (v5(v24))));
        end, 
        dispatchChangeHeight = function(v25)
            v21(v4("FlattenTool", (v6(v25))));
        end, 
        dispatchChangePivot = function(v26)
            v21(v4("FlattenTool", (v7(v26))));
        end, 
        dispatchChangePlanePositionY = function(v27)
            v21(v4("FlattenTool", (v8(v27))));
        end, 
        dispatchChangeStrength = function(v28)
            v21(v4("FlattenTool", (v9(v28))));
        end, 
        dispatchChooseBrushShape = function(v29)
            v21(v4("FlattenTool", (v10(v29))));
        end, 
        dispatchChooseFlattenMode = function(v30)
            v21(v4("FlattenTool", (v11(v30))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v31)
            v21(v4("FlattenTool", (v12(v31))));
        end, 
        dispatchSetFixedPlane = function(v32)
            v21(v4("FlattenTool", (v13(v32))));
        end, 
        dispatchSetHeightPicker = function(v33)
            v21(v4("FlattenTool", (v14(v33))));
        end, 
        dispatchSetIgnoreWater = function(v34)
            v21(v4("FlattenTool", (v15(v34))));
        end, 
        dispatchSetIgnoreParts = function(v35)
            v21(v4("FlattenTool", (v16(v35))));
        end, 
        dispatchSetSnapToVoxels = function(v36)
            v21(v4("FlattenTool", (v17(v36))));
        end
    };
end)(v2);
