local function v0(v1, v2)
    local v3 = {};
    local v4 = v2(v1);
    if v4 then
        for _, v6 in ipairs(v4) do
            v3[v6] = v0(v6, v2);
        end;
    end;
    return v3;
end;
return v0;
