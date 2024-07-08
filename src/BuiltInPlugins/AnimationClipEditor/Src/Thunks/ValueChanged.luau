local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeData);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v7, v8, v9, v10, v11, v12, v13)
    return function(v14)
        local l_AnimationData_0 = v14:getState().AnimationData;
        local v16 = v5.getTrack(l_AnimationData_0, v7, v8);
        if v16 == nil then
            v14:dispatch(v3(v7, v8[1], if v9 == v6.TRACK_TYPES.Facs then v6.TRACK_TYPES.Facs else v6.TRACK_TYPES.CFrame, v10, nil, v13));
            local v17 = {
                Value = v12
            };
            if not v5.isChannelAnimation(l_AnimationData_0) then
                v17.EasingStyle = Enum.PoseEasingStyle.Linear;
                v17.EasingDirection = Enum.PoseEasingDirection.In;
            else
                v17.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
            end;
            v14:dispatch(v1(v7, v8, v9, v10, v11, v17, v13));
        else
            local l_Data_0 = v16.Data;
            if not l_Data_0 or not l_Data_0[v11] then
                local v19 = {
                    Value = v12
                };
                if not v16.IsCurveTrack then
                    v19.EasingStyle = Enum.PoseEasingStyle.Linear;
                    v19.EasingDirection = Enum.PoseEasingDirection.In;
                else
                    v19.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
                end;
                v14:dispatch(v1(v7, v8, v9, v10, v11, v19, v13));
            else
                v14:dispatch(v2(v7, v8, v11, {
                    Value = v12
                }));
            end;
        end;
        v14:dispatch(v4(v11));
    end;
end;
