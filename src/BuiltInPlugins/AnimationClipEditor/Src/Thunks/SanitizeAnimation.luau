local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Framework).Dash.copy;
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v3 = require(l_Thunks_0.History.AddWaypoint);
local v4 = require(l_Thunks_0.DeleteTrack);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v6 = require(l_Util_0.AnimationData);
local v7 = require(l_Util_0.Constants);
local _ = require(l_Util_0.deepCopy);
local v9 = require(l_Util_0.fuzzyCFrameEq);
return function(v10)
    return function(v11)
        local v12 = v11:getState();
        local _ = v12.Status;
        local _ = v12.Tracks;
        local l_AnimationData_0 = v12.AnimationData;
        if not v6.isChannelAnimation(l_AnimationData_0) then
            local v16 = {
                [v7.R15_PARTS.HumanoidRootPart] = true, 
                [v7.R15_PARTS.LowerTorso] = true
            };
            local v17 = {};
            for _, v19 in v7.R15_PARTS, nil, nil do
                v17[v19] = true;
            end;
            for _, v21 in v7.FacsNames, nil, nil do
                v17[v21] = true;
            end;
            v11:dispatch(v3());
            for _, v23 in l_AnimationData_0.Instances, nil, nil do
                for v24, v25 in v23.Tracks, nil, nil do
                    if v17[v24] then
                        if not v16[v24] then
                            local v26 = true;
                            for _, v28 in v25.Data, nil, nil do
                                v28.Value = v28.Value.Rotation;
                                v26 = v26 and v9(v28.Value, CFrame.identity);
                            end;
                            if v26 then
                                v11:dispatch(v4(v24, v10));
                            end;
                        end;
                    else
                        v11:dispatch(v4(v24, v10));
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
