local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        VREnabledSignal = l_Signal_0.new(), 
        VREnabled = false
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.GetPropertyChangedSignal = function(v3, v4)
    if v4 == "VREnabled" then
        return v3.VREnabledSignal;
    else
        return nil;
    end;
end;
return v1;
