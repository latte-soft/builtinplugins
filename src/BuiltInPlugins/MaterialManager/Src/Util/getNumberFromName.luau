local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.getNumberFromText);
return function(v3, v4)
    local v5 = string.sub(v3, 1, #v4) == v4;
    local v6 = v2((string.sub(v3, string.len(v4) + 1)));
    local v7 = not not v6 or false;
    if not v5 or not v7 then
        return nil;
    else
        return v6;
    end;
end;
