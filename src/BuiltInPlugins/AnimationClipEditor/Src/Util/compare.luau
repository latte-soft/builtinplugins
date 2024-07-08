return function(v0, v1)
    local v2 = {};
    local v3 = {};
    local v4 = {};
    local v5 = {};
    for _, v7 in v0, nil, nil do
        v2[v7] = true;
    end;
    for _, v9 in v1, nil, nil do
        v3[v9] = true;
        if not v2[v9] then
            table.insert(v4, v9);
        end;
    end;
    for _, v11 in v0, nil, nil do
        if not v3[v11] then
            table.insert(v5, v11);
        end;
    end;
    return v4, v5;
end;
