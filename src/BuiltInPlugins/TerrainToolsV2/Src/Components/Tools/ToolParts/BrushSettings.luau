local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v4 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v5 = require(l_Parent_0.Src.PlaneDraggerSchema.DraggerSchema);
local v6 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v7 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v8 = require(l_DraggerFramework_0.Handles.RotateHandles);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Src.Util.Constants);
local v13 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushShape_0 = v13.BrushShape;
local l_PlaneLockType_0 = v13.PlaneLockType;
local l_Parent_1 = script.Parent;
local v17 = require(l_Parent_1.LabeledSlider);
local v18 = require(l_Parent_1.LabeledToggle);
local v19 = require(l_Parent_1.Panel);
local v20 = require(l_Parent_1.VectorTextInput);
local l_BrushProperties_0 = l_Parent_1.BrushProperties;
local v22 = require(l_BrushProperties_0.BaseSizeSlider);
local v23 = require(l_BrushProperties_0.BrushModeSelector);
local v24 = require(l_BrushProperties_0.BrushShapeSelector);
local v25 = require(l_BrushProperties_0.FlattenModeSelector);
local v26 = require(l_BrushProperties_0.HeightSelectionToggle);
local v27 = require(l_BrushProperties_0.PlaneLockSelector);
local v28 = require(l_BrushProperties_0.PivotSelector);
local v29 = require(l_BrushProperties_0.PlaneController);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v31 = v2.PureComponent:extend(script.Name);
local l_TerrainSmoothToolFix_0 = game:GetFastFlag("TerrainSmoothToolFix");
local function v36(v33, v34, v35)
    return math.deg(v33), math.deg(v34), (math.deg(v35));
end;
local function _(v37)
    return (Vector3.new(math.round(v37.X), math.round(v37.Y), (math.round(v37.Z))));
end;
v31.init = function(v39, v40)
    v39._cursorGridObject = {
        planeCFrame = v40.planeCFrame
    };
    v39._Selection = v5.Selection.new(v39._cursorGridObject);
    v39._draggerContext = v6.new(l_Parent_0.Parent, game, settings(), v39._Selection);
    v39._draggerContext.updatePlaneFn = function(v41)
        v39._cursorGridObject.planeCFrame = v41;
        v39.props.setPlaneCFrame(v41);
    end;
    v39._draggerContext.planeCFrame = v39.props.planeCFrame;
    v39._draggerProps = {
        Mouse = l_Parent_0.Parent:GetMouse(), 
        DraggerContext = v39._draggerContext, 
        DraggerSchema = v5, 
        DraggerSettings = {
            AnalyticsName = "AdjustablePlaneLock", 
            AllowDragSelect = true, 
            AllowFreeformDrag = true, 
            ShowLocalSpaceIndicator = true, 
            ShowPivotIndicator = true, 
            HandlesList = {
                v7.new(v39._draggerContext, {
                    ShowBoundingBox = false, 
                    Summonable = false, 
                    Outset = 1
                }, v5.TransformHandlesImplementation.new(v39._draggerContext)), 
                v8.new(v39._draggerContext, {
                    ShowBoundingBox = false, 
                    Summonable = false, 
                    Outset = 1
                }, v5.TransformHandlesImplementation.new(v39._draggerContext))
            }
        }
    };
    v39.resetPlaneCFrame = function()
        local v42 = game:GetService("Workspace").CurrentCamera.CFrame * CFrame.new((Vector3.new(0, 0, -50)));
        local v43 = CFrame.fromEulerAnglesXYZ(1.5707963267948966, 0, 0);
        local l_Position_0 = v42.Position;
        local v45 = v43 + Vector3.new(math.round(l_Position_0.X), math.round(l_Position_0.Y), (math.round(l_Position_0.Z)));
        v39.props.setPlaneCFrame(v45);
        v39._cursorGridObject.planeCFrame = v45;
        v39._Selection.SelectionChanged:Fire();
    end;
    v39.toggleEditPlaneMode = function()
        v39.props.setEditPlaneMode(not v39.props.editPlaneMode);
    end;
    v39.updatePosition = function(v46, v47)
        local v48 = tonumber(v47);
        if v48 then
            local l_planeCFrame_0 = v39.props.planeCFrame;
            if v46 == "X" then
                l_planeCFrame_0 = l_planeCFrame_0 + Vector3.new(v48 - l_planeCFrame_0.Position.X, 0, 0);
            elseif v46 == "Y" then
                l_planeCFrame_0 = l_planeCFrame_0 + Vector3.new(0, v48 - l_planeCFrame_0.Position.Y, 0);
            elseif v46 == "Z" then
                l_planeCFrame_0 = l_planeCFrame_0 + Vector3.new(0, 0, v48 - l_planeCFrame_0.Position.Z);
            end;
            v39.props.setPlaneCFrame(l_planeCFrame_0);
            v39._cursorGridObject.planeCFrame = l_planeCFrame_0;
        end;
        v39._Selection.SelectionChanged:Fire();
    end;
    v39.onPositionVectorFocusLost = function(_, v51, _, v53)
        v39.updatePosition(v51, v53);
    end;
    v39.updateRotation = function(v54, v55)
        local v56 = tonumber(v55);
        if v56 == nil then
            return ;
        else
            v56 = math.rad(v56);
            if v56 then
                local v57, v58, v59 = v39.props.planeCFrame:ToEulerAnglesXYZ();
                local v60 = CFrame.new((Vector3.new()));
                if v54 == "X" then
                    v60 = CFrame.fromEulerAnglesXYZ(v56, v58, v59);
                elseif v54 == "Y" then
                    v60 = CFrame.fromEulerAnglesXYZ(v57, v56, v59);
                elseif v54 == "Z" then
                    v60 = CFrame.fromEulerAnglesXYZ(v57, v58, v56);
                end;
                v60 = v60 + v39._cursorGridObject.planeCFrame.Position;
                v39.props.setPlaneCFrame(v60);
                v39._cursorGridObject.planeCFrame = v60;
            end;
            v39._Selection.SelectionChanged:Fire();
            return ;
        end;
    end;
    v39.onRotationVectorFocusLost = function(_, v62, _, v64)
        v39.updateRotation(v62, v64);
    end;
    v39.setPlaneLock = function(v65)
        if v65 ~= l_PlaneLockType_0.Manual then
            v39.props.setEditPlaneMode(false);
        end;
        v39.props.setPlaneLock(v65);
    end;
end;
v31.willUpdate = function(v66, v67)
    v66._cursorGridObject.planeCFrame = v67.planeCFrame;
end;
v31.render = function(v68)
    if not (not (not v68.props.planeCFrame and v68.props.planeLock == l_PlaneLockType_0.Manual) or not v68.props.setPlaneCFrame) then
        v68.resetPlaneCFrame();
    end;
    local l_Localization_0 = v68.props.Localization;
    local l_LayoutOrder_0 = v68.props.LayoutOrder;
    local v71 = l_LayoutOrderIterator_0.new();
    local l_isSubsection_0 = v68.props.isSubsection;
    local v73 = v68.props.brushShape ~= l_BrushShape_0.Sphere;
    local v74 = v68.props.strength ~= nil;
    local v75 = v68.props.snapToVoxels ~= nil;
    local v76 = v68.props.ignoreWater ~= nil;
    local v77 = v68.props.ignoreParts ~= nil;
    local v78 = v68.props.planeLock ~= nil;
    local _ = v68.props.disablePlaneLock;
    local l_disableIgnoreWater_0 = v68.props.disableIgnoreWater;
    local v81 = v68.props.fixedPlane ~= nil;
    local l_editPlaneMode_0 = v68.props.editPlaneMode;
    local l_planeCFrame_1 = v68.props.planeCFrame;
    local v84 = false;
    if v68.props.planeLock == l_PlaneLockType_0.Manual then
        v84 = v12.ToolUsesPlaneLock[v68.props.currentTool];
    end;
    return v2.createElement(v19, {
        Title = l_Localization_0:getText("BrushSettings", "BrushSettings"), 
        Padding = UDim.new(0, 12), 
        LayoutOrder = l_LayoutOrder_0, 
        isSubsection = l_isSubsection_0
    }, {
        BrushMode = if not not l_TerrainEditorOverhaul_0 and v68.props.brushMode then v2.createElement(v23, {
            LayoutOrder = v71:getNextOrder(), 
            brushMode = v68.props.brushMode, 
            setBrushMode = v68.props.setBrushMode
        }) else nil, 
        BrushShapeSelector = v2.createElement(v24, {
            LayoutOrder = v71:getNextOrder(), 
            brushShape = v68.props.brushShape, 
            setBrushShape = v68.props.setBrushShape
        }), 
        BaseSizeSlider = v2.createElement(v22, {
            LayoutOrder = v71:getNextOrder(), 
            baseSize = v68.props.baseSize, 
            setBaseSize = v68.props.setBaseSize, 
            ShowLock = v73, 
            IsLocked = v68.props.baseSizeHeightLocked, 
            ToggleLock = v68.props.toggleBaseSizeHeightLocked
        }), 
        HeightSlider = v73 and v2.createElement(v17, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "Height"), 
            Min = v12.MIN_BRUSH_SIZE, 
            Max = v12.MAX_BRUSH_SIZE, 
            SnapIncrement = 1, 
            Value = v68.props.height, 
            SetValue = v68.props.setHeight, 
            Tooltip = if not l_TerrainEditorOverhaul_0 then nil else l_Localization_0:getText("BrushSettings", "HeightTooltip")
        }), 
        StrengthSlider = v74 and v2.createElement(v17, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "Strength"), 
            Min = 0.1, 
            Max = 1, 
            SnapIncrement = not l_TerrainSmoothToolFix_0 and 0.1 or 0.05, 
            Value = v68.props.strength, 
            SetValue = v68.props.setStrength, 
            Tooltip = if not l_TerrainEditorOverhaul_0 then nil else l_Localization_0:getText("BrushSettings", "StrengthTooltip")
        }), 
        FlattenModeSelector = v68.props.flattenMode ~= nil and v2.createElement(v25, {
            LayoutOrder = v71:getNextOrder(), 
            flattenMode = v68.props.flattenMode, 
            setFlattenMode = v68.props.setFlattenMode
        }), 
        PivotSelector = v2.createElement(v28, {
            LayoutOrder = v71:getNextOrder(), 
            pivot = v68.props.pivot, 
            setPivot = v68.props.setPivot
        }), 
        PlaneLock = v78 and v2.createElement(v27, {
            LayoutOrder = v71:getNextOrder(), 
            planeLock = v68.props.planeLock, 
            setPlaneLock = v68.setPlaneLock
        }), 
        PlaneController = v84 and v2.createElement(v29, {
            LayoutOrder = v71:getNextOrder(), 
            EditPlaneMode = l_editPlaneMode_0, 
            Reset = v68.resetPlaneCFrame, 
            SetEditPlaneMode = v68.props.setEditPlaneMode
        }), 
        Dragger = (l_editPlaneMode_0 and v84) and v2.createElement(v4, v68._draggerProps), 
        PositionInput = (l_editPlaneMode_0 and v84) and v2.createElement(v20, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "Position"), 
            Key = "Position", 
            Vector = l_planeCFrame_1.Position, 
            Precisions = {
                X = 2, 
                Y = 2, 
                Z = 2
            }, 
            OnFocusLost = v68.onPositionVectorFocusLost
        }), 
        RotateInput = (l_editPlaneMode_0 and v84) and v2.createElement(v20, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "Rotation"), 
            Key = "Rotation", 
            Vector = Vector3.new(v36(v68.props.planeCFrame:toEulerAnglesXYZ())), 
            Precisions = {
                X = 2, 
                Y = 2, 
                Z = 2
            }, 
            OnFocusLost = v68.onRotationVectorFocusLost
        }), 
        FixedPlaneToggle = v81 and v2.createElement(v18, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "FixedPlane"), 
            IsOn = v68.props.fixedPlane, 
            SetIsOn = v68.props.setFixedPlane
        }), 
        HeightSelectionToggle = (v68.props.fixedPlane and v68.props.planePositionY ~= nil) and v2.createElement(v26, {
            LayoutOrder = v71:getNextOrder(), 
            Label = l_Localization_0:getText("BrushSettings", "PlanePosition"), 
            heightPicker = v68.props.heightPicker, 
            setHeightPicker = v68.props.setHeightPicker, 
            planePositionY = v68.props.planePositionY, 
            setPlanePositionY = v68.props.setPlanePositionY
        }), 
        SnapToVoxelsToggle = v75 and v2.createElement(v18, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "SnapToVoxels"), 
            IsOn = v68.props.snapToVoxels, 
            SetIsOn = v68.props.setSnapToVoxels
        }), 
        IgnoreWaterToggle = v76 and v2.createElement(v18, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "IgnoreWater"), 
            IsOn = v68.props.ignoreWater, 
            SetIsOn = v68.props.setIgnoreWater, 
            Disabled = l_disableIgnoreWater_0
        }), 
        IgnorePartsToggle = not not v77 and v2.createElement(v18, {
            LayoutOrder = v71:getNextOrder(), 
            Text = l_Localization_0:getText("BrushSettings", "IgnoreParts"), 
            IsOn = v68.props.ignoreParts, 
            SetIsOn = v68.props.setIgnoreParts
        }) or nil
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v31));
