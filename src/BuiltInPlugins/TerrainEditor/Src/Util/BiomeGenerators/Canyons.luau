local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.NoisySeed);
local _ = require(l_Generation_0.Perlin);
local v5 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v7, v8, v9)
    local v10 = {
        Enum.Material.Rock, 
        Enum.Material.Mud, 
        Enum.Material.Sand, 
        Enum.Material.Sand, 
        Enum.Material.Sandstone, 
        Enum.Material.Sandstone, 
        Enum.Material.Sandstone, 
        Enum.Material.Sandstone, 
        Enum.Material.Sandstone, 
        Enum.Material.Sandstone
    };
    return function(v11, v12, _)
        local l_X_0 = v11.X;
        local l_Y_0 = v11.Y;
        local l_Z_0 = v11.Z;
        local v17 = Vector3.new(l_X_0, 0, l_Z_0);
        local l_WaterLevel_0 = v9.WaterLevel;
        local v19 = v2.RidgeFlipped(v5(v7(v17, 2, 200)));
        local v20 = v2.RidgeFlipped(v5(v7(Vector3.new(l_X_0 + v7(v17, 5, 20) * 20, 0, l_Z_0 + v7(v17, 9, 20) * 20), 2, 200)));
        local v21 = v2.Threshold(v20, 0, 0.05);
        return ((((((((((0.42 + v5(v7(v11, 2, 70)) * 0.05) + v19 * 0.05) + v21 * 0.04) + v2.Threshold(v20, 0.05, 0) * 0.08) + v2.Threshold(v20, 0.05, 0.075) * 0.04) + v2.Threshold(v20, 0.125, 0) * 0.01) + v2.Threshold(v20, 0.0575, 0.2725) * 0.01) + v2.Threshold(v19, 0.33, 0.12) * 0.06) + v2.Threshold(v20, 0.45, 0) * 0.14) + v2.Threshold(v20, 0.45, 0.04) * 0.025) + v2.Threshold(v20, 0.49, 0) * 0.02, if 1 - v12 < l_WaterLevel_0 + 0.015 then Enum.Material.Sand else if v21 > 0 and v21 < 1 then Enum.Material.Sand else Enum.Material.Sandstone, v10[math.ceil((1 - v8((Vector3.new(1, l_Y_0, 2)))) * 10)];
    end;
end;
