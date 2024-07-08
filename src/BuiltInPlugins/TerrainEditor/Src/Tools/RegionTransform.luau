local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v3.Category;
local l_Gizmo_0 = v3.Gizmo;
local l_Note_0 = v3.Note;
local l_OperationSource_0 = v3.OperationSource;
local l_PluginAction_0 = v3.PluginAction;
local l_SelectionSettings_0 = v3.SelectionSettings;
local l_TransformMode_0 = v3.TransformMode;
local l_TransformSettings_0 = v3.TransformSettings;
local l_Tab_0 = v3.Tab;
local l_Tool_0 = v3.Tool;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v15 = require(l_Util_0.AnalyticsHelper);
local v16 = require(l_Util_0.ApplyTransform);
local v17 = require(l_Util_0.ConvertTransformToRegion);
local v18 = require(l_Util_0.getWithinTerrainBounds);
local v19 = require(l_Util_0.SettingsHelper);
local v20 = require(l_Util_0.Operations.TransformOperation);
local l_game_FastInt_0 = game:GetFastInt("SmoothTerrainMaxCppRegion");
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorDisabledFixes);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorCopyPasteFix);
local v26 = v2:new(l_Tool_0.Transform, l_Tab_0.Edit, {
    {
        Defaults = {
            [l_TransformSettings_0.MergeEmpty] = false, 
            [l_TransformSettings_0.LiveEdit] = true, 
            [l_TransformSettings_0.ForcePreview] = false, 
            [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Move
        }, 
        Id = l_Category_0.TransformSettings
    }
}, {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Color = Color3.new(0, 0, 1), 
            Wireframe = true, 
            Rotation = true
        }
    }
});
v26.startOperation = function(v27, v28)
    if v23() then
        v2.startOperation(v27, v28);
    end;
    local v29 = v27:getPayload();
    v29[l_Category_0.SelectionSettings] = v19.Get(l_Category_0.SelectionSettings, v27._pluginController, v27._persistentUserSettings[l_Category_0.SelectionSettings]);
    local v30 = v29[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
    v27._operation = v20(v27._localization:getText("Operations", (("%*Name"):format(v30))), v27._localization:getText("Operations", (("%*Description"):format(v30))), v27._services);
    local v31 = v29[l_Category_0.TransformSettings][l_TransformSettings_0.Size];
    local v32 = v29[l_Category_0.TransformSettings][l_TransformSettings_0.Transform];
    local function v35(v33, v34)
        if not (v31 == v33) or v32.Rotation ~= CFrame.new() then
            return false;
        else
            v27._services.Terrain:PasteRegion(v34:Clone(), v17(v32, v31, true).Min, v29[l_Category_0.TransformSettings][l_TransformSettings_0.MergeEmpty]);
            return true;
        end;
    end;
    if v30 == l_TransformMode_0.Move then
        if v35(v29[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], v29[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegion]) then
            return ;
        end;
    elseif v30 == l_TransformMode_0.Paste then
        if v35(v29[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBufferSize], v29[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBuffer]) then
            return ;
        end;
    elseif not (not (not (v30 ~= l_TransformMode_0.Import) or v30 == l_TransformMode_0.Duplicate) or not v35(v29[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionSize], v29[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegion])) then
        return ;
    end;
    v27._operationFinishedConnection = v27._operation.Finished:Connect(function()
        if not v22() then
            if not v27._operation:wasCanceled() then
                v27._analytics:report("RegionProperties", v15.getRegionPayload(v27:getPayload(), v27._operation:getTimeTaken(), l_Tool_0.Transform));
                v27._analytics:report("Usage", l_Tool_0.Transform, 1);
                if v27._operationFinishedConnection then
                    v27._operationFinishedConnection:Disconnect();
                    v27._operationFinishedConnection = nil;
                end;
            end;
        else
            v27:finishOperation();
            if v24() then
                v27._toolController.selectTool(l_Tool_0.Select);
                return ;
            end;
        end;
    end);
    v27._operation:start(v1.join({
        Payload = v29
    }, v28));
    v27.OnOperationChanged:Fire();
end;
v26.init = function(v36, v37, v38)
    v2.init(v36, v37, v38);
    v36._overrides = {
        [l_Category_0.TransformSettings] = {
            [l_TransformSettings_0.Rotation] = {
                Hidden = false
            }, 
            [l_TransformSettings_0.Apply] = {
                Hidden = not v36._persistentUserSettings[l_Category_0.TransformSettings][l_TransformSettings_0.ForcePreview] and v36._persistentUserSettings[l_Category_0.TransformSettings][l_TransformSettings_0.LiveEdit], 
                Label = "", 
                Schema = {
                    OnClick = function()
                        v36:startOperation();
                    end
                }, 
                Value = true
            }
        }
    };
end;
v26.getValues = function(v39)
    return v19.Get(l_Category_0.SelectionSettings, v39._pluginController, v39._persistentUserSettings[l_Category_0.SelectionSettings], v39._sessionUserSettings[l_Category_0.SelectionSettings]), (v19.Get(l_Category_0.TransformSettings, v39._pluginController, v39._persistentUserSettings[l_Category_0.TransformSettings], v39._sessionUserSettings[l_Category_0.TransformSettings]));
end;
v26.checkSize = function(v40, v41, v42, v43, v44)
    local v45 = v17(v41, v42);
    local v46 = v45.Max - v45.Min;
    local v47 = l_game_FastInt_0 < (v46.X * v46.Y) * v46.Z;
    if not (not v23() or not v40:hasError()) then
        v47 = true;
    end;
    if not (not v43 or not v44) then
        local v48 = v17(v43, v44);
        local v49 = v48.Max - v48.Min;
        v47 = v47 or l_game_FastInt_0 < (v49.X * v49.Y) * v49.Z;
        if not (not v23() or not v40:hasError()) then
            v47 = true;
        end;
    end;
    v40:setPayload({
        [l_Category_0.TransformSettings] = {
            [l_TransformSettings_0.ForcePreview] = v47
        }
    });
    return v47;
end;
if v23() then
    v26.hasError = function(v50)
        local v51, _ = v50:getValues();
        return v2.hasError(v50) or not v18(v51[l_SelectionSettings_0.Transform], v51[l_SelectionSettings_0.Size]);
    end;
    v26.setDisabledState = function(v53)
        local v54 = v53:hasError();
        if v53._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Disabled ~= v54 then
            v53._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Disabled = v54;
            v53.OnInternalsChanged:Fire();
        end;
    end;
end;
v26.activate = function(v55)
    local v56, v57 = v55:getValues();
    local v58 = v56[l_SelectionSettings_0.Size];
    local v59 = v56[l_SelectionSettings_0.SnapToVoxels];
    local v60 = v56[l_SelectionSettings_0.Transform];
    local v61 = v57[l_SelectionSettings_0.TransformMode];
    v55:checkSize(v60, v58);
    local v62 = nil;
    if v61 == l_TransformMode_0.Move then
        v62 = v55._services.Terrain:CopyRegion(v17(v60, v58, true));
        v62.Parent = v55._services.CoreGui;
    end;
    v55._applyConnection = v55._shortcutController:Connect(l_PluginAction_0.Apply, function()
        if not v55._live then
            v55:startOperation();
            return ;
        else
            return ;
        end;
    end);
    v55._shortcutController:Enable(l_PluginAction_0.Apply);
    v55:setPayload({
        [l_Category_0.TransformSettings] = {
            [l_TransformSettings_0.Size] = v58, 
            [l_TransformSettings_0.SnapToVoxels] = v59, 
            [l_TransformSettings_0.Transform] = v60, 
            [l_TransformSettings_0.TerrainRegion] = v62
        }
    });
    v55._region = v17(v60, v58);
    v55._regionOriginal = v17(v60, v58);
    v55._terrainBackup = v55._services.Terrain:CopyRegion(v55._region);
    v55._terrainOriginal = v55._services.Terrain:CopyRegion(if not v25() then v55._region else v55._regionOriginal);
    v55._analytics:report("Activated", l_Tool_0.Transform);
    v55:updateValues();
    if v23() then
        v2.activate(v55);
    end;
end;
v26.gizmos = function(v63)
    local v64 = v2.gizmos(v63);
    for _, v66 in v64, nil, nil do
        if v66.Id == l_Gizmo_0.Region then
            v66.Value[l_Category_0.SelectionSettings] = v19.Get(l_Category_0.SelectionSettings, v63._pluginController, v63._persistentUserSettings[l_Category_0.SelectionSettings]);
        end;
    end;
    return v64;
end;
v26.operation = function(v67)
    return v67._operation;
end;
v26.note = function(v68)
    return v68._note;
end;
v26.deactivate = function(v69)
    v2.deactivate(v69);
    v69._applyConnection:Disconnect();
    v69._shortcutController:Disable(l_PluginAction_0.Apply);
    v19.Set(l_Category_0.TransformSettings, v69._pluginController, {
        TransformMode = l_TransformMode_0.Move
    });
end;
v26.saveGizmos = function(v70, v71)
    v2.saveGizmos(v70, v71);
    v70:updateValues();
end;
v26.saveForm = function(v72, v73)
    v2.saveForm(v72, v73);
    v72:updateValues();
end;
v26.updateMode = function(v74)
    local _, v76 = v74:getValues();
    local v77 = not v76[l_TransformSettings_0.ForcePreview] and v76[l_TransformSettings_0.LiveEdit];
    if v74._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Hidden ~= v77 then
        v74._note = if not v77 then l_Note_0.Transform else nil;
        v74.OnNoteChanged:Fire();
        v74._overrides[l_Category_0.TransformSettings][l_TransformSettings_0.Apply].Hidden = v77;
        task.spawn(function()
            v74.OnFormChanged:Fire();
        end);
    end;
    if not v77 then
        if v74._live then
            v74._services.Terrain:PasteRegion(v74._terrainOriginal, v74._regionOriginal.Min, true);
            v74._services.Terrain:PasteRegion(v74._terrainBackup, v74._region.Min, true);
        end;
    elseif not v74._live then
        v74._services.Terrain:PasteRegion(v74._terrainOriginal, v74._regionOriginal.Min, true);
        v74._services.Terrain:PasteRegion(v74._terrainBackup, v74._region.Min, true);
    end;
    v74._live = v77;
    return not v74._live;
end;
v26.updateValues = function(v78)
    local v79, v80 = v78:getValues();
    v78:checkSize(v79[l_SelectionSettings_0.Transform], v79[l_SelectionSettings_0.Size], v80[l_TransformSettings_0.Transform], v80[l_TransformSettings_0.Size]);
    if not v78:updateMode() then
        if v80[l_TransformSettings_0.OperationSource] == l_OperationSource_0.History then
            return ;
        else
            v78:transform(v79, v80);
            return ;
        end;
    else
        return ;
    end;
end;
v26.transform = function(v81, v82, v83)
    local v84 = v83[l_SelectionSettings_0.TransformMode];
    local v85 = v83[l_TransformSettings_0.Size];
    local v86 = v83[l_TransformSettings_0.Transform];
    local v87 = if not not v25() and v84 == l_TransformMode_0.Paste then v83[l_TransformSettings_0.TransformRegionBufferSize] else v82[l_SelectionSettings_0.Size];
    local v88 = v82[l_SelectionSettings_0.Transform];
    local v89 = v17(v86, v85);
    local v90 = os.clock();
    v81._services.Terrain:PasteRegion(v81._terrainBackup, v81._region.Min, true);
    v81._terrainBackup = v81._services.Terrain:CopyRegion(v89);
    v81._region = v89;
    local v91 = v83[l_TransformSettings_0.MergeEmpty];
    local v92 = nil;
    if v84 == l_TransformMode_0.Move then
        v92 = v83[l_TransformSettings_0.TerrainRegion]:Clone();
        if v91 then
            v81._services.Terrain:SetMaterialInTransform(v86, v85, Enum.Material.Air);
        end;
        v81._services.Terrain:SetMaterialInTransform(v88, v87, Enum.Material.Air);
    elseif v84 == l_TransformMode_0.Paste then
        v92 = v83[l_TransformSettings_0.TerrainRegionBuffer]:Clone();
        if v91 then
            v81._services.Terrain:SetMaterialInTransform(v86, v85, Enum.Material.Air);
        end;
    elseif not (v84 ~= l_TransformMode_0.Duplicate) or v84 == l_TransformMode_0.Import then
        v92 = v83[l_TransformSettings_0.TerrainRegion]:Clone();
        if v91 then
            v81._services.Terrain:SetMaterialInTransform(v86, v85, Enum.Material.Air);
        end;
    else
        return ;
    end;
    local l_v16_0 = v16;
    local l_Terrain_0 = v81._services.Terrain;
    local l_v92_0 = v92;
    local l_v86_0 = v86;
    local l_v85_0 = v85;
    local v98 = false;
    if v86.Rotation == v88.Rotation then
        v98 = v85 == v87;
    end;
    l_v16_0(l_Terrain_0, l_v92_0, l_v86_0, l_v85_0, v98);
    v81._time = os.clock() - v90;
    if v22() then
        l_v16_0 = v15.NormalizeRegionTimer(v90, v85);
        if l_v16_0 then
            v81._totalTime = (v81._totalTime or 0) + l_v16_0;
            v81._count = not v81._count and 1 or v81._count + 1;
        end;
    end;
    if os.clock() - v90 > 5 then
        v81:setPayload({
            [l_Category_0.TransformSettings] = {
                [l_TransformSettings_0.LiveEdit] = false
            }
        });
    end;
end;
v26.reportAnalytics = function(v99)
    local _, v101 = v99:getValues();
    if not (not (not v101[l_TransformSettings_0.ForcePreview] and v101[l_TransformSettings_0.LiveEdit]) or not v99._time) then
        v99._analytics:report("RegionProperties", v15.getRegionPayload(v99:getPayload(), v99._time, l_Tool_0.Transform));
        v99._analytics:report("Usage", l_Tool_0.Transform, 1);
        if not (not v22() or not v99._count) then
            v99._analytics:report("Performance", l_Tool_0.Transform, v99._totalTime / v99._count);
        end;
        v99._time = nil;
    end;
end;
return v26;
