local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Selectors.GetUserCollaborators);
local v2 = require(l_Parent_0.Src.Selectors.GetGroupCollaborators);
return function(v3)
    local v4, v5 = v1(v3);
    local v6, v7 = v2(v3);
    local v8 = true;
    if #v4 <= 0 then
        v8 = true;
        if #v5 <= 0 then
            v8 = true;
            if #v6 <= 0 then
                v8 = #v7 > 0;
            end;
        end;
    end;
    return v8;
end;
