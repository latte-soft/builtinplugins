local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v6 = require(l_Hooks_0.useRaycast);
local v7 = require(l_Hooks_0.useTerrain);
local v8 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.ConvertForPivot);
local v10 = require(script.Box);
local v11 = require(script.Cylinder);
local v12 = require(script.Sphere);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Grid);
local v14 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v14.BrushSettings;
local l_BrushShape_0 = v14.BrushShape;
local l_Category_0 = v14.Category;
local l_FlattenPlane_0 = v14.FlattenPlane;
local l_PlaneLock_0 = v14.PlaneLock;
local l_Tool_0 = v14.Tool;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v23)
    local v24 = v7();
    local v25 = v23.Value[l_Category_0.BrushSettings];
    local v26 = v25[l_BrushSettings_0.BrushShape];
    local v27 = v25[l_BrushSettings_0.BrushSize];
    local v28 = v27.Size * v8.VoxelResolution;
    local v29 = if v26 == l_BrushShape_0.Sphere then v28 else v27.Height * v8.VoxelResolution;
    local v30 = v25[l_BrushSettings_0.PlaneLock];
    local v31 = v25[l_BrushSettings_0.PlaneTransform];
    local v32 = v25[l_BrushSettings_0.ManualPlaneLock];
    local v34, v35 = v6(v23.Tool, v23.Value, (not not v32 and v30 == l_PlaneLock_0.Manual) and function(_)
    end or v23.Save);
    local v36 = v9(v25[l_BrushSettings_0.PivotPosition], v34.Position, v29);
    local v37 = l_Stylizer_0:use("Brush");
    local v38 = v37.CenterRadiusMultiplier * v34.Distance;
    local l_CenterTransparency_0 = v37.CenterTransparency;
    local l_Color_0 = v37.Color;
    local l_MainTransparency_0 = v37.MainTransparency;
    local v42 = if v30 == l_PlaneLock_0.Manual then v31 else CFrame.lookAt(Vector3.new(), v35.Normal);
    local v43 = v9(v25[l_BrushSettings_0.PivotPosition], v35.Position, v29);
    local v44 = false;
    if v30 ~= l_PlaneLock_0.Off then
        v44 = not v32;
    end;
    local v45 = if v30 == l_PlaneLock_0.Manual then (v31 - v31.Position) + v43 else CFrame.lookAt(v43, v43 + v35.Normal);
    if v23.Tool == l_Tool_0.Flatten then
        v44 = true;
        if v25[l_BrushSettings_0.FlattenPlane] == l_FlattenPlane_0.Auto then
            v42 = CFrame.lookAt(Vector3.new(), Vector3.yAxis);
            v45 = CFrame.lookAt(v43, v43 + Vector3.yAxis);
        else
            v42 = CFrame.lookAt(Vector3.new(), Vector3.yAxis);
            v43 = Vector3.new(v43.X, 0, v43.Z) + Vector3.yAxis * v25[l_BrushSettings_0.FixedYPlane];
            v45 = CFrame.lookAt(v43, v43 + Vector3.yAxis);
        end;
    end;
    if v32 and v30 == l_PlaneLock_0.Manual then
        return nil;
    else
        return v3.createPortal({
            BrushVisual = v2.createElement("Folder", {}, {
                Cursor = if v26 == l_BrushShape_0.Sphere then v2.createElement(v12, {
                    Adornee = v24, 
                    CFrame = CFrame.new(v36), 
                    Color = l_Color_0, 
                    Radius = v28 / 2, 
                    Transparency = l_MainTransparency_0
                }) else if v26 == l_BrushShape_0.Cube then v2.createElement(v10, {
                    Adornee = v24, 
                    CFrame = CFrame.new(v36), 
                    Color = l_Color_0, 
                    Size = Vector3.new(v28, v29, v28), 
                    Transparency = l_MainTransparency_0
                }) else if v26 == l_BrushShape_0.Cylinder then v2.createElement(v11, {
                    Adornee = v24, 
                    CFrame = CFrame.Angles(1.5707963267948966, 0, 0) + v36, 
                    Color = l_Color_0, 
                    Height = v29, 
                    Radius = v28 / 2, 
                    Transparency = l_MainTransparency_0
                }) else nil, 
                Central = v2.createElement("SphereHandleAdornment", {
                    Adornee = v24, 
                    AlwaysOnTop = true, 
                    CFrame = CFrame.new(v36), 
                    Color = l_Color_0, 
                    Radius = v38, 
                    Transparency = l_CenterTransparency_0, 
                    ZIndex = 1
                })
            }), 
            Grid = if not v44 then nil else v2.createElement(v13, {
                AlwaysOnTop = true, 
                Center = v42, 
                Size = v25[l_BrushSettings_0.BrushSize].Size, 
                Transform = v45
            })
        }, l_CoreGui_0);
    end;
end;
