local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AnimationTagging_0 = require(l_Util_0.PublishTagging).AnimationTagging;
local v5 = require(l_Util_0.ScriptReplacement);
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local v7 = require(l_AnimationConversion_0.AnimationConversionManager);
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimation);
local function v22(v10, v11, v12, v13)
    local v14 = nil;
    for v15, v16 in v10, nil, nil do
        local v17 = v12:findScriptGUID(v15);
        if v14 == nil then
            v14 = v17;
        end;
        for _, v19 in v16, nil, nil do
            local v20 = v11[v17];
            local v21 = v7.getConvertedAnimationAssetInfo(v19.info);
            if v21.id then
                v5.replaceWithSuggestion(v17, v19.ref.range, v12, v21.url, v20, v13);
            end;
        end;
        if v17 ~= v14 then
            v12:closeScriptIfOpen(v17);
        end;
    end;
    if v14 then
        v12:closeScriptIfOpen(v14);
    end;
end;
return function(v23, v24, v25)
    return function(v26)
        local v27 = v26:getState();
        local l_animations_0 = v27.AnimationConversion.animations;
        local l_diagnostics_0 = v27.ScriptConversion.diagnostics;
        l_ChangeHistoryService_0:SetWaypoint("preReplace");
        local v30 = {};
        for _, v32 in v23, nil, nil do
            local v33 = v7.getConvertedAnimationAssetInfo(v32);
            if v33.id then
                if v32:IsA(v33._type) then
                    if next(l_animations_0[v32.id].refs) then
                        local v34 = l_deepCopy_0(l_animations_0[v32.id]);
                        local v35 = v7.getConvertedKeyframeSequence(v32);
                        local v36 = {};
                        local v37 = 0;
                        for v38, v39 in v34.refs, nil, nil do
                            if not v39:IsA(l_AssetType_0.LocalAsset) then
                                if not v39:IsA(l_AssetType_0.AnimationInstance) then
                                    if v39:IsA(l_AssetType_0.AssetIdString) then
                                        local l_scriptInstance_0 = v38.scriptInstance;
                                        if not v30[l_scriptInstance_0] then
                                            v30[l_scriptInstance_0] = {
                                                {
                                                    ref = v38, 
                                                    info = v32
                                                }
                                            };
                                        else
                                            table.insert(v30[l_scriptInstance_0], {
                                                ref = v38, 
                                                info = v32
                                            });
                                        end;
                                    end;
                                else
                                    v38.AnimationId = v33.url;
                                    table.insert(v36, v38);
                                    l_AnimationTagging_0:removeTag(v38);
                                end;
                            else
                                v38:ClearAllChildren();
                                for _, v42 in v35:GetChildren() do
                                    v42:Clone().Parent = v38;
                                end;
                                table.insert(v36, v38);
                                l_AnimationTagging_0:removeTag(v38);
                            end;
                            v37 = v37 + 1;
                        end;
                        if v37 == #v36 then
                            v34:complete();
                        else
                            v34:removeRefs(v36);
                        end;
                        v26:dispatch(v9(v32.id, v34));
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
        v22(v30, l_diagnostics_0, v24, v25);
        l_ChangeHistoryService_0:SetWaypoint("postReplace");
    end;
end;
