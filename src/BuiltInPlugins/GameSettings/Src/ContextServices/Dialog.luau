local v0 = require(script.Parent.Parent.Parent.Packages.Framework).ContextServices.ContextItem:extend("DialogProvider");
v0.new = function(v1)
    assert(typeof(v1) == "function", "No showDialog function was provided.");
    local v2 = {
        showDialog = v1
    };
    setmetatable(v2, v0);
    return v2;
end;
return v0;
