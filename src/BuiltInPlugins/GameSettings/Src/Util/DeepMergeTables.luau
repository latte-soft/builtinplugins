local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
local v1 = {};
v1.Merge = function(v2, v3)
    v2 = v2 or {};
    v3 = v3 or {};
    local v4 = {};
    for v5, v6 in pairs(v2) do
        if v3[v5] == nil then
            v4[v5] = v6;
        end;
    end;
    for v7, v8 in pairs(v3) do
        if type(v8) == "table" then
            if v2[v7] ~= nil and type(v2[v7]) == "table" then
                v4[v7] = v1.Merge(v2[v7], v8);
            else
                v4[v7] = v1.Merge(nil, v8);
            end;
        elseif v8 == v0.None then
            v4[v7] = nil;
        else
            v4[v7] = v8;
        end;
    end;
    if next(v4) == nil then
        return nil;
    else
        return v4;
    end;
end;
return v1;
