local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_Signal_0 = v0.Util.Signal;
local _ = require(script.Parent.ThreadState);
local _ = require(script.Parent.StackFrame);
local v4 = require(script.Parent.DebuggerVariable);
local v5 = require(script.Parent.MockDebuggerLuaResponse);
local v6 = require(script.Parent.Parent.Util.Constants);
local l_Promise_0 = v0.Util.Promise;
local v8 = {};
v8.__index = v8;
v8.new = function(v9)
    local v10 = {};
    local v11 = v4.new(1, "Alex", "Instance", "Map");
    local v12 = v4.new(3, "Alex2", "somePreview", "map");
    v11:MockSetChildren({
        v12
    });
    local v13 = v4.new(2, "UnitedStates", "Instance", "Map");
    local v14 = v4.new(4, "Wisconsin", "Instance", "Map");
    local v15 = v4.new(5, "Madison", "somePreview", "map");
    v14:MockSetChildren({
        v15
    });
    v13:MockSetChildren({
        v14
    });
    v10.VariableMap = {
        [1] = v11, 
        [2] = v13, 
        [3] = v12, 
        [4] = v14, 
        [5] = v15
    };
    v10.watchMap = {
        Alex = v11, 
        UnitedStatesMockDebugger = v13
    };
    v10.MockThreadMap = {};
    v10.MockThreadIdToCallstackMap = {};
    v10.MockCallstackFrameToDebuggerVariables = {};
    v10.Id = v9;
    v10.Paused = l_Signal_0.new();
    v10.Resumed = l_Signal_0.new();
    v10.MockSetThreadStateById = function(v16, v17)
        v10.MockThreadMap[v16] = v17;
    end;
    v10.MockSetCallstackByThreadId = function(v18, v19)
        assert(v19);
        assert(v19[0]);
        v10.MockThreadIdToCallstackMap[v18] = v19;
    end;
    v10.MockSetDebuggerVariablesByCallstackFrame = function(v20, v21)
        v10.MockCallstackFrameToDebuggerVariables[v20] = v21;
    end;
    setmetatable(v10, v8);
    return v10;
end;
v8.GetThreadById = function(v22, v23)
    return v22.MockThreadMap[v23];
end;
v8.EvaluateWatch = function(v24, v25, _, v27)
    l_Promise_0.new(function(v28, _, _)
        v28(v27);
    end):andThen(function(v31)
        local _ = nil;
        v31((v5.new(if v24.watchMap[v25] ~= nil then v24.watchMap[v25] else {
            VariableId = 1
        }, v6.DebuggerStatus.Success)));
    end);
    return 0;
end;
v8.GetThreads = function(v33, v34)
    l_Promise_0.new(function(v35, _, _)
        v35(v34);
    end):andThen(function(v38)
        v38((v5.new(v33.MockThreadMap, v6.DebuggerStatus.Success)));
    end);
    return 0;
end;
v8.Populate = function(v39, v40, v41)
    if not v40.Populated then
        if v40.PopulatableType == "ThreadState" then
            v40:MockSetChildren(v39.MockThreadIdToCallstackMap[v40.ThreadId]);
        elseif v40.PopulatableType == "StackFrame" then
            v40:MockSetChildren(v39.MockCallstackFrameToDebuggerVariables[v40]);
        end;
    end;
    l_Promise_0.new(function(v42, _, _)
        v42(v41);
    end):andThen(function(v45)
        v45({});
    end);
    return 0;
end;
v8.GetVariableById = function(v46, v47)
    return v46.VariableMap[v47];
end;
v8.UpdateSelectedFrame = function(v48, v49, v50)
    v48.selectedThreadId = v49;
    v48.selectedFrameNumber = v50;
end;
return v8;
