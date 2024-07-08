local l_R15MigDocumentChanges_0 = game:GetFastFlag("R15MigDocumentChanges");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.backupScript);
local l_deepCopy_0 = v2.Util.deepCopy;
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetDiagnostics);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetCompletedScripts);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetInitialIssueCounts);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetRevertedScripts);
local v9 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.findAssetId);
local v11 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
local l_ScriptTagging_0 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging).ScriptTagging;
local v13 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.DiagRef);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationIssues);
local function v21(v15, v16)
    local v17 = {};
    if v15 then
        for _, v19 in v15._list, nil, nil do
            local v20 = v10("'" .. v19.instanceName .. "'");
            if v20 then
                if not v17[v20] then
                    v17[v20] = {};
                end;
                table.insert(v17[v20], v13.new(v20, v19.range, v16));
            end;
        end;
        return v17;
    else
        return v17;
    end;
end;
local function v26(v22, v23, v24, v25)
    v22:dispatch(v14(v21(l_deepCopy_0(v22:getState().ScriptConversion.diagnostics)[v23], v25), (v21(v24, v25))));
end;
local function _(v27, v28, v29)
    local v30 = l_deepCopy_0(v27:getState().ScriptConversion.diagnostics);
    v30[v28] = v29;
    v27:dispatch(v5(v30));
end;
local function v37(v32, v33, v34, v35)
    local v36 = l_deepCopy_0(v32:getState().ScriptConversion.completedScripts);
    if v35 then
        if not v35:HasErrors() then
            l_ScriptTagging_0:removeTag(v34);
            v36[v33] = true;
        else
            l_ScriptTagging_0:addTag(v34);
            v36[v33] = nil;
        end;
        v32:dispatch(v6(v36));
        return ;
    else
        return ;
    end;
end;
local function _(v38, v39, v40)
    if v40 then
        local v41 = l_deepCopy_0(v38:getState().ScriptConversion.revertedScripts);
        v41[v39] = nil;
        v38:dispatch(v8(v41));
        return ;
    else
        return ;
    end;
end;
local function v50(v43, v44, v45, v46)
    local l_initialIssueCounts_0 = v43:getState().ScriptConversion.initialIssueCounts;
    if not v46 then
        if l_initialIssueCounts_0[v44] or v45 == 0 then
            return ;
        else
            local v48 = l_deepCopy_0(l_initialIssueCounts_0);
            v48[v44] = v45;
            v43:dispatch(v7(v48));
            return ;
        end;
    else
        local v49 = l_deepCopy_0(l_initialIssueCounts_0);
        v49[v44] = nil;
        v43:dispatch(v7(v49));
        return ;
    end;
end;
return function(v51, v52, v53)
    return function(v54)
        local l_diagnostics_0 = v54:getState().ScriptConversion.diagnostics;
        local v56 = v51:addOrFindScript(v52);
        local l_v52_Attribute_0 = v52:GetAttribute(v9.AttributeChunkCountName);
        local l_v52_Attribute_1 = v52:GetAttribute(v9.AttributeInitialIssueCountName);
        local v59 = l_diagnostics_0[v56] ~= nil;
        if (not (v53 and v53:GetSize() == 0) or v59) or l_v52_Attribute_0 then
            if l_diagnostics_0[v56] == v53 then
                return ;
            else
                if not l_v52_Attribute_0 then
                    v3(v52);
                end;
                if not l_v52_Attribute_1 then
                    v52:SetAttribute(v9.AttributeInitialIssueCountName, v53:GetSize());
                end;
                v50(v54, v56, v52:GetAttribute(v9.AttributeInitialIssueCountName), v53 == nil);
                if l_R15MigDocumentChanges_0 then
                    local l_diagnostics_1 = v54:getState().ScriptConversion.diagnostics;
                    local v61 = l_diagnostics_1 and l_diagnostics_1[v56];
                    if not (not v61 or not v53) then
                        v53 = v61:Merge(v53);
                    end;
                end;
                local v62 = v11:DidSourceChange(v52);
                v26(v54, v56, v53, v52);
                local l_v53_0 = v53;
                local v64 = l_deepCopy_0(v54:getState().ScriptConversion.diagnostics);
                v64[v56] = l_v53_0;
                v54:dispatch(v5(v64));
                if v62 then
                    local v65 = l_deepCopy_0(v54:getState().ScriptConversion.revertedScripts);
                    v65[v56] = nil;
                    v54:dispatch(v8(v65));
                end;
                v37(v54, v56, v52, v53);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
