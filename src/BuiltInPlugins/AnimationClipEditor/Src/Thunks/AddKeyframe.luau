local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v7, v8, v9, v10, v11, v12, v13)
    return function(v14)
        local v15 = v14:getState();
        local l_AnimationData_0 = v15.AnimationData;
        local v17 = v15.Status and v15.Status.EditorMode;
        if l_AnimationData_0 and l_AnimationData_0.Instances[v7] then
            local v18 = v3.Dictionary.join({}, l_AnimationData_0);
            v18.Instances = v3.Dictionary.join({}, v18.Instances);
            v18.Instances[v7] = v3.Dictionary.join({}, v18.Instances[v7]);
            v18.Instances[v7].Tracks = v3.Dictionary.join({}, v18.Instances[v7].Tracks);
            v18.Instances[v7].Tracks[v8[1]] = v1(v18.Instances[v7].Tracks[v8[1]]);
            local l_Tracks_0 = v18.Instances[v7].Tracks;
            local v20 = v4.getTrack(v18, v7, v8);
            if v20 == nil then
                v10 = (v10 or v15.Status and v15.Status.DefaultRotationType) or v2.DEFAULT_ROTATION_TYPE;
                local v21 = not not v15.Status and v15.Status.DefaultEulerAnglesOrder or Enum.RotationOrder.XYZ;
                local l_CFrame_0 = v2.TRACK_TYPES.CFrame;
                if v9 == v2.TRACK_TYPES.Facs then
                    l_CFrame_0 = v2.TRACK_TYPES.Facs;
                end;
                v14:dispatch(v5(v7, v8[1], l_CFrame_0, v10, v21, v13));
                v4.addTrack(l_Tracks_0, v8[1], l_CFrame_0, v4.isChannelAnimation(v18), v10, v21);
                v20 = v4.getTrack(v18, v7, v8);
            end;
            local v23 = not not v20 and v20.Data or nil;
            if v23 and v23[v11] == nil then
                v4.addKeyframe(v20, v11, v12);
                if v11 ~= 0 and v23[0] == nil then
                    v4.addDefaultKeyframe(v20, 0, v9);
                end;
                v14:dispatch(v6(v18));
                if v13 then
                    v13:report("onAddKeyframe", v8[1], v17, if not v18.Metadata then nil else v18.Metadata.Guid);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
