local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Src.Components.Tools.BaseBrush);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.ApplyToolAction);
local v5 = require(l_Actions_0.ChangeBaseSize);
local v6 = require(l_Actions_0.ChangeHeight);
local v7 = require(l_Actions_0.ChangePivot);
local v8 = require(l_Actions_0.ChangeStrength);
local v9 = require(l_Actions_0.ChooseBrushShape);
local v10 = require(l_Actions_0.SetAutoMaterial);
local v11 = require(l_Actions_0.SetBaseSizeHeightLocked);
local v12 = require(l_Actions_0.SetBrushMode);
local v13 = require(l_Actions_0.SetEditPlaneMode);
local v14 = require(l_Actions_0.SetIgnoreWater);
local v15 = require(l_Actions_0.SetIgnoreParts);
local v16 = require(l_Actions_0.SetMaterial);
local v17 = require(l_Actions_0.SetPlaneCFrame);
local v18 = require(l_Actions_0.SetPlaneLock);
local v19 = require(l_Actions_0.SetSnapToVoxels);
local v20 = require(l_Parent_0.Src.Util.TerrainEnums);
return v1.connect(function(v21, _)
    return {
        toolName = v20.ToolId.Sculpt, 
        autoMaterial = v21.SculptTool.autoMaterial, 
        baseSize = v21.SculptTool.baseSize, 
        baseSizeHeightLocked = v21.SculptTool.baseSizeHeightLocked, 
        brushMode = v21.SculptTool.brushMode, 
        brushShape = v21.SculptTool.brushShape, 
        height = v21.SculptTool.height, 
        ignoreWater = v21.SculptTool.ignoreWater, 
        ignoreParts = v21.SculptTool.ignoreParts, 
        material = v21.SculptTool.material, 
        pivot = v21.SculptTool.pivot, 
        planeLock = v21.BaseTool.planeLock, 
        snapToVoxels = v21.SculptTool.snapToVoxels, 
        strength = v21.SculptTool.strength, 
        editPlaneMode = v21.BaseTool.editPlaneMode, 
        planeCFrame = v21.BaseTool.planeCFrame
    };
end, function(v23)
    local function _(v24)
        v23(v4("SculptTool", v24));
    end;
    local function _(v26)
        v23(v4("BaseTool", v26));
    end;
    return {
        dispatchSetAutoMaterial = function(v28)
            v23(v4("SculptTool", (v10(v28))));
        end, 
        dispatchChangeBaseSize = function(v29)
            v23(v4("SculptTool", (v5(v29))));
        end, 
        dispatchChangeHeight = function(v30)
            v23(v4("SculptTool", (v6(v30))));
        end, 
        dispatchChangePivot = function(v31)
            v23(v4("SculptTool", (v7(v31))));
        end, 
        dispatchChangeStrength = function(v32)
            v23(v4("SculptTool", (v8(v32))));
        end, 
        dispatchChooseBrushShape = function(v33)
            v23(v4("SculptTool", (v9(v33))));
        end, 
        dispatchSetBrushMode = function(v34)
            v23(v4("SculptTool", (v12(v34))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v35)
            v23(v4("SculptTool", (v11(v35))));
        end, 
        dispatchSetIgnoreWater = function(v36)
            v23(v4("SculptTool", (v14(v36))));
        end, 
        dispatchSetIgnoreParts = function(v37)
            v23(v4("SculptTool", (v15(v37))));
        end, 
        dispatchSetMaterial = function(v38)
            v23(v4("SculptTool", (v16(v38))));
        end, 
        dispatchSetPlaneLock = function(v39)
            v23(v4("BaseTool", (v18(v39))));
        end, 
        dispatchSetEditPlaneMode = function(v40)
            v23(v4("BaseTool", (v13(v40))));
        end, 
        dispatchSetPlaneCFrame = function(v41)
            v23(v4("BaseTool", (v17(v41))));
        end, 
        dispatchSetSnapToVoxels = function(v42)
            v23(v4("SculptTool", (v19(v42))));
        end
    };
end)(v2);
