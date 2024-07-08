local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7)
    return function(v8, v9, _)
        local _ = v8.X;
        local _ = v8.Y;
        local l_Z_0 = v8.Z;
        local l_WaterLevel_0 = v7.WaterLevel;
        local v15 = v2.RidgeFlipped(v4(v6(Vector3.new(v4(v6(v8, 17, 20)) * 20, 0, l_Z_0 + v4(v6(v8, 19, 20)) * 20), 2, 200))) ^ 0.5;
        local v16 = v4(v6(v8, 3, 60));
        local v17 = (0.48 + v16 * 0.05) + ((0.05 + v16 * 0.1) + v4(v6(v8, 4, 25)) * 0.125) * v15;
        local v18 = (1 - v9) * 0.9 + v15 * 0.1;
        return v17, if v18 < l_WaterLevel_0 - 0.015 then Enum.Material.Mud else if v18 < l_WaterLevel_0 then Enum.Material.Ground else Enum.Material.Grass, Enum.Material.Slate;
    end;
end;
