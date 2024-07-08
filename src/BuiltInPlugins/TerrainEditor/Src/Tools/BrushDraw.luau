local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Operations.DrawOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v6.BrushMode;
local l_BrushSettings_0 = v6.BrushSettings;
local l_BrushShape_0 = v6.BrushShape;
local l_Category_0 = v6.Category;
local l_Gizmo_0 = v6.Gizmo;
local l_MaterialSettings_0 = v6.MaterialSettings;
local l_PivotPosition_0 = v6.PivotPosition;
local l_Snapping_0 = v6.Snapping;
local l_Tab_0 = v6.Tab;
local l_Tool_0 = v6.Tool;
local v17 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v18 = require(l_script_FirstAncestor_0.Src.Util.SettingsHelper);
local v19 = v2:new(l_Tool_0.Draw, l_Tab_0.Edit, {
    {
        Defaults = {
            [l_BrushSettings_0.BrushMode] = l_BrushMode_0.Add, 
            [l_BrushSettings_0.BrushShape] = l_BrushShape_0.Sphere, 
            [l_BrushSettings_0.BrushSize] = {
                Height = 6, 
                Locked = true, 
                Size = 6
            }, 
            [l_BrushSettings_0.PivotPosition] = l_PivotPosition_0.Center, 
            [l_BrushSettings_0.Snapping] = l_Snapping_0.Off, 
            [l_BrushSettings_0.State] = {
                Position = Vector3.new(0, 0, 0)
            }, 
            [l_BrushSettings_0.IgnoreWater] = false, 
            [l_BrushSettings_0.IgnoreParts] = true, 
            [l_BrushSettings_0.TemporarySmooth] = false, 
            [l_BrushSettings_0.WaterAutofill] = false
        }, 
        Id = l_Category_0.BrushSettings
    }, 
    {
        Defaults = {
            [l_MaterialSettings_0.AutoMaterial] = false, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Grass
        }, 
        Id = l_Category_0.MaterialSettings
    }
}, {
    {
        Id = l_Gizmo_0.Plane, 
        Schema = {
            Type = l_Gizmo_0.Plane
        }
    }, 
    {
        Id = l_Gizmo_0.Brush, 
        Schema = {
            Type = l_Gizmo_0.Brush
        }
    }
});
v19.init = function(v20, v21, v22)
    v2.init(v20, v21, v22);
    v20._overrides = {
        [l_Category_0.BrushSettings] = {
            [l_BrushSettings_0.ManualPlaneLock] = {
                Schema = {
                    OnReset = function()
                        v18.Set(l_Category_0.BrushSettings, v20._pluginController, {
                            [l_BrushSettings_0.PlaneTransform] = CFrame.Angles(1.5707963267948966, 0, 0)
                        });
                        task.spawn(function()
                            if not v4() then
                                v20.OnFormChanged:Fire();
                                v20.OnGizmoChanged:Fire();
                                return ;
                            else
                                v20.OnInternalsChanged:Fire();
                                return ;
                            end;
                        end);
                    end
                }
            }
        }
    };
    v20._brushTime = 0;
    v20._brushUsages = 0;
end;
v19.saveForm = function(v23, v24)
    v2.saveForm(v23, v24);
    if v23._operation then
        v23._operation:updatePayload(v23:getPayload());
    end;
end;
v19.saveGizmos = function(v25, v26)
    v2.saveGizmos(v25, v26);
    if v25._operation then
        v25._operation:updatePayload(v25:getPayload());
    end;
end;
v19.startOperation = function(v27, v28)
    v27._operation = v5("Draw", v27._services);
    v27._operation:start(v1.join({
        Payload = v27:getPayload()
    }, v28));
end;
v19.activate = function(v29)
    v2.activate(v29);
    local v30 = v29._shortcutController:getMouse();
    v29._mouseDownConnection = v29._shortcutController.MouseDownAction:Connect(function()
        if not v29:getPayload()[l_Category_0.BrushSettings][l_BrushSettings_0.ManualPlaneLock] then
            v29:startOperation();
        end;
    end);
    v29._mouseUpConnection = v30.Button1Up:Connect(function()
        if not (not v29._operation or not v29._operation:isRunning()) then
            local l_v29_0 = v29;
            l_v29_0._brushUsages = l_v29_0._brushUsages + 1;
            v29._brushTime = v29._operation:getCurrentTimeTaken() / v29._operation:getStepsTaken();
            l_v29_0 = v29._operation:getTimeStatistic();
            if not (not v3() or not l_v29_0) then
                v29._brushStatistic = (v29._brushStatistic or 0) + l_v29_0;
            end;
            v29._operation:destroy();
        end;
    end);
    v29._analytics:report("Activated", l_Tool_0.Draw);
end;
v19.deactivate = function(v32)
    v32._mouseDownConnection:Disconnect();
    v32._mouseUpConnection:Disconnect();
    if not (not v32._operation or not v32._operation:isRunning()) then
        v32._brushUsages = v32._brushUsages + 1;
        v32._brushTime = v32._operation:getCurrentTimeTaken() / v32._operation:getStepsTaken();
        local v33 = v32._operation:getTimeStatistic();
        if not (not v3() or not v33) then
            v32._brushStatistic = (v32._brushStatistic or 0) + v33;
        end;
        v32._operation:destroy();
    end;
    v2.deactivate(v32);
end;
v19.reportAnalytics = function(v34)
    local v35 = v34:getPayload();
    if v34._brushTime and v34._brushTime > 0 then
        v34._analytics:report("BrushProperties", v17.getBrushPayload(v35, v34._brushTime, l_Tool_0.Draw));
        v34._analytics:report("MaterialProperties", v17.getMaterialPayload(v35, l_Tool_0.Draw));
        v34._analytics:report("Usage", l_Tool_0.Draw, v34._brushUsages);
        if not (not v3() or not v34._brushStatistic) and v34._brushUsages > 0 then
            v34._analytics:report("Performance", l_Tool_0.Draw, v34._brushStatistic / v34._brushUsages);
        end;
    end;
    v34._brushUsages = 0;
    v34._brushTime = 0;
    v34._brushStatistic = 0;
end;
return v19;
