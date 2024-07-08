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
local v12 = require(l_Actions_0.SetEditPlaneMode);
local v13 = require(l_Actions_0.SetIgnoreWater);
local v14 = require(l_Actions_0.SetIgnoreParts);
local v15 = require(l_Actions_0.SetMaterial);
local v16 = require(l_Actions_0.SetPlaneCFrame);
local v17 = require(l_Actions_0.SetPlaneLock);
local v18 = require(l_Actions_0.SetSnapToVoxels);
local v19 = require(l_Parent_0.Src.Util.TerrainEnums);
return v1.connect(function(v20, _)
    return {
        toolName = v19.ToolId.Grow, 
        autoMaterial = v20.GrowTool.autoMaterial, 
        baseSize = v20.GrowTool.baseSize, 
        baseSizeHeightLocked = v20.GrowTool.baseSizeHeightLocked, 
        brushShape = v20.GrowTool.brushShape, 
        height = v20.GrowTool.height, 
        ignoreWater = v20.GrowTool.ignoreWater, 
        ignoreParts = v20.GrowTool.ignoreParts, 
        material = v20.GrowTool.material, 
        pivot = v20.GrowTool.pivot, 
        planeLock = v20.BaseTool.planeLock, 
        snapToVoxels = v20.GrowTool.snapToVoxels, 
        strength = v20.GrowTool.strength, 
        editPlaneMode = v20.BaseTool.editPlaneMode, 
        planeCFrame = v20.BaseTool.planeCFrame
    };
end, function(v22)
    local function _(v23)
        v22(v4("GrowTool", v23));
    end;
    local function _(v25)
        v22(v4("BaseTool", v25));
    end;
    return {
        dispatchChangeBaseSize = function(v27)
            v22(v4("GrowTool", (v5(v27))));
        end, 
        dispatchChangeHeight = function(v28)
            v22(v4("GrowTool", (v6(v28))));
        end, 
        dispatchChangePivot = function(v29)
            v22(v4("GrowTool", (v7(v29))));
        end, 
        dispatchChangeStrength = function(v30)
            v22(v4("GrowTool", (v8(v30))));
        end, 
        dispatchChooseBrushShape = function(v31)
            v22(v4("GrowTool", (v9(v31))));
        end, 
        dispatchSetAutoMaterial = function(v32)
            v22(v4("GrowTool", (v10(v32))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v33)
            v22(v4("GrowTool", (v11(v33))));
        end, 
        dispatchSetIgnoreWater = function(v34)
            v22(v4("GrowTool", (v13(v34))));
        end, 
        dispatchSetIgnoreParts = function(v35)
            v22(v4("GrowTool", (v14(v35))));
        end, 
        dispatchSetMaterial = function(v36)
            v22(v4("GrowTool", (v15(v36))));
        end, 
        dispatchSetPlaneLock = function(v37)
            v22(v4("BaseTool", (v17(v37))));
        end, 
        dispatchSetEditPlaneMode = function(v38)
            v22(v4("BaseTool", (v12(v38))));
        end, 
        dispatchSetPlaneCFrame = function(v39)
            v22(v4("BaseTool", (v16(v39))));
        end, 
        dispatchSetSnapToVoxels = function(v40)
            v22(v4("GrowTool", (v18(v40))));
        end
    };
end)(v2);
