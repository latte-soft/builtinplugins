local l_Math_0 = require(script:FindFirstAncestor("AnimationClipEditor").Packages.Framework).Util.Math;
return function(v1, v2)
    local v3 = {
        v1:GetComponents()
    };
    local v4 = {
        v2:GetComponents()
    };
    for v5 = 1, 12 do
        if not l_Math_0.fuzzyEq(v3[v5], v4[v5]) then
            return false;
        end;
    end;
    return true;
end;
