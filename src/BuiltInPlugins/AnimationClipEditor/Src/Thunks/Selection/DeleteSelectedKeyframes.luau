local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
return function(v8)
    return function(v9)
        local v10 = v9:getState();
        local l_SelectedKeyframes_0 = v10.Status.SelectedKeyframes;
        local l_AnimationData_0 = v10.AnimationData;
        local l_EditorMode_0 = v10.Status.EditorMode;
        if l_AnimationData_0 and l_SelectedKeyframes_0 then
            local v14 = v1.Dictionary.join({}, l_AnimationData_0);
            v14.Instances = v1.Dictionary.join({}, v14.Instances);
            for v15, v16 in pairs(l_SelectedKeyframes_0) do
                v14.Instances[v15] = v1.Dictionary.join({}, v14.Instances[v15]);
                v14.Instances[v15].Tracks = v1.Dictionary.join({}, v14.Instances[v15].Tracks);
                local v17 = v14.Instances[v15];
                for v18, v19 in pairs(v16) do
                    v17.Tracks[v18] = v2(v17.Tracks[v18]);
                    local v20 = v17.Tracks[v18];
                    local v21 = false;
                    local v22 = false;
                    do
                        local l_v21_0, l_v22_0 = v21, v22;
                        v7.traverse(v19, v20, function(v25, v26)
                            if v25.Selection then
                                l_v21_0 = true;
                                for v27, _ in pairs(v25.Selection) do
                                    if not (not v26.Data or not v26.Data[v27]) then
                                        v4.deleteKeyframe(v26, v27);
                                        v8:report("onDeleteKeyframe", v18, l_EditorMode_0, if not v14.Metadata then nil else v14.Metadata.Guid);
                                    end;
                                end;
                                if not (not v26.Data or v3(v26.Data)) then
                                    l_v22_0 = true;
                                end;
                                return ;
                            else
                                return ;
                            end;
                        end);
                        if not (not l_v21_0 or l_v22_0) then
                            v17.Tracks[v18] = nil;
                        end;
                    end;
                end;
            end;
            v9:dispatch(v6(v14));
            v9:dispatch(v5({}));
            return ;
        else
            return ;
        end;
    end;
end;
