local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetFuture);
local v4 = require(l_Actions_0.SetPast);
local v5 = require(l_Actions_0.SetSelectedKeyframes);
local v6 = require(l_Actions_0.SetSelectedTracks);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v8 = require(l_Thunks_0.SetSelectedTracks);
local v9 = require(l_Thunks_0.SortAndSetTracks);
local v10 = require(l_Thunks_0.UpdateAnimationData);
local v11 = require(l_script_FirstAncestor_0.Src.Util.TrackSelectionUtils);
local v12 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function()
    return function(v13)
        local v14 = v13:getState();
        local l_AnimationData_0 = v14.AnimationData;
        local l_Tracks_0 = v14.Status.Tracks;
        local l_SelectedTracks_0 = v14.Status.SelectedTracks;
        local l_History_0 = v14.History;
        local l_Past_0 = l_History_0.Past;
        local l_Future_0 = l_History_0.Future;
        if #l_Future_0 > 0 then
            v13:dispatch(v4((v1.List.filter(v1.List.join({
                {
                    AnimationData = v1.Dictionary.join(l_AnimationData_0), 
                    Tracks = v1.List.join(l_Tracks_0)
                }
            }, l_Past_0), function(_, v22)
                return v22 <= l_History_0.MaxWaypointSize;
            end))));
            local v23 = l_Future_0[1];
            v13:dispatch(v10(v23.AnimationData));
            v13:dispatch(v9(v23.Tracks));
            v13:dispatch(v5({}));
            local v24, v25 = v11.PruneSelectedTracks(v23.AnimationData, l_SelectedTracks_0);
            if v25 then
                if not v12() then
                    v13:dispatch(v6(v24));
                else
                    v13:dispatch(v8(v24));
                end;
            end;
            v13:dispatch(v3(v1.List.removeIndex(l_Future_0, 1)));
        end;
    end;
end;
