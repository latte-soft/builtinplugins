local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Models_0 = l_Parent_0.Src.Models;
local v2 = require(l_Models_0.Watch.ScopeEnum);
local _ = require(l_Models_0.StepStateBundle);
local v4 = require(l_Parent_0.Src.Models.Watch.VariableRow);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.Watch.AddRootVariables);
local _ = require(l_Actions_0.Watch.AddChildVariables);
local _ = require(l_Parent_0.Src.Util.Constants);
local v9 = require(l_Parent_0.Src.Thunks.Common.AddChildRowsToVars);
local _ = function(v10, v11)
    local l_filterText_0 = v11:getState().Watch.filterText;
    local l_listOfEnabledScopes_0 = v11:getState().Watch.listOfEnabledScopes;
    local l_Children_0 = v10.Locals:GetChildren();
    local l_Children_1 = v10.Globals:GetChildren();
    local l_Children_2 = v10.Upvalues:GetChildren();
    local v17 = {};
    for _, v19 in ipairs(l_Children_0) do
        table.insert(v17, v4.fromInstance(v19, nil, v2.Local, l_filterText_0, l_listOfEnabledScopes_0));
    end;
    for _, v21 in ipairs(l_Children_1) do
        table.insert(v17, v4.fromInstance(v21, nil, v2.Global, l_filterText_0, l_listOfEnabledScopes_0));
    end;
    for _, v23 in ipairs(l_Children_2) do
        table.insert(v17, v4.fromInstance(v23, nil, v2.Upvalue, l_filterText_0, l_listOfEnabledScopes_0));
    end;
    return v17;
end;
local function v42(v25, v26, v27, v28)
    local l_filterText_1 = v27:getState().Watch.filterText;
    local l_listOfEnabledScopes_1 = v27:getState().Watch.listOfEnabledScopes;
    local l_Children_3 = v26.Locals:GetChildren();
    local l_Children_4 = v26.Globals:GetChildren();
    local l_Children_5 = v26.Upvalues:GetChildren();
    local v34 = {};
    local v35 = {};
    for _, v37 in ipairs(l_Children_3) do
        table.insert(v34, v4.fromInstance(v37, nil, v2.Local, l_filterText_1, l_listOfEnabledScopes_1));
        table.insert(v35, v37);
    end;
    for _, v39 in ipairs(l_Children_4) do
        table.insert(v34, v4.fromInstance(v39, nil, v2.Global, l_filterText_1, l_listOfEnabledScopes_1));
        table.insert(v35, v39);
    end;
    for _, v41 in ipairs(l_Children_5) do
        table.insert(v34, v4.fromInstance(v41, nil, v2.Upvalue, l_filterText_1, l_listOfEnabledScopes_1));
        table.insert(v35, v41);
    end;
    v27:dispatch(v6(v28, v34));
    v27:dispatch(v9("", v35, v28, true, v25));
end;
local function _(v43, v44, v45, v46, v47, v48)
    v44[v43] = true;
    if not ((not v44[v2.Local] or not v44[v2.Global]) or not v44[v2.Upvalue]) then
        v42(v45, v46, v47, v48);
    end;
end;
local function v76(v50, v51, v52, v53)
    local v54 = {};
    v50:Populate(v51.Locals, function()
        local l_debuggerStateToken_0 = v53.debuggerStateToken;
        if l_debuggerStateToken_0 ~= v52:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_0.debuggerConnectionId] then
            return ;
        else
            local l_Local_0 = v2.Local;
            local l_v54_0 = v54;
            local l_v50_0 = v50;
            local l_v51_0 = v51;
            local l_v52_0 = v52;
            local l_v53_0 = v53;
            l_v54_0[l_Local_0] = true;
            if not ((not l_v54_0[v2.Local] or not l_v54_0[v2.Global]) or not l_v54_0[v2.Upvalue]) then
                v42(l_v50_0, l_v51_0, l_v52_0, l_v53_0);
            end;
            return ;
        end;
    end);
    v50:Populate(v51.Globals, function()
        local l_debuggerStateToken_1 = v53.debuggerStateToken;
        if l_debuggerStateToken_1 ~= v52:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_1.debuggerConnectionId] then
            return ;
        else
            local l_Global_0 = v2.Global;
            local l_v54_1 = v54;
            local l_v50_1 = v50;
            local l_v51_1 = v51;
            local l_v52_1 = v52;
            local l_v53_1 = v53;
            l_v54_1[l_Global_0] = true;
            if not ((not l_v54_1[v2.Local] or not l_v54_1[v2.Global]) or not l_v54_1[v2.Upvalue]) then
                v42(l_v50_1, l_v51_1, l_v52_1, l_v53_1);
            end;
            return ;
        end;
    end);
    v50:Populate(v51.Upvalues, function()
        local l_debuggerStateToken_2 = v53.debuggerStateToken;
        if l_debuggerStateToken_2 ~= v52:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_2.debuggerConnectionId] then
            return ;
        else
            local l_Upvalue_0 = v2.Upvalue;
            local l_v54_2 = v54;
            local l_v50_2 = v50;
            local l_v51_2 = v51;
            local l_v52_2 = v52;
            local l_v53_2 = v53;
            l_v54_2[l_Upvalue_0] = true;
            if not ((not l_v54_2[v2.Local] or not l_v54_2[v2.Global]) or not l_v54_2[v2.Upvalue]) then
                v42(l_v50_2, l_v51_2, l_v52_2, l_v53_2);
            end;
            return ;
        end;
    end);
end;
return function(v77, v78, v79)
    return function(v80, _)
        if not v78.Populated then
            v77:Populate(v78, function()
                local l_debuggerStateToken_3 = v79.debuggerStateToken;
                if l_debuggerStateToken_3 ~= v80:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_3.debuggerConnectionId] then
                    return ;
                else
                    v76(v77, v78, v80, v79);
                    return ;
                end;
            end);
        end;
    end;
end;
