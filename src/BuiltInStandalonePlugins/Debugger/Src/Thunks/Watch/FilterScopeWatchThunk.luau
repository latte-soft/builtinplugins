local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Models.StepStateBundle);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.Watch.SetVariablesScopeFilteredOut);
local v4 = require(l_Actions_0.Watch.ScopeFilterChange);
local v5 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
return function(v6)
    return function(v7, _)
        v7:dispatch(v4(v6));
        local v9 = v7:getState();
        local l_Common_0 = v9.Common;
        local l_Watch_0 = v9.Watch;
        local v12 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
        local v13 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
        if v13 == nil then
            return ;
        else
            local v14 = l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId][v13];
            local v15 = v1.ctor(v12, v13, v14);
            local l_stateTokenToRoots_0 = l_Watch_0.stateTokenToRoots;
            local l_stateTokenToFlattenedTree_0 = l_Watch_0.stateTokenToFlattenedTree;
            local v18 = (l_stateTokenToRoots_0[v12] and l_stateTokenToRoots_0[v12][v13]) and l_stateTokenToRoots_0[v12][v13][v14];
            if v18 == nil then
                return ;
            else
                local v19 = (l_stateTokenToFlattenedTree_0[v12] and l_stateTokenToFlattenedTree_0[v12][v13]) and l_stateTokenToFlattenedTree_0[v12][v13][v14];
                if v19 == nil then
                    warn("unexpected nil in filter thunk");
                    return ;
                else
                    local l_Variables_0 = v18.Variables;
                    local l_Variables_1 = v19.Variables;
                    local v22 = {};
                    for _, v24 in pairs(l_Variables_0) do
                        v22[v24] = v5.isScopeFiltered(v6, l_Variables_1[v24]);
                    end;
                    v7:dispatch(v3(v15, v22));
                    return ;
                end;
            end;
        end;
    end;
end;
