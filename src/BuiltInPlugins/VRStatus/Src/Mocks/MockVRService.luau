local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        VRDeviceNameSignal = l_Signal_0.new(), 
        VRDeviceName = "abc"
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.GetPropertyChangedSignal = function(v3, v4)
    if v4 == "VRDeviceName" then
        return v3.VRDeviceNameSignal;
    else
        return nil;
    end;
end;
return v1;
