local l_MSPhase02_0 = game:GetFastFlag("MSPhase02");
return (table.freeze(((function()
    local l_EnumItems_0 = Enum.Material:GetEnumItems();
    table.sort(l_EnumItems_0, function(v2, v3)
        return v2.Name < v3.Name;
    end);
    local v4 = nil;
    v4 = if not l_MSPhase02_0 then {
        Enum.Material.Air, 
        Enum.Material.Water, 
        Enum.Material.Cardboard, 
        Enum.Material.Carpet, 
        Enum.Material.CeramicTiles, 
        Enum.Material.ClayRoofTiles, 
        Enum.Material.Leather, 
        Enum.Material.Plaster, 
        Enum.Material.RoofShingles, 
        Enum.Material.Rubber
    } else {
        Enum.Material.Air, 
        Enum.Material.Water
    };
    for _, v6 in ipairs(v4) do
        table.remove(l_EnumItems_0, (table.find(l_EnumItems_0, v6)));
    end;
    return l_EnumItems_0;
end)())));
