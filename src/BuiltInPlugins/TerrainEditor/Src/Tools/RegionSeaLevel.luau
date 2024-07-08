local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v5 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v5.Category;
local l_FillMode_0 = v5.FillMode;
local l_Gizmo_0 = v5.Gizmo;
local l_MaterialSettings_0 = v5.MaterialSettings;
local l_SeaLevelSettings_0 = v5.SeaLevelSettings;
local l_SelectionSettings_0 = v5.SelectionSettings;
local l_Tab_0 = v5.Tab;
local l_Tool_0 = v5.Tool;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v15 = require(l_Util_0.AnalyticsHelper);
local v16 = require(l_Util_0.Operations.FillOperation);
local v17 = v2:new(l_Tool_0.SeaLevel, l_Tab_0.Edit, {
    {
        Defaults = {
            [l_SeaLevelSettings_0.Size] = Vector3.new(64, 32, 64), 
            [l_SeaLevelSettings_0.SnapToVoxels] = true, 
            [l_SeaLevelSettings_0.Transform] = CFrame.new()
        }, 
        Id = l_Category_0.SeaLevelSettings
    }
}, {
    {
        Id = l_Gizmo_0.Region, 
        Schema = {
            Type = l_Gizmo_0.Region, 
            Wireframe = false, 
            Rotation = false
        }
    }
});
v17.startOperation = function(v18, v19)
    if v4() then
        v2.startOperation(v18, v19);
    end;
    v18._operation:start(v19);
    v18.OnOperationChanged:Fire();
end;
v17.create = function(v20, v21)
    local v22 = v20:getPayload();
    v22 = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Replace, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Air, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Water
        }, 
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = v22[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Size], 
            [l_SelectionSettings_0.Transform] = v22[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Transform]
        }
    };
    v20._operation = v16(v20._localization:getText("Operations", "CreateName"), v20._localization:getText("Operations", "CreateDescription"), v20._services);
    v20._operationFinishedConnection = v20._operation.Finished:Connect(function()
        if not v3() then
            if not v20._operation:wasCanceled() then
                v20._analytics:report("RegionProperties", v15.getRegionPayload(v20:getPayload(), v20._operation:getTimeTaken(), l_Tool_0.SeaLevel));
                v20._analytics:report("Usage", l_Tool_0.SeaLevel, 1);
                if v20._operationFinishedConnection then
                    v20._operationFinishedConnection:Disconnect();
                    v20._operationFinishedConnection = nil;
                end;
            end;
            return ;
        else
            v20:finishOperation();
            return ;
        end;
    end);
    v20:startOperation(v1.join({
        Payload = v22
    }, v21));
end;
v17.evaporate = function(v23, v24)
    local v25 = v23:getPayload();
    v25 = {
        [l_Category_0.MaterialSettings] = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Replace, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Water, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Air
        }, 
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = v25[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Size], 
            [l_SelectionSettings_0.Transform] = v25[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Transform]
        }
    };
    v23._operation = v16(v23._localization:getText("Operations", "EvaporateName"), v23._localization:getText("Operations", "EvaporateDescription"), v23._services);
    v23:startOperation(v1.join({
        Payload = v25
    }, v24));
end;
v17.init = function(v26, v27, v28)
    v2.init(v26, v27, v28);
    v26._overrides = {
        [l_Category_0.SeaLevelSettings] = {
            [l_SeaLevelSettings_0.Evaporate] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function()
                        v26:evaporate();
                    end
                }, 
                Value = true
            }, 
            [l_SeaLevelSettings_0.Create] = {
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function()
                        v26:create();
                    end
                }, 
                Value = true
            }
        }
    };
end;
if v4() then
    v17.setDisabledState = function(v29)
        local v30 = v29:hasError();
        if v29._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Evaporate].Disabled ~= v30 and v29._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Create].Disabled ~= v30 then
            v29._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Evaporate].Disabled = v30;
            v29._overrides[l_Category_0.SeaLevelSettings][l_SeaLevelSettings_0.Create].Disabled = v30;
            v29.OnInternalsChanged:Fire();
        end;
    end;
end;
v17.operation = function(v31)
    return v31._operation;
end;
v17.activate = function(v32)
    v2.activate(v32);
    v32._analytics:report("Activated", l_Tool_0.SeaLevel);
end;
return v17;
