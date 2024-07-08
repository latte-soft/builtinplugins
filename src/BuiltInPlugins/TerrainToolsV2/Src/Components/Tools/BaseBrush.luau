local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.ApplyToolAction);
local v7 = require(l_Actions_0.SetPlaneLockActive);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_Parent_0.Src.ContextItems);
local v11 = require(l_Parent_0.Src.TerrainInterfaces.TerrainBrushInstance);
local l_ToolParts_0 = l_Parent_0.Src.Components.Tools.ToolParts;
local v13 = require(l_ToolParts_0.BrushSettings);
local v14 = require(l_ToolParts_0.MaterialSettings);
local v15 = require(l_Parent_0.Src.Util.Constants);
local v16 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_BrushShape_0 = v16.BrushShape;
local l_PivotType_0 = v16.PivotType;
local l_PlaneLockType_0 = v16.PlaneLockType;
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v21 = v2.PureComponent:extend(script.Name);
v21.init = function(v22)
    assert(v16.ToolId[v22.props.toolName], "Cannot use BaseBrush if brush type is not known");
    v22.connections = {};
    v22.toggleBaseSizeHeightLocked = function()
        local v23 = not v22.props.baseSizeHeightLocked or v22.props.brushShape == l_BrushShape_0.Sphere;
        v22.props.dispatchSetBaseSizeHeightLocked(v23);
        if v23 then
            v22.props.dispatchChangeHeight(v22.props.baseSize);
        end;
    end;
    v22.setBaseSize = function(v24)
        v22.props.dispatchChangeBaseSize(v24);
        if v22.props.baseSizeHeightLocked then
            v22.props.dispatchChangeHeight(v24);
        end;
    end;
    v22.setHeight = function(v25)
        v22.props.dispatchChangeHeight(v25);
        if v22.props.baseSizeHeightLocked then
            v22.props.dispatchChangeBaseSize(v25);
        end;
    end;
    v22.setBrushShape = function(v26)
        if v22.props.dispatchChooseBrushShape then
            v22.props.dispatchChooseBrushShape(v26);
            if not (not (v26 == l_BrushShape_0.Sphere) or v22.props.baseSizeHeightLocked) then
                v22.props.dispatchSetBaseSizeHeightLocked(true);
                v22.props.dispatchChangeHeight(v22.props.baseSize);
            end;
        end;
    end;
    v22.setFixedPlane = function(v27)
        if v22.props.dispatchSetFixedPlane then
            v22.props.dispatchSetFixedPlane(v27);
        end;
        if v22.props.dispatchSetHeightPicker then
            v22.props.dispatchSetHeightPicker(false);
        end;
    end;
    v22.setBrushMode = function(v28)
        if v22.props.dispatchSetBrushMode then
            v22.props.dispatchSetBrushMode(v28);
        end;
    end;
    v22.updateBrushProperties = function()
        local v29 = true;
        local v30 = false;
        local v31 = false;
        local v32 = true;
        local v33 = false;
        local v34 = false;
        local v35 = false;
        local l_None_0 = v3.None;
        local v37 = false;
        local v38 = nil;
        local v39 = false;
        if v22.props.planeLock == l_PlaneLockType_0.Manual then
            v39 = v15.ToolUsesPlaneLock[v22.props.toolName];
        end;
        v22.props.PluginActionsController:SetEnabled("EditPlane", v39);
        if v22.props.dispatchSetPlaneLock then
            v29 = v22.props.planeLock;
        end;
        if v22.props.dispatchSetAutoMaterial then
            v30 = v22.props.autoMaterial;
        end;
        if v22.props.dispatchSetIgnoreWater then
            v31 = v22.props.ignoreWater;
        end;
        if v22.props.dispatchSetIgnoreParts then
            v32 = v22.props.ignoreParts;
        end;
        if v22.props.dispatchSetSnapToVoxels then
            v33 = v22.props.snapToVoxels;
        end;
        if v22.props.dispatchSetEditPlaneMode then
            v35 = v22.props.editPlaneMode;
        end;
        if v22.props.dispatchSetPlaneCFrame then
            l_None_0 = v22.props.planeCFrame;
        end;
        if v22.props.dispatchSetFixedPlane then
            v34 = v22.props.fixedPlane;
        end;
        if v22.props.dispatchSetHeightPicker then
            v37 = v22.props.heightPicker;
        end;
        if v22.props.dispatchSetPlaneLockActive then
            v38 = v22.props.PlaneLockActive;
        end;
        v22.terrainBrush:updateSettings({
            autoMaterial = v30, 
            baseSizeHeightLocked = if not l_TerrainEditorOverhaul_0 then nil else v22.props.baseSizeHeightLocked, 
            brushMode = if not l_TerrainEditorOverhaul_0 then nil else v22.props.brushMode or v16.BrushMode.Add, 
            brushShape = v22.props.brushShape or l_BrushShape_0.Sphere, 
            cursorHeight = v22.props.height or v15.INITIAL_BRUSH_SIZE, 
            cursorSize = v22.props.baseSize or v15.INITIAL_BRUSH_SIZE, 
            fixedPlane = v34, 
            flattenMode = v22.props.flattenMode, 
            heightPicker = v37, 
            ignoreWater = v31, 
            ignoreParts = v32, 
            material = v22.props.material, 
            replaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else v22.props.replaceMaterial, 
            source = v22.props.source, 
            target = v22.props.target, 
            pivot = v22.props.pivot or l_PivotType_0.Center, 
            planeLock = v29, 
            editPlaneMode = v35, 
            planeCFrame = l_None_0, 
            planeLockActive = v38, 
            planePositionY = v22.props.planePositionY, 
            snapToVoxels = v33, 
            strength = v22.props.strength or v15.INITIAL_BRUSH_STRENGTH
        });
    end;
    v22.startBrush = function()
        spawn(function()
            v22.terrainBrush:start();
        end);
    end;
end;
v21._connectEvents = function(v40)
    local l_PluginActivationController_0 = v40.props.PluginActivationController;
    local l_PluginActionsController_0 = v40.props.PluginActionsController;
    table.insert(v40.connections, l_PluginActivationController_0:subscribeToToolDeactivated(function(v43)
        if v43 == v40.props.toolName then
            v40.terrainBrush:stop();
        end;
        if not v15.ToolUsesPlaneLock[l_PluginActivationController_0:getActiveTool()] then
            v40.props.dispatchSetPlaneLockActive(false);
        end;
    end));
    table.insert(v40.connections, l_PluginActivationController_0:subscribeToToolActivated(function(v44)
        if v44 == v40.props.toolName then
            v40.startBrush();
        end;
        if v15.ToolUsesPlaneLock[v44] then
            v40.props.dispatchSetPlaneLockActive(true);
        end;
    end));
    table.insert(v40.connections, v40.terrainBrush:subscribeToRequestBrushSizeChanged(function(v45, v46)
        if v40.props.dispatchChangeBaseSize then
            v40.props.dispatchChangeBaseSize(v45);
        end;
        if v40.props.dispatchChangeHeight then
            v40.props.dispatchChangeHeight(v46);
        end;
    end));
    table.insert(v40.connections, v40.terrainBrush:subscribeToRequestBrushStrengthChanged(function(v47)
        if v40.props.dispatchChangeStrength then
            v40.props.dispatchChangeStrength(v47);
        end;
    end));
    table.insert(v40.connections, v40.terrainBrush:subscribeToPlanePositionYChanged(function(v48)
        if v40.props.dispatchChangePlanePositionY then
            v40.props.dispatchChangePlanePositionY(math.floor(v48 * 1000) / 1000);
        end;
    end));
    table.insert(v40.connections, v40.terrainBrush:subscribeToHeightPickerSet(function(v49)
        if v40.props.dispatchSetHeightPicker then
            v40.props.dispatchSetHeightPicker(v49);
        end;
    end));
    table.insert(v40.connections, v40.terrainBrush:subscribeToMaterialSelectRequested(function(v50, v51)
        if v51 then
            if v40.props.dispatchSetTargetMaterial then
                v40.props.dispatchSetTargetMaterial(v50);
            end;
        else
            if v40.props.dispatchSetMaterial then
                v40.props.dispatchSetMaterial(v50);
            end;
            if v40.props.dispatchSetSourceMaterial then
                v40.props.dispatchSetSourceMaterial(v50);
                return ;
            end;
        end;
    end));
    table.insert(v40.connections, l_PluginActionsController_0:Connect("EditPlane", function()
        if v40.props.dispatchSetEditPlaneMode then
            v40.props.dispatchSetEditPlaneMode(not v40.props.editPlaneMode);
        end;
    end));
end;
v21.didUpdate = function(v52, _, _)
    v52.updateBrushProperties();
end;
v21.didMount = function(v55)
    v55.terrainBrush = v11.new({
        terrain = v55.props.Terrain:get(), 
        mouse = v55.props.Mouse:get(), 
        analytics = v55.props.Analytics, 
        tool = v55.props.toolName
    });
    v55:_connectEvents();
    v55.updateBrushProperties();
    v55.startBrush();
end;
v21.willUnmount = function(v56)
    if v56.connections then
        for v57 = #v56.connections, 1, -1 do
            v56.connections[v57]:Disconnect();
        end;
        v56.connections = nil;
    end;
    if v56.terrainBrush then
        v56.terrainBrush:destroy();
        v56.terrainBrush = nil;
    end;
end;
v21.render = function(v58)
    local v59 = v58.props.LayoutOrder or 1;
    local l_isSubsection_0 = v58.props.isSubsection;
    local l_allowAir_0 = v58.props.allowAir;
    local l_autoMaterial_0 = v58.props.autoMaterial;
    local l_baseSize_0 = v58.props.baseSize;
    local l_baseSizeHeightLocked_0 = v58.props.baseSizeHeightLocked;
    local l_brushMode_0 = v58.props.brushMode;
    local l_brushShape_0 = v58.props.brushShape;
    local v67 = v58.props.editPlaneMode and v58.props.PlaneLockActive;
    local l_fixedPlane_0 = v58.props.fixedPlane;
    local l_flattenMode_0 = v58.props.flattenMode;
    local l_height_0 = v58.props.height;
    local l_heightPicker_0 = v58.props.heightPicker;
    local l_ignoreWater_0 = v58.props.ignoreWater;
    local l_ignoreParts_0 = v58.props.ignoreParts;
    local l_material_0 = v58.props.material;
    return v2.createFragment({
        BrushSettings = v2.createElement(v13, {
            LayoutOrder = v59, 
            isSubsection = l_isSubsection_0, 
            currentTool = v58.props.toolName, 
            baseSize = l_baseSize_0, 
            baseSizeHeightLocked = l_baseSizeHeightLocked_0, 
            brushMode = if not l_TerrainEditorOverhaul_0 then nil else l_brushMode_0, 
            brushShape = l_brushShape_0, 
            fixedPlane = l_fixedPlane_0, 
            flattenMode = l_flattenMode_0, 
            height = l_height_0, 
            heightPicker = l_heightPicker_0, 
            ignoreWater = l_ignoreWater_0, 
            ignoreParts = l_ignoreParts_0, 
            pivot = v58.props.pivot, 
            planeLock = v58.props.planeLock, 
            disablePlaneLock = v58.props.disablePlaneLock, 
            disableIgnoreWater = v58.props.disableIgnoreWater, 
            planePositionY = v58.props.planePositionY, 
            snapToVoxels = v58.props.snapToVoxels, 
            editPlaneMode = v67, 
            planeCFrame = v58.props.planeCFrame, 
            strength = v58.props.strength, 
            setBaseSize = v58.setBaseSize, 
            setBrushMode = if not l_TerrainEditorOverhaul_0 then nil else v58.setBrushMode, 
            setBrushShape = v58.setBrushShape, 
            setEditPlaneMode = v58.props.dispatchSetEditPlaneMode, 
            setFixedPlane = v58.setFixedPlane, 
            setFlattenMode = v58.props.dispatchChooseFlattenMode, 
            setHeight = v58.setHeight, 
            setHeightPicker = v58.props.dispatchSetHeightPicker, 
            setIgnoreWater = v58.props.dispatchSetIgnoreWater, 
            setIgnoreParts = v58.props.dispatchSetIgnoreParts, 
            setPivot = v58.props.dispatchChangePivot, 
            setPlaneCFrame = v58.props.dispatchSetPlaneCFrame, 
            setPlaneLock = v58.props.dispatchSetPlaneLock, 
            setPlanePositionY = v58.props.dispatchChangePlanePositionY, 
            setSnapToVoxels = v58.props.dispatchSetSnapToVoxels, 
            setStrength = v58.props.dispatchChangeStrength, 
            toggleBaseSizeHeightLocked = v58.toggleBaseSizeHeightLocked
        }), 
        MaterialSettings = l_material_0 and v2.createElement(v14, {
            LayoutOrder = v59 + 1, 
            AllowAir = l_allowAir_0, 
            autoMaterial = l_autoMaterial_0, 
            currentTool = v58.props.toolName, 
            material = l_material_0, 
            replaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else v58.props.replaceMaterial, 
            source = if not l_TerrainEditorOverhaul_0 then nil else v58.props.source, 
            target = if not l_TerrainEditorOverhaul_0 then nil else v58.props.target, 
            setAutoMaterial = v58.props.dispatchSetAutoMaterial, 
            setMaterial = v58.props.dispatchSetMaterial, 
            setReplaceMaterial = if not l_TerrainEditorOverhaul_0 then nil else v58.props.dispatchSetReplaceMaterial, 
            setSource = if not l_TerrainEditorOverhaul_0 then nil else v58.props.dispatchSetSourceMaterial, 
            setTarget = if not l_TerrainEditorOverhaul_0 then nil else v58.props.dispatchSetTargetMaterial
        })
    });
end;
return v4.connect(function(v75, _)
    return {
        PlaneLockActive = v75.BaseTool.planeLockActive
    };
end, function(v77)
    local function _(v78)
        v77(v6("BaseTool", v78));
    end;
    return {
        dispatchSetPlaneLockActive = function(v80)
            v77(v6("BaseTool", (v7(v80))));
        end
    };
end)((l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    Analytics = l_ContextServices_0.Analytics, 
    Terrain = v10.Terrain, 
    PluginActivationController = v10.PluginActivationController, 
    PluginActionsController = v10.PluginActionsController
})(v21)));
