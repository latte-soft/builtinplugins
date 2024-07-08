local l_HttpService_0 = game:GetService("HttpService");
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis.Constants);
local v23 = {
    GetScriptBackupChunks = function(_, v5)
        local l_v5_Attribute_0 = v5:GetAttribute(v3.AttributeChunkCountName);
        if l_v5_Attribute_0 then
            local v7 = {};
            for v8 = 1, l_v5_Attribute_0 do
                table.insert(v7, l_HttpService_0:JSONDecode((v5:GetAttribute(v3.AttributeChunkNameBase .. tostring(v8)))).source);
            end;
            return v7;
        else
            return ;
        end;
    end, 
    HasScriptBackup = function(_, v10)
        local l_v10_Attribute_0 = v10:GetAttribute(v3.AttributeChunkCountName);
        if not l_v10_Attribute_0 or l_v10_Attribute_0 == 0 then
            return false;
        else
            return true;
        end;
    end, 
    RemoveScriptBackupChunks = function(_, v13)
        local l_v13_Attribute_0 = v13:GetAttribute(v3.AttributeChunkCountName);
        if l_v13_Attribute_0 then
            v13:SetAttribute(v3.AttributeChunkCountName, nil);
            v13:SetAttribute(v3.AttributeInitialIssueCountName, nil);
            for v15 = 1, l_v13_Attribute_0 do
                v13:SetAttribute(v3.AttributeChunkNameBase .. tostring(v15), nil);
            end;
            return ;
        else
            return ;
        end;
    end, 
    DidSourceChange = function(v16, v17, v18)
        if not v18 then
            v18 = v16:GetScriptBackupChunks(v17);
        end;
        if v18 then
            local l_l_ScriptEditorService_0_EditorSource_0 = l_ScriptEditorService_0:GetEditorSource(v17);
            local v20 = "";
            for _, v22 in v18, nil, nil do
                v20 = v20 .. v22;
            end;
            if string.gsub(l_l_ScriptEditorService_0_EditorSource_0, "\r\n", "\n") == string.gsub(v20, "\r\n", "\n") then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    end
};
local function _(v24)
    local l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v24);
    if not l_l_ScriptEditorService_0_ScriptDocument_0 then
        l_ScriptEditorService_0:OpenScriptDocumentAsync(v24);
        l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v24);
    end;
    return l_l_ScriptEditorService_0_ScriptDocument_0;
end;
v23.AppendChunk = function(_, v28, v29)
    local l_l_ScriptEditorService_0_ScriptDocument_1 = l_ScriptEditorService_0:FindScriptDocument(v28);
    if not l_l_ScriptEditorService_0_ScriptDocument_1 then
        l_ScriptEditorService_0:OpenScriptDocumentAsync(v28);
        l_l_ScriptEditorService_0_ScriptDocument_1 = l_ScriptEditorService_0:FindScriptDocument(v28);
    end;
    local l_l_l_ScriptEditorService_0_ScriptDocument_1_0 = l_l_ScriptEditorService_0_ScriptDocument_1;
    if l_l_l_ScriptEditorService_0_ScriptDocument_1_0 then
        l_l_ScriptEditorService_0_ScriptDocument_1 = l_l_l_ScriptEditorService_0_ScriptDocument_1_0:GetLineCount();
        local v32 = string.len((l_l_l_ScriptEditorService_0_ScriptDocument_1_0:GetLine(l_l_ScriptEditorService_0_ScriptDocument_1)));
        l_l_l_ScriptEditorService_0_ScriptDocument_1_0:EditTextAsync(v29, l_l_ScriptEditorService_0_ScriptDocument_1, v32 + 1, l_l_ScriptEditorService_0_ScriptDocument_1, v32 + 1);
    end;
end;
v23.ReplaceWithChunk = function(_, v34, v35)
    local l_l_ScriptEditorService_0_ScriptDocument_2 = l_ScriptEditorService_0:FindScriptDocument(v34);
    if not l_l_ScriptEditorService_0_ScriptDocument_2 then
        l_ScriptEditorService_0:OpenScriptDocumentAsync(v34);
        l_l_ScriptEditorService_0_ScriptDocument_2 = l_ScriptEditorService_0:FindScriptDocument(v34);
    end;
    local l_l_l_ScriptEditorService_0_ScriptDocument_2_0 = l_l_ScriptEditorService_0_ScriptDocument_2;
    if l_l_l_ScriptEditorService_0_ScriptDocument_2_0 then
        l_l_ScriptEditorService_0_ScriptDocument_2 = l_l_l_ScriptEditorService_0_ScriptDocument_2_0:GetLineCount();
        l_l_l_ScriptEditorService_0_ScriptDocument_2_0:EditTextAsync(v35, 1, 1, l_l_ScriptEditorService_0_ScriptDocument_2, (string.len((l_l_l_ScriptEditorService_0_ScriptDocument_2_0:GetLine(l_l_ScriptEditorService_0_ScriptDocument_2)))));
    end;
end;
v23.SplitIntoChunks = function(_, v39)
    local v40 = {};
    local l_v39_0 = v39;
    while v3.CharacterLimit < string.len(l_v39_0) do
        local v42 = #v40 * v3.CharacterLimit + 1;
        local v43 = (#v40 + 1) * v3.CharacterLimit;
        table.insert(v40, (string.sub(l_v39_0, v42, v43)));
        l_v39_0 = string.sub(l_v39_0, v43 + 1, (string.len(l_v39_0)));
    end;
    table.insert(v40, l_v39_0);
    return v40;
end;
v23.GetScriptSourceFromChunks = function(v44, v45)
    local l_v44_ScriptBackupChunks_0 = v44:GetScriptBackupChunks(v45);
    local v47 = "";
    for v48 = 1, #l_v44_ScriptBackupChunks_0 do
        v47 = v47 .. l_v44_ScriptBackupChunks_0[v48];
    end;
    return v47;
end;
v23.RemoveAllScriptBackups = function(v49)
    for _, v51 in (l_CollectionService_0:GetTagged(v3.ScriptBackupTag)), nil, nil do
        v49:RemoveScriptBackupChunks(v51);
        l_CollectionService_0:RemoveTag(v51, v3.ScriptBackupTag);
    end;
end;
v23.TrackBackup = function(_, v53)
    l_CollectionService_0:AddTag(v53, v3.ScriptBackupTag);
end;
return v23;
