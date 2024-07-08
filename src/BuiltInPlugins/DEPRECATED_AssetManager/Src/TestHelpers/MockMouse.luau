local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({
        Origin = CFrame.new(), 
        UnitRay = Ray.new(Vector3.new(), (Vector3.new())), 
        Target = nil, 
        WheelForward = l_Signal_0.new(), 
        WheelBackward = l_Signal_0.new()
    }, v1));
end;
return v1;
