local _ = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_join_0 = v2.join;
local l_copy_0 = v2.copy;
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v5.useState;
local l_useCallback_0 = v5.useCallback;
local v8 = require(l_script_FirstAncestor_0.Src.Util.roundDecimal);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_game_FastInt_0 = game:GetFastInt("AudioEmitterDistanceAttenuationMaxPoints");
return function(v11)
    local v12, v13 = l_useState_0(v11.Keypoints);
    local v14, v15 = l_useState_0(1);
    local v17 = l_useCallback_0(function(v16)
        v13(v16.Keypoints);
        v15(1);
    end, {});
    local v40 = l_useCallback_0(function(v18, v19)
        local l_v19_0 = v19;
        if not (l_v19_0 >= 1) or #v18 < l_v19_0 then
            return l_v19_0;
        else
            local function _(v21, v22)
                local l_v18_0 = v18;
                local l_v18_1 = v18;
                local v25 = v18[v22];
                local v26 = v18[v21];
                l_v18_0[v21] = v25;
                l_v18_1[v22] = v26;
            end;
            for _ = 0, l_game_FastInt_0 do
                local v29 = v18[l_v19_0];
                local v30 = v18[l_v19_0 - 1];
                if v30 and v29.X < v30.X then
                    local v31 = l_v19_0 - 1;
                    local l_l_v19_0_0 = l_v19_0;
                    local v33 = v18[l_l_v19_0_0];
                    local v34 = v18[v31];
                    v18[v31] = v33;
                    v18[l_l_v19_0_0] = v34;
                    l_v19_0 = l_v19_0 - 1;
                else
                    local v35 = v18[l_v19_0 + 1];
                    if v35 and v35.X < v29.X then
                        local l_l_v19_0_1 = l_v19_0;
                        local v37 = l_v19_0 + 1;
                        local v38 = v18[v37];
                        local v39 = v18[l_l_v19_0_1];
                        v18[l_l_v19_0_1] = v38;
                        v18[v37] = v39;
                        l_v19_0 = l_v19_0 + 1;
                    else
                        break;
                    end;
                end;
            end;
            return l_v19_0;
        end;
    end, {});
    local v44 = l_useCallback_0(function(v41, v42)
        local v43 = v8(v41[v42].X, 3);
        if v42 >= 2 and v8(v41[v42 - 1].X, 3) == v43 then
            table.remove(v41, v42 - 1);
            return v42 - 1;
        elseif v42 <= #v41 - 1 and v8(v41[v42 + 1].X, 3) == v43 then
            table.remove(v41, v42 + 1);
            return v42;
        else
            return v42;
        end;
    end, {});
    return {
        keypoints = v12, 
        selectedIndex = v14, 
        reset = v17, 
        update = l_useCallback_0(function(v45, v46)
            local v47 = l_join_0(v12, {
                [v14] = Vector2.new(math.clamp(v8(v45.X, 3), 0, math.huge), (math.clamp(v8(v45.Y, 3), 0, 1)))
            });
            local v48 = v40(v47, v14);
            if v46 then
                v48 = v44(v47, v48);
            end;
            v15(v48);
            v13(v47);
        end, {
            v12, 
            v14
        }), 
        add = l_useCallback_0(function(v49)
            if l_game_FastInt_0 <= #v12 then
                return false;
            else
                local v50 = l_copy_0(v12);
                local v51 = 1;
                local v52 = #v50;
                while v51 <= v52 do
                    local v53 = math.floor((v51 + v52) / 2);
                    if v50[v53].X == v49.X then
                        v51 = v53;
                        break;
                    elseif v49.X < v50[v53].X then
                        v52 = v53 - 1;
                    else
                        v51 = v53 + 1;
                    end;
                end;
                if v51 <= #v50 and v50[v51].X == v49.X then
                    v50[v51] = v49;
                else
                    table.insert(v50, v51, v49);
                end;
                v13(v50);
                v15(v51);
                return true;
            end;
        end, {
            v12, 
            v14
        }), 
        remove = l_useCallback_0(function()
            local v54 = l_copy_0(v12);
            table.remove(v54, v14);
            v13(v54);
            if #v54 < v14 then
                v15(#v54);
            end;
        end, {
            v12, 
            v14
        }), 
        select = l_useCallback_0(function(v55)
            v15(v55);
        end, {}), 
        save = l_useCallback_0(function(v56)
            v13(function(v57)
                v56({
                    Keypoints = v57
                });
                return v57;
            end);
        end, {}), 
        getSelectedKeypoint = l_useCallback_0(function()
            if not (v14 > 0) or #v12 < v14 then
                return nil;
            else
                return v12[v14];
            end;
        end, {
            v12, 
            v14
        })
    };
end;
