local v0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem:extend("Analytics");
v0.new = function(v1)
    assert(v1, "Analytics.new expects analyticsImpl.");
    local v2 = {
        analyticsImpl = v1
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.get = function(v3)
    return v3.analyticsImpl;
end;
return v0;
