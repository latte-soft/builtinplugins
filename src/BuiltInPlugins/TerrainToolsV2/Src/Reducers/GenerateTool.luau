local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Biome_0 = require(l_Parent_0.Src.Util.TerrainEnums).Biome;
return (v1.createReducer({
    position = {
        X = 0, 
        Y = 0, 
        Z = 0
    }, 
    size = {
        X = 1024, 
        Y = 512, 
        Z = 1024
    }, 
    biomeSelection = {
        [l_Biome_0.Plains] = true, 
        [l_Biome_0.Mountains] = true, 
        [l_Biome_0.Hills] = true, 
        [l_Biome_0.Water] = false, 
        [l_Biome_0.Dunes] = false, 
        [l_Biome_0.Arctic] = false, 
        [l_Biome_0.Marsh] = false, 
        [l_Biome_0.Canyons] = false, 
        [l_Biome_0.Lavascape] = false
    }, 
    biomeSize = 100, 
    haveCaves = true, 
    seed = "618033988"
}, {
    ChangePosition = function(v4, v5)
        return v2.Dictionary.join(v4, {
            position = v5.position
        });
    end, 
    ChangeSize = function(v6, v7)
        return v2.Dictionary.join(v6, {
            size = v7.size
        });
    end, 
    SetBiomeSelection = function(v8, v9)
        return v2.Dictionary.join(v8, {
            biomeSelection = v2.Dictionary.join(v8.biomeSelection, v9.newBiomeUpdate)
        });
    end, 
    SetBiomeSize = function(v10, v11)
        return v2.Dictionary.join(v10, {
            biomeSize = v11.biomeSize
        });
    end, 
    SetHaveCaves = function(v12, v13)
        return v2.Dictionary.join(v12, {
            haveCaves = v13.haveCaves
        });
    end, 
    SetSeed = function(v14, v15)
        return v2.Dictionary.join(v14, {
            seed = v15.seed
        });
    end
}));
