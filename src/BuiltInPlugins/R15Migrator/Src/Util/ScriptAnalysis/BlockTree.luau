local v0 = require(script.Parent.CodeBlock);
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({
        _root = v0.new(1, 1)
    }, v1));
end;
v1.GetRoot = function(v2)
    return v2._root;
end;
v1.TraverseBF = function(v3, v4)
    local v5 = {
        v3._root
    };
    while #v5 > 0 do
        local v6 = v5[1];
        table.remove(v5, 1);
        for _, v8 in ipairs(v6.Children) do
            table.insert(v5, v8);
        end;
        v4(v6);
    end;
end;
v1.TraverseUp = function(v9, v10)
    local l_v9_0 = v9;
    while true do
        if not l_v9_0 then
            return ;
        elseif not v10(l_v9_0) then
            l_v9_0 = l_v9_0.Parent;
        else
            return ;
        end;
    end;
end;
return v1;
