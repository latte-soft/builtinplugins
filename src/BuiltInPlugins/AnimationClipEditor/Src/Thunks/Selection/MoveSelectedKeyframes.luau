local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
return function(v9, v10, v11, v12, v13)
    return function(v14)
        local v15 = v14:getState();
        local v16 = not not v13 and v13.selectedKeyframes or v15.Status.SelectedKeyframes;
        local v17 = not not v13 and v13.animationData or v15.AnimationData;
        local l_FrameRate_0 = v15.Status.FrameRate;
        local l_SnapMode_0 = v15.Status.SnapMode;
        if v17 and v16 then
            local v20 = v1.Dictionary.join({}, v17);
            v20.Instances = v1.Dictionary.join({}, v20.Instances);
            v20.Events = v2(v20.Events);
            local v21 = v9 < v10;
            local v22, v23 = v3.getSelectionBounds(v20, v16);
            local v24 = v2(v16);
            for v25, v26 in pairs(v24) do
                v20.Instances[v25] = v1.Dictionary.join({}, v20.Instances[v25]);
                v20.Instances[v25].Tracks = v1.Dictionary.join({}, v20.Instances[v25].Tracks);
                local v27 = v20.Instances[v25];
                for v28, v29 in pairs(v26) do
                    v27.Tracks[v28] = v2(v27.Tracks[v28]);
                    v8.traverse(v29, v27.Tracks[v28], function(v30, v31)
                        if v30.Selection then
                            local v32 = v1.Dictionary.keys(v30.Selection);
                            table.sort(v32);
                            local v33 = nil;
                            local v34 = nil;
                            local v35 = nil;
                            if not v21 then
                                v33 = 1;
                                v34 = #v32;
                                v35 = 1;
                            else
                                v33 = #v32;
                                v34 = 1;
                                v35 = -1;
                            end;
                            for v36 = v33, v34, v35 do
                                local v37 = v32[v36];
                                local v38 = v10 + (v37 - v9);
                                if l_SnapMode_0 ~= v6.SNAP_MODES.None then
                                    v38 = v7.getNearestFrame(v38, l_FrameRate_0);
                                end;
                                v38 = math.clamp(v38, v37 - v22, v6.MAX_ANIMATION_LENGTH - (v23 - v37));
                                if v31.Keyframes then
                                    v3.moveKeyframe(v31, v37, v38);
                                    v3.moveNamedKeyframe(v20, v37, v38);
                                    if not ((((not (v31.Type ~= v6.TRACK_TYPES.Quaternion) or not v31.Data) or not v31.Data[v38]) or not v11) or not v12) then
                                        if v31.Type == v6.TRACK_TYPES.Facs then
                                            v12 = math.clamp(v12, 0, 1);
                                        end;
                                        v3.setKeyframeData(v31, v38, {
                                            Value = (v31.Data[v38].Value - v11) + v12
                                        });
                                    end;
                                end;
                                v30.Selection[v37] = nil;
                                v30.Selection[v38] = true;
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            v14:dispatch(v5(v20));
            v14:dispatch(v4(v24));
            return ;
        else
            return ;
        end;
    end;
end;
