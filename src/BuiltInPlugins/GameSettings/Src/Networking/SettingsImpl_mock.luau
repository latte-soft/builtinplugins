local l_Promise_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Promise;
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({}, v1));
end;
v1.GetUserId = function(_)
    return 0;
end;
v1.GetSettings = function(_)
    return l_Promise_0.resolve({});
end;
v1.SaveAll = function(_)
    return l_Promise_0.resolve();
end;
return v1;
