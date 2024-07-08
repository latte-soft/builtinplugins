local l_deepJoin_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.deepJoin;
local function v1(v2, v3)
    if not (type(v2) == "table") or type(v3) ~= "table" then
        if not v2 then
            v2 = "nil";
        end;
        if not v3 then
            v3 = "nil";
        end;
        error(string.format("Expected to compare two tables, got %s and %s", tostring(v2), (tostring(v3))));
    end;
    local v4 = 0;
    for _, _ in pairs(v3) do
        v4 = v4 + 1;
    end;
    local v7 = 0;
    for v8, v9 in pairs(v2) do
        v7 = v7 + 1;
        local v10 = v3[v8];
        if type(v9) == "table" then
            v1(v9, v10);
        elseif v9 ~= v10 then
            error(string.format("the field \"%s\" no longer matches", v8));
        end;
    end;
    if v7 ~= v4 then
        return error(string.format("Number of keys mismatch : %d vs %d", v7, v4));
    else
        return true;
    end;
end;
return function(v11, v12, v13)
    assert(type(v11) == "function", "Expected a reducer to test");
    assert(type(v12) == "table", "Expected an action to test");
    local v14 = v11(v13, {
        type = "__nil__"
    });
    local v15 = l_deepJoin_0(v14, {});
    assert(v1(v14, v15), "deepJoin mutates fields");
    v11(v14, v12);
    return v1(v14, v15);
end;
