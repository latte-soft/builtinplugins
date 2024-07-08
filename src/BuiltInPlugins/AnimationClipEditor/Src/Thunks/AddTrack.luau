local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
return function(v7, v8, v9, v10, v11, v12)
    return function(v13)
        local v14 = v13:getState();
        local l_Status_0 = v14.Status;
        if l_Status_0 == nil then
            return ;
        else
            local l_EditorMode_0 = l_Status_0.EditorMode;
            local l_Tracks_0 = l_Status_0.Tracks;
            v10 = v10 or l_Status_0.DefaultRotationType;
            for _, v19 in ipairs(l_Tracks_0) do
                if v19.Name == v8 then
                    return ;
                end;
            end;
            local v20 = v2.trackListEntry(v9 or v3.TRACK_TYPES.CFrame);
            v20.Name = v8;
            v20.Instance = v7;
            v20.EulerAnglesOrder = v11;
            local l_AnimationData_0 = v14.AnimationData;
            if v5.isChannelAnimation(l_AnimationData_0) then
                v4.createTrackListEntryComponents(v20, v7, v10, v11);
            end;
            v13:dispatch(v6((v1.List.join(l_Tracks_0, {
                v20
            }))));
            if v12 then
                v12:report("onTrackAdded", v8, l_EditorMode_0, if not not l_AnimationData_0 and l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil);
            end;
            return ;
        end;
    end;
end;
