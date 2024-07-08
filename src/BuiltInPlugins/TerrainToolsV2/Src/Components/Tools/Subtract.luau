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
local v13 = require(l_Actions_0.SetPlaneCFrame);
local v14 = require(l_Actions_0.SetPlaneLock);
local v15 = require(l_Actions_0.SetSnapToVoxels);
local v16 = require(l_Parent_0.Src.Util.TerrainEnums);
return v1.connect(function(v17, _)
    return {
        toolName = v16.ToolId.Subtract, 
        baseSize = v17.SubtractTool.baseSize, 
        baseSizeHeightLocked = v17.SubtractTool.baseSizeHeightLocked, 
        brushShape = v17.SubtractTool.brushShape, 
        height = v17.SubtractTool.height, 
        ignoreWater = v17.SubtractTool.ignoreWater, 
        ignoreParts = v17.SubtractTool.ignoreParts, 
        pivot = v17.SubtractTool.pivot, 
        planeLock = v17.BaseTool.planeLock, 
        snapToVoxels = v17.SubtractTool.snapToVoxels, 
        editPlaneMode = v17.BaseTool.editPlaneMode, 
        planeCFrame = v17.BaseTool.planeCFrame
    };
end, function(v19)
    local function _(v20)
        v19(v4("SubtractTool", v20));
    end;
    local function _(v22)
        v19(v4("BaseTool", v22));
    end;
    return {
        dispatchChangeBaseSize = function(v24)
            v19(v4("SubtractTool", (v5(v24))));
        end, 
        dispatchChangeHeight = function(v25)
            v19(v4("SubtractTool", (v6(v25))));
        end, 
        dispatchChangePivot = function(v26)
            v19(v4("SubtractTool", (v7(v26))));
        end, 
        dispatchChooseBrushShape = function(v27)
            v19(v4("SubtractTool", (v8(v27))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v28)
            v19(v4("SubtractTool", (v9(v28))));
        end, 
        dispatchSetIgnoreWater = function(v29)
            v19(v4("SubtractTool", (v11(v29))));
        end, 
        dispatchSetIgnoreParts = function(v30)
            v19(v4("SubtractTool", (v12(v30))));
        end, 
        dispatchSetPlaneLock = function(v31)
            v19(v4("BaseTool", (v14(v31))));
        end, 
        dispatchSetEditPlaneMode = function(v32)
            v19(v4("BaseTool", (v10(v32))));
        end, 
        dispatchSetPlaneCFrame = function(v33)
            v19(v4("BaseTool", (v13(v33))));
        end, 
        dispatchSetSnapToVoxels = function(v34)
            v19(v4("SubtractTool", (v15(v34))));
        end
    };
end)(v2);
