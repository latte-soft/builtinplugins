local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
return function(v7, v8, _)
    return function(v10)
        local l_AnimationData_0 = v10:getState().AnimationData;
        if l_AnimationData_0 and l_AnimationData_0.Instances[v7] then
            local v12 = v2.Dictionary.join({}, l_AnimationData_0);
            v12.Instances = v2.Dictionary.join({}, v12.Instances);
            v12.Instances[v7] = v2.Dictionary.join({}, v12.Instances[v7]);
            v12.Instances[v7].Tracks = v2.Dictionary.join({}, v12.Instances[v7].Tracks);
            v12.Instances[v7].Tracks[v8[1]] = v1(v12.Instances[v7].Tracks[v8[1]]);
            local v13 = v3.getTrack(v12, v7, v8);
            if v13 ~= nil then
                v4.traverseTracks(nil, v13, function(v14)
                    v14.Keyframes = {};
                    v14.Data = {};
                end);
                v10:dispatch(v5(v12));
            end;
            return ;
        else
            return ;
        end;
    end;
end;
