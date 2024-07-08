local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetFuture);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetPast);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v10)
    return function(v11)
        local v12 = v11:getState();
        local l_AnimationData_0 = v12.AnimationData;
        if not (not l_AnimationData_0 or not l_AnimationData_0.Metadata) and not l_AnimationData_0.Metadata.IsChannelAnimation then
            local l_DefaultRotationType_0 = v12.Status.DefaultRotationType;
            local l_DefaultEulerAnglesOrder_0 = v12.Status.DefaultEulerAnglesOrder;
            v11:dispatch(v5({}));
            v11:dispatch(v4({}));
            v11:dispatch(v6({}));
            local v16 = v2(l_AnimationData_0);
            local v17, v18 = v1.promoteToChannels(v16, l_DefaultRotationType_0, l_DefaultEulerAnglesOrder_0);
            local l_Tracks_0 = v12.Status.Tracks;
            for _, v21 in ipairs(l_Tracks_0) do
                v3.createTrackListEntryComponents(v21, v21.Instance, l_DefaultRotationType_0, l_DefaultEulerAnglesOrder_0);
                v21.EulerAnglesOrder = nil;
            end;
            v11:dispatch(v7(l_Tracks_0));
            v11:dispatch(v8(v16));
            v10:report("onPromoteAnimation", l_AnimationData_0.Metadata.Name, v17, v18, if not l_AnimationData_0.Metadata then nil else l_AnimationData_0.Metadata.Guid);
            return ;
        else
            return ;
        end;
    end;
end;
