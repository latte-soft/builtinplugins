local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local _ = require(l_Generation_0.Perlin);
local v3 = require(l_Generation_0.ProcessPerlin);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5, _)
    return function(v7, v8, _)
        return 0.36 + v3(v5(v7, 2, 50)) * 0.08, if 1 - v8 < 0.44 then Enum.Material.Slate else Enum.Material.Sand, Enum.Material.Rock;
    end;
end;
