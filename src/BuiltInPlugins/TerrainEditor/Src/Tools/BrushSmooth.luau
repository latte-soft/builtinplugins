local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(script.Parent.BaseTool);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorTimeStatistic);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Operations.SmoothOperation);
local v6 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v6.BrushSettings;
local l_BrushShape_0 = v6.BrushShape;
local l_Category_0 = v6.Category;
local l_Gizmo_0 = v6.Gizmo;
local l_PivotPosition_0 = v6.PivotPosition;
local l_Snapping_0 = v6.Snapping;
local l_Tab_0 = v6.Tab;
local l_Tool_0 = v6.Tool;
local v15 = v2:new(l_Tool_0.Smooth, l_Tab_0.Edit, {
    {
        Defaults = {
            [l_BrushSettings_0.BrushShape] = l_BrushShape_0.Sphere, 
            [l_BrushSettings_0.BrushSize] = {
                Height = 6, 
                Locked = true, 
                Size = 6
            }, 
            [l_BrushSettings_0.Strength] = 1, 
            [l_BrushSettings_0.PivotPosition] = l_PivotPosition_0.Center, 
            [l_BrushSettings_0.Snapping] = l_Snapping_0.Off, 
            [l_BrushSettings_0.State] = {
                Position = Vector3.new(0, 0, 0)
            }, 
            [l_BrushSettings_0.IgnoreWater] = false, 
            [l_BrushSettings_0.IgnoreParts] = true
        }, 
        Id = l_Category_0.BrushSettings
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
v15.init = function(v16, v17, v18)
    v2.init(v16, v17, v18);
    v16._brushTime = 0;
    v16._brushUsages = 0;
end;
v15.saveForm = function(v19, v20)
    v2.saveForm(v19, v20);
    if v19._operation then
        v19._operation:updatePayload(v19:getPayload());
    end;
end;
v15.saveGizmos = function(v21, v22)
    v2.saveGizmos(v21, v22);
    if v21._operation then
        v21._operation:updatePayload(v21:getPayload());
    end;
end;
v15.startOperation = function(v23, v24)
    v23._operation = v5("Smooth", v23._services);
    v23._operation:start(v1.join({
        Payload = v23:getPayload()
    }, v24));
end;
v15.activate = function(v25)
    v2.activate(v25);
    local v26 = v25._shortcutController:getMouse();
    v25._mouseDownConnection = v25._shortcutController.MouseDownAction:Connect(function()
        if not v25:getPayload()[l_Category_0.BrushSettings][l_BrushSettings_0.ManualPlaneLock] then
            v25:startOperation();
        end;
    end);
    v25._mouseUpConnection = v26.Button1Up:Connect(function()
        if not (not v25._operation or not v25._operation:isRunning()) then
            local l_v25_0 = v25;
            l_v25_0._brushUsages = l_v25_0._brushUsages + 1;
            v25._brushTime = v25._operation:getCurrentTimeTaken() / v25._operation:getStepsTaken();
            l_v25_0 = v25._operation:getTimeStatistic();
            if not (not v3() or not l_v25_0) then
                v25._brushStatistic = (v25._brushStatistic or 0) + l_v25_0;
            end;
            v25._operation:destroy();
        end;
    end);
    v25._analytics:report("Activated", l_Tool_0.Smooth);
end;
v15.deactivate = function(v28)
    v28._mouseDownConnection:Disconnect();
    v28._mouseUpConnection:Disconnect();
    if not (not v28._operation or not v28._operation:isRunning()) then
        v28._brushUsages = v28._brushUsages + 1;
        v28._brushTime = v28._operation:getCurrentTimeTaken() / v28._operation:getStepsTaken();
        local v29 = v28._operation:getTimeStatistic();
        if not (not v3() or not v29) then
            v28._brushStatistic = (v28._brushStatistic or 0) + v29;
        end;
        v28._operation:destroy();
    end;
    v2.deactivate(v28);
end;
v15.reportAnalytics = function(v30)
    local v31 = v30:getPayload();
    if v30._brushTime then
        v30._analytics:report("BrushProperties", v4.getBrushPayload(v31, v30._brushTime, l_Tool_0.Smooth));
        v30._analytics:report("Usage", l_Tool_0.Smooth, v30._brushUsages);
        if not (not v3() or not v30._brushStatistic) and v30._brushUsages > 0 then
            v30._analytics:report("Performance", l_Tool_0.Smooth, v30._brushStatistic / v30._brushUsages);
        end;
    end;
    v30._brushUsages = 0;
    v30._brushTime = 0;
    v30._brushStatistic = 0;
end;
return v15;
