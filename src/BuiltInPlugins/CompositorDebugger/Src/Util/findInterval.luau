return function(v0, v1, v2)
    local v3 = math.pow(10, (math.floor((math.log10(v0)))));
    local v4 = (v0 / v3) / v1;
    local v5 = v2[1];
    for _, v7 in v2, nil, nil do
        if v4 < v7 then
            v5 = v7;
            break;
        end;
    end;
    return v5 * v3;
end;
