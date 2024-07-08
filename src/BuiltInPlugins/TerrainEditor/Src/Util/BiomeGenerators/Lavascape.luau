local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7)
    return function(v8, v9, _)
        local l_X_0 = v8.X;
        local l_Y_0 = v8.Y;
        local l_Z_0 = v8.Z;
        local l_WaterLevel_0 = v7.WaterLevel;
        local v15 = l_X_0 + v6(Vector3.new(l_X_0, l_Y_0 * 0.25, l_Z_0), 21, 8) * 5;
        local v16 = l_Y_0 + v6(Vector3.new(l_X_0, l_Y_0 * 0.25, l_Z_0), 22, 8) * 5;
        local v17 = l_Z_0 + v6(Vector3.new(l_X_0, l_Y_0 * 0.25, l_Z_0), 23, 8) * 5;
        local v18 = Vector3.new(v15, v16, v17);
        local v19 = v2.Ridge(v4(v6(Vector3.new(v15 + v6(v8, 22, 30) * 30, v16, v17 + v6(v8, 24, 30) * 30), 2, 120)));
        local v20 = v2.Ridge(v4(v6(v18, 3, 40))) * (v19 * 0.25 + 0.75);
        local v21 = v2.Ridge(v4(v6(v18, 4, 20))) * (v20 * 0.25 + 0.75);
        local v22 = v2.Threshold(v4(v6(v8, 9, 40)), 0.25, 0.5) * v4(v6(v8, 10, 60));
        local v23 = math.max(0, ((1 - v2.Threshold(v19, 0.975, 0)) - v2.Threshold(v20, 0.925, 0)) - v2.Threshold(v21, 0.9, 0));
        local v24 = v2.Threshold(v4(v6((CFrame.Angles(0.7, 0.7, 0) * Vector3.new(v15, v16, v17)) / Vector3.new(40, 300, 30), 123, 1)), 0.6, 0.4);
        local v25 = ((((l_WaterLevel_0 + 0.02) + (v23 * (0.5 + v22 * 0.5)) * 0.02) + v22 * 0.05) + v24 * 0.3) + ((not (l_WaterLevel_0 + 0.01 >= 1 - v9) or v24 > 0) and 0.04 or 0);
        local v26 = if v24 > 0 then Enum.Material.Rock else if v23 < 1 then Enum.Material.CrackedLava else Enum.Material.Basalt;
        return v25, if v26 == Enum.Material.CrackedLava and 1 - v9 < l_WaterLevel_0 then Enum.Material.Basalt else v26, v26;
    end;
end;
