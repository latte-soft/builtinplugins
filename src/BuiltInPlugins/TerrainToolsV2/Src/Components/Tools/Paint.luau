local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Src.Components.Tools.BaseBrush);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.ApplyToolAction);
local v5 = require(l_Actions_0.ChangeBaseSize);
local v6 = require(l_Actions_0.ChangeHeight);
local v7 = require(l_Actions_0.ChangePivot);
local v8 = require(l_Actions_0.ChooseBrushShape);
local v9 = require(l_Actions_0.SetBaseSizeHeightLocked);
local v10 = require(l_Actions_0.SetEditPlaneMode);
local v11 = require(l_Actions_0.SetIgnoreWater);
local v12 = require(l_Actions_0.SetIgnoreParts);
local v13 = require(l_Actions_0.SetMaterial);
local v14 = require(l_Actions_0.SetReplaceMaterial);
local v15 = require(l_Actions_0.SetSourceMaterial);
local v16 = require(l_Actions_0.SetTargetMaterial);
local v17 = require(l_Actions_0.SetPlaneCFrame);
local v18 = require(l_Actions_0.SetPlaneLock);
local v19 = require(l_Actions_0.SetSnapToVoxels);
local v20 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
return v1.connect(function(v22, _)
    return {
        toolName = v20.ToolId.Paint, 
        allowAir = true, 
        baseSize = v22.PaintTool.baseSize, 
        baseSizeHeightLocked = v22.PaintTool.baseSizeHeightLocked, 
        brushShape = v22.PaintTool.brushShape, 
        height = v22.PaintTool.height, 
        ignoreWater = v22.PaintTool.ignoreWater, 
        ignoreParts = v22.PaintTool.ignoreParts, 
        material = v22.PaintTool.material, 
        replaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else v22.PaintTool.replaceMaterial, 
        source = if not l_TerrainEditorOverhaul_0 then nil else v22.PaintTool.sourceMaterial, 
        target = if not l_TerrainEditorOverhaul_0 then nil else v22.PaintTool.targetMaterial, 
        pivot = v22.PaintTool.pivot, 
        planeLock = v22.BaseTool.planeLock, 
        snapToVoxels = v22.PaintTool.snapToVoxels, 
        editPlaneMode = v22.BaseTool.editPlaneMode, 
        planeCFrame = v22.BaseTool.planeCFrame
    };
end, function(v24)
    local function _(v25)
        v24(v4("PaintTool", v25));
    end;
    local function _(v27)
        v24(v4("BaseTool", v27));
    end;
    return {
        dispatchChangeBaseSize = function(v29)
            v24(v4("PaintTool", (v5(v29))));
        end, 
        dispatchChangeHeight = function(v30)
            v24(v4("PaintTool", (v6(v30))));
        end, 
        dispatchChangePivot = function(v31)
            v24(v4("PaintTool", (v7(v31))));
        end, 
        dispatchChooseBrushShape = function(v32)
            v24(v4("PaintTool", (v8(v32))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v33)
            v24(v4("PaintTool", (v9(v33))));
        end, 
        dispatchSetIgnoreWater = function(v34)
            v24(v4("PaintTool", (v11(v34))));
        end, 
        dispatchSetIgnoreParts = function(v35)
            v24(v4("PaintTool", (v12(v35))));
        end, 
        dispatchSetMaterial = function(v36)
            v24(v4("PaintTool", (v13(v36))));
        end, 
        dispatchSetReplaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else function(v37)
            v24(v4("PaintTool", (v14(v37))));
        end, 
        dispatchSetSourceMaterial = if not l_TerrainEditorOverhaul_0 then nil else function(v38)
            v24(v4("PaintTool", (v15(v38))));
        end, 
        dispatchSetTargetMaterial = if not l_TerrainEditorOverhaul_0 then nil else function(v39)
            v24(v4("PaintTool", (v16(v39))));
        end, 
        dispatchSetPlaneLock = function(v40)
            v24(v4("BaseTool", (v18(v40))));
        end, 
        dispatchSetEditPlaneMode = function(v41)
            v24(v4("BaseTool", (v10(v41))));
        end, 
        dispatchSetPlaneCFrame = function(v42)
            v24(v4("BaseTool", (v17(v42))));
        end, 
        dispatchSetSnapToVoxels = function(v43)
            v24(v4("PaintTool", (v19(v43))));
        end
    };
end)(v2);
