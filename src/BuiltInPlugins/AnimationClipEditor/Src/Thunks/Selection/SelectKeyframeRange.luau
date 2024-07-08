local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
return function(v5, v6, v7, v8, v9)
    return function(v10)
        local v11 = v10:getState();
        local l_Status_0 = v11.Status;
        if l_Status_0 then
            local l_AnimationData_0 = v11.AnimationData;
            if l_AnimationData_0 then
                local v14 = v2.getTrack(l_AnimationData_0, v5, v6);
                if v14 == nil then
                    return ;
                else
                    local function v15(v16)
                        local l_pairs_0 = pairs;
                        local v18 = v16.Keyframes or {};
                        for _, v20 in l_pairs_0(v18) do
                            if v7 <= v20 and v20 <= v8 then
                                return true;
                            end;
                        end;
                        l_pairs_0 = pairs;
                        v18 = v16.Components or {};
                        for _, v22 in l_pairs_0(v18) do
                            if v15(v22) then
                                return true;
                            end;
                        end;
                        return false;
                    end;
                    if v15(v14) then
                        local l_SelectedKeyframes_0 = l_Status_0.SelectedKeyframes;
                        if l_SelectedKeyframes_0 and v9 then
                            l_SelectedKeyframes_0 = v1.Dictionary.join(l_SelectedKeyframes_0, {});
                            l_SelectedKeyframes_0[v5] = v1.Dictionary.join(l_SelectedKeyframes_0[v5] or {}, {});
                            l_SelectedKeyframes_0[v5][v6[1]] = v3(l_SelectedKeyframes_0[v5][v6[1]] or {});
                        else
                            l_SelectedKeyframes_0 = {
                                [v5] = {}
                            };
                        end;
                        local v24 = l_SelectedKeyframes_0[v5];
                        for v25, v26 in ipairs(v6) do
                            v24[v26] = v24[v26] or {};
                            if v25 < #v6 then
                                if not v24[v26].Components then
                                    v24[v26].Components = {};
                                end;
                                v24 = v24[v26].Components;
                            else
                                v24 = v24[v26];
                            end;
                        end;
                        local function v27(v28, v29)
                            local v30 = {};
                            local l_pairs_1 = pairs;
                            local v32 = v28.Keyframes or {};
                            for _, v34 in l_pairs_1(v32) do
                                if v7 <= v34 and v34 <= v8 then
                                    v30[v34] = true;
                                end;
                            end;
                            l_pairs_1 = pairs;
                            v32 = v28.Components or {};
                            for v35, v36 in l_pairs_1(v32) do
                                if v29.Components then
                                    if not v29.Components[v35] then
                                        v29.Components[v35] = {};
                                    end;
                                else
                                    v29.Components = {
                                        [v35] = {}
                                    };
                                end;
                                v30 = v1.Dictionary.join(v30, (v27(v36, v29.Components[v35])));
                            end;
                            v29.Selection = v1.Dictionary.join(v29.Selection or {}, v30);
                            return v30;
                        end;
                        v27(v14, v24);
                        v10:dispatch(v4(l_SelectedKeyframes_0));
                        return ;
                    else
                        return ;
                    end;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
