local v0 = setmetatable({}, {
    __mode = "k"
});
local function v1()
end;
local function v3(v2)
    return v2.Name;
end;
return function(v4)
    local v5 = v0[v4];
    if v5 == nil then
        v5 = not xpcall(v3, v1, v4);
        v0[v4] = v5;
    end;
    return v5;
end;
