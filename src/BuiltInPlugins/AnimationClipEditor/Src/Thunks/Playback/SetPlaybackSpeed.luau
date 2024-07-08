local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetPlaybackSpeed);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPlaybackStartInfo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v4)
    return function(v5)
        local l_AnimationData_0 = v5:getState().AnimationData;
        v5:dispatch(v1(v4));
        if not (not (not (not l_AnimationData_0 or not l_AnimationData_0.Metadata) and l_AnimationData_0.Metadata.EndTick > 0) or not (v5:getState().Status.PlayState ~= v3.PLAY_STATE.Pause)) then
            v5:dispatch(v2({
                startTime = tick(), 
                startPlayhead = v5:getState().Status.Playhead
            }));
        end;
    end;
end;
