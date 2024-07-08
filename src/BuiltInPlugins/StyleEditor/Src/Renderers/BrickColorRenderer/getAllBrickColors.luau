return function()
    local v0 = {};
    for v1 = 1, 1032 do
        local v2 = BrickColor.new(v1);
        if v2 then
            v0[v2.Number] = v2;
        end;
    end;
    local v3 = {};
    for _, v5 in v0, nil, nil do
        table.insert(v3, v5);
    end;
    return v3;
end;
