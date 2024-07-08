local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v5, v6, v7, v8)
    return function(v9)
        local l_AnimationData_0 = v9:getState().AnimationData;
        if l_AnimationData_0 and l_AnimationData_0.Instances[v5] then
            local v11 = v1.Dictionary.join({}, l_AnimationData_0);
            v11.Instances = v1.Dictionary.join({}, v11.Instances);
            v11.Instances[v5] = v1.Dictionary.join({}, v11.Instances[v5]);
            v11.Instances[v5].Tracks = v1.Dictionary.join({}, v11.Instances[v5].Tracks);
            v11.Instances[v5].Tracks[v6[1]] = v2(v11.Instances[v5].Tracks[v6[1]]);
            local v12 = v3.getTrack(v11, v5, v6);
            if not ((not v12 or not v12.Data) or not v12.Data[v7]) then
                v3.setKeyframeData(v12, v7, v8);
                v9:dispatch(v4(v11));
            end;
            return ;
        else
            return ;
        end;
    end;
end;
