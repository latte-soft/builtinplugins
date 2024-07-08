local _ = {
    Enum.PoseEasingStyle.Linear, 
    Enum.PoseEasingStyle.Constant, 
    Enum.PoseEasingStyle.Cubic, 
    Enum.PoseEasingStyle.Elastic, 
    Enum.PoseEasingStyle.Bounce
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetEventEditingTick);
local v8 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v10 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetShowEvents);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetTool);
local v13 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v14 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
local v16 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v17 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.CopySelectedKeyframes);
local v18 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeleteSelectedKeyframes);
local v19 = require(l_script_FirstAncestor_0.Src.Thunks.PasteKeyframes);
local v20 = require(l_script_FirstAncestor_0.Src.Thunks.History.Redo);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.ResetSelectedKeyframes);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectAllKeyframes);
local v23 = require(l_script_FirstAncestor_0.Src.Thunks.SplitTrack);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.ToggleBoneVisibility);
local v25 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.TogglePlay);
local v26 = require(l_script_FirstAncestor_0.Src.Thunks.History.Undo);
local v27 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v28 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v29 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v30 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v31 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v32 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v33 = v2.PureComponent:extend("TimelineActions");
v33.getSharedPropertyValue = function(v34, v35)
    local l_props_0 = v34.props;
    local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
    local l_AnimationData_0 = l_props_0.AnimationData;
    local v39 = false;
    local v40 = nil;
    for v41, v42 in pairs(l_SelectedKeyframes_0) do
        local v43 = l_AnimationData_0.Instances[v41];
        for v44, v45 in pairs(v42) do
            v31.traverse(v45, v43.Tracks[v44], function(v46, v47)
                if not (not v46.Selection or not v47.Data) and not v39 then
                    for v48, _ in pairs(v46.Selection) do
                        local v50 = v47.Data[v48];
                        if v50 then
                            if v40 == nil then
                                v40 = v50[v35];
                            elseif v40 ~= v50[v35] then
                                v40 = nil;
                                v39 = true;
                                return ;
                            end;
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end);
        end;
    end;
    return v40 and v40.Value;
end;
v33.makeSelectionSubMenu = function(v51, v52, v53)
    local l_props_1 = v51.props;
    local v55 = {
        Text = l_props_1.Localization:getText("ContextMenu", v53)
    };
    local v56 = v51:getSharedPropertyValue(v53);
    local function v58(v57)
        l_props_1.OnItemSelected(v53, v57.Data);
    end;
    for _, v60 in v52, nil, nil do
        table.insert(v55, {
            Text = v60.Name, 
            Data = v60, 
            Checked = v56 == v60.Value, 
            OnItemClicked = v58
        });
    end;
    return v55;
end;
v33.makeGenerateCurveMenu = function(v61)
    local l_props_2 = v61.props;
    local l_Localization_0 = l_props_2.Localization;
    local function v67(v64)
        local function v66(v65)
            l_props_2.OnGenerateCurve(v64, v65.Data);
        end;
        return {
            Text = v64.Name; 
            {
                Text = Enum.PoseEasingDirection.In.Name, 
                Data = Enum.PoseEasingDirection.In, 
                OnItemClicked = v66
            }, 
            {
                Text = Enum.PoseEasingDirection.Out.Name, 
                Data = Enum.PoseEasingDirection.Out, 
                OnItemClicked = v66
            }, 
            {
                Text = Enum.PoseEasingDirection.InOut.Name, 
                Data = Enum.PoseEasingDirection.InOut, 
                OnItemClicked = v66
            }
        };
    end;
    return {
        Text = l_Localization_0:getText("ContextMenu", "GenerateCurve"); 
        v67(Enum.PoseEasingStyle.Bounce), 
        (v67(Enum.PoseEasingStyle.Elastic))
    };
end;
v33.multipleSelected = function(v68)
    local l_props_3 = v68.props;
    local l_AnimationData_1 = l_props_3.AnimationData;
    local l_SelectedKeyframes_1 = l_props_3.SelectedKeyframes;
    local v72, v73 = v27.getSelectionBounds(l_AnimationData_1, l_SelectedKeyframes_1);
    return l_SelectedKeyframes_1 and v72 ~= v73;
end;
v33.makeMenuActions = function(v74)
    local l_props_4 = v74.props;
    local l_SelectedKeyframes_2 = l_props_4.SelectedKeyframes;
    local l_SummaryKeyframe_0 = l_props_4.SummaryKeyframe;
    local l_PluginActions_0 = v74.props.PluginActions;
    local l_IsChannelAnimation_0 = l_props_4.IsChannelAnimation;
    local v80 = {
        l_PluginActions_0:get("AddKeyframeHere"), 
        l_PluginActions_0:get("DeleteSelected"), 
        v28.MENU_SEPARATOR, 
        l_PluginActions_0:get("CutSelected"), 
        l_PluginActions_0:get("CopySelected"), 
        l_PluginActions_0:get("PasteKeyframes"), 
        v28.MENU_SEPARATOR
    };
    if not l_SelectedKeyframes_2 or v29(l_SelectedKeyframes_2) then
        table.insert(v80, l_PluginActions_0:get("AddResetKeyframe"));
    else
        table.insert(v80, l_PluginActions_0:get("ResetSelected"));
        table.insert(v80, v28.MENU_SEPARATOR);
        table.insert(v80, l_PluginActions_0:get("ChangeDuration"));
        table.insert(v80, v28.MENU_SEPARATOR);
        if not l_IsChannelAnimation_0 then
            table.insert(v80, v74:makeSelectionSubMenu(v28.EASING_STYLE_ORDER, "EasingStyle"));
            table.insert(v80, v74:makeSelectionSubMenu(v28.EASING_DIRECTION_ORDER, "EasingDirection"));
        else
            table.insert(v80, v74:makeSelectionSubMenu(v28.KEY_INTERPOLATION_MODE_ORDER, "InterpolationMode"));
            table.insert(v80, l_PluginActions_0:get("ClearBothTangents"));
            if v74:multipleSelected() then
                table.insert(v80, v74:makeGenerateCurveMenu());
            end;
        end;
    end;
    table.insert(v80, v28.MENU_SEPARATOR);
    table.insert(v80, l_PluginActions_0:get("AddEvent"));
    if l_SummaryKeyframe_0 ~= nil then
        table.insert(v80, l_PluginActions_0:get("RenameKeyframe"));
    end;
    return v80;
end;
v33.addAction = function(v81, v82, v83)
    if v82 then
        v82.Enabled = false;
        table.insert(v81.Actions, v82);
        table.insert(v81.Connections, v82.Triggered:Connect(v83));
    end;
end;
v33.didMount = function(v84)
    local l_PluginActions_1 = v84.props.PluginActions;
    v84.Connections = {};
    v84.Actions = {};
    v84:addAction(l_PluginActions_1:get("AddKeyframeHere"), function()
        local l_props_5 = v84.props;
        local l_Tick_0 = l_props_5.Tick;
        local _ = l_props_5.TrackName;
        local l_InstanceName_0 = l_props_5.InstanceName;
        local l_Tracks_0 = l_props_5.Tracks;
        local l_TrackType_0 = l_props_5.TrackType;
        local l_RotationType_0 = l_props_5.RotationType;
        local l_Path_0 = l_props_5.Path;
        local l_AnimationData_2 = l_props_5.AnimationData;
        local l_IsChannelAnimation_1 = l_props_5.IsChannelAnimation;
        local function v102(v96, v97)
            l_TrackType_0 = l_TrackType_0 or v32.getTrackTypeFromName(v97[1], l_Tracks_0);
            l_RotationType_0 = l_RotationType_0 or v32.getRotationTypeFromName(v97[1], l_Tracks_0);
            if not l_IsChannelAnimation_1 then
                local v98 = v27.getTrack(l_AnimationData_2, v96, v97);
                local _ = nil;
                l_props_5.AddKeyframe(v96, v97, l_TrackType_0, nil, l_Tick_0, {
                    Value = if not not v98 and v98.Keyframes then v30.getValue(v98, l_Tick_0) else v30.getDefaultValue(l_TrackType_0), 
                    EasingStyle = Enum.PoseEasingStyle.Linear, 
                    EasingDirection = Enum.PoseEasingDirection.In
                }, l_props_5.Analytics);
                return ;
            else
                v32.traverseComponents(l_TrackType_0, function(v100, v101)
                    l_props_5.SplitTrack(v96, v4.List.join(v97, v101), v100, l_RotationType_0, l_Tick_0, l_props_5.Analytics);
                end, l_RotationType_0);
                return ;
            end;
        end;
        if not l_InstanceName_0 or not l_Path_0 then
            for v103, _ in pairs(l_props_5.AnimationData.Instances) do
                for _, v106 in pairs(l_Tracks_0) do
                    v102(v103, {
                        v106.Name
                    });
                end;
            end;
        else
            v102(l_InstanceName_0, l_Path_0);
        end;
    end);
    v84:addAction(l_PluginActions_1:get("AddKeyframeAtScrubber"), function()
        local l_props_6 = v84.props;
        local l_Tracks_1 = l_props_6.Tracks;
        local l_Playhead_0 = l_props_6.Playhead;
        local l_SelectedTracks_0 = l_props_6.SelectedTracks;
        local l_IsChannelAnimation_2 = l_props_6.IsChannelAnimation;
        if l_SelectedTracks_0 then
            for v112, _ in pairs(l_props_6.AnimationData.Instances) do
                for _, v115 in pairs(l_SelectedTracks_0) do
                    local v116 = v27.getTrack(l_props_6.AnimationData, v112, v115);
                    local v117 = not not v116 and v116.Type or v32.getComponentTypeFromPath(v115, l_Tracks_1);
                    if not l_IsChannelAnimation_2 then
                        local _ = nil;
                        l_props_6.AddKeyframe(v112, v115, v117, nil, l_Playhead_0, {
                            Value = if not not v116 and v116.Keyframes then v30.getValue(v116, l_Playhead_0) else v30.getDefaultValue(v117), 
                            EasingStyle = Enum.PoseEasingStyle.Linear, 
                            EasingDirection = Enum.PoseEasingDirection.In
                        }, l_props_6.Analytics);
                    else
                        local v119 = not not v116 and v32.getRotationType(v116) or l_props_6.DefaultRotationType;
                        v32.traverseComponents(v117, function(v120, v121)
                            l_props_6.SplitTrack(v112, v4.List.join(v115, v121), v120, v119, l_Playhead_0, l_props_6.Analytics);
                        end, v119);
                    end;
                end;
            end;
        end;
    end);
    v84:addAction(l_PluginActions_1:get("AddResetKeyframe"), function()
        local l_props_7 = v84.props;
        local l_Tick_1 = l_props_7.Tick;
        local l_InstanceName_1 = l_props_7.InstanceName;
        local l_Tracks_2 = l_props_7.Tracks;
        local l_Path_1 = l_props_7.Path;
        local l_IsChannelAnimation_3 = l_props_7.IsChannelAnimation;
        if not l_InstanceName_1 or not l_Path_1 then
            for v128, v129 in pairs(l_props_7.AnimationData.Instances) do
                for _, v131 in pairs(l_Tracks_2) do
                    local l_Name_0 = v131.Name;
                    local v133 = v129.Tracks[l_Name_0];
                    local v134 = nil;
                    local v135 = nil;
                    local v136 = nil;
                    do
                        local l_v134_0, l_v136_0 = v134, v136;
                        if not l_IsChannelAnimation_3 then
                            v135 = not not v133 and v133.Type or v32.getTrackTypeFromName(l_Name_0, l_Tracks_2);
                            l_props_7.AddKeyframe(v128, {
                                l_Name_0
                            }, v135, nil, l_Tick_1, {
                                Value = v30.getDefaultValue(v135), 
                                EasingStyle = Enum.PoseEasingStyle.Linear, 
                                EasingDirection = Enum.PoseEasingDirection.In
                            }, l_props_7.Analytics);
                        else
                            if not v133 then
                                v135 = v32.getTrackTypeFromName(l_Name_0, l_Tracks_2);
                                l_v136_0 = v32.getRotationTypeFromName(l_Name_0, l_Tracks_2);
                            else
                                v135 = v133.Type;
                                local v139 = v133.Components and v133.Components[v28.PROPERTY_KEYS.Rotation];
                                l_v136_0 = not not v139 and v139.Type or nil;
                            end;
                            v32.traverseComponents(v135, function(v140, v141)
                                local v142 = v4.List.join({
                                    l_Name_0
                                }, v141);
                                l_v134_0 = v30.getDefaultValue(v140);
                                l_props_7.AddKeyframe(v128, v142, v140, l_v136_0, l_Tick_1, {
                                    Value = l_v134_0, 
                                    InterpolationMode = Enum.KeyInterpolationMode.Cubic
                                }, l_props_7.Analytics);
                            end, l_v136_0);
                        end;
                    end;
                end;
            end;
            return ;
        else
            local v143 = nil;
            local l_TrackType_1 = l_props_7.TrackType;
            local l_RotationType_1 = l_props_7.RotationType;
            if not l_IsChannelAnimation_3 then
                l_props_7.AddKeyframe(l_InstanceName_1, l_Path_1, l_TrackType_1, nil, l_Tick_1, {
                    Value = v30.getDefaultValue(l_TrackType_1), 
                    EasingStyle = Enum.PoseEasingStyle.Linear, 
                    EasingDirection = Enum.PoseEasingDirection.In
                }, l_props_7.Analytics);
            else
                v32.traverseComponents(l_TrackType_1, function(v146, v147)
                    local v148 = v4.List.join(l_Path_1, v147);
                    v143 = v30.getDefaultValue(v146);
                    l_props_7.AddKeyframe(l_InstanceName_1, v148, v146, l_RotationType_1, l_Tick_1, {
                        Value = v143, 
                        InterpolationMode = Enum.KeyInterpolationMode.Cubic
                    }, l_props_7.Analytics);
                end, l_RotationType_1);
            end;
            return ;
        end;
    end);
    v84:addAction(l_PluginActions_1:get("RenameKeyframe"), function()
        local l_props_8 = v84.props;
        l_props_8.OnRenameKeyframe(l_props_8.Tick);
    end);
    v84:addAction(l_PluginActions_1:get("PasteKeyframes"), function()
        local l_props_9 = v84.props;
        l_props_9.PasteKeyframes(l_props_9.Tick or l_props_9.Playhead, l_props_9.Analytics);
    end);
    v84:addAction(l_PluginActions_1:get("CutSelected"), function()
        local l_props_10 = v84.props;
        l_props_10.CopySelectedKeyframes();
        l_props_10.DeleteSelectedKeyframes(l_props_10.Analytics);
    end);
    v84:addAction(l_PluginActions_1:get("AddEvent"), function()
        v84.props.OnEditEvents(v84.props.Tick);
    end);
    v84:addAction(l_PluginActions_1:get("ToggleTool"), function()
        local l_props_11 = v84.props;
        if l_props_11.Tool == Enum.RibbonTool.Move then
            l_props_11.SetTool(Enum.RibbonTool.Rotate);
            return ;
        else
            l_props_11.SetTool(Enum.RibbonTool.Move);
            return ;
        end;
    end);
    local function v153()
        return v84.props.TogglePlay(v84.props.Analytics);
    end;
    local function v154()
        return v84.props.DeleteSelectedKeyframes(v84.props.Analytics);
    end;
    local function v155()
        return v84.props.Undo(v84.props.Signals);
    end;
    v84:addAction(l_PluginActions_1:get("CopySelected"), v84.props.CopySelectedKeyframes);
    v84:addAction(l_PluginActions_1:get("DeleteSelected"), v154);
    v84:addAction(l_PluginActions_1:get("ResetSelected"), v84.props.ResetSelectedKeyframes);
    v84:addAction(l_PluginActions_1:get("SelectAll"), v84.props.SelectAllKeyframes);
    v84:addAction(l_PluginActions_1:get("DeselectAll"), v84.props.DeselectAllKeyframes);
    v84:addAction(l_PluginActions_1:get("ChangeDuration"), v84.props.OnChangeDuration);
    v84:addAction(l_PluginActions_1:get("Undo"), v155);
    v84:addAction(l_PluginActions_1:get("Redo"), v84.props.Redo);
    v84:addAction(l_PluginActions_1:get("TogglePlay"), v153);
    v84:addAction(l_PluginActions_1:get("ToggleBoneVis"), v84.props.ToggleBoneVisibility);
    v84:addAction(l_PluginActions_1:get("ClearBothTangents"), v84.props.OnClearTangentsSelected);
end;
v33.render = function(v156)
    local l_props_12 = v156.props;
    local l_ShowMenu_0 = l_props_12.ShowMenu;
    local l_Clipboard_0 = l_props_12.Clipboard;
    local l_ClipboardType_0 = l_props_12.ClipboardType;
    local l_SelectedKeyframes_3 = l_props_12.SelectedKeyframes;
    local l_SummaryKeyframe_1 = l_props_12.SummaryKeyframe;
    local l_MultipleSelected_0 = l_props_12.MultipleSelected;
    local l_Tool_0 = l_props_12.Tool;
    local l_Tracks_3 = l_props_12.Tracks;
    local l_IsChannelAnimation_4 = l_props_12.IsChannelAnimation;
    local l_ReadOnly_0 = l_props_12.ReadOnly;
    local l_Actions_0 = v156.Actions;
    local l_PluginActions_2 = v156.props.PluginActions;
    if not v29(l_PluginActions_2) and l_Actions_0 ~= nil then
        for _, v171 in ipairs(l_Actions_0) do
            v171.Enabled = false;
        end;
        local v172 = not not l_IsChannelAnimation_4 and v28.CLIPBOARD_TYPE.Channels or v28.CLIPBOARD_TYPE.Keyframes;
        if not (not l_Clipboard_0 or v29(l_Clipboard_0)) and l_ClipboardType_0 == v172 then
            l_PluginActions_2:get("PasteKeyframes").Enabled = not l_ReadOnly_0;
        end;
        if not l_SelectedKeyframes_3 or v29(l_SelectedKeyframes_3) then
            l_PluginActions_2:get("SelectAll").Enabled = not l_ReadOnly_0;
        else
            l_PluginActions_2:get("DeselectAll").Enabled = true;
            l_PluginActions_2:get("CutSelected").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("CopySelected").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("ResetSelected").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("DeleteSelected").Enabled = not l_ReadOnly_0;
        end;
        if not (l_props_12.OnKeyframe or v29(l_Tracks_3)) then
            l_PluginActions_2:get("AddKeyframeHere").Enabled = not l_ReadOnly_0;
            l_PluginActions_2:get("AddResetKeyframe").Enabled = not l_ReadOnly_0;
        end;
        l_PluginActions_2:get("AddKeyframeAtScrubber").Enabled = not l_ReadOnly_0;
        if l_MultipleSelected_0 then
            l_PluginActions_2:get("ChangeDuration").Enabled = not l_ReadOnly_0;
        end;
        if l_SummaryKeyframe_1 ~= nil then
            l_PluginActions_2:get("RenameKeyframe").Enabled = true;
        end;
        if l_IsChannelAnimation_4 then
            l_PluginActions_2:get("ClearBothTangents").Enabled = not l_ReadOnly_0;
        end;
        if not (l_Tool_0 ~= Enum.RibbonTool.Rotate) or l_Tool_0 == Enum.RibbonTool.Move then
            l_PluginActions_2:get("ToggleTool").Enabled = not l_ReadOnly_0;
        end;
        l_PluginActions_2:get("Undo").Enabled = not l_ReadOnly_0;
        l_PluginActions_2:get("Redo").Enabled = not l_ReadOnly_0;
        l_PluginActions_2:get("TogglePlay").Enabled = true;
        l_PluginActions_2:get("AddEvent").Enabled = true;
        l_PluginActions_2:get("ToggleBoneVis").Enabled = true;
    end;
    if not l_ShowMenu_0 or l_ReadOnly_0 then
        return nil;
    else
        return (v2.createElement(v13, {
            Actions = v156:makeMenuActions(), 
            OnMenuOpened = l_props_12.OnMenuOpened
        }));
    end;
end;
v33.willUnmount = function(v173)
    if v173.Connections then
        for _, v175 in ipairs(v173.Connections) do
            v175:Disconnect();
        end;
        v173.Connections = {};
    end;
    if v173.Actions then
        for _, v177 in ipairs(v173.Actions) do
            v177.Enabled = false;
        end;
    end;
end;
return v3.connect(function(v178, _)
    local l_Status_0 = v178.Status;
    return {
        Clipboard = l_Status_0.Clipboard, 
        ClipboardType = l_Status_0.ClipboardType, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        Playhead = l_Status_0.Playhead, 
        AnimationData = v178.AnimationData, 
        Tracks = l_Status_0.Tracks, 
        Path = l_Status_0.RightClickContextInfo.Path, 
        TrackName = l_Status_0.RightClickContextInfo.TrackName, 
        TrackType = l_Status_0.RightClickContextInfo.TrackType, 
        RotationType = l_Status_0.RightClickContextInfo.RotationType, 
        InstanceName = l_Status_0.RightClickContextInfo.InstanceName, 
        Tick = l_Status_0.RightClickContextInfo.Tick, 
        SummaryKeyframe = l_Status_0.RightClickContextInfo.SummaryKeyframe, 
        OnKeyframe = l_Status_0.RightClickContextInfo.OnKeyframe, 
        Tool = l_Status_0.Tool, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(v181)
    return {
        SelectAllKeyframes = function()
            v181(v22());
            v181(v9({}));
        end, 
        DeselectAllKeyframes = function()
            v181(v10({}));
            v181(v9({}));
        end, 
        DeleteSelectedKeyframes = function(v182)
            v181(v16());
            v181(v18(v182));
            v181(v8({}));
        end, 
        ResetSelectedKeyframes = function()
            v181(v16());
            v181(v21());
            v181(v8({}));
        end, 
        CopySelectedKeyframes = function()
            v181(v17());
            v181(v8({}));
        end, 
        PasteKeyframes = function(v183, v184)
            v181(v16());
            v181(v19(v183, v184));
            v181(v8({}));
        end, 
        SplitTrack = function(v185, v186, v187, v188, v189, v190)
            v181(v16());
            v181(v23(v185, v186, v187, v188, v189, v190));
            v181(v8({}));
        end, 
        AddKeyframe = function(v191, v192, v193, v194, v195, v196, v197)
            v181(v16());
            v181(v15(v191, v192, v193, v194, v195, v196, v197));
            v181(v8({}));
        end, 
        OnEditEvents = function(v198)
            v181(v11(true));
            v181(v7(v198));
        end, 
        Undo = function(v199)
            v181(v26(v199));
        end, 
        Redo = function()
            v181(v20());
        end, 
        TogglePlay = function(v200)
            v181(v25(v200));
        end, 
        SetTool = function(v201)
            v181(v12(v201));
        end, 
        ToggleBoneVisibility = function()
            v181(v24());
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v14
})(v33)));
