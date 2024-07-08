local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v2 = require(l_Generation_0.Filter);
local _ = require(l_Generation_0.Perlin);
local v4 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6, _)
    return function(v8, _, _)
        local l_X_0 = v8.X;
        local l_Z_0 = v8.Z;
        local v13 = Vector3.new(l_X_0, 0, l_Z_0);
        local v14 = v4(v6(v13, 227, 20)) * 24;
        return 0.4 + 0.1 * (v2.Ridge(v4(v6(v13, 201, 40))) + v2.Ridge(v4(v6(Vector3.new(l_X_0 / 10 + v14, 0, l_Z_0 + v14), 200, 48)))), Enum.Material.Sand, Enum.Material.Sandstone;
    end;
end;
