local _ = require(script.Parent.StackFrame);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4)
    local v5 = {
        ThreadId = v2, 
        ThreadName = v3, 
        isValid = v4, 
        Populated = false, 
        PopulatableType = "ThreadState", 
        callstack = {}, 
        FrameCount = 0
    };
    setmetatable(v5, v1);
    return v5;
end;
v1.GetFrame = function(v6, v7)
    return v6.callstack[v7];
end;
v1.GetChildren = function(v8)
    local v9 = {};
    for v10, v11 in pairs(v8.callstack) do
        v9[v10 + 1] = v11;
    end;
    return v9;
end;
v1.MockSetChildren = function(v12, v13)
    assert(v13);
    assert(v13[0]);
    v12.callstack = v13;
    v12.FrameCount = 0;
    for _ in pairs(v12.callstack) do
        v12.FrameCount = v12.FrameCount + 1;
    end;
    v12.Populated = true;
end;
return v1;
