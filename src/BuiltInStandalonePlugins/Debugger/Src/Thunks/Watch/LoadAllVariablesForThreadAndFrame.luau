local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local l_Models_0 = l_Parent_0.Src.Models;
local v3 = require(l_Models_0.StepStateBundle);
local v4 = require(l_Models_0.Watch.WatchRow);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local _ = require(l_Thunks_0.Watch.ExecuteExpressionThunk);
local v7 = require(l_Thunks_0.Callstack.LoadStackFrameVariables);
local v8 = require(l_Thunks_0.Common.AddChildRowsToVars);
local v9 = require(l_Parent_0.Src.Actions.Callstack.SetCurrentThread);
local v10 = require(l_Parent_0.Src.Actions.Watch.ExpressionsEvaluated);
local v11 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
return function(v12, v13, v14, v15)
    return function(v16, _)
        if v13 then
            v13:UpdateSelectedFrame(v12, v14);
            v15:SetCurrentThreadId(v12);
            v16:dispatch(v9(v12));
            local v18 = v16:getState().Common.debuggerConnectionIdToDST[v13.Id];
            local l_Children_0 = v13:GetThreadById(v12):GetChildren();
            local v20 = v3.ctor(v18, v12, v14 + 1);
            v16:dispatch(v7(v13, l_Children_0[v14 + 1], v20));
            local l_listOfExpressions_0 = v16:getState().Watch.listOfExpressions;
            local v22 = {};
            local v23 = {};
            local v24 = #l_listOfExpressions_0;
            for _, v26 in ipairs(l_listOfExpressions_0) do
                v11.evaluateWatchWithCallback(v26, v20, v13, v16, function(v27)
                    if v27 ~= nil then
                        table.insert(v22, v27);
                        table.insert(v23, v4.fromInstance(v27, v26));
                    end;
                    v24 = v24 - 1;
                    if v24 == 0 then
                        v16:dispatch(v10(v20, v23));
                        v16:dispatch(v8("", v22, v20, false, v13));
                    end;
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
end;
