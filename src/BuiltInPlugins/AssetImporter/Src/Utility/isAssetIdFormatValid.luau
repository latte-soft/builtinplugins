return function(v0)
    if string.sub(v0, 1, 13) == "rbxassetid://" then
        v0 = string.sub(v0, 14);
    end;
    local v1 = tonumber(v0);
    local v2 = true;
    if v0 ~= "" then
        v2 = false;
        if v1 ~= nil then
            v2 = v1 <= 9223372036854775807;
        end;
    end;
    return v2;
end;
