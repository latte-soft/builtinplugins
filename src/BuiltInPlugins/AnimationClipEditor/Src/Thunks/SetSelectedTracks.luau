local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetSelectedTracks);
local v5 = require(l_Actions_0.SetSelectedTrackInstances);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetSelectedTrackInstances);
local v7 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
return function(v8)
    return function(v9)
        local l_RootInstance_0 = v9:getState().Status.RootInstance;
        v9:dispatch(v4(v8));
        if l_RootInstance_0 then
            local v11 = {};
            local v12 = {};
            local l_Parts_0 = v2.getRigInfo(l_RootInstance_0).Parts;
            for _, v15 in ipairs(l_Parts_0) do
                v12[v15.Name] = v15;
            end;
            if not (not v8 or not next(l_Parts_0)) then
                for _, v17 in ipairs(v8) do
                    local v18 = v17[1];
                    local v19 = v2.getBoneByName(l_RootInstance_0, v18);
                    if not v19 then
                        table.insert(v11, v12[v18]);
                    else
                        table.insert(v11, v19);
                    end;
                end;
            end;
            if not (not v11 or not next(v11)) then
                if not v7() then
                    v9:dispatch(v5(v11));
                else
                    v9:dispatch(v6(v11));
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
