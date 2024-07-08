local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    return {
        type = "SetUIGroupCollapseState", 
        data = v1
    };
end;
