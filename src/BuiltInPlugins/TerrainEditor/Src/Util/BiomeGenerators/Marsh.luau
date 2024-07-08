local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, v7)
    return function(v8, v9, _)
        local l_X_0 = v8.X;
        local _ = v8.Y;
        local l_Z_0 = v8.Z;
        local v14 = Vector3.new(l_X_0, 0, l_Z_0);
        local l_WaterLevel_0 = v7.WaterLevel;
        local v16 = v4(v6(Vector3.new((l_X_0 + v6(v14, 5, 7) * 10) + v6(v14, 6, 30) * 50, 0, (l_Z_0 + v6(v14, 9, 7) * 10) + v6(v14, 10, 30) * 50), 2, 70));
        local v17 = v2.Threshold(v16, 0.65, 0);
        return (((l_WaterLevel_0 - 0.04) + (v16 * v17) * 0.025) + v4(v6(v8, 4, 100)) * 0.035) + v4(v6(v8, 3, 20)) * 0.025, if v17 >= 1 then Enum.Material.Grass else if 1 - v9 < l_WaterLevel_0 - 0.01 then Enum.Material.Mud else if 1 - v9 < l_WaterLevel_0 + 0.01 then Enum.Material.Ground else Enum.Material.Grass, Enum.Material.Slate;
    end;
end;
