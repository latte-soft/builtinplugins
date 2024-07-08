local v0 = require(script.Parent.Parent.Parent.Actions.Watch.ClearAllExpressions);
local v1 = {};
v1.__index = v1;
v1.OnExpressionsCleared = function(v2)
    v2.store:dispatch(v0());
end;
local function _(v3, v4)
    v3._expressionsClearedConnection = (v4 or game:GetService("DebuggerUIService")).ExpressionsCleared:Connect(function()
        v3:OnExpressionsCleared();
    end);
end;
v1.destroy = function(v6)
    if v6._expressionsClearedConnection then
        v6._expressionsClearedConnection:Disconnect();
        v6._expressionsClearedConnection = nil;
    end;
end;
v1.new = function(v7, v8)
    local v9 = {
        store = v7
    };
    v9._expressionsClearedConnection = (v8 or game:GetService("DebuggerUIService")).ExpressionsCleared:Connect(function()
        v9:OnExpressionsCleared();
    end);
    setmetatable(v9, v1);
    return v9;
end;
return v1;
