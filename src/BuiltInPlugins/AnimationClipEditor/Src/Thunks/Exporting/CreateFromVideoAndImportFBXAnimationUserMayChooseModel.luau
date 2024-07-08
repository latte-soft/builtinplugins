local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.ImportLoadedFBXAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationImportProgress);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationImportStatus);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetCreatingAnimationFromVideo);
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationFromVideoUploadStartTime);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationFromVideoErroredOut);
local function v23(v13, v14, v15, _, v17)
    local l_RootInstance_0 = v13:getState().Status.RootInstance;
    if l_RootInstance_0 then
        local function v19()
            v13:dispatch(v4(v15, true, v17));
        end;
        local l_status_0, l_result_0 = pcall(function()
            return game:GetService("AvatarImportService"):ImportFBXAnimationFromFilePathUserMayChooseModel(v14, l_RootInstance_0, v19);
        end);
        if not l_status_0 then
            warn(l_result_0);
            return ;
        else
            local v22 = v3.fromKeyframeSequence(l_result_0);
            v22.Metadata.Name = v1.DEFAULT_IMPORTED_NAME;
            v13:dispatch(v5(v22, v17));
            v13:dispatch(v6(false));
            v13:dispatch(v7(false));
            if l_result_0 then
                l_result_0:Destroy();
            end;
            v17:report("onCreateFromVideo", if not v22.Metadata then nil else v22.Metadata.Guid);
            return ;
        end;
    else
        return ;
    end;
end;
return function(v24, v25, v26)
    return function(v27)
        if not v27:getState().Status.CreatingAnimationFromVideo then
            v27:dispatch(v12(false));
            v27:dispatch(v9(v1.ANIMATION_FROM_VIDEO_STATUS.Initializing));
            v27:dispatch(v8(0));
            v27:dispatch(v10(true));
            local v28 = nil;
            local function v31(v29, v30)
                if not (not (v30 == v1.ANIMATION_FROM_VIDEO_STATUS.UploadingData) or v28) then
                    v28 = os.clock();
                    v27:dispatch(v11(v28));
                end;
                if v27:getState().Status.CreatingAnimationFromVideo then
                    v27:dispatch(v9(v30));
                    v27:dispatch(v8(v29));
                    return true;
                else
                    return false;
                end;
            end;
            local l_AnimationFromVideoCreatorStudioService_0 = game:GetService("AnimationFromVideoCreatorStudioService");
            local l_status_1, l_result_1 = pcall(function()
                return l_AnimationFromVideoCreatorStudioService_0:CreateAnimationByUploadingVideo(v31);
            end);
            local v35 = v28 and os.clock() - v28;
            if l_status_1 then
                local l_l_result_1_0 = l_result_1;
                v26:report("onAnimationEditorImportVideoUploadSucceed", v35);
                if l_l_result_1_0 ~= nil and v27:getState().Status.CreatingAnimationFromVideo then
                    v27:dispatch(v10(false));
                    v23(v27, l_l_result_1_0, v24, v25, v26);
                    return ;
                else
                    return ;
                end;
            else
                v27:dispatch(v12(true));
                if v27:getState().Status.AnimationImportStatus == v1.ANIMATION_FROM_VIDEO_STATUS.Initializing then
                    v27:dispatch(v10(false));
                end;
                if v27:getState().Status.AnimationImportStatus == v1.ANIMATION_FROM_VIDEO_STATUS.UploadingData then
                    v27:dispatch(v9(v1.ANIMATION_FROM_VIDEO_STATUS.ErrorUploadingData));
                    v27:dispatch(v8(0));
                    l_result_1 = l_result_1 or "Error while uploading video";
                end;
                v26:report("onAnimationEditorImportVideoError", l_result_1, v35);
                warn(l_result_1);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
