local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ScriptAnalysis_0 = l_script_FirstAncestor_0.Src.Util.ScriptAnalysis;
local v5 = require(l_ScriptAnalysis_0.StringUtil);
local v6 = require(l_ScriptAnalysis_0.findAssetId);
local v7 = require(l_ScriptAnalysis_0.buildRange);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v9 = require(l_Util_0.findAllInServices);
local v10 = require(l_Util_0.SaveInterface);
local v11 = require(l_Util_0.AnimationConversion.AnimationConversionManager);
local v12 = require(l_Util_0.ScriptHistory.ChunkUtil);
local l_AnimationTagging_0 = require(l_Util_0.PublishTagging).AnimationTagging;
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local v15 = require(l_AnimationConversion_0.DiagRef);
local v16 = require(l_AnimationConversion_0.AnimationState);
local v17 = require(l_AnimationConversion_0.constants);
local l_AssetType_0 = v17.AssetType;
local l_AnimationStatus_0 = v17.AnimationStatus;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v21 = require(l_Actions_0.SetStatus);
local v22 = require(l_Actions_0.SetAnimations);
local l_OriginalId_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).Attributes.OriginalId;
local function v25(v24)
    return v24:IsA("Script");
end;
local function v64(v26)
    v26:dispatch(v21(v17.Status.ScanningScripts));
    local v27 = v9(v25);
    local v28 = {};
    local v29 = {};
    for _, v31 in v27, nil, nil do
        local l_l_ScriptEditorService_0_EditorSource_0 = l_ScriptEditorService_0:GetEditorSource(v31);
        local _ = function(v33, v34, v35, _, v37)
            if v11.isR6Animation(v35) then
                return v15.new(v35, v7(v37, v33, v34), v31);
            else
                return ;
            end;
        end;
        v5.ForEachLine(l_l_ScriptEditorService_0_EditorSource_0, function(v39, v40)
            v6(v39, v40, function(...)
                local v41, v42, v43, _, v45 = ...;
                local v46 = if v11.isR6Animation(v43) then v15.new(v43, v7(v45, v41, v42), v31) else nil;
                if v46 then
                    v41 = v46:id();
                    if not v28[v41] then
                        v28[v41] = {};
                    end;
                    table.insert(v28[v41], v46);
                    return ;
                else
                    return ;
                end;
            end);
        end);
        local l_v12_ScriptBackupChunks_0 = v12:GetScriptBackupChunks(v31);
        if not (not l_v12_ScriptBackupChunks_0 or not v12:DidSourceChange(v31, l_v12_ScriptBackupChunks_0)) then
            local v48 = 0;
            do
                local l_v48_0 = v48;
                for _, v51 in l_v12_ScriptBackupChunks_0, nil, nil do
                    v5.ForEachLine(v51, function(v52, v53)
                        v6(v52, v53 + l_v48_0, function(...)
                            local v54, v55, v56, _, v58 = ...;
                            local v59 = if v11.isR6Animation(v56) then v15.new(v56, v7(v58, v54, v55), v31) else nil;
                            if v59 then
                                v54 = v59:id();
                                if v28[v54] then
                                    for _, v61 in v28[v54], nil, nil do
                                        if v61 == v59 then
                                            return ;
                                        end;
                                    end;
                                end;
                                if not v29[v54] then
                                    v29[v54] = {};
                                end;
                                table.insert(v29[v54], v59);
                                return ;
                            else
                                return ;
                            end;
                        end);
                    end);
                    local _, v63 = v51:gsub("\n", "\n");
                    l_v48_0 = l_v48_0 + v63;
                end;
            end;
        end;
    end;
    return v28, v29;
end;
local function v73(v65)
    v65:dispatch(v21(v17.Status.ScanningWorkspace));
    local v67 = v9(function(v66)
        return v66:IsA("Animation") or v66:IsA("KeyframeSequence");
    end);
    local v68 = {};
    local v69 = {};
    local v70 = {};
    for _, v72 in v67, nil, nil do
        if not v10.isConvertibleKeyframeSequence(v72) or v11.isR6KeyframeSequence(v72) then
            if not v11.isR6Animation(v72) then
                if v72:GetAttribute(l_OriginalId_0) then
                    if not v72:IsA("Animation") then
                        warn("OriginalId Attribute should only be found on Animation Instances. Were Attributes manually edited?");
                    else
                        table.insert(v70, v72);
                    end;
                end;
            else
                table.insert(v68, v72);
                l_AnimationTagging_0:addTag(v72);
            end;
        else
            table.insert(v69, v72);
        end;
    end;
    return v68, v69, v70;
end;
local function v83(v74)
    local v75 = {};
    local v76 = 1;
    for _, v78 in v74, nil, nil do
        local v79 = v11.getAnimationAssetInfo(v78);
        local l_Name_0 = v78.Name;
        if not (not v79:IsA(l_AssetType_0.RobloxAsset) or v75[v79.id]) then
            local l_status_0, l_result_0 = pcall(function()
                return l_MarketplaceService_0:GetProductInfo(v79.id);
            end);
            if l_status_0 then
                l_Name_0 = l_result_0.Name;
            end;
        end;
        if not (not v79:IsA(l_AssetType_0.RobloxAsset) or v78:GetAttribute(l_OriginalId_0)) then
            v78:SetAttribute(l_OriginalId_0, v79.id);
        end;
        if not v75[v79.id] then
            v75[v79.id] = v16.new(v79, l_Name_0, v76, nil, nil);
            v76 = v76 + 1;
        end;
        v75[v79.id].refs[v78] = v79;
    end;
    return v75;
end;
local function v94(v84, v85, v86)
    local v87 = {};
    for v88, _ in v84, nil, nil do
        v87[v88] = true;
    end;
    for v90, _ in v85, nil, nil do
        v87[v90] = true;
    end;
    for v92, v93 in v86, nil, nil do
        if v93.animationAssetInfo:IsA(l_AssetType_0.RobloxAsset) then
            v87[v92] = true;
        end;
    end;
    return v87;
end;
local function v104(v95, v96, v97, v98)
    v95:dispatch(v21(v17.Status.ConvertingAnimations));
    for _, v100 in v98, nil, nil do
        if not (v100.animationAssetInfo:IsA(l_AssetType_0.RobloxAsset) or not v100.animationAssetInfo:IsA(l_AssetType_0.LocalAsset)) then
            for v101 in v100.refs, nil, nil do
                v11.convertAnimation(v101);
                break;
            end;
        end;
    end;
    for v102, v103 in (v11.checkIfAssetsAlreadyConverted(v96, v97)), nil, nil do
        if v98[v102] then
            v98[v102].converted = v103;
        end;
    end;
end;
local function v113(v105, v106)
    local v107 = v10.getOriginalR6KeyframeSequences(v106);
    local v108 = 1 + #v1.Dictionary.keys(v105);
    for v109, v110 in v107, nil, nil do
        v11.registerConvertedKeyframeSequence(v110, v109);
        local v111 = v11.getAnimationAssetInfo(v110);
        local l_id_0 = v111.id;
        if not v105[l_id_0] then
            v105[l_id_0] = v16.new(v111, v109.Name, v108, l_AnimationStatus_0.Done, nil);
            v108 = v108 + 1;
        end;
        v105[l_id_0].oldRefs[v109] = v111;
    end;
end;
local function v122(v114, v115)
    local v116 = 1 + #v1.Dictionary.keys(v114);
    for _, v118 in v115, nil, nil do
        local v119 = v118:Clone();
        v119.AnimationId = v11.getAnimationId(v118:GetAttribute(l_OriginalId_0));
        local v120 = v11.getAnimationAssetInfo(v119);
        local l_id_1 = v120.id;
        if not v114[l_id_1] then
            v114[l_id_1] = v16.new(v120, v118.Name, v116, l_AnimationStatus_0.Done, v11.getConvertedAssetId(l_id_1));
            l_AnimationTagging_0:removeTag(v118);
            v116 = v116 + 1;
        end;
        v114[l_id_1].oldRefs[v118] = v120;
    end;
end;
local function v131(v123, v124)
    local v125 = 1 + #v1.Dictionary.keys(v123);
    for v126, v127 in v124, nil, nil do
        for _, v129 in v127, nil, nil do
            local v130 = v11.getAnimationAssetInfo(v129.str);
            if not v123[v126] then
                v123[v126] = v16.new(v130, v11.getCachedName(v126) or v129.str, v125, l_AnimationStatus_0.Done, v11.getConvertedAssetId(v126));
                v125 = v125 + 1;
            end;
            v123[v126].oldRefs[v129] = v130;
        end;
    end;
end;
local function v134()
    for v132, v133 in (v10.getAllSavedAnimationAssetIds()), nil, nil do
        v11.registerConvertedAssetId(v132, v133.converted, v133.kfs, v133.name);
        v11.overrideIsR6Cache(v133.converted, false);
    end;
end;
return function(v135, v136, v137)
    return function(v138)
        task.spawn(function()
            v134();
            local v139, v140 = v64(v138);
            local v141, v142, v143 = v73(v138);
            local v144 = v83(v141);
            v113(v144, v142);
            v122(v144, v143);
            v131(v144, v140);
            v10.addConvertibleKeyframeSequences(v141);
            v10.addConvertibleAnimations(v141);
            v10.addConvertibleAssetIds(v1.Dictionary.keys(v139));
            local v145 = v94(v139, v140, v144);
            v135:getHandler("onInitialAnimationsAnalysisScan")(v145, v144);
            v104(v138, v136, v145, v144);
            v138:dispatch(v22(v144));
            v137();
            v138:dispatch(v21(v17.Status.Done));
        end);
    end;
end;
