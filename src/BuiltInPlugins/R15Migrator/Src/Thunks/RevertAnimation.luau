local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.SaveInterface);
local l_AnimationTagging_0 = require(l_Util_0.PublishTagging).AnimationTagging;
local l_AssetType_0 = require(l_Util_0.AnimationConversion.constants).AssetType;
local v7 = require(l_Util_0.ScriptHistory.revertScripts);
local v8 = require(l_Util_0.ScriptConversionProgressTracker);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimations);
return function(v10)
    return function(v11)
        local v12 = v11:getState();
        local v13 = l_deepCopy_0(v12.AnimationConversion.animations);
        local v14 = {};
        for v15 in v12.AnimationConversion.selection, nil, nil do
            local v16 = {};
            local v17 = v13[v15];
            if next(v17.oldRefs) then
                for v18, v19 in v17.oldRefs, nil, nil do
                    if not v19:IsA(l_AssetType_0.LocalAsset) then
                        if not v19:IsA(l_AssetType_0.AnimationInstance) then
                            if v19:IsA(l_AssetType_0.AssetIdString) then
                                v14[v10:findScriptGUID(v18.scriptInstance)] = true;
                            end;
                        else
                            v18.AnimationId = v19.url;
                            table.insert(v16, v18);
                            l_AnimationTagging_0:addTag(v18);
                        end;
                    else
                        local v20 = v4.getR6KeyframeSequence(v18);
                        v18:ClearAllChildren();
                        for _, v22 in v20:GetChildren() do
                            v22:Clone().Parent = v18;
                        end;
                        table.insert(v16, v18);
                        l_AnimationTagging_0:addTag(v18);
                    end;
                end;
                v17:addRefs(v16);
            end;
        end;
        if next(v14) then
            local v23 = v2.Dictionary.keys(v14);
            local v24 = v8.new("Revert", #v23, v11);
            v7(v23, v10, function()
                v24:updateProgress();
            end);
            v24:clearProgressBar();
        end;
        v11:dispatch(v9(v13));
    end;
end;
