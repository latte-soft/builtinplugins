local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    return {
        type = "SetTagData", 
        data = v1
    };
end;
