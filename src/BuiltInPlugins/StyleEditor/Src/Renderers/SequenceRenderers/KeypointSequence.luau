local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v1.join;
local l_joinDeep_0 = v1.joinDeep;
local l_copy_0 = v1.copy;
local v5 = require(l_Parent_0.Src.Util.roundDecimal);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local v24 = {
    MAX_KEYPOINT_COUNT = 20, 
    updateIndexMut = function(v7)
        local l_Selected_0 = v7.Selected;
        if not (l_Selected_0 > 1) or #v7.Keypoints <= l_Selected_0 then
            return l_Selected_0;
        else
            local l_Keypoints_0 = v7.Keypoints;
            local function _(v10, v11)
                local v12 = l_Keypoints_0[v10];
                l_Keypoints_0[v10] = l_Keypoints_0[v11];
                l_Keypoints_0[v11] = v12;
            end;
            for _ = 0, 15 do
                local v15 = l_Keypoints_0[l_Selected_0];
                local v16 = l_Keypoints_0[l_Selected_0 - 1];
                if v16 and v15.Time < v16.Time then
                    local v17 = l_Selected_0 - 1;
                    local l_l_Selected_0_0 = l_Selected_0;
                    local v19 = l_Keypoints_0[v17];
                    l_Keypoints_0[v17] = l_Keypoints_0[l_l_Selected_0_0];
                    l_Keypoints_0[l_l_Selected_0_0] = v19;
                    l_Selected_0 = l_Selected_0 - 1;
                else
                    local v20 = l_Keypoints_0[l_Selected_0 + 1];
                    if v20 and v20.Time < v15.Time then
                        local l_l_Selected_0_1 = l_Selected_0;
                        local v22 = l_Selected_0 + 1;
                        local v23 = l_Keypoints_0[l_l_Selected_0_1];
                        l_Keypoints_0[l_l_Selected_0_1] = l_Keypoints_0[v22];
                        l_Keypoints_0[v22] = v23;
                        l_Selected_0 = l_Selected_0 + 1;
                    else
                        break;
                    end;
                end;
            end;
            v7.Selected = l_Selected_0;
            return ;
        end;
    end
};
v24.updateSelected = function(v25, v26)
    if v25.Selected == 1 then
        v26.Time = 0;
    elseif v25.Selected == #v25.Keypoints then
        v26.Time = 1;
    else
        v26.Time = math.clamp(v5(v26.Time, 3), 0.01, 0.99);
    end;
    if typeof(v26.Value) == "number" then
        v26.Value = math.clamp(v5(v26.Value, 3), 0, 1);
    end;
    local v27 = l_join_0(v25, {
        Keypoints = l_join_0(v25.Keypoints, {
            [v25.Selected] = v26
        })
    });
    v24.updateIndexMut(v27);
    return v27;
end;
v24.add = function(v28, v29)
    if v24.MAX_KEYPOINT_COUNT <= #v28.Keypoints then
        return v28;
    else
        local v30 = l_join_0(v28, {
            Keypoints = l_copy_0(v28.Keypoints)
        });
        local v31 = -1;
        for v32, v33 in v30.Keypoints, nil, nil do
            if v29.Time == v33.Time then
                v29.Time = v29.Time - 0.001;
            end;
            if v29.Time < v33.Time then
                v31 = v32;
                table.insert(v30.Keypoints, v31, v29);
                break;
            end;
        end;
        v30.Selected = v31;
        return v30;
    end;
end;
v24.removeSelected = function(v34)
    local v35 = l_copy_0(v34.Keypoints);
    table.remove(v35, v34.Selected);
    return {
        Keypoints = v35, 
        Selected = v34.Selected - 1
    };
end;
v24.isFixedKeypointSelected = function(v36)
    local v37 = true;
    if v36.Selected ~= 1 then
        v37 = v36.Selected == #v36.Keypoints;
    end;
    return v37;
end;
v24.select = function(v38, v39)
    return l_joinDeep_0(v38, {
        Selected = v39
    });
end;
v24.selectedKeypoint = function(v40)
    return v40.Keypoints[v40.Selected];
end;
return v24;
