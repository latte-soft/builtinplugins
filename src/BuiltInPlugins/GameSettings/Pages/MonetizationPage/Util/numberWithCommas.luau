local function v6(v0, v1)
    local v2 = string.format("%%1%s%%2", v1);
    local _ = nil;
    while true do
        local v4, v5 = string.gsub(v0, "^(-?%d+)(%d%d%d)", v2);
        v0 = v4;
        if not (v5 ~= 0) then
            break;
        end;
    end;
    return v0;
end;
return function(v7)
    return (v6(v7, ","));
end;
