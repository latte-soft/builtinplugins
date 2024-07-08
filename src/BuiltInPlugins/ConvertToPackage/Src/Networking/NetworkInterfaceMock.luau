local v0 = require(script.Parent.Parent.Parent.DEPRECATED_modules.Http.Promise);
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({}, v1));
end;
v1.resolveAssets = function(_, v3, v4)
    return v0.resolve({
        responseBody = {
            TotalResults = v4 or #v3, 
            Results = v3
        }
    });
end;
v1.getMyGroups = function(_, _)
    return v0.resolve({});
end;
return v1;
