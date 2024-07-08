local v0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem:extend("RobloxAPI");
v0.new = function(v1)
    local v2 = {
        api = v1
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.get = function(v3)
    return v3.api;
end;
return v0;
