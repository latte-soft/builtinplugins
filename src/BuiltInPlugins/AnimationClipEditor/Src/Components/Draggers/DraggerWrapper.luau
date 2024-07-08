local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTrackInstances);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Draggers.AnimationClipEditorDragger);
local v9 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Implementation.DraggerContext_PluginImpl);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v11 = require(l_Thunks_0.History.AddWaypoint);
local v12 = require(l_Thunks_0.SetSelectedTrackInstances);
local v13 = require(l_Thunks_0.SortAndSetSelectedTrackInstances);
local v14 = require(l_Thunks_0.ValueChanged);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v16 = require(l_Util_0.AnimationData);
local v17 = require(l_Util_0.Constants);
local v18 = require(l_Util_0.DraggerSchema.DraggerSchema);
local _ = require(l_Util_0.RigUtils);
local v20 = require(l_Util_0.TrackUtils);
local v21 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
local v22 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v23 = v1.PureComponent:extend("DraggerWrapper");
v23.didUpdate = function(v24, v25)
    local l_props_0 = v24.props;
    if v24.selection and l_props_0.SelectedTrackInstances ~= v25.SelectedTrackInstances then
        v24.selection.selectedTrackInstances = l_props_0.SelectedTrackInstances;
        v24.props.Signals:get(v17.SIGNAL_KEYS.SelectionChanged):Fire();
    end;
end;
local function v43(v27, v28)
    v27.RootInstance = v28.RootInstance;
    v27.IKMode = v28.IKMode;
    v27.StartingPose = v28.StartingPose;
    v27.PinnedParts = v28.PinnedParts;
    v27.IKEnabled = v28.IKEnabled;
    v27.Tool = v28.Tool;
    v27.IsPlaying = v28.PlayState ~= v17.PLAY_STATE.Pause;
    v27.VisualizeBones = v28.VisualizeBones;
    v27.ScrubberSignal = v28.Signals:get(v17.SIGNAL_KEYS.ScrubberChanged);
    v27.OnManipulateJoints = function(v29, v30)
        if v28.ReadOnly or v28.PlayState ~= v17.PLAY_STATE.Pause then
            return ;
        else
            if v27.RootInstance:IsA("Model") then
                local l_Scale_0 = v27.RootInstance:GetScale();
                for v32, v33 in v30, nil, nil do
                    v30[v32] = v33.Rotation + v33.Position / l_Scale_0;
                end;
            end;
            for v34, v35 in pairs(v30) do
                local v36 = {
                    v34
                };
                if v16.isChannelAnimation(v28.AnimationData) then
                    local v37 = nil;
                    local l_DefaultEulerAnglesOrder_0 = v28.DefaultEulerAnglesOrder;
                    v37 = v20.getRotationTypeFromName(v34, v28.Tracks) or v28.DefaultRotationType;
                    if v37 == v17.TRACK_TYPES.EulerAngles then
                        l_DefaultEulerAnglesOrder_0 = v20.getEulerAnglesOrder((v16.getTrack(v28.AnimationData, "Root", v36))) or l_DefaultEulerAnglesOrder_0;
                    end;
                    do
                        local l_v37_0 = v37;
                        v20.traverseValue(v17.TRACK_TYPES.CFrame, v35, function(v40, v41, v42)
                            v28.ValueChanged(v29, v3.List.join(v36, v41), v40, l_v37_0, v28.Playhead, v42, v28.Analytics);
                        end, l_v37_0, l_DefaultEulerAnglesOrder_0);
                    end;
                else
                    v28.ValueChanged(v29, v36, v17.TRACK_TYPES.CFrame, nil, v28.Playhead, v35, v28.Analytics);
                end;
            end;
            return ;
        end;
    end;
end;
local function v48(v44)
    local v45 = v44.Plugin:get();
    local v46 = v18.Selection.new(v44.Signals:get(v17.SIGNAL_KEYS.SelectionChanged), if not v21() then v44.SetSelectedTrackInstances else v44.SortAndSetSelectedTrackInstances);
    local v47 = v9.new(v45, game, settings(), v46);
    v47.AddWaypoint = function()
        v44.AddWaypoint();
    end;
    return v46, v47;
end;
v23.render = function(v49)
    local l_props_1 = v49.props;
    local l_Tool_0 = l_props_1.Tool;
    local v52 = l_props_1.Mouse:get();
    if not v49.draggerContext then
        if l_props_1.AnimationData ~= nil then
            local v53, v54 = v48(l_props_1);
            v49.selection = v53;
            v49.draggerContext = v54;
        else
            return ;
        end;
    end;
    if l_props_1.AnimationData ~= nil then
        v43(v49.draggerContext, l_props_1);
    end;
    return v1.createElement(v8, {
        Context = v49.draggerContext, 
        Tool = l_Tool_0, 
        Mouse = v52
    });
end;
return v2.connect(function(v55, _)
    local l_Status_0 = v55.Status;
    return {
        Tool = v55.Status.Tool, 
        SelectedTrackInstances = v55.Status.SelectedTrackInstances, 
        RootInstance = v55.Status.RootInstance, 
        IKMode = v55.Status.IKMode, 
        StartingPose = v55.Status.StartingPose, 
        PinnedParts = v55.Status.PinnedParts, 
        IKEnabled = v55.Status.IKEnabled, 
        Playhead = v55.Status.Playhead, 
        Tracks = v55.Status.Tracks, 
        PlayState = l_Status_0.PlayState, 
        AnimationData = v55.AnimationData, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        VisualizeBones = v55.Status.VisualizeBones, 
        ReadOnly = v55.Status.ReadOnly
    };
end, function(v58)
    return {
        SetSelectedTrackInstances = if v21() then nil else function(v59)
            if not v22() then
                v58(v7(v59));
                return ;
            else
                v58(v12(v59));
                return ;
            end;
        end, 
        SortAndSetSelectedTrackInstances = function(v60)
            v58(v13(v60));
        end, 
        ValueChanged = function(v61, v62, v63, v64, v65, v66, v67)
            v58(v14(v61, v62, v63, v64, v65, v66, v67));
        end, 
        AddWaypoint = function()
            v58(v11());
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Signals = v6, 
    Mouse = l_ContextServices_0.Mouse, 
    Analytics = l_ContextServices_0.Analytics
})(v23)));
