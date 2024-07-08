local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        ConnectionStarted = l_Signal_0.new(), 
        ConnectionEnded = l_Signal_0.new(), 
        FocusChanged = l_Signal_0.new()
    };
    setmetatable(v2, v1);
    return v2;
end;
return v1;
