local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2)
    local v3 = {};
    if v1 == nil then
        return v3;
    else
        for _, v5 in v1, nil, nil do
            if v5:lower():match(v2:lower()) then
                table.insert(v3, {
                    Id = v5, 
                    Label = v5, 
                    Value = v5
                });
            end;
        end;
        table.sort(v3, function(v6, v7)
            return v6.Label < v7.Label;
        end);
        return v3;
    end;
end;
