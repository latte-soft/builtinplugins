local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetFrameRate);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
return function(v10, v11)
    return function(v12)
        if v12:getState().Status.RootInstance then
            local l_status_0, l_result_0 = pcall(function()
                return v10:get():PromptForExistingAssetId("Animation");
            end);
            if l_status_0 then
                if l_result_0 and tonumber(l_result_0) > 0 then
                    local v15 = nil;
                    if not pcall(function()
                        v15 = l_AnimationClipProvider_0:GetAnimationClipById(l_result_0, false);
                    end) then
                        v12:dispatch(v9("InvalidAnimation", true));
                    end;
                    if v15 then
                        local v16 = nil;
                        local v17 = nil;
                        if not v15:IsA("KeyframeSequence") then
                            v16 = v4.fromCurveAnimation(v15);
                            v17 = v2.DEFAULT_FRAMERATE;
                        else
                            local v18, v19 = v4.fromKeyframeSequence(v15);
                            v16 = v18;
                            v17 = v19;
                        end;
                        v16.Metadata.Name = v2.DEFAULT_IMPORTED_NAME;
                        v12:dispatch(v5(v16, v11));
                        v12:dispatch(v6(false));
                        v12:dispatch(v7(false));
                        v12:dispatch(v8(v17));
                        if v11 then
                            v11:report("onImportAnimation", l_result_0, if not v16.Metadata then nil else v16.Metadata.Guid);
                        end;
                        --[[ close >= 5 ]]
                    else
                        return ;
                    end;
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
