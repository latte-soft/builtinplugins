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
        local v14 = Vector3.new(l_X_0, 0, l_Z_0);
        local l_WaterLevel_0 = v7.WaterLevel;
        local v16 = v2.Ridge((v4(v6(Vector3.new(l_X_0 + v6(v14, 5, 8) * 5, l_Y_0 / 8, l_Z_0 + v6(v14, 9, 8) * 5), 2, 20))));
        local v17 = v4(v6(Vector3.new(l_X_0, l_Y_0 / 4, l_Z_0), 436, 2));
        local v18 = v2.Threshold(v16, 0.8, 0.1);
        local v19 = v4(v6(v14, 6, 74)) - 0.5;
        local _ = nil;
        return ((0.55 + (v16 * 0.05) * v19) + if v19 < 0 then 1 + v19 * 0.5 < v16 and -0.17 or 0 else ((v18 * 0.1) * v17) * v19) + v4(v6(v14, 123, 25)) * 0.025, if 1 - v9 < l_WaterLevel_0 - 0.1 then Enum.Material.Glacier else if (v18 > 0.6 and v19 > 0.1) and v17 > 0.5 then Enum.Material.Glacier else Enum.Material.Snow, Enum.Material.Glacier;
    end;
end;
