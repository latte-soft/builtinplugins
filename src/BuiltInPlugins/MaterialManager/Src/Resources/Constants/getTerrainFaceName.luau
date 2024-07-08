local v0 = {
    [Enum.TerrainFace.Top] = "Top", 
    [Enum.TerrainFace.Side] = "Side", 
    [Enum.TerrainFace.Bottom] = "Bottom"
};
return function(v1)
    return v0[v1];
end;
