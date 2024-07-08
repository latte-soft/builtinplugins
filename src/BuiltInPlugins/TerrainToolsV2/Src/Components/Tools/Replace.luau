local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.ApplyToolAction);
local v9 = require(l_Actions_0.ChangePosition);
local v10 = require(l_Actions_0.ChangeSize);
local v11 = require(l_Actions_0.SetSourceMaterial);
local v12 = require(l_Actions_0.SetTargetMaterial);
local v13 = require(l_Actions_0.SetReplaceMode);
local v14 = require(l_Actions_0.ChangeBaseSize);
local v15 = require(l_Actions_0.ChangeHeight);
local v16 = require(l_Actions_0.ChangePivot);
local v17 = require(l_Actions_0.ChooseBrushShape);
local v18 = require(l_Actions_0.SetBaseSizeHeightLocked);
local v19 = require(l_Actions_0.SetEditPlaneMode);
local v20 = require(l_Actions_0.SetIgnoreWater);
local v21 = require(l_Actions_0.SetIgnoreParts);
local v22 = require(l_Actions_0.SetPlaneCFrame);
local v23 = require(l_Actions_0.SetPlaneLock);
local v24 = require(l_Actions_0.SetSnapToVoxels);
local l_ToolParts_0 = script.Parent.ToolParts;
local v26 = require(l_ToolParts_0.ButtonGroup);
local v27 = require(l_ToolParts_0.Panel);
local v28 = require(l_ToolParts_0.MapSettingsWithPreview);
local v29 = require(l_ToolParts_0.MaterialSelector);
local v30 = require(l_Parent_0.Src.Components.ProgressDialog);
local v31 = require(l_ToolParts_0.ModeSelector);
local v32 = require(l_ToolParts_0.MouseListener);
local v33 = require(l_Parent_0.Src.Components.Tools.BaseBrush);
local v34 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_PlaneLockType_0 = v34.PlaneLockType;
local l_ReplaceMode_0 = v34.ReplaceMode;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v38 = v2.PureComponent:extend(script.Name);
v38.init = function(v39)
    v39.tryGenerateReplace = function()
        v39.props.Replace:replaceMaterial(Vector3.new(v39.props.Position.X, v39.props.Position.Y, v39.props.Position.Z), Vector3.new(v39.props.Size.X, v39.props.Size.Y, v39.props.Size.Z), v39.props.Source, v39.props.Target, v39.props.toolName);
    end;
    v39.setSourceMaterial = function(v40)
        if v40 == Enum.Material.Water and v39.props.ignoreWater == true then
            v39.props.dispatchSetIgnoreWater(false);
        end;
        if v40 == Enum.Material.Air and v39.props.planeLock == l_PlaneLockType_0.Off then
            v39.props.dispatchSetPlaneLock(l_PlaneLockType_0.Auto);
        end;
        v39.props.dispatchSetSourceMaterial(v40);
    end;
    v39.setIgnoreWater = function(v41)
        if v39.props.Source == Enum.Material.Water then
            if v39.props.ignoreWater then
                v39.props.dispatchSetIgnoreWater(false);
                return ;
            end;
        else
            v39.props.dispatchSetIgnoreWater(v41);
        end;
    end;
    v39.setPlaneLock = function(v42)
        if v39.props.Source == Enum.Material.Air then
            if v42 ~= l_PlaneLockType_0.Off then
                v39.props.dispatchSetPlaneLock(v42);
                return ;
            end;
        else
            v39.props.dispatchSetPlaneLock(v42);
        end;
    end;
    v39.cancel = function()
        v39.props.Replace:cancel();
    end;
end;
v38.render = function(v43)
    local l_Localization_0 = v43.props.Localization;
    local l_Position_0 = v43.props.Position;
    local l_Size_0 = v43.props.Size;
    local v47 = v43.props.Replace:isReplacing();
    return v2.createFragment({
        ReplaceTool = v2.createElement(v27, {
            Title = l_Localization_0:getText("Replace", "ReplaceMaterial"), 
            LayoutOrder = 1
        }, {
            ModeButtonsWithBoxToggled = if l_TerrainEditorOverhaul_0 then nil else v2.createElement(v31, {
                Selected = v43.props.Mode, 
                Select = v43.props.dispatchSetReplaceMode, 
                Options = {
                    {
                        Data = l_ReplaceMode_0.Box, 
                        Text = l_Localization_0:getText("ReplaceMode", "Box")
                    }, 
                    {
                        Data = l_ReplaceMode_0.Brush, 
                        Text = l_Localization_0:getText("ReplaceMode", "Brush")
                    }
                }
            }), 
            Brush = if not l_TerrainEditorOverhaul_0 and v43.props.Mode == l_ReplaceMode_0.Brush then v2.createElement(v33, {
                LayoutOrder = 2, 
                isSubsection = true, 
                toolName = v43.props.toolName, 
                baseSize = v43.props.baseSize, 
                baseSizeHeightLocked = v43.props.baseSizeHeightLocked, 
                brushShape = v43.props.brushShape, 
                height = v43.props.height, 
                ignoreWater = v43.props.ignoreWater, 
                ignoreParts = v43.props.ignoreParts, 
                pivot = v43.props.pivot, 
                planeLock = v43.props.planeLock, 
                planeCFrame = v43.props.planeCFrame, 
                editPlaneMode = v43.props.editPlaneMode, 
                snapToVoxels = v43.props.snapToVoxels, 
                strength = v43.props.strength, 
                source = v43.props.Source, 
                target = v43.props.Target, 
                dispatchChangeBaseSize = v43.props.dispatchChangeBaseSize, 
                dispatchSetBaseSizeHeightLocked = v43.props.dispatchSetBaseSizeHeightLocked, 
                dispatchChooseBrushShape = v43.props.dispatchChooseBrushShape, 
                dispatchChangeHeight = v43.props.dispatchChangeHeight, 
                dispatchSetEditPlaneMode = v43.props.dispatchSetEditPlaneMode, 
                dispatchSetIgnoreWater = v43.setIgnoreWater, 
                dispatchSetIgnoreParts = v43.props.dispatchSetIgnoreParts, 
                dispatchChangePivot = v43.props.dispatchChangePivot, 
                dispatchSetPlaneCFrame = v43.props.dispatchSetPlaneCFrame, 
                dispatchSetPlaneLock = v43.setPlaneLock, 
                dispatchSetSnapToVoxels = v43.props.dispatchSetSnapToVoxels, 
                dispatchSetSourceMaterial = v43.props.dispatchSetSourceMaterial, 
                dispatchSetTargetMaterial = v43.props.dispatchSetTargetMaterial, 
                disablePlaneLock = v43.props.Source == Enum.Material.Air, 
                disableIgnoreWater = v43.props.Source == Enum.Material.Water
            }) else nil, 
            MouseListener = if l_TerrainEditorOverhaul_0 or v43.props.Mode == l_ReplaceMode_0.Box then v2.createElement(v32, {
                dispatchSetSourceMaterial = v43.props.dispatchSetSourceMaterial, 
                dispatchSetTargetMaterial = v43.props.dispatchSetTargetMaterial
            }) else nil, 
            MapSettingsWithPreview = if l_TerrainEditorOverhaul_0 or v43.props.Mode == l_ReplaceMode_0.Box then v2.createElement(v28, {
                LayoutOrder = 3, 
                isSubsection = true, 
                toolName = v43.props.toolName, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                OnPositionChanged = v43.props.dispatchChangePosition, 
                OnSizeChanged = v43.props.dispatchChangeSize
            }) else nil, 
            MaterialPanel = v2.createElement(v27, {
                Title = l_Localization_0:getText("Replace", "MaterialSettings"), 
                LayoutOrder = 4, 
                isSubsection = true
            }, {
                SourceMaterialSelector = v2.createElement(v29, {
                    LayoutOrder = 1, 
                    AllowAir = true, 
                    Label = l_Localization_0:getText("Replace", "SourceMaterial"), 
                    material = v43.props.Source, 
                    setMaterial = v43.setSourceMaterial
                }), 
                TargetMaterialSelector = v2.createElement(v29, {
                    LayoutOrder = 2, 
                    AllowAir = true, 
                    Label = l_Localization_0:getText("Replace", "TargetMaterial"), 
                    material = v43.props.Target, 
                    setMaterial = v43.props.dispatchSetTargetMaterial
                })
            }), 
            ReplaceButtons = if l_TerrainEditorOverhaul_0 or v43.props.Mode == l_ReplaceMode_0.Box then v2.createElement(v26, {
                LayoutOrder = 5, 
                Buttons = {
                    {
                        Key = "Replace", 
                        Name = l_Localization_0:getText("Replace", "Replace"), 
                        Active = not v47, 
                        OnClicked = v43.tryGenerateReplace
                    }
                }
            }) else nil
        }), 
        ProgressDialog = v47 and v2.createElement(v30, {
            Title = l_Localization_0:getText("Replace", "ReplaceProgressTitle"), 
            SubText = l_Localization_0:getText("Replace", "Replacing"), 
            Progress = not not v47 and v43.props.Replace:getProgress() or 0, 
            OnCancelButtonClicked = v43.cancel
        })
    });
end;
return v3.connect(function(v48, _)
    return {
        toolName = v34.ToolId.Replace, 
        Position = v48.ReplaceTool.position, 
        Size = v48.ReplaceTool.size, 
        Source = v48.ReplaceTool.SourceMaterial, 
        Target = v48.ReplaceTool.TargetMaterial, 
        Mode = v48.ReplaceTool.ReplaceMode, 
        baseSize = v48.ReplaceTool.baseSize, 
        baseSizeHeightLocked = v48.ReplaceTool.baseSizeHeightLocked, 
        brushShape = v48.ReplaceTool.brushShape, 
        height = v48.ReplaceTool.height, 
        ignoreWater = v48.ReplaceTool.ignoreWater, 
        ignoreParts = v48.ReplaceTool.ignoreParts, 
        pivot = v48.ReplaceTool.pivot, 
        planeLock = v48.BaseTool.planeLock, 
        planeCFrame = v48.BaseTool.planeCFrame, 
        editPlaneMode = v48.BaseTool.editPlaneMode
    };
end, function(v50)
    local function _(v51)
        v50(v8("ReplaceTool", v51));
    end;
    local function _(v53)
        v50(v8("BaseTool", v53));
    end;
    return {
        dispatchChangePosition = function(v55)
            v50(v8("ReplaceTool", (v9(v55))));
        end, 
        dispatchChangeSize = function(v56)
            v50(v8("ReplaceTool", (v10(v56))));
        end, 
        dispatchSetSourceMaterial = function(v57)
            v50(v8("ReplaceTool", (v11(v57))));
        end, 
        dispatchSetTargetMaterial = function(v58)
            v50(v8("ReplaceTool", (v12(v58))));
        end, 
        dispatchSetReplaceMode = function(v59)
            v50(v8("ReplaceTool", (v13(v59))));
        end, 
        dispatchChangeBaseSize = function(v60)
            v50(v8("ReplaceTool", (v14(v60))));
        end, 
        dispatchSetBaseSizeHeightLocked = function(v61)
            v50(v8("ReplaceTool", (v18(v61))));
        end, 
        dispatchChooseBrushShape = function(v62)
            v50(v8("ReplaceTool", (v17(v62))));
        end, 
        dispatchChangeHeight = function(v63)
            v50(v8("ReplaceTool", (v15(v63))));
        end, 
        dispatchSetEditPlaneMode = function(v64)
            v50(v8("ReplaceTool", (v19(v64))));
        end, 
        dispatchSetIgnoreWater = function(v65)
            v50(v8("ReplaceTool", (v20(v65))));
        end, 
        dispatchSetIgnoreParts = function(v66)
            v50(v8("ReplaceTool", (v21(v66))));
        end, 
        dispatchChangePivot = function(v67)
            v50(v8("ReplaceTool", (v16(v67))));
        end, 
        dispatchSetPlaneCFrame = function(v68)
            v50(v8("BaseTool", (v22(v68))));
        end, 
        dispatchSetPlaneLock = function(v69)
            v50(v8("BaseTool", (v23(v69))));
        end, 
        dispatchSetSnapToVoxels = function(v70)
            v50(v8("BaseTool", (v24(v70))));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Replace = v6.SeaLevel
})(v38)));
