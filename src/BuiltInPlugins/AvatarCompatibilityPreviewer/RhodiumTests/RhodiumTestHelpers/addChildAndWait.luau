local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.Promise);
return function(v1, v2, v3)
    task.defer(v2);
    return v0.try(function()
        local v4 = {};
        for _ = 1, v3 or 1 do
            table.insert(v4, v1.ChildAdded:Wait());
        end;
        return unpack(v4);
    end):timeout(3):expect();
end;
