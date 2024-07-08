local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v6)
    return function(v7)
        local v8 = v7:getState();
        local l_SelectedKeyframes_0 = v8.Status.SelectedKeyframes;
        local l_AnimationData_0 = v8.AnimationData;
        if l_AnimationData_0 and l_SelectedKeyframes_0 then
            local v11 = v1.Dictionary.join({}, l_AnimationData_0);
            v11.Instances = v1.Dictionary.join({}, v11.Instances);
            for v12, v13 in pairs(l_SelectedKeyframes_0) do
                v11.Instances[v12] = v1.Dictionary.join({}, v11.Instances[v12]);
                v11.Instances[v12].Tracks = v1.Dictionary.join({}, v11.Instances[v12].Tracks);
                local v14 = v11.Instances[v12];
                for v15, v16 in pairs(v13) do
                    v14[v15] = v2(v14[v15]);
                    v4.traverse(v16, v14.Tracks[v15], function(v17, v18)
                        if v17.Selection and v18.Data then
                            for v19, _ in pairs(v17.Selection) do
                                if v18.Data[v19] then
                                    v3.setKeyframeData(v18, v19, v6);
                                end;
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            v7:dispatch(v5(v11));
            return ;
        else
            return ;
        end;
    end;
end;
