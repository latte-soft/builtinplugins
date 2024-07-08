local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis.Constants);
local v1 = {};
local _ = function(v2)
    local v3 = 0;
    for _, v5 in v2, nil, nil do
        for _ in v5, nil, nil do
            v3 = v3 + 1;
        end;
    end;
    return v3;
end;
v1.GetStatusCounts = function(_, v9)
    local l_revertResult_0 = v9.revertResult;
    local l_scriptInstance_0 = v9.scriptInstance;
    local l_replaceResult_0 = v9.replaceResult;
    local l_undoRevertResult_0 = v9.undoRevertResult;
    local v14 = 0;
    local v15 = 0;
    local v16 = 0;
    local v17 = 0;
    if l_replaceResult_0 then
        v14 = l_replaceResult_0.autoConverted;
        v15 = v15 + l_replaceResult_0.succeeded;
        local l_failed_0 = l_replaceResult_0.failed;
        local v19 = 0;
        for _, v21 in l_failed_0, nil, nil do
            for _ in v21, nil, nil do
                v19 = v19 + 1;
            end;
        end;
        v16 = v19;
        l_failed_0 = l_replaceResult_0.failedVar;
        v19 = 0;
        for _, v24 in l_failed_0, nil, nil do
            for _ in v24, nil, nil do
                v19 = v19 + 1;
            end;
        end;
        v17 = v19;
    end;
    if l_scriptInstance_0 then
        v15 = 1;
    end;
    local v26 = {};
    if not l_revertResult_0 then
        if l_undoRevertResult_0 then
            v26[v0.ScriptStatus.Reverted] = l_undoRevertResult_0;
        end;
    else
        v26[v0.ScriptStatus.Reverted] = l_revertResult_0;
    end;
    if v14 > 0 then
        v26[v0.ScriptStatus.AutoConverted] = v14;
    end;
    if v15 > 0 then
        v26[v0.ScriptStatus.Complete] = v15;
    end;
    if v16 > 0 then
        v26[v0.ScriptStatus.Error] = v16;
    end;
    if v17 > 0 then
        v26[v0.ScriptStatus.VariableError] = v17;
    end;
    return v26;
end;
v1.GetStatusMessages = function(v27, v28, v29)
    if not v28.scriptInstance then
        local l_v27_StatusCounts_0 = v27:GetStatusCounts(v28);
        local v31 = {};
        for v32, v33 in l_v27_StatusCounts_0, nil, nil do
            if v32 ~= v0.ScriptStatus.AutoConverted then
                local v34 = {
                    count = string.format("%d", v33)
                };
                if not v28.undoRevertResult then
                    v31[v32] = v29:getText("ConversionResult", v32, v34);
                else
                    v31[v32] = v29:getText("ConversionResult", "Undo" .. v32, v34);
                end;
            end;
        end;
        return v31;
    else
        return {
            [v0.ScriptStatus.Complete] = v29:getText("ConversionResult", "Script", {
                name = v28.scriptInstance
            })
        };
    end;
end;
return v1;
