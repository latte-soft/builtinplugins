local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.SnapToNearestFrame);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
return function(v7, v8)
    return function(v9)
        local v10 = v9:getState();
        local l_AnimationData_0 = v10.AnimationData;
        if l_AnimationData_0 then
            local l_Instances_0 = l_AnimationData_0.Instances;
            if l_Instances_0 then
                local l_Root_0 = l_Instances_0.Root;
                if l_Root_0 then
                    local v14 = nil;
                    if v10.Status.EditorMode == v1.EDITOR_MODE.CurveCanvas then
                        v14 = {};
                        local l_ipairs_0 = ipairs;
                        local v16 = v10.Status.SelectedTracks or {};
                        for _, v18 in l_ipairs_0(v16) do
                            table.insert(v14, v6.getTrack(l_AnimationData_0, "Root", v18));
                        end;
                    else
                        v14 = l_Root_0.Tracks;
                    end;
                    local v19 = false;
                    local l_v7_0 = v7;
                    if v14 then
                        local v21 = v3.getZoomRange(l_AnimationData_0, v10.Status.HorizontalScroll, v10.Status.HorizontalZoom, v10.Status.EditingLength);
                        local v22 = v3.getScaledKeyframePosition(v7, v21.Start, v21.End, v8);
                        local v23 = v21.End + 1;
                        do
                            local l_v23_0 = v23;
                            for _, v26 in pairs(v14) do
                                v3.traverseTracks(nil, v26, function(v27)
                                    if v27.Keyframes and #v27.Keyframes > 0 then
                                        local v28, v29 = v2.findNearestKeyframes(v27.Keyframes, v7);
                                        if math.abs(v27.Keyframes[v28] - v7) < math.abs(v7 - l_v23_0) then
                                            l_v23_0 = v27.Keyframes[v28];
                                        end;
                                        if v29 and math.abs(v27.Keyframes[v29] - v7) < math.abs(v7 - l_v23_0) then
                                            l_v23_0 = v27.Keyframes[v29];
                                        end;
                                    end;
                                end, true);
                            end;
                            if (v21.Start <= l_v23_0 and l_v23_0 <= v21.End) and math.abs(v3.getScaledKeyframePosition(l_v23_0, v21.Start, v21.End, v8) - v22) < v1.SNAP_TO_KEYFRAME_THRESHOLD then
                                l_v7_0 = l_v23_0;
                                v19 = true;
                            end;
                        end;
                    end;
                    if not v19 then
                        v9:dispatch(v5(v7));
                        return ;
                    else
                        v9:dispatch(v4(l_v7_0));
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
