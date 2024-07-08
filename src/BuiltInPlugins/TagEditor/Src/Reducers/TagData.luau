local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2)
    v1 = v1 or {};
    if v2.type == "SetTagData" then
        table.sort(v2.data, function(v3, v4)
            local v5 = v3.Group or "";
            local v6 = v4.Group or "";
            if v5 < v6 then
                return true;
            elseif v6 < v5 then
                return false;
            else
                return (v3.Name or "") < (v4.Name or "");
            end;
        end);
        return v2.data;
    else
        return v1;
    end;
end;
