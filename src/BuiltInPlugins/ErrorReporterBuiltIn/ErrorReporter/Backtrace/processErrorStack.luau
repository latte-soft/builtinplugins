local v0 = require(script.Parent.splitStringWithMarks);
local v1 = require(script.Parent.findFileNameFromPath);
return function(v2)
    local v3 = {};
    local v4 = {};
    local v5 = 0;
    if type(v2) ~= "string" then
        return v3, v4;
    else
        for v6 in v2:gmatch("[^\r\n]+") do
            local _ = nil;
            local v8 = nil;
            local v9 = nil;
            local v10 = nil;
            local v11, v12 = v0(v6, {
                ", line ", 
                ", Line ", 
                ":"
            });
            v8 = v11;
            v11, v12 = v0(v12, {
                " - "
            });
            v10 = v11;
            v9 = v12;
            if v10 ~= "" and v8 ~= "" then
                local v13;
                v11, v12, v13 = string.find(v8, "Script '(.*)'");
                if v13 ~= nil then
                    v8 = v13;
                end;
                local v14 = v4[v8];
                if v14 == nil then
                    v5 = v5 + 1;
                    v14 = v5;
                    v4[v8] = v14;
                end;
                if v9 == "" then
                    v9 = v1(v8);
                end;
                table.insert(v3, {
                    line = v10, 
                    funcName = v9, 
                    sourceCode = tostring(v14)
                });
            end;
        end;
        local v15 = {};
        for v16, v17 in pairs(v4) do
            v15[tostring(v17)] = {
                path = v16
            };
        end;
        return v3, v15;
    end;
end;
