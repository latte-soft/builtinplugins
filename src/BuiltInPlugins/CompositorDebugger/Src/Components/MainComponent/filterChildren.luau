local _ = require(script:FindFirstAncestor("CompositorDebugger").Src.Types);
local function v1(v2, v3, v4)
    local v5 = {};
    local v6 = false;
    for _, v8 in v2, nil, nil do
        if v3[v8.className] or v4 and v8.weight == 0 then
            v6 = true;
        else
            local _ = nil;
            local v10, v11 = v1(v8.children, v3, v4);
            v8.children = v10;
            v6 = v6 or v11;
            table.insert(v5, v8);
        end;
    end;
    if v6 then
        v2 = v5;
    end;
    return v2, v6;
end;
return v1;
