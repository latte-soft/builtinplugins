return function(v0, v1, v2)
    v0.Size = nil;
    for v3, v4 in v0, nil, nil do
        for v5, v6 in v4, nil, nil do
            for v7, v8 in v6, nil, nil do
                if v8 == Enum.Material.Water then
                    if v2[v3][v5][v7] < v1[v3][v5][v7] then
                        v2[v3][v5][v7] = v1[v3][v5][v7];
                    end;
                    v1[v3][v5][v7] = 0;
                    v0[v3][v5][v7] = Enum.Material.Air;
                end;
            end;
        end;
    end;
end;
