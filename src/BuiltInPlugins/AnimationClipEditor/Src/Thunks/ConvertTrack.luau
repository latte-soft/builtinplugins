local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetTracks);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v10 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
return function(v11, v12, v13, _)
    return function(v15)
        local v16 = v15:getState();
        local l_AnimationData_0 = v16.AnimationData;
        if l_AnimationData_0 and l_AnimationData_0.Instances[v11] then
            local v18 = v16.Status.DefaultEulerAnglesOrder or Enum.RotationOrder.XYZ;
            local v19 = v1(v16.Status.Tracks);
            local v20 = v10.findTrackEntry(v19, v12);
            local v21 = v2.Dictionary.join(l_AnimationData_0);
            v21.Instances = v2.Dictionary.join(v21.Instances);
            v21.Instances[v11] = v2.Dictionary.join({}, v21.Instances[v11]);
            v21.Instances[v11].Tracks = v2.Dictionary.join({}, v21.Instances[v11].Tracks);
            v21.Instances[v11].Tracks[v12[1]] = v1(v21.Instances[v11].Tracks[v12[1]]);
            local v22 = v6.getTrack(v21, v11, v12);
            if ((v22 ~= nil and v22.Data ~= nil) and v22.Type == v7.TRACK_TYPES.Quaternion) and v13 == v7.TRACK_TYPES.EulerAngles then
                v10.convertTrackToEulerAngles(v22, v18);
                v20.Type = v7.TRACK_TYPES.EulerAngles;
                v20.EulerAnglesOrder = v18;
                v10.createTrackListEntryComponents(v20, v20.Instance, v7.TRACK_TYPES.EulerAngles, v18);
                v15:dispatch(v5(v21));
                v15:dispatch(v4(v19));
            end;
            return ;
        else
            return ;
        end;
    end;
end;
