local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
return function(v1, v2)
    local v3, v4 = v0.useState({
        state = "loading"
    });
    v0.useEffect(function()
        v4({
            state = "loading"
        });
        local v5 = task.spawn(function()
            v4({
                state = "ok", 
                value = v1()
            });
        end);
        return function()
            task.cancel(v5);
        end;
    end, v2);
    return v3;
end;
