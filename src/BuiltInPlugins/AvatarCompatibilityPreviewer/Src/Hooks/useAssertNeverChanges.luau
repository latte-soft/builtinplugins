local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
return function(v1)
    assert(v0.useRef(v1).current == v1, "Value has changed");
end;
