local l_map_0 = require(script.Parent.Parent.Parent.Packages.Dash).map;
local v1 = {
    Enum.Material.Asphalt, 
    Enum.Material.Basalt, 
    Enum.Material.Brick, 
    Enum.Material.Cobblestone, 
    Enum.Material.Concrete, 
    Enum.Material.CorrodedMetal, 
    Enum.Material.CrackedLava, 
    Enum.Material.DiamondPlate, 
    Enum.Material.Fabric, 
    Enum.Material.Foil, 
    Enum.Material.Glacier, 
    Enum.Material.Granite, 
    Enum.Material.Grass, 
    Enum.Material.Ground, 
    Enum.Material.Ice, 
    Enum.Material.LeafyGrass, 
    Enum.Material.Limestone, 
    Enum.Material.Marble, 
    Enum.Material.Metal, 
    Enum.Material.Mud, 
    Enum.Material.Pavement, 
    Enum.Material.Pebble, 
    Enum.Material.Plastic, 
    Enum.Material.Rock, 
    Enum.Material.Salt, 
    Enum.Material.Sand, 
    Enum.Material.Sandstone, 
    Enum.Material.Slate, 
    Enum.Material.SmoothPlastic, 
    Enum.Material.Snow, 
    Enum.Material.Wood, 
    Enum.Material.WoodPlanks
};
return {
    getIcons = function()
        return l_map_0(v1, function(v2)
            return (("rbxasset://textures/MaterialGenerator/Materials/%*.png"):format(v2.Name));
        end);
    end, 
    getNames = function()
        return l_map_0(v1, function(v3)
            return v3.Name;
        end);
    end
};
