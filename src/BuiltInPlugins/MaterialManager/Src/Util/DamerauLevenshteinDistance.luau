return function(v0, v1)
    v0 = string.lower(v0);
    v1 = string.lower(v1);
    local v2 = utf8.len(v0);
    local v3 = utf8.len(v1);
    local v4 = {};
    for v5 = 1, v2 + 1 do
        v4[v5] = table.create(v3 + 1, 0);
    end;
    for v6 = 1, v2 + 1 do
        v4[v6][1] = v6 - 1;
    end;
    for v7 = 1, v3 + 1 do
        v4[1][v7] = v7 - 1;
    end;
    local _ = nil;
    local v9 = {};
    local v10 = {};
    for v11, v12 in utf8.graphemes(v0) do
        table.insert(v9, v0:sub(v11, v12));
    end;
    for v13, v14 in utf8.graphemes(v1) do
        table.insert(v10, v1:sub(v13, v14));
    end;
    for v15 = 2, #v9 + 1 do
        for v16 = 2, #v10 + 1 do
            v4[v15][v16] = math.min(v4[v15 - 1][v16] + 1, v4[v15][v16 - 1] + 1, v4[v15 - 1][v16 - 1] + (v9[v15 - 1] == v10[v16 - 1] and 0 or 1));
            if ((v15 > 2 and v16 > 2) and v9[v15 - 1] == v10[v16 - 2]) and v9[v15 - 2] == v10[v16 - 1] then
                v4[v15][v16] = math.min(v4[v15][v16], v4[v15 - 2][v16 - 2] + 1);
            end;
        end;
    end;
    return v4[v2 + 1][v3 + 1];
end;
