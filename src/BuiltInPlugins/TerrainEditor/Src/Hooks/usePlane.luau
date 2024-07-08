local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v9 = require(l_script_FirstAncestor_0.Src.Schemas.Plane);
local v10 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v11 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v12 = require(l_DraggerFramework_0.Handles.RotateHandles);
local v13 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v13.BrushSettings;
local l_Category_0 = v13.Category;
return function(v16, v17, v18, v19)
    local v20 = v7:use();
    local v21 = v8:use();
    local v22 = l_useMemo_0(function()
        return v9.Selection.new(v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform]);
    end, {
        v16
    });
    local v23, v24 = l_useState_0(v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform]);
    local v26 = l_useCallback_0(function(v25)
        v18({
            [l_Category_0.BrushSettings] = {
                [l_BrushSettings_0.PlaneTransform] = v25
            }
        });
        v24(v25);
    end, {
        v17
    });
    local v28 = l_useCallback_0(function(v27)
        v22:SetTransform(v27);
        v26(v27);
    end, {
        v22, 
        v26
    });
    local v30 = l_useMemo_0(function()
        if not v20:isMocking() then
            local v29 = v10.new(l_script_FirstAncestor_0.Parent, game, settings(), v22);
            v29.updatePlane = v28;
            v29.Mock = false;
            return {
                Mouse = v21:getMouse(), 
                DraggerContext = v29, 
                DraggerSchema = v9, 
                DraggerSettings = {
                    AnalyticsName = "AdjustablePlaneLock", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true, 
                    HandlesList = {
                        v11.new(v29, {
                            ShowBoundingBox = false, 
                            Summonable = false, 
                            Outset = 1
                        }, v9.TransformHandlesImplementation.new(v29)), 
                        v12.new(v29, {
                            ShowBoundingBox = false, 
                            Summonable = false, 
                            Outset = 1
                        }, v9.TransformHandlesImplementation.new(v29))
                    }
                }
            };
        else
            return {
                DraggerContext = {}, 
                Mock = true
            };
        end;
    end, {
        v16
    });
    l_useEffect_0(function()
        v30.DraggerContext.updatePlane = v28;
    end, {
        v28
    });
    l_useEffect_0(function()
        local v31 = v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform];
        if not v19 then
            v22:SetTransformSignal(v31);
            v24(v31);
        end;
    end, {
        v16, 
        v17[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform]
    });
    return v30, v23;
end;
