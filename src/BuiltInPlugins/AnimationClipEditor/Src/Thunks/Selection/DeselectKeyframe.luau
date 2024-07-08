local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v3 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v4 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local function v13(v7, v8)
    local l_v7_0 = v7;
    local v10 = nil;
    for v11, v12 in ipairs(v8) do
        v10 = l_v7_0[v12];
        if v10 then
            if v11 < #v8 then
                if not v10.Components then
                    return nil;
                else
                    l_v7_0 = v10.Components;
                end;
            end;
        else
            return nil;
        end;
    end;
    return v10;
end;
local function _(v14)
    local v15;
    if v14.Components ~= nil then
        v15 = v2(v14.Components);
        if not v15 then
            goto label0;
        end;
    end;
    v15 = true;
    if v14.Selection ~= nil then
        v15 = v2(v14.Selection);
    end;
    ::label0::;
    return v15;
end;
return function(v17, v18, v19)
    return function(v20)
        local v21 = v20:getState();
        local l_AnimationData_0 = v21.AnimationData;
        local v23 = (v21.Status or {}).SelectedKeyframes or {};
        local v24 = v13(v23[v17] or {}, v18);
        if v24 and (not v24.Selection or v24.Selection[v19]) then
            local v25 = v1.Dictionary.join(v23, {});
            v25[v17] = v1.Dictionary.join(v25[v17], {});
            v25[v17][v18[1]] = v3(v25[v17][v18[1]]);
            v24 = v13(v25[v17], v18);
            if v24 then
                v4.traverse(v24, nil, function(v26)
                    if v26.Selection then
                        v26.Selection[v19] = nil;
                        if v2(v26.Selection) then
                            v26.Selection = nil;
                        end;
                    end;
                end);
            end;
            local v27 = v25[v17][v18[1]];
            v4.traverse(v27, l_AnimationData_0.Instances[v17].Tracks[v18[1]], function(v28, v29, v30)
                if not (((not v29 or not v29.Data) or not v29.Data[v19]) or v28.Selection and v28.Selection[v19]) then
                    local l_v27_0 = v27;
                    for _, v33 in ipairs(v30) do
                        if l_v27_0 then
                            if l_v27_0.Selection then
                                l_v27_0.Selection[v19] = nil;
                            end;
                            l_v27_0 = l_v27_0.Components[v33];
                        end;
                    end;
                end;
            end, function(v34)
                if not (not v34.Selection or not v2(v34.Selection)) then
                    v34.Selection = nil;
                end;
            end);
            v4.traverse(v27, nil, nil, function(v35)
                if v35.Components then
                    local l_pairs_0 = pairs;
                    local v37 = v35.Components or {};
                    for v38, v39 in l_pairs_0(v37) do
                        local v40;
                        if v39.Components ~= nil then
                            v40 = v2(v39.Components);
                            if not v40 then
                                goto label2;
                            end;
                        end;
                        v40 = true;
                        if v39.Selection ~= nil then
                            v40 = v2(v39.Selection);
                        end;
                        ::label2::;
                        if v40 then
                            v35.Components[v38] = nil;
                        end;
                    end;
                end;
            end);
            local v41;
            if v27.Components ~= nil then
                v41 = v2(v27.Components);
                if not v41 then
                    goto label1;
                end;
            end;
            v41 = true;
            if v27.Selection ~= nil then
                v41 = v2(v27.Selection);
            end;
            ::label1::;
            if v41 then
                v25[v17][v18[1]] = nil;
                if v2(v25[v17]) then
                    v25[v17] = nil;
                end;
            end;
            v20:dispatch(v6(v25));
            return ;
        else
            return ;
        end;
    end;
end;
