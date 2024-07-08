local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetIsDirty);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v7 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v9 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
removeTracksWithNames = function(v10, v11)
    for v12, v13 in pairs(v11.Instances) do
        for _, v15 in pairs(v10) do
            for v16, _ in pairs(v13.Tracks) do
                if v16 == v15 then
                    v11.Instances[v12].Tracks[v16] = nil;
                end;
            end;
        end;
    end;
end;
clearFacsTracksAndHeadTrack = function(v18)
    local v19 = v9(v4.FacsNames);
    v19.Head = "Head";
    removeTracksWithNames(v19, v18);
end;
clearR15TracksBesidesHead = function(v20)
    local v21 = v9(v4.R15_PARTS);
    v21.Head = nil;
    removeTracksWithNames(v21, v20);
end;
return function(v22, v23, v24)
    return function(v25)
        local v26 = v25:getState();
        local l_Status_0 = v26.Status;
        local l_AnimationData_0 = v26.AnimationData;
        if not (v22 ~= nil) or l_AnimationData_0 == nil then
            return ;
        else
            l_AnimationData_0 = v9(l_AnimationData_0);
            v22 = v9(v22);
            local v29 = not (not l_AnimationData_0.Metadata.IsChannelAnimation and not v22.Metadata.IsChannelAnimation);
            local l_DefaultRotationType_0 = l_Status_0.DefaultRotationType;
            local l_DefaultEulerAnglesOrder_0 = l_Status_0.DefaultEulerAnglesOrder;
            if not (not v29 or l_AnimationData_0.Metadata.IsChannelAnimation) then
                local _, _ = v3.promoteToChannels(l_AnimationData_0, l_DefaultRotationType_0, l_DefaultEulerAnglesOrder_0);
            end;
            if not (not v29 or v22.Metadata.IsChannelAnimation) then
                local _, _ = v3.promoteToChannels(v22, l_DefaultRotationType_0, l_DefaultEulerAnglesOrder_0);
            end;
            local v36 = nil;
            local v37 = nil;
            if v23 == v4.TRACKS_SUBSETS_TYPE.Body then
                v36 = v22;
                v37 = l_AnimationData_0;
            elseif v23 == v4.TRACKS_SUBSETS_TYPE.Face then
                v36 = l_AnimationData_0;
                v37 = v22;
            else
                return ;
            end;
            clearR15TracksBesidesHead(v37);
            clearFacsTracksAndHeadTrack(v36);
            local l_Tracks_0 = v36.Instances.Root.Tracks;
            for _, v40 in pairs(v37.Instances) do
                for v41, v42 in pairs(v40.Tracks) do
                    l_Tracks_0[v41] = v9(v42);
                end;
            end;
            v36.Metadata.Name = l_AnimationData_0.Metadata.Name;
            v25:dispatch(v2());
            v25:dispatch(v6({}));
            for v43, v44 in pairs(v36.Instances) do
                for v45, v46 in pairs(v44.Tracks) do
                    v25:dispatch(v1(v43, v45, v46.Type, v7.getRotationType(v46), v7.getEulerAnglesOrder(v46), v24));
                end;
            end;
            v25:dispatch(v8(v36));
            v25:dispatch(v5(true));
            return ;
        end;
    end;
end;
