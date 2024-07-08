local _ = script:FindFirstAncestor("TerrainEditor");
return function(v1, v2)
    local v3 = {
        Enum.Material.Asphalt, 
        Enum.Material.Basalt, 
        Enum.Material.Brick, 
        Enum.Material.Cobblestone, 
        Enum.Material.Concrete, 
        Enum.Material.CrackedLava, 
        Enum.Material.Glacier, 
        Enum.Material.Grass, 
        Enum.Material.Ground, 
        Enum.Material.Ice, 
        Enum.Material.LeafyGrass, 
        Enum.Material.Limestone, 
        Enum.Material.Mud, 
        Enum.Material.Pavement, 
        Enum.Material.Rock, 
        Enum.Material.Salt, 
        Enum.Material.Sand, 
        Enum.Material.Sandstone, 
        Enum.Material.Slate, 
        Enum.Material.Snow, 
        Enum.Material.Water, 
        Enum.Material.WoodPlanks
    };
    if v1 then
        table.insert(v3, Enum.Material.Air);
    end;
    if v2 == false then
        table.remove(v3, table.find(v3, Enum.Material.Water));
    end;
    return v3;
end;
