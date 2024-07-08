local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetSelectedTracks);
local v5 = require(l_Actions_0.SetSelectedTrackInstances);
local v6 = require(l_Actions_0.SetTopTrackIndex);
return function(v7)
    return function(v8)
        v8:dispatch(v5(v7));
        local l_Status_0 = v8:getState().Status;
        local l_RootInstance_0 = l_Status_0.RootInstance;
        local l_Tracks_0 = l_Status_0.Tracks;
        if l_RootInstance_0 then
            if not (v7 and next(v7)) then
                v8:dispatch(v4({}));
            end;
            local l_Parts_0 = v2.getRigInfo(l_RootInstance_0).Parts;
            local v13 = {};
            local v14 = {};
            for _, v16 in ipairs(l_Parts_0) do
                v14[v16] = {
                    v16.Name
                };
            end;
            for _, v18 in v7, nil, nil do
                local l_BoneRef_0 = v18:FindFirstChild("BoneRef");
                if not l_BoneRef_0 then
                    table.insert(v13, v14[v18]);
                else
                    table.insert(v13, v14[l_BoneRef_0.Value]);
                end;
            end;
            local v20 = v13[#v13];
            local v21 = 1;
            if v20 then
                for v22, v23 in l_Tracks_0, nil, nil do
                    if v23.Name == v20[1] then
                        v21 = v22;
                        break;
                    end;
                end;
            end;
            v8:dispatch(v4(v13));
            v8:dispatch(v6(v21));
            return ;
        else
            return ;
        end;
    end;
end;
