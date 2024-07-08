local l_Parent_0 = script.Parent.Parent;
local l_Models_0 = l_Parent_0.Models;
local v2 = require(l_Models_0.Watch.WatchRow);
local v3 = require(l_Models_0.Watch.VariableRow);
local v4 = require(l_Models_0.Watch.ScopeEnum);
local v5 = require(l_Models_0.StepStateBundle);
local v6 = require(l_Models_0.MetaBreakpoint);
local l_Mocks_0 = l_Parent_0.Mocks;
local v8 = require(l_Mocks_0.ThreadState);
local v9 = require(l_Mocks_0.StackFrame);
local v10 = require(l_Mocks_0.ScriptRef);
local v11 = require(l_Mocks_0.PausedState);
local v12 = require(l_Mocks_0.DebuggerVariable);
local v13 = require(l_Mocks_0.MockDebuggerConnection);
local v14 = require(l_Mocks_0.MockDebuggerConnectionManager);
local v15 = require(l_Mocks_0.MockDebuggerUIService);
local v16 = require(l_Mocks_0.MockCrossDMScriptChangeListenerService);
local l_Actions_0 = l_Parent_0.Actions;
local v18 = require(l_Actions_0.Watch.AddExpression);
local v19 = require(l_Actions_0.Watch.ExpressionEvaluated);
local v20 = require(l_Actions_0.BreakpointsWindow.AddBreakpoint);
local v21 = require(l_Actions_0.Watch.AddChildVariables);
local v22 = require(l_Parent_0.Util.DebugConnectionListener.DebugConnectionListener);
local v23 = require(l_Parent_0.Util.Constants);
return function(v24)
    local v25 = v2.fromData({
        expression = "Expression 1", 
        path = "3", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string", 
        childPaths = {}
    });
    local v26 = v12.new(1, "Alex", "somePreview", "map");
    local v27 = {
        name = "Heesoo", 
        path = "Alex_Heesoo", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "map"
    };
    local v28 = {
        name = "Austin", 
        path = "Alex_Austin", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string"
    };
    local v29 = {
        name = "Raul", 
        path = "Alex_Heesoo_Raul", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string"
    };
    local v30 = {
        name = "Karan", 
        path = "Alex_Austin_Karan", 
        scope = v4.Local, 
        value = "somePreview", 
        dataType = "string"
    };
    local v31 = v12.new(2, "UnitedStates", "somePreview2", "map");
    local v32 = {
        name = "Wisconsin", 
        path = "UnitedStates_Wisconsin", 
        scope = v4.Local, 
        value = "somePreview2", 
        dataType = "map"
    };
    local v33 = {
        name = "GreenBay", 
        path = "UnitedStates_Wisconsin_GreenBay", 
        scope = v4.Local, 
        value = "somePreview2", 
        dataType = "string"
    };
    local v34 = v3.fromData(v27);
    local v35 = v3.fromData(v28);
    local v36 = v3.fromData(v29);
    local v37 = v3.fromData(v30);
    local v38 = v3.fromData(v32);
    local v39 = v3.fromData(v33);
    local v40 = v10.new();
    local v41 = v10.new();
    local v42 = v9.new(10, v40, "TestFrame1", "C");
    local v43 = v9.new(20, v41, "TestFrame2", "C");
    local v44 = {
        [0] = v42, 
        [1] = v43
    };
    local v45 = {
        [0] = v43, 
        [1] = v42
    };
    local v46 = v8.new(1, v40, true);
    local v47 = v8.new(2, v41, true);
    local v48 = nil;
    v48 = v11.new(v23.DebuggerPauseReason.Requested, 1, true);
    local v49 = v13.new(1);
    local v50 = v14.new();
    local _ = v22.new(v24, v50, v15.new(), v16.new());
    v49.MockSetThreadStateById(1, v46);
    v49.MockSetThreadStateById(2, v47);
    v49.MockSetCallstackByThreadId(1, v44);
    v49.MockSetCallstackByThreadId(2, v45);
    local v52 = v12.GetDefaultFrameVariables();
    v52.Locals:MockSetChildren({
        v26, 
        v31
    });
    v49.MockSetDebuggerVariablesByCallstackFrame(v42, v52);
    local v53 = v12.GetDefaultFrameVariables();
    v53.Locals:MockSetChildren({
        v31, 
        v26
    });
    v49.MockSetDebuggerVariablesByCallstackFrame(v43, v53);
    v50.ConnectionStarted:Fire(v49);
    v49.Paused:Fire(v48, v48.Reason);
    local l_Common_0 = v24:getState().Common;
    local v55 = v5.ctor(l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId], 1, 1);
    v24:dispatch(v18("Expression 1"));
    v24:dispatch(v19(v55, v25));
    local v56 = 0;
    for _, v58 in ipairs({
        1, 
        2, 
        3, 
        4, 
        5, 
        6, 
        7, 
        8, 
        9, 
        10, 
        11, 
        12, 
        14
    }) do
        v24:dispatch(v20(123, v6.mockMetaBreakpoint({
            isEnabled = v56 >= 6
        }, v58)));
        v56 = v56 + 1;
    end;
    v24:dispatch(v21(v55, "Alex", {
        v34, 
        v35
    }));
    v24:dispatch(v21(v55, "Alex_Heesoo", {
        v36
    }));
    v24:dispatch(v21(v55, "Alex_Austin", {
        v37
    }));
    v24:dispatch(v21(v55, "UnitedStates", {
        v38
    }));
    v24:dispatch(v21(v55, "UnitedStates_Wisconsin", {
        v39
    }));
    return v24;
end;
