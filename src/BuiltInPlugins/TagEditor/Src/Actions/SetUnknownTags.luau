local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    return {
        type = "SetUnknownTags", 
        data = v1
    };
end;
