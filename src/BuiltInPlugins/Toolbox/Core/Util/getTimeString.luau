return function(v0, v1)
    local v2 = math.floor(v0 / 60);
    local v3 = math.floor(v0 % 60);
    if v1 ~= nil and v3 == 0 then
        v3 = math.max(v3, v1);
    end;
    return string.format("%d:%02d", v2, v3);
end;
