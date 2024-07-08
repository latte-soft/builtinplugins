local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_getFFlagMSPhase02_0 = require(l_Parent_0.Src.Flags).getFFlagMSPhase02;
local v3 = {
    Materials = {
        Concrete = Enum.Material.Concrete, 
        Fabric = Enum.Material.Fabric, 
        Ground = Enum.Material.Ground, 
        Metal = Enum.Material.Metal, 
        Organic = Enum.Material.Ice, 
        Plastic = Enum.Material.Plastic, 
        Rock = Enum.Material.Rock, 
        Stone = Enum.Material.Slate, 
        Wood = Enum.Material.Wood
    }
};
local v4 = {
    Materials = {
        Ceramic = Enum.Material.CeramicTiles, 
        Concrete = Enum.Material.Concrete, 
        Fabric = Enum.Material.Fabric, 
        Ground = Enum.Material.Ground, 
        Metal = Enum.Material.Metal, 
        Organic = Enum.Material.Ice, 
        Paper = Enum.Material.Cardboard, 
        Plastic = Enum.Material.Plastic, 
        Rock = Enum.Material.Rock, 
        Stone = Enum.Material.Slate, 
        Synthetic = Enum.Material.Rubber, 
        Wood = Enum.Material.Wood
    }
};
return function(v5)
    local v6 = nil;
    v6 = if not l_getFFlagMSPhase02_0() then v3 else v4;
    for _, v8 in v5, nil, nil do
        v6 = v6[v8];
        if not v6 then
            return v6;
        end;
    end;
    if type(v6) == "table" then
        return nil;
    else
        return v6;
    end;
end;
