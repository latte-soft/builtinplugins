return function(v0, v1, v2)
    local v3 = v2.Samples or 3;
    local v4 = v2.Scale or 0.5;
    local v5 = v2.Offset or 0;
    local v6 = v2.Gain or 1;
    local v7 = 0;
    local v8 = 0;
    for v9 = 1, v3 do
        local v10 = v4 ^ (v9 - 1);
        v8 = v8 + v10;
        v7 = v7 + (v5 + v6 * v0(v1, v9)) * v10;
    end;
    return v7 / v8;
end;
