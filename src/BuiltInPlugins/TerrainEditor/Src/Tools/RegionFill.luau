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
local _ = v5.SelectionSettings;
local l_Tab_0 = v5.Tab;
local l_Tool_0 = v5.Tool;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v14 = require(l_Util_0.AnalyticsHelper);
local v15 = require(l_Util_0.Operations.FillOperation);
local v16 = v2:new(l_Tool_0.Fill, l_Tab_0.Edit, {
    {
        Defaults = {}, 
        Id = l_Category_0.SelectionSettings
    }, 
    {
        Defaults = {
            [l_MaterialSettings_0.FillMode] = l_FillMode_0.Fill, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Grass, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Grass
        }, 
        Id = l_Category_0.MaterialSettings
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
v16.startOperation = function(v17, v18)
    if v4() then
        v2.startOperation(v17, v18);
    end;
    local v19 = v17:getPayload();
    v17._operation = v15(v17._localization:getText("Operations", (("%*Name"):format(v19[l_Category_0.MaterialSettings][l_MaterialSettings_0.FillMode]))), if v19[l_Category_0.MaterialSettings][l_MaterialSettings_0.FillMode] == l_FillMode_0.Fill then v17._localization:getText("Operations", "FillDescription", {
        material = v17._localization:getText("Materials", v19[l_Category_0.MaterialSettings][l_MaterialSettings_0.SourceMaterial].Name)
    }) else v17._localization:getText("Operations", "ReplaceDescription", {
        source = v17._localization:getText("Materials", v19[l_Category_0.MaterialSettings][l_MaterialSettings_0.SourceMaterial].Name), 
        target = v17._localization:getText("Materials", v19[l_Category_0.MaterialSettings][l_MaterialSettings_0.TargetMaterial].Name)
    }), v17._services);
    v17._operationFinishedConnection = v17._operation.Finished:Connect(function()
        if not v3() then
            if not v17._operation:wasCanceled() then
                v17._analytics:report("RegionProperties", v14.getRegionPayload(v17:getPayload(), v17._operation:getTimeTaken(), l_Tool_0.Fill));
                v17._analytics:report("MaterialProperties", v14.getMaterialPayload(v19, l_Tool_0.Fill));
                v17._analytics:report("Usage", l_Tool_0.Fill, 1);
                if v17._operationFinishedConnection then
                    v17._operationFinishedConnection:Disconnect();
                    v17._operationFinishedConnection = nil;
                end;
            end;
            return ;
        else
            v17:finishOperation();
            return ;
        end;
    end);
    v17._operation:start(v1.join({
        Payload = v19
    }, v18));
    v17.OnOperationChanged:Fire();
end;
if v4() then
    v16.setDisabledState = function(v20)
        local v21 = v20:hasError();
        if v20._overrides[l_Category_0.MaterialSettings][l_MaterialSettings_0.Apply].Disabled ~= v21 then
            v20._overrides[l_Category_0.MaterialSettings][l_MaterialSettings_0.Apply].Disabled = v21;
            v20.OnInternalsChanged:Fire();
        end;
    end;
end;
v16.init = function(v22, v23, v24)
    v2.init(v22, v23, v24);
    if not v4() then
        v22._overrides = {
            [l_Category_0.TransformSettings] = {
                [l_MaterialSettings_0.SourceMaterial] = {
                    Schema = {
                        AllowAir = true
                    }
                }, 
                [l_MaterialSettings_0.TargetMaterial] = {
                    Schema = {
                        AllowAir = true
                    }
                }
            }, 
            [l_Category_0.MaterialSettings] = {
                [l_MaterialSettings_0.Apply] = {
                    Hidden = false, 
                    Label = "", 
                    Schema = {
                        OnClick = function()
                            v22:startOperation();
                        end
                    }, 
                    Value = true
                }
            }
        };
        return ;
    else
        v22._overrides = {
            [l_Category_0.MaterialSettings] = {
                [l_MaterialSettings_0.Apply] = {
                    Hidden = false, 
                    Label = "", 
                    Schema = {
                        OnClick = function()
                            v22:startOperation();
                        end
                    }, 
                    Value = true
                }
            }, 
            [l_MaterialSettings_0.SourceMaterial] = {
                Schema = {
                    AllowAir = true
                }
            }, 
            [l_MaterialSettings_0.TargetMaterial] = {
                Schema = {
                    AllowAir = true
                }
            }
        };
        return ;
    end;
end;
v16.operation = function(v25)
    return v25._operation;
end;
v16.activate = function(v26)
    v2.activate(v26);
    v26._analytics:report("Activated", l_Tool_0.Fill);
end;
return v16;
