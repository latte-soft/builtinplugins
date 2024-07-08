local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeData);
return function(v5, v6, v7, v8, v9)
    return function(v10)
        local l_AnimationData_0 = v10:getState().AnimationData;
        if l_AnimationData_0 then
            local v12 = v2.getTrack(l_AnimationData_0, v5, v6);
            if v12 then
                if v12.Data[v7] then
                    local v13 = {};
                    if v8 == v1.SLOPES.Left then
                        local _, v15, _ = v3.findNearestKeyframesProperly(v12.Keyframes, v7 - 1);
                        if v15 then
                            v10:dispatch(v4(v5, v6, v12.Keyframes[v15], {
                                InterpolationMode = Enum.KeyInterpolationMode.Cubic
                            }));
                        end;
                        v13.LeftSlope = v9;
                    else
                        v13.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
                        v13.RightSlope = v9;
                    end;
                    v10:dispatch(v4(v5, v6, v7, v13));
                    return ;
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
