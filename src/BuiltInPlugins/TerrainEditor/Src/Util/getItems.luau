local l_EnumTypeIndices_0 = require(script:FindFirstAncestor("TerrainEditor").Src.Types).EnumTypeIndices;
return function(v1, v2, v3)
    local v4 = {};
    for _, v6 in l_EnumTypeIndices_0[v3], nil, nil do
        table.insert(v4, {
            Icon = if not v2 then nil else v2:get(v3, {})[v3][v6], 
            Id = v6, 
            Label = if not v1 then nil else v1:getText(v3, v6)
        });
    end;
    return v4;
end;
