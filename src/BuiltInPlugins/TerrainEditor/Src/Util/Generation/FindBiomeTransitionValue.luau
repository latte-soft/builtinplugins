local l_Biome_0 = require(script:FindFirstAncestor("TerrainEditor").Src.Types).Biome;
return function(v1, v2, v3, v4)
    if v1 == l_Biome_0.Arctic then
        return (v2 > 0.2 and 1 or 0) * v3;
    elseif v1 == l_Biome_0.Canyons then
        return (v2 > 0.7 and 1 or 0) * v3;
    elseif v1 == l_Biome_0.Mountains then
        local v5 = v2 ^ 3;
        return v4 * (1 - v5) + v3 * v5;
    else
        return v4 * (1 - v2) + v3 * v2;
    end;
end;
