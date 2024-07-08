local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
return function(v3, v4)
    return function(v5)
        local v6 = v5:getState();
        local l_AnimationData_0 = v6.AnimationData;
        local l_Tracks_0 = v6.Status.Tracks;
        local l_Playhead_0 = v6.Status.Playhead;
        if not (not l_AnimationData_0 or not l_AnimationData_0.Metadata) and l_Tracks_0 then
            if l_AnimationData_0.Metadata.EndTick - l_AnimationData_0.Metadata.StartTick == 0 then
                return ;
            else
                local _ = nil;
                local v11 = {};
                for _, v13 in ipairs(l_Tracks_0) do
                    local v14 = l_AnimationData_0.Instances[v13.Instance];
                    if not (not v14 or not v14.Tracks[v13.Name]) then
                        v11[v13.Name] = v14.Tracks[v13.Name];
                    end;
                end;
                v5:dispatch(v2(if not v3 then v1.getPreviousKeyframe(v11, l_Playhead_0) else v1.getNextKeyframe(v11, l_Playhead_0)));
                if not v3 then
                    v4:report("onControlPressed", "SkipBackward");
                    return ;
                else
                    v4:report("onControlPressed", "SkipForward");
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
end;
