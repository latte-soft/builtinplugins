local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetHaveToSetBackToNotLooping);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetInReviewState);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetPast);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.MergeBodyAndFacialAnimation);
local v8 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
return function(v11, v12, v13)
    return function(v14)
        local v15 = v8.newRigAnimation((v11.Localization:getText("FaceCapture", "DefaultFaceRecordingName")));
        for _, v17 in pairs(v15.Instances) do
            local l_Tracks_0 = v17.Tracks;
            for v19, v20 in pairs(v12) do
                for v21, v22 in pairs(v20) do
                    local v23 = l_Tracks_0[v21];
                    if v23 == nil then
                        v23 = if v21 == "Head" then v8.addTrack(l_Tracks_0, v21, v9.TRACK_TYPES.CFrame, false, v9.TRACK_TYPES.Quaternion) else v8.addTrack(l_Tracks_0, v21, v9.TRACK_TYPES.Facs, false, v9.TRACK_TYPES.Quaternion);
                    end;
                    v8.addKeyframe(v23, v19, {
                        Value = v22, 
                        EasingStyle = Enum.PoseEasingStyle.Linear, 
                        EasingDirection = Enum.PoseEasingDirection.In
                    });
                end;
            end;
        end;
        v8.clearTrackSequences(v15);
        if not v14:getState().AnimationData then
            v14:dispatch(v5());
            local l_Past_0 = v14:getState().History.Past;
            v14:dispatch(v6(v15, v13));
            v14:dispatch(v4(l_Past_0));
        else
            v14:dispatch(v7(v15, v9.TRACKS_SUBSETS_TYPE.Face, v13));
        end;
        v14:dispatch(v3(true));
        local l_AnimationData_0 = v14:getState().AnimationData;
        if not l_AnimationData_0.Metadata.Looping then
            v8.setLooping(l_AnimationData_0, true);
            v14:dispatch(v1(l_AnimationData_0));
            v14:dispatch(v2(true));
        end;
    end;
end;
