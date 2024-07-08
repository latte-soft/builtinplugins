local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return {
    textMatchRow = function(v3, v4)
        local v5 = v3:lower();
        if v4.nameColumn ~= nil and string.find(v4.nameColumn:lower(), v5) ~= nil then
            return true;
        elseif v4.expressionColumn ~= nil and string.find(v4.expressionColumn:lower(), v5) ~= nil then
            return true;
        elseif string.find(v4.scopeColumn:lower(), v5) ~= nil then
            return true;
        elseif string.find(v4.valueColumn:lower(), v5) ~= nil then
            return true;
        elseif string.find(v4.dataTypeColumn:lower(), v5) ~= nil then
            return true;
        else
            return false;
        end;
    end, 
    isScopeFiltered = function(v6, v7)
        assert(v7 ~= nil, ("isScopeFiltered got a nil node for path %s"):format((tostring(v7))));
        for _, v9 in ipairs(v6) do
            if string.find(v7.scopeColumn, v9) then
                return false;
            end;
        end;
        return true;
    end, 
    evaluateWatchWithCallback = function(v10, v11, v12, v13, v14)
        local l_debuggerStateToken_0 = v11.debuggerStateToken;
        if l_debuggerStateToken_0 ~= v13:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_0.debuggerConnectionId] then
            v14(nil);
        end;
        if v12 == nil then
            assert(false);
        end;
        local l_v12_ThreadById_0 = v12:GetThreadById(v11.threadId);
        if l_v12_ThreadById_0 == nil then
            assert(false);
        end;
        local l_l_v12_ThreadById_0_Frame_0 = l_v12_ThreadById_0:GetFrame(v11.frameNumber - 1);
        if l_l_v12_ThreadById_0_Frame_0 == nil then
            assert(false);
        end;
        v12:EvaluateWatch(v10, l_l_v12_ThreadById_0_Frame_0, function(v18)
            local l_debuggerStateToken_1 = v11.debuggerStateToken;
            if l_debuggerStateToken_1 ~= v13:getState().Common.debuggerConnectionIdToDST[l_debuggerStateToken_1.debuggerConnectionId] then
                v14(nil);
            end;
            if tostring(v18.Status) ~= v1.DebuggerStatus.Success then
                v14(nil);
            end;
            v14(v18:GetArg());
        end);
    end, 
    sortTableByColumnAndOrder = function(v20, v21, v22, v23, v24, v25)
        local v26 = v22 or Enum.SortDirection.Descending;
        local v27 = nil;
        local v28 = false;
        if v21 == nil then
            v28 = v22 == nil;
        end;
        v27 = if (not not v28 and v25) and #v25 > 0 then v25[1] else not not v23[v21] and v23[v21] or v23[not not v23[v21] and v21 or 1];
        local function v36(v29, v30, v31)
            local l_v29_0 = v29;
            local l_v30_0 = v30;
            if type(l_v29_0) == "boolean" then
                l_v29_0 = not l_v29_0 and 0 or 1;
                l_v30_0 = not l_v30_0 and 0 or 1;
            elseif type(l_v29_0) == "string" then
                local v34 = string.lower(l_v29_0);
                local v35 = string.lower(l_v30_0);
                if v34 ~= v35 then
                    l_v29_0 = v34;
                    l_v30_0 = v35;
                end;
            end;
            if v31 == Enum.SortDirection.Ascending then
                return l_v30_0 < l_v29_0;
            else
                return l_v29_0 < l_v30_0;
            end;
        end;
        local function v42(v37, v38)
            if v37[v27] == v38[v27] then
                local v39 = if not v25 then v23 else v25;
                for _, v41 in ipairs(v39) do
                    if v37[v41] ~= v38[v41] then
                        return (v36(v37[v41], v38[v41], Enum.SortDirection.Descending));
                    end;
                end;
                return false;
            else
                return (v36(v37[v27], v38[v27], v26));
            end;
        end;
        local v43 = nil;
        if v24 and #v20 > 0 then
            v43 = table.remove(v20);
        end;
        table.sort(v20, v42);
        if not (not v24 or not v43) then
            table.insert(v20, v43);
        end;
    end
};
