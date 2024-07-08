return function(v0)
    local v1 = {};
    for v2 in string.gmatch(v0, "[^\n]+") do
        v1[#v1 + 1] = v2;
    end;
    return v1;
end;
