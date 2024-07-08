local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local v2 = require(l_Parent_0.Src.Actions.Common.SetPausedState);
local v3 = require(l_Parent_0.Src.Util.Constants);
return function(v4, v5, v6, v7)
    return function(v8, v9)
        local l_ConnectionById_0 = game:GetService("DebuggerConnectionManager"):GetConnectionById(v6);
        if not (v7 ~= nil) or l_ConnectionById_0 == nil then
            return ;
        else
            local l_l_ConnectionById_0_ThreadById_0 = l_ConnectionById_0:GetThreadById(v7);
            if l_l_ConnectionById_0_ThreadById_0 then
                if v4 == v3.StepActionIds.stepOverActionV2 then
                    l_ConnectionById_0:Step(l_l_ConnectionById_0_ThreadById_0, function()
                    end);
                    v9.analytics:report(v1.CallstackStepOver, v5);
                elseif v4 == v3.StepActionIds.stepIntoActionV2 then
                    l_ConnectionById_0:StepIn(l_l_ConnectionById_0_ThreadById_0, function()
                    end);
                    v9.analytics:report(v1.CallstackStepInto, v5);
                elseif v4 == v3.StepActionIds.stepOutActionV2 then
                    l_ConnectionById_0:StepOut(l_l_ConnectionById_0_ThreadById_0, function()
                    end);
                    v9.analytics:report(v1.CallstackStepOut, v5);
                else
                    assert(false);
                    return ;
                end;
                v8:dispatch(v2(false));
                return ;
            else
                return ;
            end;
        end;
    end;
end;
