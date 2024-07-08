local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Cryo);
local function v1(v2, v3)
    if v2 == nil then
        return "<nil>";
    else
        local v4 = string.rep("  ", v3);
        local v5 = "{\n";
        local v6 = v0.Dictionary.keys(v2);
        table.sort(v6, function(v7, v8)
            return tostring(v7) < tostring(v8);
        end);
        for _, v10 in ipairs(v6) do
            local v11 = v2[v10];
            v5 = v5 .. string.format("%s  %s%s:", v4, tostring(v10), if typeof(v10) ~= "string" and typeof(v10) ~= "number" then string.format("[%s]", (typeof(v10))) else "");
            if type(v11) == "table" then
                v5 = v5 .. v1(v11, v3 + 1);
            else
                v5 = v5 .. tostring(v11) .. "\n";
            end;
        end;
        return v5 .. v4 .. "}\n";
    end;
end;
return function(v12)
    print((v1(v12, 0)));
end;
