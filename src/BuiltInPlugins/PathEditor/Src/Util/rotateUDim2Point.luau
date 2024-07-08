local v0 = require(script.Parent.getVector2FromUDim2Scale);
local v1 = require(script.Parent.getUDim2FromVector2);
local v2 = require(script.Parent.rotatePoint);
rotateUDim2Point = function(v3, v4, v5, v6)
    if v5 == 0 then
        return v3;
    else
        return v1(v2(v0(v3, v6), v4, v5), v6);
    end;
end;
return rotateUDim2Point;
