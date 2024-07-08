local v0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem:extend("NetworkInterface");
v0.new = function(v1)
    local v2 = {
        networkInterface = v1
    };
    setmetatable(v2, v0);
    return v2;
end;
return v0;
