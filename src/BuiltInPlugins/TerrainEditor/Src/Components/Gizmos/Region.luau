local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v3.useEffect;
local l_Pane_0 = v2.UI.Pane;
local v6 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Box);
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v9 = require(l_Hooks_0.useLines);
local v10 = require(l_Hooks_0.useRegion);
local v11 = require(l_Hooks_0.useTerrain);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Selection_0 = game:GetService("Selection");
return function(v14)
    local v15, v16, v17 = v10(v14.Tool, v14.Value, v14.Save, v14.Schema.Rotation);
    local v18 = v9(v14.Tool, v14.Value, v16, v14.Schema.Wireframe);
    local v19 = v11();
    l_useEffect_0(function()
        l_Selection_0:SetTerrainSelectionHack(v16.Transform.Position, v16.Size);
        return function()
            l_Selection_0:ClearTerrainSelectionHack();
        end;
    end, {
        v14.Tool, 
        v16.Size, 
        v16.Transform.Position
    });
    return v3.createElement(l_Pane_0, {}, {
        Dragger = if v15.DraggerContext.Mock then nil else v3.createElement(v6, v15), 
        Region = v3.createElement(v7, {
            Adornee = v19, 
            AlwaysOnTop = true, 
            Color = v14.Schema.Color or Color3.new(1, 1, 1), 
            LineThickness = 0.1, 
            Lines = v18, 
            Scale = v17, 
            Size = v16.Size, 
            Transform = v16.Transform, 
            Transparency = 0.9, 
            Wireframe = v14.Schema.Wireframe
        })
    });
end;
