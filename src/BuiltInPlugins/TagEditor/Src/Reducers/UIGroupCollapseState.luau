local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2)
    v1 = v1 or {};
    if v2.type == "SetUIGroupCollapseState" then
        return v2.data;
    else
        return v1;
    end;
end;
