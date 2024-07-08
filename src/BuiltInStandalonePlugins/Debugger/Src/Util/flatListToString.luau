return function(v0)
    local v1 = "";
    for _, v3 in ipairs(v0) do
        if v1 ~= "" then
            v1 = v1 .. ",";
        end;
        v1 = v1 .. v3;
    end;
    return v1;
end;
