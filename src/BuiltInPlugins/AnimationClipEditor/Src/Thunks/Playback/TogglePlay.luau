local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
return function(v3)
    return function(v4)
        local l_AnimationData_0 = v4:getState().AnimationData;
        if not (not l_AnimationData_0 or not l_AnimationData_0.Metadata) and l_AnimationData_0.Metadata.EndTick > 0 then
            if v4:getState().Status.PlayState == v1.PLAY_STATE.Pause then
                v4:dispatch(v2(v1.PLAY_STATE.Play));
            else
                v4:dispatch(v2(v1.PLAY_STATE.Pause));
            end;
        end;
        v3:report("onControlPressed", "TogglePlay");
    end;
end;
