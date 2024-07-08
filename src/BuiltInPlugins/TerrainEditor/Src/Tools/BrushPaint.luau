local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Operations.PaintOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v6.BrushSettings;
local l_BrushShape_0 = v6.BrushShape;
local l_Category_0 = v6.Category;
local l_Gizmo_0 = v6.Gizmo;
local l_MaterialMode_0 = v6.MaterialMode;
local l_MaterialSettings_0 = v6.MaterialSettings;
local l_PivotPosition_0 = v6.PivotPosition;
local l_Snapping_0 = v6.Snapping;
local l_Tab_0 = v6.Tab;
local l_Tool_0 = v6.Tool;
local v17 = v2:new(l_Tool_0.Paint, l_Tab_0.Edit, {
    {
        Defaults = {
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
            [l_BrushSettings_0.IgnoreParts] = true
        }, 
        Id = l_Category_0.BrushSettings
    }, 
    {
        Defaults = {
            [l_MaterialSettings_0.MaterialMode] = l_MaterialMode_0.Paint, 
            [l_MaterialSettings_0.SourceMaterial] = Enum.Material.Grass, 
            [l_MaterialSettings_0.TargetMaterial] = Enum.Material.Grass
        }, 
        Id = l_Category_0.MaterialSettings
    }
}, {
    {
        Id = l_Gizmo_0.Brush, 
        Schema = {
            Type = l_Gizmo_0.Brush
        }
    }, 
    {
        Id = l_Gizmo_0.Plane, 
        Schema = {
            Type = l_Gizmo_0.Plane
        }
    }
});
v17.init = function(v18, v19, v20)
    v2.init(v18, v19, v20);
    v18._overrides = {
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
        }
    };
    v18._brushTime = 0;
    v18._brushUsages = 0;
end;
v17.saveForm = function(v21, v22)
    v2.saveForm(v21, v22);
    if v21._operation then
        v21._operation:updatePayload(v21:getPayload());
    end;
end;
v17.saveGizmos = function(v23, v24)
    v2.saveGizmos(v23, v24);
    if v23._operation then
        v23._operation:updatePayload(v23:getPayload());
    end;
end;
v17.startOperation = function(v25, v26)
    v25._operation = v5("Paint", v25._services);
    v25._operation:start(v1.join({
        Payload = v25:getPayload()
    }, v26));
end;
v17.activate = function(v27)
    v2.activate(v27);
    local v28 = v27._shortcutController:getMouse();
    v27._mouseDownConnection = v27._shortcutController.MouseDownAction:Connect(function()
        if not v27:getPayload()[l_Category_0.BrushSettings][l_BrushSettings_0.ManualPlaneLock] then
            v27:startOperation();
        end;
    end);
    v27._mouseUpConnection = v28.Button1Up:Connect(function()
        if not (not v27._operation or not v27._operation:isRunning()) then
            local l_v27_0 = v27;
            l_v27_0._brushUsages = l_v27_0._brushUsages + 1;
            v27._brushTime = v27._operation:getCurrentTimeTaken() / v27._operation:getStepsTaken();
            l_v27_0 = v27._operation:getTimeStatistic();
            if not (not v3() or not l_v27_0) then
                v27._brushStatistic = (v27._brushStatistic or 0) + l_v27_0;
            end;
            v27._operation:destroy();
        end;
    end);
    v27._analytics:report("Activated", l_Tool_0.Paint);
end;
v17.deactivate = function(v30)
    v30._mouseDownConnection:Disconnect();
    v30._mouseUpConnection:Disconnect();
    if not (not v30._operation or not v30._operation:isRunning()) then
        v30._brushUsages = v30._brushUsages + 1;
        v30._brushTime = v30._operation:getCurrentTimeTaken() / v30._operation:getStepsTaken();
        local v31 = v30._operation:getTimeStatistic();
        if not (not v3() or not v31) then
            v30._brushStatistic = (v30._brushStatistic or 0) + v31;
        end;
        v30._operation:destroy();
    end;
    v2.deactivate(v30);
end;
v17.reportAnalytics = function(v32)
    local v33 = v32:getPayload();
    if v32._brushTime and v32._brushTime > 0 then
        v32._analytics:report("BrushProperties", v4.getBrushPayload(v33, v32._brushTime, l_Tool_0.Paint));
        v32._analytics:report("MaterialProperties", v4.getMaterialPayload(v33, l_Tool_0.Paint));
        v32._analytics:report("Usage", l_Tool_0.Paint, v32._brushUsages);
        if not (not v3() or not v32._brushStatistic) and v32._brushUsages > 0 then
            v32._analytics:report("Performance", l_Tool_0.Paint, v32._brushStatistic / v32._brushUsages);
        end;
    end;
    v32._brushUsages = 0;
    v32._brushTime = 0;
    v32._brushStatistic = 0;
end;
return v17;
