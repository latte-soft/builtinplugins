local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigSerialization);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetIsLegacyAnimSaves);
local v7 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.MergeBodyAndFacialAnimation);
local v9 = game:DefineFastFlag("MergeBodyAnimationWithExistingFaceAnimationOnFBXImport", false);
return function(_, v11, v12)
    return function(v13)
        local l_status_0, l_result_0 = pcall(function()
            return game:GetService("AvatarImportService"):ImportLoadedFBXAnimation(v11);
        end);
        if l_status_0 then
            local v16 = v3.fromKeyframeSequence(l_result_0);
            local l_AnimationData_0 = v13:getState().AnimationData;
            local v18 = l_AnimationData_0 and v7.hasFacsData(l_AnimationData_0);
            local v19 = v16 and not v7.hasFacsData(v16);
            if (not v9 or not v18) or not v19 then
                v16.Metadata.Name = v1.DEFAULT_IMPORTED_NAME;
                v13:dispatch(v4(v16, v12));
                v13:dispatch(v5(false));
                v13:dispatch(v6(false));
            else
                v13:dispatch(v8(v16, v1.TRACKS_SUBSETS_TYPE.Body, v12));
            end;
            if l_result_0 then
                l_result_0:Destroy();
            end;
            v12:report("onImportFbxAnimation", if not v16.Metadata then nil else v16.Metadata.Guid);
            if not v11 then
                v12:report("onUserChoseSelectedModelForAnimImport", if not v16.Metadata then nil else v16.Metadata.Guid);
            else
                v12:report("onUserChoseFBXModelForAnimImport", if not v16.Metadata then nil else v16.Metadata.Guid);
            end;
            warn(l_result_0);
        end;
    end;
end;
