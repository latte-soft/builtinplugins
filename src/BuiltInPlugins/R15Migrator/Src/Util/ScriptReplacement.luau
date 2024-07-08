local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_DraftsService_0 = game:GetService("DraftsService");
local l_Util_0 = script:FindFirstAncestor("R15Migrator").Src.Util;
local _ = require(l_Util_0.ScriptAnalysis.Constants);
local v4 = require(l_Util_0.ScriptHistory.ChunkUtil);
local v8 = {
    UNASSIGNED = "Unassigned", 
    goToScriptInstance = function(v5, v6)
        if v5 then
            l_ScriptEditorService_0:OpenScriptDocumentAsync(v5);
            local l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v5);
            if l_l_ScriptEditorService_0_ScriptDocument_0 and v6 then
                l_l_ScriptEditorService_0_ScriptDocument_0:ForceSetSelectionAsync(v6.startLine, v6.startCharacter, v6.endLine, v6.endCharacter);
                return l_l_ScriptEditorService_0_ScriptDocument_0;
            else
                return ;
            end;
        else
            return ;
        end;
    end
};
v8.goToScript = function(v9, v10, v11)
    if v9 and v11 then
        return v8.goToScriptInstance(v11:getScriptInstanceFromGUID(v9), v10);
    else
        return ;
    end;
end;
local function _(v12, v13, v14)
    if v12 and v13 then
        v12:EditTextAsync(v14, v13.startLine, v13.startCharacter, v13.endLine, v13.endCharacter);
        return true;
    else
        return false;
    end;
end;
v8.replaceWithSuggestion = function(v16, v17, v18, v19, v20, v21)
    for _, v23 in v20._list, nil, nil do
        if v17 == v23.range then
            v21:getHandler("onScriptAutoReplacement")(v23.issueType);
        end;
    end;
    local v24 = v8.goToScript(v16, v17, v18);
    if v24 and v17 then
        v24:EditTextAsync(v19, v17.startLine, v17.startCharacter, v17.endLine, v17.endCharacter);
        return true;
    else
        return false;
    end;
end;
v8.diffScripts = function(v25, v26)
    local v27 = {};
    local v28 = {};
    for _, v30 in v25, nil, nil do
        local v31 = v26:getScriptInstanceFromGUID(v30.scriptId);
        table.insert(v28, v31);
        table.insert(v27, (v4:GetScriptSourceFromChunks(v31)));
    end;
    l_DraftsService_0:ShowSourceDiffsAgainstCurrent(v27, v28);
end;
return v8;
