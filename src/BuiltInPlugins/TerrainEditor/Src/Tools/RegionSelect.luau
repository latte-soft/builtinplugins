local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_FillMode_0 = v2.FillMode;
local l_Gizmo_0 = v2.Gizmo;
local l_MaterialSettings_0 = v2.MaterialSettings;
local l_PluginAction_0 = v2.PluginAction;
local l_SelectionSettings_0 = v2.SelectionSettings;
local l_Tab_0 = v2.Tab;
local l_Tool_0 = v2.Tool;
local l_TransformMode_0 = v2.TransformMode;
local l_TransformSettings_0 = v2.TransformSettings;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v14 = require(l_Util_0.ConvertTransformToRegion);
local v15 = require(l_Util_0.Operations.FillOperation);
local v16 = require(l_Util_0.SettingsHelper);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v18 = v1:new(l_Tool_0.Select, l_Tab_0.Edit, {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }
}, {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = true, 
            Rotation = false
        }
    }
});
v18.fillAir = function(v19, v20)
    local v21 = v19:getPayload();
    v21 = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Fill, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Air
        }, 
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = v21[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], 
            [l_SelectionSettings_0.Transform] = v21[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform]
        }
    };
    v19._operation = v15(v19._localization:getText("Operations", (("%*Name"):format(v20))), v19._localization:getText("Operations", (("%*Description"):format(v20))), v19._services);
    v19._operation:start({
        Payload = v21
    });
end;
v18.copy = function(v22)
    if not v17() or not v22:hasError() then
        local v23 = v16.Get(l_Category_0.SelectionSettings, v22._pluginController, v22._persistentUserSettings);
        v22._analytics:report("Activated", "Copy");
        v16.Set(l_Category_0.TransformSettings, v22._pluginController, {
            [l_TransformSettings_0.TerrainRegionBuffer] = v22._services.Terrain:CopyRegion(v14(v23[l_SelectionSettings_0.Transform], v23[l_SelectionSettings_0.Size], true)), 
            [l_TransformSettings_0.TerrainRegionBufferSize] = v23[l_SelectionSettings_0.Size], 
            [l_TransformSettings_0.TerrainRegionBufferTransform] = v23[l_SelectionSettings_0.Transform]
        });
        return ;
    else
        return ;
    end;
end;
v18.delete = function(v24)
    if not v17() or not v24:hasError() then
        v24._analytics:report("Activated", "Delete");
        v24:fillAir("Delete");
        return ;
    else
        return ;
    end;
end;
v18.cut = function(v25)
    if not v17() or not v25:hasError() then
        local v26 = v16.Get(l_Category_0.SelectionSettings, v25._pluginController, v25._persistentUserSettings);
        v25._analytics:report("Activated", "Cut");
        local v27 = v25._services.Terrain:CopyRegion(v14(v26[l_SelectionSettings_0.Transform], v26[l_SelectionSettings_0.Size], true));
        v25:fillAir("Cut");
        v16.Set(l_Category_0.TransformSettings, v25._pluginController, {
            [l_TransformSettings_0.TerrainRegionBuffer] = v27, 
            [l_TransformSettings_0.TerrainRegionBufferSize] = v26[l_SelectionSettings_0.Size], 
            [l_TransformSettings_0.TerrainRegionBufferTransform] = v26[l_SelectionSettings_0.Transform]
        });
        return ;
    else
        return ;
    end;
end;
v18.paste = function(v28)
    if not v17() or not v28:hasError() then
        local v29 = v16.Get(l_Category_0.TransformSettings, v28._pluginController, v28._persistentUserSettings);
        v28._analytics:report("Activated", "Paste");
        if v29[l_TransformSettings_0.TerrainRegionBuffer] then
            v16.Set(l_Category_0.TransformSettings, v28._pluginController, {
                [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Paste
            });
            v28._toolController.selectTool(l_Tool_0.Transform);
        end;
        return ;
    else
        return ;
    end;
end;
v18.duplicate = function(v30)
    if not v17() or not v30:hasError() then
        local v31 = v16.Get(l_Category_0.SelectionSettings, v30._pluginController, v30._persistentUserSettings);
        v30._analytics:report("Activated", "Duplicate");
        v16.Set(l_Category_0.TransformSettings, v30._pluginController, {
            [l_TransformSettings_0.TerrainRegion] = v30._services.Terrain:CopyRegion(v14(v31[l_SelectionSettings_0.Transform], v31[l_SelectionSettings_0.Size], true)), 
            [l_TransformSettings_0.TerrainRegionSize] = v31[l_SelectionSettings_0.Size], 
            [l_TransformSettings_0.TerrainRegionTransform] = v31[l_SelectionSettings_0.Transform], 
            [l_TransformSettings_0.TransformMode] = l_TransformMode_0.Duplicate
        });
        v30._toolController.selectTool(l_Tool_0.Transform);
        return ;
    else
        return ;
    end;
end;
v18.operation = function(v32)
    return v32._operation;
end;
v18.activate = function(v33)
    v1.activate(v33);
    v33._pluginActions = {
        [l_PluginAction_0.CopySelected] = function()
            v33:copy();
        end, 
        [l_PluginAction_0.CutSelected] = function()
            v33:cut();
        end, 
        [l_PluginAction_0.DeleteSelected] = function()
            v33:delete();
        end, 
        [l_PluginAction_0.PasteSelected] = function()
            v33:paste();
        end, 
        [l_PluginAction_0.DuplicateSelected] = function()
            v33:duplicate();
        end
    };
    v33._connections = {};
    for v34, v35 in v33._pluginActions, nil, nil do
        v33._connections[v34] = v33._shortcutController:Connect(v34, v35);
        v33._shortcutController:Enable(v34);
    end;
    v33._selection = v33._services.Selection:Get() or {};
    v33._services.Selection:Set({});
    if not v33._onSelectionChanged then
        v33._onSelectionChanged = v33._services.Selection.SelectionChanged:Connect(function()
            if not v33._pluginController:getEnabled() then
                v33._selection = v33._services.Selection:Get() or {};
                return ;
            else
                task.defer(function()
                    v33._services.Selection:Set({});
                end);
                return ;
            end;
        end);
    end;
    v33._analytics:report("Activated", l_Tool_0.Select);
end;
v18.deactivate = function(v36)
    if v36._onSelectionChanged then
        v36._onSelectionChanged:Disconnect();
        v36._onSelectionChanged = nil;
    end;
    v36._services.Selection:Set(v36._selection);
    v1.deactivate(v36);
    for v37 in v36._pluginActions, nil, nil do
        v36._shortcutController:Disable(v37);
    end;
    for _, v39 in v36._connections, nil, nil do
        v39:Disconnect();
    end;
    v36._connections = nil;
end;
return v18;
