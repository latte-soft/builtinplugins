local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
return function(v4, v5, v6, v7, v8, v9)
    return function(v10)
        local l_AnimationData_0 = v10:getState().AnimationData;
        if l_AnimationData_0 and l_AnimationData_0.Instances[v4] then
            local v12 = v1.getTrack(l_AnimationData_0, v4, v5);
            local v13 = nil;
            local v14 = nil;
            local v15 = nil;
            if v12 then
                local v16, v17, v18 = v2.findNearestKeyframesProperly(v12.Keyframes, v8);
                v13 = v16;
                v14 = v17;
                v15 = v18;
                if v13 then
                    return ;
                end;
            end;
            local v19 = nil;
            if v12 and v14 then
                local v20 = v2.getValue(v12, v8);
                local l_InterpolationMode_0 = v12.Data[v12.Keyframes[v14]].InterpolationMode;
                local v22 = nil;
                local v23 = nil;
                if l_InterpolationMode_0 == Enum.KeyInterpolationMode.Cubic then
                    local v24, v25 = v2.getSlopes(v12, v8);
                    v22 = v24;
                    v23 = v25;
                end;
                v19 = {
                    Value = v20, 
                    InterpolationMode = l_InterpolationMode_0, 
                    LeftSlope = v22, 
                    RightSlope = v23
                };
            else
                v19 = {
                    Value = v2.getDefaultValue(v6), 
                    InterpolationMode = Enum.KeyInterpolationMode.Cubic
                };
            end;
            v10:dispatch(v3(v4, v5, v6, v7, v8, v19, v9));
            return ;
        else
            return ;
        end;
    end;
end;
