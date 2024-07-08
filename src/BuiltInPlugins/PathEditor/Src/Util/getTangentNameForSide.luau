local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1)
    if v1 == "Left" then
        return "LeftTangent";
    else
        return "RightTangent";
    end;
end;
