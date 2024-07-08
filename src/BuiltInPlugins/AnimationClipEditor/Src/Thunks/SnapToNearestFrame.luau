local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
return function(v3)
    return function(v4)
        v4:dispatch(v1((v2.getNearestFrame(v3, v4:getState().Status.FrameRate))));
    end;
end;
