local l_RunService_0 = game:GetService("RunService");
local l_t_0 = require(script.Parent.Parent.Packages.Framework).Util.Typecheck.t;
local v2 = l_t_0.tuple(l_t_0.callback, l_t_0.optional(l_t_0.strictInterface({
    queueTimeLimit = l_t_0.optional(l_t_0.numberPositive), 
    queueErrorLimit = l_t_0.optional(l_t_0.numberPositive), 
    queueKeyLimit = l_t_0.optional(l_t_0.numberPositive)
})));
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    assert(v2(v4, v5));
    v5 = v5 or {};
    local v6 = {
        _reportMethod = v4, 
        _queueTimeLimit = v5.queueTimeLimit or 30, 
        _queueErrorLimit = v5.queueErrorLimit or 30, 
        _queueKeyLimit = v5.queueKeyLimit or 10, 
        _errors = {}, 
        _totalErrorCount = 0, 
        _totalKeyCount = 0, 
        _runningTime = 0, 
        _renderSteppedConnection = nil
    };
    setmetatable(v6, v3);
    return v6;
end;
v3.hasError = function(v7, v8)
    if not l_t_0.string(v8) or v8 == "" then
        return false;
    else
        return v7._errors[v8] ~= nil;
    end;
end;
v3.addError = function(v9, v10, v11)
    assert(l_t_0.string(v10), "Expected errorKey to be a string");
    assert(l_t_0.any(v11), "Expected errorData to not be nil");
    if v9._errors[v10] then
        v9._errors[v10].count = v9._errors[v10].count + 1;
    else
        v9._errors[v10] = {
            data = v11, 
            count = 1
        };
        v9._totalKeyCount = v9._totalKeyCount + 1;
    end;
    v9._totalErrorCount = v9._totalErrorCount + 1;
    if v9:isReadyToReport() then
        v9:reportAllErrors();
    end;
end;
v3.isReadyToReport = function(v12)
    return (v12._queueKeyLimit <= v12._totalKeyCount or v12._queueErrorLimit <= v12._totalErrorCount) or v12._totalErrorCount > 0 and v12._queueTimeLimit <= v12._runningTime;
end;
v3.reportAllErrors = function(v13)
    local v14 = v13._errors or {};
    v13._errors = {};
    v13._totalErrorCount = 0;
    v13._totalKeyCount = 0;
    v13._runningTime = 0;
    for v15, v16 in pairs(v14) do
        v13._reportMethod(v15, v16.data, v16.count);
    end;
end;
v3._onQueueTimerTick = function(v17, v18)
    v17._runningTime = v17._runningTime + v18;
    if v17:isReadyToReport() then
        v17:reportAllErrors();
    end;
end;
v3.startTimer = function(v19)
    if v19._renderSteppedConnection == nil then
        v19._runningTime = 0;
        v19._renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(v20)
            v19:_onQueueTimerTick(v20);
        end);
    end;
end;
v3.stopTimer = function(v21)
    if v21._renderSteppedConnection ~= nil then
        v21._renderSteppedConnection:Disconnect();
        v21._runningTime = 0;
        v21._renderSteppedConnection = nil;
    end;
    v21:reportAllErrors();
end;
return v3;
