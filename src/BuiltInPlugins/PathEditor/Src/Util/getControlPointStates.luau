local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.getControlPointState);
return function(v3)
    local v4 = {};
    for _, v6 in v3, nil, nil do
        table.insert(v4, v2(v6));
    end;
    return v4;
end;
