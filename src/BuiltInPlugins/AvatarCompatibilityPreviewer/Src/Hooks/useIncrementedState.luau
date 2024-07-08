local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
return function()
    local v1, v2 = v0.useState(0);
    return {
        amount = v1, 
        increment = v0.useCallback(function()
            v2(function(v3)
                return v3 + 1;
            end);
        end, {}), 
        decrement = v0.useCallback(function()
            v2(function(v4)
                return v4 - 1;
            end);
        end, {})
    };
end;
