local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local function _(v9)
    return (math.floor(v9 + 0.5));
end;
return function(v11, v12, v13)
    return function(v14)
        local v15 = v14:getState();
        local l_FrameRate_0 = v15.Status.FrameRate;
        local l_SnapMode_0 = v15.Status.SnapMode;
        local v18 = not not v13 and v13.selectedKeyframes or v15.Status.SelectedKeyframes;
        local v19 = not not v13 and v13.animationData or v15.AnimationData;
        if v19 and v18 then
            local v20 = v1.Dictionary.join({}, v19);
            v20.Instances = v1.Dictionary.join({}, v20.Instances);
            v20.Events = v2(v20.Events);
            local v21 = v2(v18);
            for v22, v23 in pairs(v21) do
                v20.Instances[v22] = v1.Dictionary.join({}, v20.Instances[v22]);
                v20.Instances[v22].Tracks = v1.Dictionary.join({}, v20.Instances[v22].Tracks);
                local v24 = v20.Instances[v22];
                for v25, v26 in pairs(v23) do
                    v24.Tracks[v25] = v2(v24.Tracks[v25]);
                    v8.traverse(v26, v24.Tracks[v25], function(v27, v28)
                        if v27.Selection and next(v27.Selection) then
                            local v29 = v1.Dictionary.keys(v27.Selection);
                            table.sort(v29);
                            if v12 > 1 then
                                local function v33(v30, v31)
                                    local v32 = math.floor((v11 + (v30 - v11) * v12) + 0.5);
                                    if l_SnapMode_0 ~= v3.SNAP_MODES.None then
                                        v32 = v4.getNearestFrame(v32, l_FrameRate_0);
                                    end;
                                    v32 = math.clamp(v32, 0, v3.MAX_ANIMATION_LENGTH);
                                    if v11 * v31 <= v32 * v31 then
                                        return true;
                                    else
                                        if v28.Keyframes then
                                            v5.moveKeyframe(v28, v30, v32);
                                            v5.moveNamedKeyframe(v20, v30, v32);
                                        end;
                                        v27.Selection[v30] = nil;
                                        v27.Selection[v32] = true;
                                        return false;
                                    end;
                                end;
                                for v34 = 1, #v29 do
                                    if v33(v29[v34], 1) then
                                        break;
                                    end;
                                end;
                                for v35 = #v29, 1, -1 do
                                    if v33(v29[v35], -1) then
                                        goto label0;
                                    end;
                                end;
                                return ;
                            else
                                local v36, v37 = v4.findNearestKeyframes(v29, v11);
                                if v37 == nil then
                                    v37 = v36 + 1;
                                end;
                                local function v40(v38)
                                    local v39 = math.floor((v11 + (v38 - v11) * v12) + 0.5);
                                    if l_SnapMode_0 ~= v3.SNAP_MODES.None then
                                        v39 = v4.getNearestFrame(v39, l_FrameRate_0);
                                    end;
                                    v39 = math.clamp(v39, 0, v3.MAX_ANIMATION_LENGTH);
                                    if v28.Keyframes then
                                        v5.moveKeyframe(v28, v38, v39);
                                        v5.moveNamedKeyframe(v20, v38, v39);
                                    end;
                                    v27.Selection[v38] = nil;
                                    v27.Selection[v39] = true;
                                end;
                                for v41 = v36, 1, -1 do
                                    v40(v29[v41]);
                                end;
                                for v42 = v37, #v29 do
                                    v40(v29[v42]);
                                end;
                            end;
                            ::label0::;
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            v14:dispatch(v7(v20));
            v14:dispatch(v6(v21));
            return ;
        else
            return ;
        end;
    end;
end;
