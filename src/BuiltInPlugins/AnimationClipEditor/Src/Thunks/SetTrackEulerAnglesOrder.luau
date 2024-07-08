local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v6, v7, v8)
    return function(v9)
        local l_AnimationData_0 = v9:getState().AnimationData;
        local v11 = v2.getTrack(l_AnimationData_0, v6, v7);
        if v11 and (not (v11.Type == v3.TRACK_TYPES.EulerAngles) or v11.EulerAnglesOrder == v8) then
            return nil;
        else
            local v12 = v1.Dictionary.join({}, l_AnimationData_0);
            local v13 = v1.Dictionary.join({}, v12.Instances);
            local v14 = v1.Dictionary.join({}, v13[v6]);
            local v15 = v1.Dictionary.join({}, v14.Tracks);
            if not v11 then
                v2.addTrack(v15, v7[1], v3.TRACK_TYPES.CFrame, v2.isChannelAnimation(v12), v3.TRACK_TYPES.EulerAngles, v8);
            end;
            local v16 = v1.Dictionary.join({}, v15[v7[1]]);
            local v17 = v1.Dictionary.join({}, v16.Components);
            local v18 = v1.Dictionary.join({}, v17[v3.PROPERTY_KEYS.Rotation]);
            v18.EulerAnglesOrder = v8;
            v17[v3.PROPERTY_KEYS.Rotation] = v18;
            v16.Components = v17;
            v15[v7[1]] = v16;
            v14.Tracks = v15;
            v13[v6] = v14;
            v12.Instances = v13;
            v9:dispatch(v5(v12));
            return ;
        end;
    end;
end;
