local v0 = require(script:FindFirstAncestor("AnimationClipEditor").Src.Actions.SetCreatingAnimationFromVideo);
return function(v1)
    return function(v2)
        v2:dispatch(v0(false));
        local v3 = v2:getState();
        if not v3.Status.AnimationFromVideoErroredOut then
            local l_AnimationFromVideoUploadStartTime_0 = v3.Status.AnimationFromVideoUploadStartTime;
            v1:report("onAnimationEditorImportVideoUploadCancel", l_AnimationFromVideoUploadStartTime_0 and os.clock() - l_AnimationFromVideoUploadStartTime_0);
        end;
    end;
end;
