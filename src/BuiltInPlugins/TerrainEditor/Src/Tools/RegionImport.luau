local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v6 = require(l_Util_0.AnalyticsHelper);
local v7 = require(l_Util_0.ConvertTransformToRegion);
local v8 = require(l_Util_0.hasCorrectAspectRatio);
local v9 = require(l_Util_0.hasCorrectScaling);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Operations.ImportOperation);
local v11 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v12 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v12.Category;
local l_Gizmo_0 = v12.Gizmo;
local l_HeightmapSettings_0 = v12.HeightmapSettings;
local l_SelectionSettings_0 = v12.SelectionSettings;
local l_Tab_0 = v12.Tab;
local l_Tool_0 = v12.Tool;
local v19 = v2:new(l_Tool_0.Import, l_Tab_0.Create, {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }, 
    {
        Defaults = {
            [l_HeightmapSettings_0.Colormap] = {
                Error = ""
            }, 
            [l_HeightmapSettings_0.DefaultMaterial] = Enum.Material.Grass, 
            [l_HeightmapSettings_0.Heightmap] = {
                Error = ""
            }, 
            [l_HeightmapSettings_0.Import] = true
        }, 
        Id = l_Category_0.HeightmapSettings
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
v19.startOperation = function(v20, v21)
    if v4() then
        v2.startOperation(v20, v21);
    end;
    local v22 = v20:getPayload();
    local v23 = v20._localization:getText("Operations", "ImportName");
    local v24 = v20._localization:getText("Operations", "ImportDescription");
    v20._region = v7(v22[l_Category_0.SelectionSettings][l_SelectionSettings_0.Transform], v22[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size], true);
    v20._terrainRegion = v20._services.Terrain:CopyRegion(v20._region);
    v20._operation = v10(v23, v24, v20._services);
    v20._operationFinishedConnection = v20._operation.Finished:Connect(function()
        if not v3() then
            if not v20._operation:wasCanceled() then
                if v4() then
                    v20._isRunning = false;
                end;
                v20._analytics:report("RegionProperties", v6.getRegionPayload(v20:getPayload(), v20._operation:getTimeTaken(), l_Tool_0.Import));
                v20._analytics:report("Usage", l_Tool_0.Import, 1);
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
    v20._operation:start(v1.join({
        Payload = v22
    }, v21));
    v20.OnOperationChanged:Fire();
end;
v19.init = function(v25, v26, v27)
    v2.init(v25, v26, v27);
    local v28 = v25:getPayload()[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
    local v33 = {
        [l_Category_0.SelectionSettings] = {
            [l_SelectionSettings_0.Size] = {
                Validate = function(v29)
                    if not (v29.X >= v11.VoxelResolution and v29.Y >= v11.VoxelResolution) or v29.Z < v11.VoxelResolution then
                        return Enum.PropertyStatus.Error, v25._localization:getText("SelectionWarning", "Size");
                    elseif v11.MaxImportVolume < (v29.X * v29.Y) * v29.Z then
                        return Enum.PropertyStatus.Error, v25._localization:getText("ImportWarning", "Volume");
                    else
                        local l_Image_0 = v25._sessionUserSettings[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Heightmap].Image;
                        if l_Image_0 then
                            local v31, v32 = v8(l_Image_0, v29);
                            if v31 then
                                if v9(l_Image_0, v29) then
                                    return Enum.PropertyStatus.Ok, "";
                                else
                                    return Enum.PropertyStatus.Warning, v25._localization:getText("ImportWarning", "Scaling", {
                                        ImageWidth = l_Image_0.Width, 
                                        ImageHeight = l_Image_0.Height, 
                                        RegionWidth = v29.X, 
                                        RegionHeight = v29.Z
                                    });
                                end;
                            else
                                return Enum.PropertyStatus.Warning, v25._localization:getText("ImportWarning", "AspectRatio", {
                                    ImageAspectRatio = v32, 
                                    RegionWidth = v29.X, 
                                    RegionHeight = v29.Z
                                });
                            end;
                        else
                            return Enum.PropertyStatus.Ok, "";
                        end;
                    end;
                end
            }
        }
    };
    local l_HeightmapSettings_1 = l_Category_0.HeightmapSettings;
    local v35 = {};
    local l_Import_0 = l_HeightmapSettings_0.Import;
    local v37 = {};
    local v38;
    if v4() then
        v38 = nil;
    else
        v38 = not v25._sessionUserSettings[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Heightmap].Image;
        if not v38 then
            v38 = true;
            if v11.MaxImportVolume >= (v28.X * v28.Y) * v28.Z then
                v38 = true;
                if v28.X >= v11.VoxelResolution then
                    v38 = true;
                    if v28.Y >= v11.VoxelResolution then
                        v38 = v28.Z < v11.VoxelResolution;
                    end;
                end;
            end;
        end;
    end;
    v37.Disabled = v38;
    v37.Hidden = false;
    v37.Label = "";
    v37.Schema = {
        OnClick = function()
            v25:startOperation();
        end
    };
    v35[l_Import_0] = v37;
    v33[l_HeightmapSettings_1] = v35;
    v25._overrides = v33;
end;
v19.operation = function(v39)
    return v39._operation;
end;
if v4() then
    v19.setDisabledState = function(v40)
        local v41 = v40:hasError();
        if v40._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled ~= v41 then
            v40._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled = v41;
            v40.OnInternalsChanged:Fire();
        end;
    end;
end;
v19.saveForm = function(v42, v43)
    v2.saveForm(v42, v43);
    if not v4() then
        local v44 = v42:getPayload()[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        local v45 = not v42._sessionUserSettings[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Heightmap].Image;
        if not v45 then
            v45 = true;
            if v11.MaxImportVolume >= (v44.X * v44.Y) * v44.Z then
                v45 = true;
                if v44.X >= v11.VoxelResolution then
                    v45 = true;
                    if v44.Y >= v11.VoxelResolution then
                        v45 = v44.Z < v11.VoxelResolution;
                    end;
                end;
            end;
        end;
        if v42._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled ~= v45 then
            v42._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import].Disabled = v45;
            v42.OnGizmoChanged:Fire();
        end;
        return ;
    else
        v42:setDisabledState();
        return ;
    end;
end;
v19.activate = function(v46)
    v2.activate(v46);
    if not v4() then
        local v47 = v46:getPayload()[l_Category_0.SelectionSettings][l_SelectionSettings_0.Size];
        local v48 = v46._overrides[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Import];
        local v49 = not v46._sessionUserSettings[l_Category_0.HeightmapSettings][l_HeightmapSettings_0.Heightmap].Image;
        if not v49 then
            v49 = true;
            if v11.MaxImportVolume >= (v47.X * v47.Y) * v47.Z then
                v49 = true;
                if v47.X >= v11.VoxelResolution then
                    v49 = true;
                    if v47.Y >= v11.VoxelResolution then
                        v49 = v47.Z < v11.VoxelResolution;
                    end;
                end;
            end;
        end;
        v48.Disabled = v49;
        v46.OnGizmoChanged:Fire();
    end;
    v46._analytics:report("Activated", l_Tool_0.Import);
end;
return v19;
