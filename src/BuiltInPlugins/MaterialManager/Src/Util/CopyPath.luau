local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    local v2 = {};
    for _, v4 in ipairs(v1) do
        table.insert(v2, v4);
    end;
    return v2;
end;
