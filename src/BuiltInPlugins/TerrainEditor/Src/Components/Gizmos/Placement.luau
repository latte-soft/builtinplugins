local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useRaycast);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useTerrain);
local v8 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Gizmos.Box);
local v11 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v11.BrushSettings;
local l_BuildSettings_0 = v11.BuildSettings;
local l_Category_0 = v11.Category;
local l_TerrainType_0 = v11.TerrainType;
return function(v16)
    local v17 = v16.Value[l_Category_0.BuildSettings];
    if v17[l_BuildSettings_0.PlacementMode] then
        local v18 = v17[l_BuildSettings_0.Size];
        local v19 = l_useMemo_0(function()
            return v1.join({
                [l_Category_0.BrushSettings] = {}
            }, v16.Value);
        end, {
            v16.Value
        });
        local v20 = v7();
        local v24 = l_useCallback_0(function(v21)
            local l_Position_0 = v21[l_Category_0.BrushSettings][l_BrushSettings_0.State].Position;
            local v23 = v17[l_BuildSettings_0.TerrainType];
            if not (v23 ~= l_TerrainType_0.Volcano and v23 ~= l_TerrainType_0.Mountain) or v23 == l_TerrainType_0.Mesa then
                v16.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0 + Vector3.new(0, v18.Y / 2 - 2 * v8.VoxelResolution, 0))
                    }
                });
                return ;
            elseif v23 == l_TerrainType_0.Crater then
                v16.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0 - Vector3.new(0, v18.Y / 2 - 3 * v8.VoxelResolution, 0))
                    }
                });
                return ;
            elseif v23 == l_TerrainType_0.Lake then
                v16.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0 - Vector3.new(0, v18.Y / 2, 0))
                    }
                });
                return ;
            else
                v16.Save({
                    [l_Category_0.BuildSettings] = {
                        [l_BuildSettings_0.Transform] = CFrame.new(l_Position_0)
                    }
                });
                return ;
            end;
        end, {
            v16.Save, 
            v17[l_BuildSettings_0.TerrainType], 
            v18
        });
        v5(v9.use().MouseDownAction, function()
            v16.Save({
                [l_Category_0.BuildSettings] = {
                    [l_BuildSettings_0.PlacementMode] = false
                }
            });
        end, {
            v16.Save
        });
        local v25, _ = v6(v16.Tool, v19, v24);
        return v2.createElement(v10, {
            Adornee = v20, 
            AlwaysOnTop = true, 
            Color = v16.Schema.Color or Color3.new(1, 1, 1), 
            LineThickness = 0.1, 
            Size = Vector3.new(v18.X, 0, v18.Z), 
            Transform = CFrame.new(v25.Position), 
            Transparency = 0.9
        });
    else
        return nil;
    end;
end;
