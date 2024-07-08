local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.StepStateBundle);
local v3 = require(l_Models_0.Watch.TableTab);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Watch.SetVariablesTextFilteredOut);
local v6 = require(l_Actions_0.Watch.SetExpansionTree);
local v7 = require(l_Actions_0.Watch.FilterTextChanged);
local v8 = require(l_Parent_0.Src.Util.WatchHelperFunctions);
local function v9(v10, v11, v12, v13)
    local v14 = v12[v11];
    assert(v14 ~= nil, ("FilterWatchDataThunk depthFirstTextFilter got a nil node for path %s"):format((tostring(v11))));
    local v15 = false;
    for _, v17 in ipairs(v14.childPaths) do
        v15 = v15 or v9(v10, v17, v12, v13);
    end;
    local v18 = v15 or v8.textMatchRow(v10, v14);
    v13[v11] = v18;
    return v18;
end;
return function(v19)
    return function(v20, _)
        v20:dispatch(v7(v19));
        local v22 = v20:getState();
        local l_Common_0 = v22.Common;
        local l_Watch_0 = v22.Watch;
        local v25 = l_Common_0.debuggerConnectionIdToDST[l_Common_0.currentDebuggerConnectionId];
        local v26 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
        if v26 == nil then
            return ;
        else
            local v27 = l_Common_0.currentFrameMap[l_Common_0.currentDebuggerConnectionId][v26];
            local v28 = v2.ctor(v25, v26, v27);
            local v29 = l_Watch_0.currentTab == v3.Variables;
            local l_stateTokenToRoots_0 = l_Watch_0.stateTokenToRoots;
            local l_stateTokenToFlattenedTree_0 = l_Watch_0.stateTokenToFlattenedTree;
            local v32 = (l_stateTokenToRoots_0[v25] and l_stateTokenToRoots_0[v25][v26]) and l_stateTokenToRoots_0[v25][v26][v27];
            if v32 == nil then
                warn("unexpected nil in filter thunk");
                return ;
            else
                local v33 = (l_stateTokenToFlattenedTree_0[v25] and l_stateTokenToFlattenedTree_0[v25][v26]) and l_stateTokenToFlattenedTree_0[v25][v26][v27];
                if v33 == nil then
                    warn("unexpected nil in filter thunk");
                    return ;
                else
                    local v34 = not not v29 and v32.Variables or v32.Watches;
                    local v35 = not not v29 and v33.Variables or v33.Watches;
                    local v36 = {};
                    local v37 = {};
                    for _, v39 in pairs(v34) do
                        v37[v39] = not v9(v19, v39, v35, v36);
                    end;
                    v20:dispatch(v5(v28, v37, v29));
                    v20:dispatch(v6(v29, v36));
                    return ;
                end;
            end;
        end;
    end;
end;
