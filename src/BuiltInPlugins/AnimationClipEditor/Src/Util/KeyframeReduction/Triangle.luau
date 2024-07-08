local _ = require(script.Parent.Types);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4)
    local v5 = setmetatable({
        a = v2, 
        b = v3, 
        c = v4, 
        area = 0
    }, v1);
    v5:updateArea();
    return v5;
end;
local function v10(v6, v7)
    local v8 = 0;
    for v9 = 1, #v6 do
        v8 = v8 + (v6[v9] - v7[v9]) * (v6[v9] - v7[v9]);
    end;
    return v8;
end;
v1.updateArea = function(v11)
    local v12 = v10(v11.a, v11.b);
    local v13 = v10(v11.a, v11.c);
    local v14 = (v12 + v13) - v10(v11.b, v11.c);
    v11.area = (4 * v12) * v13 - v14 * v14;
end;
return v1;
