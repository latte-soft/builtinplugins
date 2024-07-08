local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Flags);
local l_getFFlagMSPhase02_0 = v2.getFFlagMSPhase02;
local l_getFFlagMSPhase02FixCategory_0 = v2.getFFlagMSPhase02FixCategory;
local v5 = {
    [Enum.Material.Aluminum] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Asphalt] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.Basalt] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Brick] = {
        "Materials", 
        "Stone"
    }, 
    [Enum.Material.Cobblestone] = {
        "Materials", 
        "Stone"
    }, 
    [Enum.Material.Concrete] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.CorrodedMetal] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.CrackedLava] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.DiamondPlate] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Fabric] = {
        "Materials", 
        "Fabric"
    }, 
    [Enum.Material.ForceField] = {
        "Materials", 
        "Special"
    }, 
    [Enum.Material.Glacier] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.Glass] = {
        "Materials", 
        "Translucent"
    }, 
    [Enum.Material.Granite] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Grass] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Ground] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Ice] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.LeafyGrass] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Limestone] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Neon] = {
        "Materials", 
        "Special"
    }, 
    [Enum.Material.Marble] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Metal] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Mud] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Pavement] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.Pebble] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Plastic] = {
        "Materials", 
        "Plastic"
    }, 
    [Enum.Material.Rock] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Salt] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.Sand] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Sandstone] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Slate] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.SmoothPlastic] = {
        "Materials", 
        "Plastic"
    }, 
    [Enum.Material.Snow] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Wood] = {
        "Materials", 
        "Wood"
    }, 
    [Enum.Material.WoodPlanks] = {
        "Materials", 
        "Wood"
    }
};
local v6 = {
    [Enum.Material.Aluminum] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Asphalt] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.Basalt] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Brick] = {
        "Materials", 
        "Stone"
    }, 
    [Enum.Material.Cardboard] = {
        "Materials", 
        "Paper"
    }, 
    [Enum.Material.Carpet] = {
        "Materials", 
        "Fabric"
    }, 
    [Enum.Material.CeramicTiles] = {
        "Materials", 
        "Ceramic"
    }, 
    [Enum.Material.ClayRoofTiles] = {
        "Materials", 
        "Ceramic"
    }, 
    [Enum.Material.Cobblestone] = {
        "Materials", 
        "Stone"
    }, 
    [Enum.Material.Concrete] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.CorrodedMetal] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.CrackedLava] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.DiamondPlate] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Fabric] = {
        "Materials", 
        "Fabric"
    }, 
    [Enum.Material.ForceField] = {
        "Materials", 
        "Special"
    }, 
    [Enum.Material.Glacier] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.Glass] = {
        "Materials", 
        "Translucent"
    }, 
    [Enum.Material.Granite] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Grass] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Ground] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Ice] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.LeafyGrass] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Leather] = {
        "Materials", 
        "Leather"
    }, 
    [Enum.Material.Limestone] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Neon] = {
        "Materials", 
        "Special"
    }, 
    [Enum.Material.Marble] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Metal] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Mud] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Pavement] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.Pebble] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Plaster] = {
        "Materials", 
        "Ceramic"
    }, 
    [Enum.Material.Plastic] = {
        "Materials", 
        "Plastic"
    }, 
    [Enum.Material.Rock] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.RoofShingles] = {
        "Materials", 
        "Synthetic"
    }, 
    [Enum.Material.Rubber] = {
        "Materials", 
        "Synthetic"
    }, 
    [Enum.Material.Salt] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.Sand] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Sandstone] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Slate] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.SmoothPlastic] = {
        "Materials", 
        "Plastic"
    }, 
    [Enum.Material.Snow] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Wood] = {
        "Materials", 
        "Wood"
    }, 
    [Enum.Material.WoodPlanks] = {
        "Materials", 
        "Wood"
    }
};
local v7 = {
    [Enum.Material.Aluminum] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Asphalt] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.Basalt] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Brick] = {
        "Materials", 
        "Stone"
    }, 
    [Enum.Material.Cardboard] = {
        "Materials", 
        "Paper"
    }, 
    [Enum.Material.Carpet] = {
        "Materials", 
        "Fabric"
    }, 
    [Enum.Material.CeramicTiles] = {
        "Materials", 
        "Ceramic"
    }, 
    [Enum.Material.ClayRoofTiles] = {
        "Materials", 
        "Ceramic"
    }, 
    [Enum.Material.Cobblestone] = {
        "Materials", 
        "Stone"
    }, 
    [Enum.Material.Concrete] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.CorrodedMetal] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.CrackedLava] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.DiamondPlate] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Fabric] = {
        "Materials", 
        "Fabric"
    }, 
    [Enum.Material.ForceField] = {
        "Materials", 
        "Special"
    }, 
    [Enum.Material.Glacier] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.Glass] = {
        "Materials", 
        "Translucent"
    }, 
    [Enum.Material.Granite] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Grass] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Ground] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Ice] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.LeafyGrass] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Leather] = {
        "Materials", 
        "Fabric"
    }, 
    [Enum.Material.Limestone] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Neon] = {
        "Materials", 
        "Special"
    }, 
    [Enum.Material.Marble] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Metal] = {
        "Materials", 
        "Metal"
    }, 
    [Enum.Material.Mud] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Pavement] = {
        "Materials", 
        "Concrete"
    }, 
    [Enum.Material.Pebble] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Plaster] = {
        "Materials", 
        "Ceramic"
    }, 
    [Enum.Material.Plastic] = {
        "Materials", 
        "Plastic"
    }, 
    [Enum.Material.Rock] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.RoofShingles] = {
        "Materials", 
        "Synthetic"
    }, 
    [Enum.Material.Rubber] = {
        "Materials", 
        "Synthetic"
    }, 
    [Enum.Material.Salt] = {
        "Materials", 
        "Organic"
    }, 
    [Enum.Material.Sand] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Sandstone] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.Slate] = {
        "Materials", 
        "Rock"
    }, 
    [Enum.Material.SmoothPlastic] = {
        "Materials", 
        "Plastic"
    }, 
    [Enum.Material.Snow] = {
        "Materials", 
        "Ground"
    }, 
    [Enum.Material.Wood] = {
        "Materials", 
        "Wood"
    }, 
    [Enum.Material.WoodPlanks] = {
        "Materials", 
        "Wood"
    }
};
return function(v8)
    if not l_getFFlagMSPhase02_0() then
        return v5[v8];
    elseif not l_getFFlagMSPhase02FixCategory_0() then
        return v6[v8];
    else
        return v7[v8];
    end;
end;
