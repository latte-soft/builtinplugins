return function(v0, v1)
    local v2 = {};
    local v3 = {};
    local v4 = {};
    local v5 = {};
    for _, v7 in v0, nil, nil do
        v5[v7] = (v5[v7] or 0) + 1;
    end;
    for _, v9 in v1, nil, nil do
        local v10 = v5[v9];
        if not (v10 ~= nil) or v10 == 0 then
            table.insert(v3, v9);
        else
            v5[v9] = v5[v9] - 1;
            table.insert(v4, v9);
        end;
    end;
    for v11, v12 in v5, nil, nil do
        for _ = 1, v12 do
            table.insert(v2, v11);
        end;
    end;
    return v2, v3, v4;
end;
