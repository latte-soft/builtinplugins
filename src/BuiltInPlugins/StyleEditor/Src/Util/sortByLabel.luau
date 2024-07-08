local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    table.sort(v1, function(v2, v3)
        return v2.Label:lower() < v3.Label:lower();
    end);
    return v1;
end;
