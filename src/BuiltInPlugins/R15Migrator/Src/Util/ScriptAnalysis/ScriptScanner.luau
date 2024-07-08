local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_ScriptAnalysis_0 = l_script_FirstAncestor_0.Src.Util.ScriptAnalysis;
local v2 = require(l_ScriptAnalysis_0.buildBlockTree);
local v3 = require(l_ScriptAnalysis_0.findR6Names);
local v4 = require(l_ScriptAnalysis_0.findAssetId);
local v5 = require(l_ScriptAnalysis_0.R6Info);
local v6 = require(l_ScriptAnalysis_0.StatementParser);
local v7 = require(l_ScriptAnalysis_0.BlockTree);
local v8 = require(l_ScriptAnalysis_0.Constants);
local v9 = require(l_ScriptAnalysis_0.DiagnosticList);
local v10 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.AnimationConversionManager);
local v11 = {};
local function v23(v12, v13, v14, v15)
    local l_PartKey_0 = v5.PartKey;
    local v17 = v5.Conversions.Parts[v14] or {};
    v7.TraverseUp(v12, function(v18)
        for v19, _ in v18.Variables, nil, nil do
            if not (not v18:IsHumanoidVariable(v19) or not v6:FindVariableAccess(v15, v13, v19)) then
                v17 = {
                    v5.Conversions.Humanoid[v14]
                };
                l_PartKey_0 = v5.HumanoidKey;
                return true;
            end;
        end;
        return false;
    end);
    for _, v22 in v5.HumanoidNames, nil, nil do
        if v6:FindVariableAccess(v15, v13, v22) then
            v17 = {
                v5.Conversions.Humanoid[v14]
            };
            l_PartKey_0 = v5.HumanoidKey;
            break;
        end;
    end;
    return l_PartKey_0, v17;
end;
local function _(v24, v25, v26, v27)
    local v28 = nil;
    local v29 = nil;
    v7.TraverseUp(v24, function(v30)
        local l_v6_VariableAssignment_0, v32 = v6:FindVariableAssignment(v30.Variables, v27, v25);
        v28 = l_v6_VariableAssignment_0;
        v29 = v32;
        if not v29 or not v28 then
            return false;
        else
            v29.Value = v26;
            return true;
        end;
    end);
    return v28, v29;
end;
local function _(v34, v35, v36, v37, v38, v39, v40)
    local v41 = nil;
    local v42 = nil;
    local v43;
    do
        local l_v41_0, l_v42_0 = v41, v42;
        v7.TraverseUp(v34, function(v46)
            local l_v6_VariableAssignment_1, v48 = v6:FindVariableAssignment(v46.Variables, v39, v36);
            l_v41_0 = l_v6_VariableAssignment_1;
            l_v42_0 = v48;
            if not l_v42_0 or not l_v41_0 then
                return false;
            else
                l_v42_0.Value = v38;
                return true;
            end;
        end);
        v43 = l_v41_0;
    end;
    v41, v42 = v23(v34, v36, v38, v39);
    v34:AddIssue(v38, v43, v41, v40, v36 + v35, v37 + v35, v42);
end;
local function v60(v50, v51, v52, v53, v54)
    v7.TraverseUp(v50, function(v55)
        for _, v57 in ipairs(v55.Issues) do
            if not ((not (v57.Type == v5.PartKey) or not v57.VariableName) or not v6:FindVariableAccess(v52, v51, v57.VariableName)) then
                v57.Suggestions = v54;
                return ;
            end;
        end;
    end);
    for _, v59 in ipairs(v50.Issues) do
        if not (not (v59.Type == v5.PartKey and v59.Range.startLine == v53) or not v6:FindVariableAccess(v52, v51, v59.InstanceName)) then
            v59.Suggestions = v54;
            return ;
        end;
    end;
end;
local function _(v61, v62, v63, v64, v65)
    v7.TraverseUp(v61, function(v66)
        for v67, v68 in v66.Variables, nil, nil do
            if v6:FindVariableAccess(v64, v63, v67) and v68.Value ~= v65 then
                local v69, v70 = string.find(v64, v67);
                v61:AddIssue(v67, v67, v8.ReferenceKey, v62, v69, v70, {
                    v65
                });
                return ;
            end;
        end;
    end);
    return false;
end;
local function v89(v72, v73, v74, v75, v76, v77, v78, v79, v80)
    local v81 = v5.Conversions[v72][v78];
    if v81 then
        local l_v6_VariableAssignment_2 = v6:FindVariableAssignment(v74.Variables, v79, v76);
        if v78 ~= v81[v73] then
            v74:AddIssue(v78, l_v6_VariableAssignment_2, v73, v80, v76 + v75, v77 + v75, {
                v81[v73]
            });
        end;
        v60(v74, v76, v79, v80, v81.Part);
        if #v81.Part == 1 then
            local v83 = v81.Part[1];
            v7.TraverseUp(v74, function(v84)
                for v85, v86 in v84.Variables, nil, nil do
                    if v6:FindVariableAccess(v79, v76, v85) and v86.Value ~= v83 then
                        local v87, v88 = string.find(v79, v85);
                        v74:AddIssue(v85, v85, v8.ReferenceKey, v80, v87, v88, {
                            v83
                        });
                        return ;
                    end;
                end;
            end);
        end;
        return ;
    else
        return ;
    end;
end;
local function v90(...)
    v89(v5.AttachmentsKey, v5.AttachmentKey, ...);
end;
local function v91(...)
    v89(v5.JointsKey, v5.JointKey, ...);
end;
local function v99(v92, v93, v94, v95, v96, v97, v98)
    if v10.isR6Animation(v96, true) then
        v92:AddIssue(v96, v6:FindVariableAssignment(v92.Variables, v97, v94), v5.AnimationKey, v98, v94 + v93, v95 + v93, {
            v10.getConvertedAssetUrl(v96)
        });
        return ;
    else
        return ;
    end;
end;
local function v107(v100, v101, v102, v103, v104, v105, v106)
    v100:AddIssue(v104, v6:FindVariableAssignment(v100.Variables, v105, v102), v5.RigTypeKey, v106, v102 + v101, v103 + v101, {
        v5.R15RigType
    });
end;
local function v137(v108)
    for _, v110 in ipairs(v108.Lines) do
        v3(v110.Text, v110.LineNo, v5.GetPartNames(), true, function(...)
            local l_v108_0 = v108;
            local l_Offset_0 = v110.Offset;
            local v113, v114, v115, v116, v117 = ...;
            local v118 = nil;
            local v119 = nil;
            local v120;
            do
                local l_v118_0, l_v119_0 = v118, v119;
                v7.TraverseUp(l_v108_0, function(v123)
                    local l_v6_VariableAssignment_3, v125 = v6:FindVariableAssignment(v123.Variables, v116, v113);
                    l_v118_0 = l_v6_VariableAssignment_3;
                    l_v119_0 = v125;
                    if not l_v119_0 or not l_v118_0 then
                        return false;
                    else
                        l_v119_0.Value = v115;
                        return true;
                    end;
                end);
                v120 = l_v118_0;
            end;
            v118, v119 = v23(l_v108_0, v113, v115, v116);
            l_v108_0:AddIssue(v115, v120, v118, v117, v113 + l_Offset_0, v114 + l_Offset_0, v119);
        end);
        v3(v110.Text, v110.LineNo, v5.GetR15PartNames(), true, function(v126, _, v128, v129, _)
            local l_v108_1 = v108;
            local v132 = nil;
            local v133 = nil;
            v7.TraverseUp(l_v108_1, function(v134)
                local l_v6_VariableAssignment_4, v136 = v6:FindVariableAssignment(v134.Variables, v129, v126);
                v132 = l_v6_VariableAssignment_4;
                v133 = v136;
                if not v133 or not v132 then
                    return false;
                else
                    v133.Value = v128;
                    return true;
                end;
            end);
        end);
        v3(v110.Text, v110.LineNo, v5.GetAttachmentNames(), true, function(...)
            v90(v108, v110.Offset, ...);
        end);
        v3(v110.Text, v110.LineNo, v5.GetJointNames(), true, function(...)
            v91(v108, v110.Offset, ...);
        end);
        v3(v110.Text, v110.LineNo, {
            v5.R6RigType
        }, false, function(...)
            v107(v108, v110.Offset, ...);
        end);
        v4(v110.Text, v110.LineNo, function(...)
            v99(v108, v110.Offset, ...);
        end);
    end;
end;
local function v146(v138, v139)
    local v140 = v9.new();
    v138:TraverseBF(function(v141)
        for _, v143 in ipairs(v141.Issues) do
            v140:AddDiagnostic(v143:ConvertToDiagnostic(v139));
        end;
    end);
    table.sort(v140, function(v144, v145)
        if v144.range[v8.StartKey].line < v145.range[v8.StartKey].line then
            return true;
        elseif v144.range[v8.StartKey].line == v145.range[v8.StartKey].line then
            return v144.range[v8.StartKey].character <= v145.range[v8.StartKey].character;
        else
            return false;
        end;
    end);
    return v140;
end;
v11.ScanScript = function(_, v148, v149)
    local v150 = v2(v148);
    v150:TraverseBF(v137);
    return (v146(v150, v149));
end;
return v11;
