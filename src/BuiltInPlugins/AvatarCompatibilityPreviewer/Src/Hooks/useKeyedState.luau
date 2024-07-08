local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
return function(v1, v2)
    local v3, v4 = v0.useState({});
    return if v3[v2] == nil then v1(v2) else v3[v2], (v0.useCallback(function(v5)
        v4(function(v6)
            v6 = table.clone(v6);
            v6[v2] = if v6[v2] == nil then v5(v1(v2)) else v5(v6[v2]);
            return v6;
        end);
    end, {
        v2, 
        v1
    }));
end;
