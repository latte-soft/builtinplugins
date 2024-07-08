local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local function v15(v4, v5, v6)
    for v7, v8 in pairs(v4.Instances) do
        for v9, v10 in pairs(v8.Tracks) do
            local l_Keyframes_0 = v10.Keyframes;
            if not v6 then
                for _, v13 in ipairs(l_Keyframes_0) do
                    v5(v7, v9, v13);
                end;
            else
                for v14 = #l_Keyframes_0, 1, -1 do
                    v5(v7, v9, l_Keyframes_0[v14]);
                end;
            end;
        end;
    end;
end;
local function v24(v16, v17)
    for v18, v19 in pairs(v16) do
        for v20, v21 in pairs(v19) do
            for v22, v23 in pairs(v21) do
                v17(v18, v20, v22, v23);
            end;
        end;
    end;
end;
return function()
    return function(v25)
        local l_AnimationData_0 = v25:getState().AnimationData;
        if l_AnimationData_0 then
            local v27 = v1(l_AnimationData_0);
            local v28 = {};
            local v29 = {};
            v15(v27, function(v30, v31, v32)
                local v33 = math.floor(v32);
                if v32 ~= v33 then
                    v28[v30] = v28[v30] or {};
                    v29[v30] = v29[v30] or {};
                    v28[v30][v31] = v28[v30][v31] or {};
                    v29[v30][v31] = v29[v30][v31] or {};
                    local v34 = v28[v30][v31];
                    local v35 = v29[v30][v31];
                    v34[v33] = v34[v33] == nil and v32 or v34[v33];
                    v35[v33] = v35[v33] == nil and v32 or math.max(v35[v33], v32);
                end;
            end);
            v24(v28, function(v36, v37, v38, v39)
                local v40 = v27.Instances[v36].Tracks[v37];
                if not v40.Data[v38] then
                    v2.moveKeyframe(v40, v39, v38);
                    v2.moveNamedKeyframe(v27, v39, v38);
                    if not (not v29[v36] or not v29[v36][v37]) and v29[v36][v37][v38] == v39 then
                        v29[v36][v37][v38] = nil;
                    end;
                end;
            end);
            v24(v29, function(v41, v42, v43, v44)
                local v45 = v27.Instances[v41].Tracks[v42];
                if not v45.Data[v43 + 1] then
                    v2.moveKeyframe(v45, v44, v43 + 1);
                    v2.moveNamedKeyframe(v27, v44, v43 + 1);
                end;
            end);
            v15(v27, function(v46, v47, v48)
                if v48 ~= math.floor(v48) then
                    v2.deleteKeyframe(v27.Instances[v46].Tracks[v47], v48);
                end;
            end, true);
            v25:dispatch(v3(v27));
            return ;
        else
            return ;
        end;
    end;
end;
