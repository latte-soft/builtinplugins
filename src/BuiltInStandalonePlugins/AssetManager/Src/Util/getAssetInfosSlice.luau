local _ = require(script:FindFirstAncestor("AssetManager").Src.Types);
return function(v1, v2, v3)
    local v4 = math.min(v2, v3);
    local v5 = math.max(v2, v3);
    local v6 = false;
    if v4 >= 1 then
        v6 = v4 <= #v1;
    end;
    assert(v6, "startIndex must be in range of items");
    v6 = false;
    if v5 >= 1 then
        v6 = v5 <= #v1;
    end;
    assert(v6, "endIndex must be in range of items");
    local v7 = {};
    for v8 = v4, v5 do
        table.insert(v7, v1[v8].AssetId);
    end;
    return v7;
end;
