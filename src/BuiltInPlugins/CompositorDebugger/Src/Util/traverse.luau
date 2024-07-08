local _ = script:FindFirstAncestor("CompositorDebugger");
local function v1(v2, v3, v4, v5)
    v3(v2, v5);
    local v6 = if not v4 then v2.children else v4(v2) or {};
    for _, v8 in pairs(v6) do
        v1(v8, v3, v4, v5 + 1);
    end;
end;
return function(v9, v10, v11)
    return v1(v9, v10, v11, 1);
end;
