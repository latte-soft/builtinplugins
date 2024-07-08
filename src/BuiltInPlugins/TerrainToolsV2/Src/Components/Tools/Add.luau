local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Src.Components.Tools.BaseBrush);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.ApplyToolAction);
local v5 = require(l_Actions_0.ChangeBaseSize);
local v6 = require(l_Actions_0.ChangeHeight);
local v7 = require(l_Actions_0.ChangePivot);
local v8 = require(l_Actions_0.ChooseBrushShape);
local v9 = require(l_Actions_0.SetAutoMaterial);
local v10 = require(l_Actions_0.SetBaseSizeHeightLocked);
local v11 = require(l_Actions_0.SetEditPlaneMode);
local v12 = require(l_Actions_0.SetIgnoreWater);
local v13 = require(l_Actions_0.SetIgnoreParts);
local v14 = require(l_Actions_0.SetMaterial);
local v15 = require(l_Actions_0.SetPlaneCFrame);
local v16 = require(l_Actions_0.SetPlaneLock);
local v17 = require(l_Actions_0.SetSnapToVoxels);
local v18 = require(l_Parent_0.Src.Util.TerrainEnums);
return v1.connect(function(v19, _)
    return {
        toolName = v18.ToolId.Add, 
        autoMaterial = v19.AddTool.autoMaterial, 
        baseSize = v19.AddTool.baseSize, 
        baseSizeHeightLocked = v19.AddTool.baseSizeHeightLocked, 
        brushShape = v19.AddTool.brushShape, 
        height = v19.AddTool.height, 
        ignoreWater = v19.AddTool.ignoreWater, 
        ignoreParts = v19.AddTool.ignoreParts, 
        material = v19.AddTool.material, 
        pivot = v19.AddTool.pivot, 
        planeLock = v19.BaseTool.planeLock, 
        snapToVoxels = v19.AddTool.snapToVoxels, 
        editPlaneMode = v19.BaseTool.editPlaneMode, 
        planeCFrame = v19.BaseTool.planeCFrame
    };
end, function(v21)
    local function _(v22)
        v21(v4("AddTool", v22));
    end;
    local function _(v24)
        v21(v4("BaseTool", v24));
    end;
    return {
        dispatchSetAutoMaterial = function(v26)
            v21(v4("AddTool", (v9(v26))));
        end, 
        dispatchChangeBaseSize = function(v27)
            v21(v4("AddTool", (v5(v27))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v28)
            v21(v4("AddTool", (v10(v28))));
        end, 
        dispatchChooseBrushShape = function(v29)
            v21(v4("AddTool", (v8(v29))));
        end, 
        dispatchChangeHeight = function(v30)
            v21(v4("AddTool", (v6(v30))));
        end, 
        dispatchSetIgnoreWater = function(v31)
            v21(v4("AddTool", (v12(v31))));
        end, 
        dispatchSetIgnoreParts = function(v32)
            v21(v4("AddTool", (v13(v32))));
        end, 
        dispatchSetMaterial = function(v33)
            v21(v4("AddTool", (v14(v33))));
        end, 
        dispatchChangePivot = function(v34)
            v21(v4("AddTool", (v7(v34))));
        end, 
        dispatchSetPlaneLock = function(v35)
            v21(v4("BaseTool", (v16(v35))));
        end, 
        dispatchSetEditPlaneMode = function(v36)
            v21(v4("BaseTool", (v11(v36))));
        end, 
        dispatchSetPlaneCFrame = function(v37)
            v21(v4("BaseTool", (v15(v37))));
        end, 
        dispatchSetSnapToVoxels = function(v38)
            v21(v4("AddTool", (v17(v38))));
        end
    };
end)(v2);
