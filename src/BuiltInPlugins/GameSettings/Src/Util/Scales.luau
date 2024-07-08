local v0 = {};
local v1 = nil;
v0.isEqual = function(v2, v3)
    if not (v2 ~= nil) or v3 == nil then
        local v4 = false;
        if v2 == nil then
            v4 = v3 == nil;
        end;
        return v4;
    else
        for v5, v6 in pairs(v2) do
            if v6 ~= v3[v5] then
                return false;
            end;
        end;
        return v1(v2) == v1(v3);
    end;
end;
v1 = function(v7)
    local v8 = 0;
    for _, _ in pairs(v7) do
        v8 = v8 + 1;
    end;
    return v8;
end;
return v0;
