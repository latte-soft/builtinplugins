local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2)
    if #v2 < #v1 then
        return false;
    else
        for v3, v4 in ipairs(v1) do
            if not (v4 == v2[v3]) then
                return false;
            end;
        end;
        return true;
    end;
end;
