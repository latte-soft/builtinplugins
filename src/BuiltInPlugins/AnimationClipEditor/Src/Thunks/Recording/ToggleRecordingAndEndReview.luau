local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.SetFacialRecordingMode);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetInReviewState);
return function(v3)
    return function(v4)
        if not v4:getState().Status.inReviewState then
            v3:report("onFacialAnimationRecordingEnabled");
            v4:dispatch(v1(true));
            return ;
        else
            v4:dispatch(v2(false));
            v4:dispatch(v1(false));
            return ;
        end;
    end;
end;
