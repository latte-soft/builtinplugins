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
local v10 = require(l_Actions_0.SetBaseSizeHeightLocked);
local v11 = require(l_Actions_0.SetEditPlaneMode);
local v12 = require(l_Actions_0.SetIgnoreWater);
local v13 = require(l_Actions_0.SetIgnoreParts);
local v14 = require(l_Actions_0.SetPlaneCFrame);
local v15 = require(l_Actions_0.SetPlaneLock);
local v16 = require(l_Actions_0.SetSnapToVoxels);
local v17 = require(l_Parent_0.Src.Util.TerrainEnums);
return v1.connect(function(v18, _)
    return {
        toolName = v17.ToolId.Smooth, 
        baseSize = v18.SmoothTool.baseSize, 
        baseSizeHeightLocked = v18.SmoothTool.baseSizeHeightLocked, 
        brushShape = v18.SmoothTool.brushShape, 
        height = v18.SmoothTool.height, 
        ignoreWater = v18.SmoothTool.ignoreWater, 
        ignoreParts = v18.SmoothTool.ignoreParts, 
        pivot = v18.SmoothTool.pivot, 
        planeLock = v18.BaseTool.planeLock, 
        snapToVoxels = v18.SmoothTool.snapToVoxels, 
        strength = v18.SmoothTool.strength, 
        editPlaneMode = v18.BaseTool.editPlaneMode, 
        planeCFrame = v18.BaseTool.planeCFrame
    };
end, function(v20)
    local function _(v21)
        v20(v4("SmoothTool", v21));
    end;
    local function _(v23)
        v20(v4("BaseTool", v23));
    end;
    return {
        dispatchChangeBaseSize = function(v25)
            v20(v4("SmoothTool", (v5(v25))));
        end, 
        dispatchChangeHeight = function(v26)
            v20(v4("SmoothTool", (v6(v26))));
        end, 
        dispatchChangePivot = function(v27)
            v20(v4("SmoothTool", (v7(v27))));
        end, 
        dispatchChangeStrength = function(v28)
            v20(v4("SmoothTool", (v8(v28))));
        end, 
        dispatchChooseBrushShape = function(v29)
            v20(v4("SmoothTool", (v9(v29))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v30)
            v20(v4("SmoothTool", (v10(v30))));
        end, 
        dispatchSetIgnoreWater = function(v31)
            v20(v4("SmoothTool", (v12(v31))));
        end, 
        dispatchSetIgnoreParts = function(v32)
            v20(v4("SmoothTool", (v13(v32))));
        end, 
        dispatchSetPlaneLock = function(v33)
            v20(v4("BaseTool", (v15(v33))));
        end, 
        dispatchSetEditPlaneMode = function(v34)
            v20(v4("BaseTool", (v11(v34))));
        end, 
        dispatchSetPlaneCFrame = function(v35)
            v20(v4("BaseTool", (v14(v35))));
        end, 
        dispatchSetSnapToVoxels = function(v36)
            v20(v4("SmoothTool", (v16(v36))));
        end
    };
end)(v2);
