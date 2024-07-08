return function(v0, v1)
    assert(type(v0) == "string", "Expected the string to split to be a string");
    local v2 = false;
    if type(v1) == "table" then
        v2 = #v1 > 0;
    end;
    assert(v2, "Expected matches to be an array");
    for _, v4 in ipairs(v1) do
        local v5, v6 = string.find(v0, v4, nil, true);
        if v5 ~= nil then
            return string.sub(v0, 1, v5 - 1), (string.sub(v0, v6 + 1));
        end;
    end;
    return v0, "";
end;
