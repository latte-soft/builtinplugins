local _ = require(script:FindFirstAncestor("CompositorDebugger").Src.Types);
local function v1(v2, v3)
    if v2 == nil then
        return "<nil>";
    else
        v3 = v3 or 0;
        assert(v2);
        assert(v3);
        local v4 = string.rep("  ", v3);
        local v5 = "{\n";
        local v6 = {};
        for v7, _ in v2, nil, nil do
            table.insert(v6, v7);
        end;
        table.sort(v6, function(v9, v10)
            if type(v9) == "number" and type(v10) == "number" then
                return v9 < v10;
            else
                return tostring(v9) < tostring(v10);
            end;
        end);
        for _, v12 in ipairs(v6) do
            local v13 = v2[v12];
            v5 = v5 .. v4 .. "  " .. if type(v12) ~= "number" and type(v12) ~= "string" then "`" .. tostring(v12) .. "`" else tostring(v12) .. ": ";
            if type(v13) == "table" then
                v5 = v5 .. v1(v13, v3 + 1);
            elseif type(v13) == "string" then
                v5 = v5 .. "\"" .. v13 .. "\"\n";
            else
                v5 = v5 .. tostring(v13) .. "\n";
            end;
        end;
        return v5 .. v4 .. "}\n";
    end;
end;
return function(v14, v15)
    local v16 = v1(v14, 0);
    if not v15 then
        print(v16);
        return ;
    else
        v15(v16);
        return ;
    end;
end;
