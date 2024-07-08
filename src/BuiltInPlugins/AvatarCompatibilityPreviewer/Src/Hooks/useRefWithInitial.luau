local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
return function(v1)
    local v2 = v0.useRef(nil);
    if v2.current == nil then
        v2.current = v1();
    end;
    return v2;
end;
