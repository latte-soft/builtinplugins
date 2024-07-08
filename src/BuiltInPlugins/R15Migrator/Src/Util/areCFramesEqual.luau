local l_Math_0 = require(script:FindFirstAncestor("R15Migrator").Packages.Framework).Util.Math;
return function(v1, v2, v3)
    local v4 = {
        v1:GetComponents()
    };
    local v5 = {
        v2:GetComponents()
    };
    for v6 = 1, 12 do
        if not l_Math_0.fuzzyEq(v4[v6], v5[v6], v3) then
            return false;
        end;
    end;
    return true;
end;
