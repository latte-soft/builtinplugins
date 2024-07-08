local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.StepStateBundle);
local _ = require(l_Models_0.DebuggerStateToken);
local v4 = require(l_Parent_0.Src.Thunks.Watch.ExecuteExpressionThunk);
return function(v5, v6, v7, v8)
    return function(v9, _)
        assert(v6);
        local l_v6_ThreadById_0 = v6:GetThreadById(v8);
        assert(l_v6_ThreadById_0);
        for v12 = 1, l_v6_ThreadById_0.FrameCount do
            v9:dispatch(v4(v5, v2.ctor(v7, v8, v12), v6));
        end;
    end;
end;
