local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Util.CurveUtils);
return function(v10, v11)
    return function(v12)
        local v13 = v12:getState();
        local l_SelectedKeyframes_0 = v13.Status.SelectedKeyframes;
        local l_AnimationData_0 = v13.AnimationData;
        if l_AnimationData_0 and l_SelectedKeyframes_0 then
            local v16 = v1.Dictionary.join({}, l_AnimationData_0);
            v16.Instances = v1.Dictionary.join({}, v16.Instances);
            v16.Events = v2(v16.Events);
            local v17, v18 = v4.getSelectionBounds(l_AnimationData_0, l_SelectedKeyframes_0);
            for v19, v20 in pairs((v2(l_SelectedKeyframes_0))) do
                v16.Instances[v19] = v1.Dictionary.join({}, v16.Instances[v19]);
                v16.Instances[v19].Tracks = v1.Dictionary.join({}, v16.Instances[v19].Tracks);
                local v21 = v16.Instances[v19];
                for v22, v23 in pairs(v20) do
                    v21.Tracks[v22] = v2(v21.Tracks[v22]);
                    v8.traverse(v23, v21.Tracks[v22], function(v24, v25)
                        if not ((not v24.Selection or not v25.Keyframes) or v3(v25.Keyframes)) and v25.Data then
                            if not v25.Data[v17] then
                                v4.addKeyframe(v25, v17, {
                                    Value = v7.getValue(v25, v17), 
                                    LeftSlope = v7.getSlopes(v25, v17)
                                });
                            end;
                            if not v25.Data[v18] then
                                local _, v27 = v7.getSlopes(v25, v18);
                                local _, v29 = v7.findNearestKeyframesProperly(v25.Keyframes, v18);
                                v4.addKeyframe(v25, v18, {
                                    Value = v7.getValue(v25, v18), 
                                    RightSlope = v27, 
                                    InterpolationMode = if not v29 then Enum.KeyInterpolationMode.Cubic else v25.Data[v25.Keyframes[v29]].InterpolationMode
                                });
                            end;
                            for _, v31 in ipairs(v25.Keyframes) do
                                if v17 < v31 and v31 < v18 then
                                    v25.Data[v31] = nil;
                                end;
                            end;
                            local v32 = v9.generateCurve(v25.Type, v10, v11, v17, v25.Data[v17], v18, v25.Data[v18]);
                            if not (not v32 or v3(v32)) then
                                v25.Keyframes = v1.List.join(v1.Dictionary.keys(v25.Data), v1.Dictionary.keys(v32));
                                table.sort(v25.Keyframes);
                                v25.Data = v1.Dictionary.join(v25.Data, v32);
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            v12:dispatch(v6(v16));
            v12:dispatch(v5({}));
            return ;
        else
            return ;
        end;
    end;
end;
