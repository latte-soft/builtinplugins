local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Arctic);
local v2 = require(script.Canyons);
local v3 = require(script.Dunes);
local v4 = require(script.Hills);
local v5 = require(script.Lavascape);
local v6 = require(script.Marsh);
local v7 = require(script.Mountains);
local v8 = require(script.Plains);
local v9 = require(script.Water);
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local _ = require(l_Generation_0.NoisySeed);
local _ = require(l_Generation_0.Perlin);
local l_Biome_0 = require(l_script_FirstAncestor_0.Src.Types).Biome;
return function(v14, v15, v16)
    return {
        [l_Biome_0.Arctic] = v1(v14, v16), 
        [l_Biome_0.Canyons] = v2(v14, v15, v16), 
        [l_Biome_0.Dunes] = v3(v14, v16), 
        [l_Biome_0.Hills] = v4(v14, v16), 
        [l_Biome_0.Lavascape] = v5(v14, v16), 
        [l_Biome_0.Marsh] = v6(v14, v16), 
        [l_Biome_0.Mountains] = v7(v14, v16), 
        [l_Biome_0.Plains] = v8(v14, v16), 
        [l_Biome_0.Water] = v9(v14, v16)
    };
end;
