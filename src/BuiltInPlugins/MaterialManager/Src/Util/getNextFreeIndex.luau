local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    local v2 = 1;
    if v1 and #v1 > 0 then
        table.sort(v1);
        for _, v4 in ipairs(v1) do
            if v2 >= v4 then
                v2 = v2 + 1;
            else
                break;
            end;
        end;
    end;
    return v2;
end;
