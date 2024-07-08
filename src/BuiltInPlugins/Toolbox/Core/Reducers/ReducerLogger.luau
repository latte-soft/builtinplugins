local _ = function(v0)
    if type(v0) ~= "table" then
        return 0;
    else
        local v1 = 0;
        for _ in pairs(v0) do
            v1 = v1 + 1;
        end;
        return v1;
    end;
end;
local v4 = {
    categories = true, 
    sorts = true
};
local function v5(v6, v7, v8)
    v8 = v8 or 0;
    local v9 = ("\t"):rep(v8);
    local v10 = tostring(v6);
    local v11 = tostring(v7);
    if type(v6) ~= "string" then
        v10 = ("[%s]"):format(v10);
    end;
    if type(v7) == "string" then
        v11 = ("\"%s\""):format(v11);
    elseif type(v7) == "table" then
        local v12;
        if type(v7) ~= "table" then
            v12 = 0;
        else
            local v13 = 0;
            for _ in pairs(v7) do
                v13 = v13 + 1;
            end;
            v12 = v13;
        end;
        if v12 <= 15 and not v4[v6] then
            v11 = "{";
            for v15, v16 in pairs(v7) do
                v11 = v11 .. ("\n%s"):format(v5(v15, v16, v8 + 1));
            end;
            v11 = v11 .. (v12 > 0 and ("\n%s"):format(v9) or " ") .. "}";
        else
            v11 = ("%s (length = %d)"):format(v11, v12);
        end;
    end;
    return (("%s%s\t = %s"):format(v9, v10, v11));
end;
return function(v17, v18, v19)
    local v20 = not not v19.type and tostring(v19.type) or "(action.type == nil)";
    local v21 = ("-"):rep(40);
    print(v21);
    print(("Handling action %s"):format(v20));
    if v19.type == "@@INIT" then
        print((v5("State", v18, 1)));
    end;
    print((v5(("Action %s"):format(v20), v19, 1)));
    local v22 = v17(v18, v19);
    print((v5("New state", v22, 1)));
    print(v21);
    return v22;
end;
