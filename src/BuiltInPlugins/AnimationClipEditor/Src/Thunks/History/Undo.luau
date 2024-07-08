local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetFuture);
local v5 = require(l_Actions_0.SetInReviewState);
local v6 = require(l_Actions_0.SetPast);
local v7 = require(l_Actions_0.SetSelectedKeyframes);
local v8 = require(l_Actions_0.SetSelectedTracks);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v10 = require(l_Thunks_0.SetSelectedTracks);
local v11 = require(l_Thunks_0.SortAndSetTracks);
local v12 = require(l_Thunks_0.UpdateAnimationData);
local v13 = require(l_script_FirstAncestor_0.Src.Util.TrackSelectionUtils);
local v14 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v15 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function(v16)
    return function(v17)
        local v18 = v17:getState();
        local l_AnimationData_0 = v18.AnimationData;
        local l_Tracks_0 = v18.Status.Tracks;
        local l_SelectedTracks_0 = v18.Status.SelectedTracks;
        local l_History_0 = v18.History;
        local l_Past_0 = l_History_0.Past;
        local l_Future_0 = l_History_0.Future;
        if #l_Past_0 > 0 then
            if v14() then
                v17:dispatch(v5(false));
            end;
            v17:dispatch(v4((v2.List.filter(v2.List.join({
                {
                    AnimationData = v2.Dictionary.join(l_AnimationData_0), 
                    Tracks = v2.List.join(l_Tracks_0)
                }
            }, l_Future_0), function(_, v26)
                return v26 <= l_History_0.MaxWaypointSize;
            end))));
            local v27 = l_Past_0[1];
            v17:dispatch(v12(v27.AnimationData));
            v17:dispatch(v11(v27.Tracks));
            v17:dispatch(v7({}));
            local v28, v29 = v13.PruneSelectedTracks(v27.AnimationData, l_SelectedTracks_0);
            if v29 then
                if not v15() then
                    v17:dispatch(v8(v28));
                else
                    v17:dispatch(v10(v28));
                end;
            end;
            v17:dispatch(v6(v2.List.removeIndex(l_Past_0, 1)));
            if v16 then
                v16:get(v1.SIGNAL_KEYS.SelectionChanged):Fire();
            end;
        end;
    end;
end;
