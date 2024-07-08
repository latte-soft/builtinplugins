local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v4.BrushSettings;
local l_BuildSettings_0 = v4.BuildSettings;
local l_Category_0 = v4.Category;
local l_PlaneLock_0 = v4.PlaneLock;
local l_SelectionSettings_0 = v4.SelectionSettings;
local l_TerrainType_0 = v4.TerrainType;
local l_TransformMode_0 = v4.TransformMode;
local l_TransformSettings_0 = v4.TransformSettings;
local l_Signal_0 = v2.Util.Signal;
local l_Serialization_0 = l_script_FirstAncestor_0.Src.Util.Serialization;
local v15 = require(l_Serialization_0.Serialize);
local v16 = require(l_Serialization_0.Deserialize);
local v17 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorBrushPerformanceEnhancements);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorManualPlaneLockRelative);
local v21 = l_ContextItem_0:extend("PluginController");
local l_Workspace_0 = game:GetService("Workspace");
v21.new = function(v23, v24)
    if not v24 then
        assert(v23, "PluginController.new() requires a plugin");
    end;
    local v25 = setmetatable({
        _mock = v24, 
        _plugin = v23, 
        _store = {
            [l_Category_0.SelectionSettings] = {
                [l_SelectionSettings_0.Size] = Vector3.new(64, 32, 64), 
                [l_SelectionSettings_0.SnapToVoxels] = true, 
                [l_SelectionSettings_0.Transform] = CFrame.new()
            }, 
            [l_Category_0.TransformSettings] = {
                [l_TransformSettings_0.Size] = Vector3.new(64, 32, 64), 
                [l_TransformSettings_0.SnapToVoxels] = true, 
                [l_TransformSettings_0.Transform] = CFrame.new(), 
                [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Move
            }, 
            [l_Category_0.BrushSettings] = {
                [l_BrushSettings_0.ManualPlaneLock] = false, 
                [l_BrushSettings_0.PlaneLock] = l_PlaneLock_0.Off, 
                [l_BrushSettings_0.PlaneTransform] = CFrame.Angles(1.5707963267948966, 0, 0)
            }, 
            [l_Category_0.BuildSettings] = if not v18() then nil else {
                [l_BuildSettings_0.TerrainType] = l_TerrainType_0.None
            }
        }, 
        Activation = l_Signal_0.new(), 
        Compact = l_Signal_0.new(), 
        Focused = l_Signal_0.new()
    }, v21);
    if not v19() then
        if v17.IsDebuggingSavedSettings then
            v25._store = v1.join(v25._store, (v16(v25._plugin:GetSetting("Global") or {})));
        end;
    elseif not v17.IsDebuggingSavedSettings then
        v25._store = v1.join(v25._store, (v16(v25._plugin:GetSetting("Global") or {})));
    end;
    v25._deactivationListener = v25._plugin.Deactivation:Connect(function()
        v25.Activation:Fire(false);
        v25._enabled = false;
    end);
    return v25;
end;
v21.mock = function(v26)
    return v21.new(v26, true);
end;
v21.isMocking = function(v27)
    return v27._mock;
end;
v21.getPlugin = function(v28)
    return v28._plugin;
end;
v21.getEnabled = function(v29)
    return v29._enabled;
end;
v21.setGlobal = function(v30, v31, v32, v33)
    local l__store_0 = v30._store;
    l__store_0[v31][v32] = v33;
    if (v20() and v32 == l_BrushSettings_0.PlaneLock) and v33 == l_PlaneLock_0.Manual then
        local l_CFrame_0 = l_Workspace_0.CurrentCamera.CFrame;
        l__store_0[v31][l_BrushSettings_0.PlaneTransform] = CFrame.Angles(1.5707963267948966, 0, 0) + (l_CFrame_0.Position + l_CFrame_0.LookVector * 64);
    end;
    if not v19() then
        v30._plugin:SetSetting("Global", v15(v30._store));
        return ;
    else
        if v30._saveSettingsTask then
            task.cancel(v30._saveSettingsTask);
            v30._saveSettingsTask = nil;
        end;
        v30._saveSettingsTask = task.delay(1, function()
            v30._plugin:SetSetting("Global", v15(v30._store));
            v30._saveSettingsTask = nil;
        end);
        return ;
    end;
end;
v21.getGlobal = function(v36, v37, v38)
    return v36._store[v37][v38];
end;
v21.setSetting = function(v39, v40, v41)
    v39._plugin:SetSetting(v40, v15(v41));
end;
v21.getSetting = function(v42, v43)
    return v16(v42._plugin:GetSetting(v43) or {});
end;
v21.toggle = function(v44)
    if not v44._enabled then
        v44:enable();
        return ;
    else
        v44:disable();
        return ;
    end;
end;
v21.enable = function(v45)
    if not v45._enabled then
        v45._enabled = true;
        v45._plugin:Activate(true);
        return ;
    else
        return ;
    end;
end;
v21.disable = function(v46)
    if v46._enabled then
        v46._enabled = false;
        v46._plugin:Deactivate();
        return ;
    else
        return ;
    end;
end;
v21.resume = function(v47)
    v47.Focused:Fire(true);
    v47.Activation:Fire(true);
end;
v21.pause = function(v48)
    v48.Focused:Fire(false);
end;
v21.destroy = function(v49)
    if v49._deactivationListener then
        v49._deactivationListener:Disconnect();
        v49._deactivationListener = nil;
    end;
    v49:disable();
end;
v21.setRoot = function(v50, v51)
    v50._root = v51;
end;
v21.getRoot = function(v52)
    return v52._root;
end;
v21.setPluginWidth = function(v53, v54)
    local v55 = v53:getShouldBeCompact();
    v53._pluginWidth = v54;
    if v55 ~= v53:getShouldBeCompact() then
        v53.Compact:Fire();
    end;
end;
v21.getShouldBeCompact = function(v56)
    if not v56._pluginWidth then
        return false;
    else
        return v56._pluginWidth < v17.MinWindowWidth;
    end;
end;
return v21;
