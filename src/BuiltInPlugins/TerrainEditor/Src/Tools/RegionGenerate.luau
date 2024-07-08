local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local _ = l_script_FirstAncestor_0.Src.Schemas.Settings;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.AnalyticsHelper);
local v6 = require(l_Util_0.ConvertTransformToRegion);
local _ = require(l_Util_0.SettingsHelper);
local v8 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Operations.GenerateOperation);
local v10 = require(l_script_FirstAncestor_0.Src.Types);
local l_Biome_0 = v10.Biome;
local l_BiomeSettings_0 = v10.BiomeSettings;
local l_Category_0 = v10.Category;
local l_Gizmo_0 = v10.Gizmo;
local l_SelectionSettings_0 = v10.SelectionSettings;
local l_Tab_0 = v10.Tab;
local l_Tool_0 = v10.Tool;
local _ = v10.TransformMode;
local _ = v10.TransformSettings;
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v22 = v2:new(l_Tool_0.Generate, l_Tab_0.Create, {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }, 
    {
        Defaults = {
            [l_BiomeSettings_0.Biomes] = {
                [l_Biome_0.Mountains] = true, 
                [l_Biome_0.Hills] = true, 
                [l_Biome_0.Plains] = true
            }, 
            [l_BiomeSettings_0.BiomeBlending] = 0.25, 
            [l_BiomeSettings_0.BiomeSize] = 100, 
            [l_BiomeSettings_0.Caves] = true, 
            [l_BiomeSettings_0.Seed] = 618033988
        }, 
        Id = l_Category_0.BiomeSettings
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
local _ = function(v23)
    for _, v25 in v23, nil, nil do
        if v25 then
            return false;
        end;
    end;
    return true;
end;
v22.startOperation = function(v27, v28)
    if v21() then
        v2.startOperation(v27, v28);
    end;
    local v29 = v27:getPayload();
    local v30 = v27._localization:getText("Operations", "GenerateName");
    local v31 = v27._localization:getText("Operations", "GenerateDescription");
    v27._region = v6(v29[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform], v29[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], true);
    v27._terrainRegion = v27._services.Terrain:CopyRegion(v27._region);
    v27._operation = v9(v30, v31, v27._services);
    v27._operationFinishedConnection = v27._operation.Finished:Connect(function()
        if not v20() then
            if not v27._operation:wasCanceled() then
                v27._analytics:report("RegionProperties", v5.getRegionPayload(v27:getPayload(), v27._operation:getTimeTaken(), l_Tool_0.Generate));
                v27._analytics:report("Usage", l_Tool_0.Generate, 1);
                if v27._operationFinishedConnection then
                    v27._operationFinishedConnection:Disconnect();
                    v27._operationFinishedConnection = nil;
                end;
            end;
            return ;
        else
            v27:finishOperation();
            return ;
        end;
    end);
    v27._operation:start(v1.join({
        Payload = v29
    }, v28));
    v27.OnOperationChanged:Fire();
end;
if not v21() then
    v22.shouldBeDisabled = function(v32, _)
        local v34 = v32:getPayload();
        local l__biomeSizeUndefined_0 = v32._biomeSizeUndefined;
        if not l__biomeSizeUndefined_0 then
            l__biomeSizeUndefined_0 = v32._seedUndefined;
            if not l__biomeSizeUndefined_0 then
                for _, v37 in v34[l_Category_0.BiomeSettings][l_BiomeSettings_0.Biomes], nil, nil do
                    if v37 then
                        return false;
                    end;
                end;
                l__biomeSizeUndefined_0 = true;
            end;
        end;
        return l__biomeSizeUndefined_0;
    end;
    v22.validateNumberValue = function(v38, v39)
        if tonumber(v39) then
            return Enum.PropertyStatus.Ok;
        else
            return Enum.PropertyStatus.Error, v38._localization:getText("NumberWarning", "Invalid Number");
        end;
    end;
    v22.init = function(v40, v41, v42)
        v2.init(v40, v41, v42);
        local _ = v40:getPayload();
        v40._overrides = {
            [l_Category_0.BiomeSettings] = {
                [l_BiomeSettings_0.BiomeSize] = {
                    Validate = function(v44)
                        local v45, v46 = v40:validateNumberValue(v44);
                        v40._biomeSizeUndefined = v45 == Enum.PropertyStatus.Error;
                        local v47 = v40:shouldBeDisabled(v40:getPayload());
                        if v40._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled ~= v47 then
                            v40._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled = v47;
                            v40.OnGizmoChanged:Fire();
                        end;
                        return v45, v46;
                    end
                }, 
                [l_BiomeSettings_0.Seed] = {
                    Validate = function(v48)
                        local v49, v50 = v40:validateNumberValue(v48);
                        v40._seedUndefined = v49 == Enum.PropertyStatus.Error;
                        local v51 = v40:shouldBeDisabled(v40:getPayload());
                        if v40._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled ~= v51 then
                            v40._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled = v51;
                            v40.OnGizmoChanged:Fire();
                        end;
                        return v49, v50;
                    end
                }, 
                [l_BiomeSettings_0.Generate] = {
                    Disabled = v40:shouldBeDisabled(v40:getPayload()), 
                    Hidden = false, 
                    Label = "", 
                    Schema = {
                        OnClick = function()
                            v40:startOperation();
                        end
                    }, 
                    Value = true
                }
            }
        };
    end;
    v22.saveForm = function(v52, v53)
        v2.saveForm(v52, v53);
        v52._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled = v52:shouldBeDisabled(v53);
    end;
else
    v22.setDisabledState = function(v54)
        local v55 = v54:hasError();
        if v54._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled ~= v55 then
            v54._overrides[l_Category_0.BiomeSettings][l_BiomeSettings_0.Generate].Disabled = v55;
            v54.OnInternalsChanged:Fire();
        end;
    end;
    v22.init = function(v56, v57, v58)
        v2.init(v56, v57, v58);
        local _ = v56:getPayload();
        v56._overrides = {
            [l_Category_0.SelectionSettings] = {
                [l_SelectionSettings_0.Size] = {
                    Validate = function(v60)
                        if not (v60.X >= v8.VoxelResolution and v60.Y >= v8.VoxelResolution) or v60.Z < v8.VoxelResolution then
                            return Enum.PropertyStatus.Error, v56._localization:getText("SelectionWarning", "Size");
                        elseif v8.MaxImportVolume < (v60.X * v60.Y) * v60.Z then
                            return Enum.PropertyStatus.Error, v56._localization:getText("ImportWarning", "Volume");
                        else
                            return Enum.PropertyStatus.Ok, "";
                        end;
                    end
                }
            }, 
            [l_Category_0.BiomeSettings] = {
                [l_BiomeSettings_0.Generate] = {
                    Hidden = false, 
                    Label = "", 
                    Schema = {
                        OnClick = function()
                            v56:startOperation();
                        end
                    }, 
                    Value = true
                }
            }
        };
    end;
    v22.saveForm = function(v61, v62)
        v2.saveForm(v61, v62);
    end;
end;
v22.operation = function(v63)
    return v63._operation;
end;
v22.activate = function(v64)
    v2.activate(v64);
    v64._analytics:report("Activated", l_Tool_0.Generate);
end;
return v22;
