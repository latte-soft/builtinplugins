local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetRootInstance);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetActive);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Util.RigValidation);
local v13 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
local v14 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
return function(v15)
    return function(v16)
        local v17 = v16:getState();
        v16:dispatch(v10(true));
        local l_RootInstance_0 = v17.Status.RootInstance;
        local l_AnimationData_0 = v17.AnimationData;
        local l_Playhead_0 = v17.Status.Playhead;
        local l_VisualizeBones_0 = v17.Status.VisualizeBones;
        if l_ChangeHistoryService_0:GetCanUndo() then
            l_ChangeHistoryService_0:SetEnabled(false);
        end;
        l_StudioService_0:CopyToClipboard("");
        if (l_RootInstance_0 ~= nil and l_RootInstance_0:FindFirstAncestorOfClass("Workspace") ~= nil) and (not l_RootInstance_0 or not v12.rigHasErrors(l_RootInstance_0)) then
            if l_AnimationData_0 then
                v16:dispatch(v9({}));
                for v22, v23 in pairs(l_AnimationData_0.Instances) do
                    for v24, v25 in pairs(v23.Tracks) do
                        v16:dispatch(v8(v22, v24, v25.Type, v14.getRotationType(v25), v14.getEulerAnglesOrder(v25), v15));
                    end;
                end;
            end;
            v13.clearMicrobones();
            if not (not l_RootInstance_0 or l_AnimationData_0) then
                v13.updateMicrobones(l_RootInstance_0, l_VisualizeBones_0);
            end;
            v16:dispatch(v4(l_Playhead_0));
            return ;
        else
            v16:dispatch(v5(v3.None));
            v16:dispatch(v9({}));
            v16:dispatch(v7({}));
            v16:dispatch(v6(nil));
            return ;
        end;
    end;
end;
