local _ = require(script.Parent.ScriptRef);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5)
    local v6 = {
        Line = v2, 
        Script = v3, 
        FrameName = v4, 
        FrameType = v5, 
        Populated = false, 
        FrameId = 0, 
        PopulatableType = "StackFrame"
    };
    setmetatable(v6, v1);
    return v6;
end;
v1.MockSetChildren = function(v7, v8)
    assert(v8);
    v7.Locals = v8.Locals;
    v7.Globals = v8.Globals;
    v7.Upvalues = v8.Upvalues;
    v7.Populated = true;
end;
return v1;
