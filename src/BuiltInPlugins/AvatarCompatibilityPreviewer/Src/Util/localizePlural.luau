local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.Dash);
return function(v1, v2, v3, v4, v5)
    return v1:getText(v2, if v4 == 1 then ("%*_Singular"):format(v3) else ("%*_Plural"):format(v3), v0.join({
        amount = if v4 == 1 then nil else v4
    }, v5));
end;
