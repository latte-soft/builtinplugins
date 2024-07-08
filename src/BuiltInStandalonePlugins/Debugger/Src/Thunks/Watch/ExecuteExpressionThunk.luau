local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.Watch.ExpressionEvaluated);
local _ = require(l_Parent_0.Src.Actions.Watch.AddChildExpression);
local l_Models_0 = l_Parent_0.Src.Models;
local _ = require(l_Models_0.StepStateBundle);
local v5 = require(l_Models_0.Watch.WatchRow);
local _ = require(l_Parent_0.Src.Util.Constants);
local v7 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
local v8 = require(l_Parent_0.Src.Thunks.Common.AddChildRowsToVars);
return function(v9, v10, v11)
    return function(v12, _)
        v7.evaluateWatchWithCallback(v9, v10, v11, v12, function(v14)
            if v14 ~= nil then
                v12:dispatch(v1(v10, (v5.fromInstance(v14, v9))));
                v12:dispatch(v8("", {
                    v14
                }, v10, false, v11));
            end;
        end);
    end;
end;
