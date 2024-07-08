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
        toolName = v17.ToolId.Erode, 
        baseSize = v18.ErodeTool.baseSize, 
        baseSizeHeightLocked = v18.ErodeTool.baseSizeHeightLocked, 
        brushShape = v18.ErodeTool.brushShape, 
        height = v18.ErodeTool.height, 
        ignoreWater = v18.ErodeTool.ignoreWater, 
        ignoreParts = v18.ErodeTool.ignoreParts, 
        pivot = v18.ErodeTool.pivot, 
        planeLock = v18.BaseTool.planeLock, 
        snapToVoxels = v18.ErodeTool.snapToVoxels, 
        strength = v18.ErodeTool.strength, 
        editPlaneMode = v18.BaseTool.editPlaneMode, 
        planeCFrame = v18.BaseTool.planeCFrame
    };
end, function(v20)
    local function _(v21)
        v20(v4("ErodeTool", v21));
    end;
    local function _(v23)
        v20(v4("BaseTool", v23));
    end;
    return {
        dispatchChangeBaseSize = function(v25)
            v20(v4("ErodeTool", (v5(v25))));
        end, 
        dispatchChangeHeight = function(v26)
            v20(v4("ErodeTool", (v6(v26))));
        end, 
        dispatchChangePivot = function(v27)
            v20(v4("ErodeTool", (v7(v27))));
        end, 
        dispatchChangeStrength = function(v28)
            v20(v4("ErodeTool", (v8(v28))));
        end, 
        dispatchChooseBrushShape = function(v29)
            v20(v4("ErodeTool", (v9(v29))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v30)
            v20(v4("ErodeTool", (v10(v30))));
        end, 
        dispatchSetIgnoreWater = function(v31)
            v20(v4("ErodeTool", (v12(v31))));
        end, 
        dispatchSetIgnoreParts = function(v32)
            v20(v4("ErodeTool", (v13(v32))));
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
            v20(v4("ErodeTool", (v16(v36))));
        end
    };
end)(v2);
