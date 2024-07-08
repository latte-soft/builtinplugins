local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeData);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTrackInstances);
local function v16(v8)
    local v9 = v5.buildRigHierarchy(v8);
    local v10 = {};
    local function v11(v12, v13)
        v13 = v13 or 1;
        for v14, v15 in v12, nil, nil do
            assert(not v10[v14], "Duplicate name in hierarchy");
            v10[v14] = v13;
            v11(v15, v13 + 1);
        end;
    end;
    v11(v9);
    return v10;
end;
return function(v17)
    return function(v18)
        local l_RootInstance_0 = v18:getState().Status.RootInstance;
        if l_RootInstance_0 then
            if v17 and #v17 > 1 then
                local v20 = v16(l_RootInstance_0);
                local v21 = {};
                for v22, v23 in v17, nil, nil do
                    local l_BoneRef_0 = v23:FindFirstChild("BoneRef");
                    v21[v23] = {
                        depth = v20[if not l_BoneRef_0 then v23.Name else l_BoneRef_0.Value.Name] or math.huge, 
                        order = v22
                    };
                end;
                table.sort(v17, function(v25, v26)
                    local v27 = v21[v25];
                    local v28 = v21[v26];
                    local l_depth_0 = v27.depth;
                    local l_depth_1 = v28.depth;
                    local l_order_0 = v27.order;
                    local l_order_1 = v28.order;
                    if l_depth_1 < l_depth_0 then
                        return true;
                    elseif l_depth_0 < l_depth_1 then
                        return false;
                    else
                        return l_order_0 < l_order_1;
                    end;
                end);
            end;
            v18:dispatch(v7(v17));
            return ;
        else
            return ;
        end;
    end;
end;
