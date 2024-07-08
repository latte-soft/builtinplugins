return function(v0, ...)
    local v1 = table.clone(v0);
    local v2 = {
        ...
    };
    table.sort(v1, function(v3, v4)
        for _, v6 in v2, nil, nil do
            local v7 = v6(v3);
            local v8 = v6(v4);
            if v7 ~= v8 then
                if typeof(v7) == "boolean" then
                    assert(typeof(v8) == "boolean", "keyA == bool, keyB is not");
                    return v8;
                else
                    assert(typeof(v7) == typeof(v8), "typeof(keyA) ~= typeof(keyB)");
                    return v7 < v8;
                end;
            end;
        end;
        return false;
    end);
    return v1;
end;
