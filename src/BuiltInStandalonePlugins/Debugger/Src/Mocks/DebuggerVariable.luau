local v0 = require(script.Parent.Parent.Util.Constants);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5)
    local v6 = {
        VariableId = v2, 
        Name = v3, 
        Value = v4, 
        Type = v5, 
        Populated = false, 
        PopulatableType = "DebuggerVariable"
    };
    setmetatable(v6, v1);
    return v6;
end;
v1.MockSetChildren = function(v7, v8)
    v7.children = v8;
end;
v1.GetChildren = function(v9)
    return not not v9.children and v9.children or {};
end;
v1.GetVariableByIndex = function(_)
    return v1.new(0, "", "", "");
end;
v1.newDummyRow = function()
    return v1.new(0, v0.DummyRowName, "", "");
end;
v1.GetDefaultFrameVariables = function()
    return {
        Locals = v1.new(1, "", "", ""), 
        Globals = v1.new(1, "", "", ""), 
        Upvalues = v1.new(1, "", "", "")
    };
end;
return v1;
