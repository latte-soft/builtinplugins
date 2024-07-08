local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = v2.UI.Pane;
local v5 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.usePlane);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Grid);
local v8 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v8.BrushSettings;
local l_Category_0 = v8.Category;
local l_PlaneLock_0 = v8.PlaneLock;
local _ = v8.Tool;
return function(v13)
    local v14, v15 = v6(v13.Tool, v13.Value, v13.Save, v13.FromSelf);
    local v16 = v13.Value[l_Category_0.BrushSettings];
    if not (v16[l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual) or not v16[l_BrushSettings_0.ManualPlaneLock] then
        return nil;
    else
        return (v3.createElement(l_Pane_0, {}, {
            Dragger = if v14.Mock then nil else v3.createElement(v5, v14), 
            Grid = v3.createElement(v7, {
                AlwaysOnTop = v16[l_BrushSettings_0.ManualPlaneLock], 
                Size = v16[l_BrushSettings_0.BrushSize].Size, 
                Transform = v15
            })
        }));
    end;
end;
