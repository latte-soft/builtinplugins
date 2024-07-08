local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.BodyShape);
local v2 = require(l_Parent_0.Src.Util.loadOutfitAsHumanoidDescription);
return function(v3)
    return v2(v3 == v1.Masculine and 0 or 131929545);
end;
