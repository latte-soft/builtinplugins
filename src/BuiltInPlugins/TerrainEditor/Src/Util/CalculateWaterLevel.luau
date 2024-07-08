return function(v0, v1)
    local v2 = -1;
    local v3 = 0;
    for v4, v5 in v0, nil, nil do
        for v6, v7 in v5, nil, nil do
            for v8, v9 in v7, nil, nil do
                if v9 == Enum.Material.Water then
                    local v10 = v1[v4][v6][v8];
                    if v2 < v6 then
                        v2 = v6;
                        v3 = v1[v4][v6][v8];
                    elseif v6 == v2 and v3 < v10 then
                        v3 = v10;
                    end;
                end;
            end;
        end;
    end;
    return v2, v3;
end;
