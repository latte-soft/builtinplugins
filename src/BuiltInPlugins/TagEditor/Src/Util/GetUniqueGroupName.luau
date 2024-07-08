local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.TagManager);
local _ = require(l_Parent_0.Src.Types);
return function(v3)
    local v4 = 1;
    while v1.Get():GetGroups()[v3 .. " " .. tostring(v4)] do
        v4 = v4 + 1;
    end;
    return v3 .. " " .. tostring(v4);
end;
