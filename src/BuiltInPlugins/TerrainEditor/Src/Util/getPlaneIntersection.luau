return function(v0, v1, v2, v3)
    local v4 = v1:Dot(v3);
    if v4 == 0 then
        return v0, 0;
    else
        local v5 = (v2 - v0):Dot(v3) / v4;
        return v0 + v1 * v5, v5;
    end;
end;
