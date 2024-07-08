local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local l_Models_0 = l_Parent_0.Src.Models;
local _ = require(l_Models_0.StepStateBundle);
local v4 = require(l_Models_0.Watch.VariableRow);
local v5 = require(l_Models_0.Watch.WatchRow);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v7 = require(l_Actions_0.Watch.AddChildVariables);
local v8 = require(l_Actions_0.Watch.AddChildExpression);
local v9 = require(l_Actions_0.Watch.RemoveDummyVariableFromParent);
local v10 = nil;
local function v28(v11, v12, v13, v14, v15, v16)
    local v17 = v16:getState();
    local l_filterText_0 = v17.Watch.filterText;
    local l_listOfEnabledScopes_0 = v17.Watch.listOfEnabledScopes;
    local v20 = v17.Watch.stateTokenToFlattenedTree[v13.debuggerStateToken][v13.threadId][v13.frameNumber];
    local v21 = if not v14 then v20.Watches[v12] else v20.Variables[v12];
    if not if not v14 then v17.Watch.expressionToExpansionState[v12] else v17.Watch.pathToExpansionState[v12] then
        if not v14 then
            v16:dispatch(v8(v13, v12, {
                v5.dummyRow(v21)
            }));
            return ;
        else
            v16:dispatch(v7(v13, v12, {
                v4.dummyRow(v21, l_filterText_0, l_listOfEnabledScopes_0)
            }));
            return ;
        end;
    elseif not v11.Populated then
        v15:Populate(v11, function()
            local l_debuggerStateToken_0 = v13.debuggerStateToken;
            if l_debuggerStateToken_0 ~= v16:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_0.debuggerConnectionId] then
                return ;
            else
                v16:dispatch(v9(v13, v12, v14));
                local l_v11_Children_0 = v11:GetChildren();
                if #l_v11_Children_0 == 0 then
                    return ;
                else
                    local v24 = {};
                    for _, v26 in ipairs(l_v11_Children_0) do
                        local _ = nil;
                        table.insert(v24, if not v14 then v5.fromChildInstance(v26, v12) else v4.fromInstance(v26, v21, nil, l_filterText_0, l_listOfEnabledScopes_0));
                    end;
                    if not v14 then
                        v16:dispatch(v8(v13, v12, v24));
                    else
                        v16:dispatch(v7(v13, v12, v24));
                    end;
                    v10(v12, l_v11_Children_0, v13, v14, v15, v16);
                    return ;
                end;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v10 = function(v29, v30, v31, v32, v33, v34)
    for _, v36 in ipairs(v30) do
        if v36.VariableId ~= 0 then
            v28(v36, if v29 == "" then v36.Name else v29 .. v1.SeparationToken .. v36.Name, v31, v32, v33, v34);
        end;
    end;
end;
return function(v37, v38, v39, v40, v41)
    return function(v42, _)
        v10(v37, v38, v39, v40, v41, v42);
    end;
end;
