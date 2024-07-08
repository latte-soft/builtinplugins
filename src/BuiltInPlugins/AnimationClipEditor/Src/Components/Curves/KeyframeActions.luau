local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v10 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.SplitTrack);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.PasteKeyframes);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.CopySelectedKeyframes);
local v16 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeleteSelectedKeyframes);
local v17 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.ResetSelectedKeyframes);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v19 = require(l_script_FirstAncestor_0.Src.Thunks.ToggleBoneVisibility);
local v20 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectAllKeyframes);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetEventEditingTick);
local v22 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v23 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v24 = require(l_script_FirstAncestor_0.Src.Actions.SetShowEvents);
local v25 = require(l_script_FirstAncestor_0.Src.Actions.SetTool);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v28 = require(l_script_FirstAncestor_0.Src.Thunks.History.Undo);
local v29 = require(l_script_FirstAncestor_0.Src.Thunks.History.Redo);
local v30 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.TogglePlay);
local v31 = v1.PureComponent:extend("KeyframeActions");
v31.getSharedPropertyValue = function(v32, v33)
    local l_props_0 = v32.props;
    local l_SelectedKeyframes_0 = l_props_0.SelectedKeyframes;
    local l_AnimationData_0 = l_props_0.AnimationData;
    local v37 = false;
    local v38 = nil;
    for v39, v40 in pairs(l_SelectedKeyframes_0) do
        local v41 = l_AnimationData_0.Instances[v39];
        for v42, v43 in pairs(v40) do
            v8.traverse(v43, v41.Tracks[v42], function(v44, v45)
                if not (not v44.Selection or not v45.Data) and not v37 then
                    for v46, _ in pairs(v44.Selection) do
                        local v48 = v45.Data[v46];
                        if v48 then
                            if v38 == nil then
                                v38 = v48[v33];
                            elseif v38 ~= v48[v33] then
                                v38 = nil;
                                v37 = true;
                                return ;
                            end;
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end, nil, nil);
        end;
    end;
    return if not v38 then nil else v38.Value;
end;
v31.makeInterpolationModeMenu = function(v49)
    local l_props_1 = v49.props;
    local v51 = {
        Text = l_props_1.Localization:getText("ContextMenu", "InterpolationMode")
    };
    local v52 = v49:getSharedPropertyValue("InterpolationMode");
    local function v54(v53)
        l_props_1.OnInterpolationSelected(v53.Data);
    end;
    for _, v56 in v5.KEY_INTERPOLATION_MODE_ORDER, nil, nil do
        table.insert(v51, {
            Text = v56.Name, 
            Data = v56, 
            Checked = v52 == v56.Value, 
            OnItemClicked = v54
        });
    end;
    return v51;
end;
v31.makeGenerateCurveMenu = function(v57)
    local l_props_2 = v57.props;
    local l_Localization_0 = l_props_2.Localization;
    local function v63(v60)
        local function v62(v61)
            l_props_2.OnGenerateCurve(v60, v61.Data);
        end;
        return {
            Text = v60.Name; 
            {
                Text = Enum.PoseEasingDirection.In.Name, 
                Data = Enum.PoseEasingDirection.In, 
                OnItemClicked = v62
            }, 
            {
                Text = Enum.PoseEasingDirection.Out.Name, 
                Data = Enum.PoseEasingDirection.Out, 
                OnItemClicked = v62
            }, 
            {
                Text = Enum.PoseEasingDirection.InOut.Name, 
                Data = Enum.PoseEasingDirection.InOut, 
                OnItemClicked = v62
            }
        };
    end;
    return {
        Text = l_Localization_0:getText("ContextMenu", "GenerateCurve"); 
        v63(Enum.PoseEasingStyle.Bounce), 
        (v63(Enum.PoseEasingStyle.Elastic))
    };
end;
v31.multipleSelected = function(v64)
    local l_props_3 = v64.props;
    local l_AnimationData_1 = l_props_3.AnimationData;
    local l_SelectedKeyframes_1 = l_props_3.SelectedKeyframes;
    local v68, v69 = v9.getSelectionBounds(l_AnimationData_1, l_SelectedKeyframes_1);
    return l_SelectedKeyframes_1 and v68 ~= v69;
end;
v31.makeMenuActions = function(v70)
    local l_SelectedKeyframes_2 = v70.props.SelectedKeyframes;
    local l_PluginActions_0 = v70.props.PluginActions;
    local v73 = {
        l_PluginActions_0:get("DeleteSelected"), 
        v5.MENU_SEPARATOR, 
        l_PluginActions_0:get("CutSelected"), 
        l_PluginActions_0:get("CopySelected"), 
        l_PluginActions_0:get("PasteKeyframes")
    };
    if not (not l_SelectedKeyframes_2 or v4(l_SelectedKeyframes_2)) then
        table.insert(v73, v5.MENU_SEPARATOR);
        table.insert(v73, l_PluginActions_0:get("ResetSelected"));
        table.insert(v73, v5.MENU_SEPARATOR);
        table.insert(v73, l_PluginActions_0:get("ChangeDuration"));
        table.insert(v73, v5.MENU_SEPARATOR);
        table.insert(v73, v70:makeInterpolationModeMenu());
        table.insert(v73, l_PluginActions_0:get("ClearBothTangents"));
        if v70:multipleSelected() then
            table.insert(v73, v70:makeGenerateCurveMenu());
        end;
    end;
    table.insert(v73, v5.MENU_SEPARATOR);
    table.insert(v73, l_PluginActions_0:get("AddEvent"));
    return v73;
end;
v31.addAction = function(v74, v75, v76)
    if v75 then
        v75.Enabled = false;
        table.insert(v74.Actions, v75);
        table.insert(v74.Connections, v75.Triggered:Connect(v76));
    end;
end;
v31.didMount = function(v77)
    local l_PluginActions_1 = v77.props.PluginActions;
    v77.Connections = {};
    v77.Actions = {};
    v77:addAction(l_PluginActions_1:get("AddKeyframeAtScrubber"), function()
        local l_props_4 = v77.props;
        local l_Tracks_0 = l_props_4.Tracks;
        local l_Playhead_0 = l_props_4.Playhead;
        local l_SelectedTracks_0 = l_props_4.SelectedTracks;
        if l_SelectedTracks_0 then
            for v83, _ in pairs(l_props_4.AnimationData.Instances) do
                for _, v86 in pairs(l_SelectedTracks_0) do
                    local v87 = v9.getTrack(l_props_4.AnimationData, v83, v86);
                    local v88 = not not v87 and v87.Type or v10.getComponentTypeFromPath(v86, l_Tracks_0);
                    local v89 = not not v87 and v10.getRotationType(v87) or l_props_4.DefaultRotationType;
                    v10.traverseComponents(v88, function(v90, v91)
                        l_props_4.SplitTrack(v83, v3.List.join(v86, v91), v90, v89, l_Playhead_0, l_props_4.Analytics);
                    end, v89);
                end;
            end;
        end;
    end);
    v77:addAction(l_PluginActions_1:get("PasteKeyframes"), function()
        local l_props_5 = v77.props;
        l_props_5.PasteKeyframes(l_props_5.Tick or l_props_5.Playhead, l_props_5.Analytics);
    end);
    v77:addAction(l_PluginActions_1:get("CutSelected"), function()
        local l_props_6 = v77.props;
        l_props_6.CopySelectedKeyframes();
        l_props_6.DeleteSelectedKeyframes(l_props_6.Analytics);
    end);
    v77:addAction(l_PluginActions_1:get("ToggleTool"), function()
        local l_props_7 = v77.props;
        if l_props_7.Tool == Enum.RibbonTool.Move then
            l_props_7.SetTool(Enum.RibbonTool.Rotate);
            return ;
        else
            l_props_7.SetTool(Enum.RibbonTool.Move);
            return ;
        end;
    end);
    local function v95()
        return v77.props.TogglePlay(v77.props.Analytics);
    end;
    local function v96()
        return v77.props.DeleteSelectedKeyframes(v77.props.Analytics);
    end;
    local function v97()
        return v77.props.Undo(v77.props.Signals);
    end;
    v77:addAction(l_PluginActions_1:get("AddEvent"), function()
        v77.props.OnEditEvents(v77.props.Tick);
    end);
    v77:addAction(l_PluginActions_1:get("CopySelected"), v77.props.CopySelectedKeyframes);
    v77:addAction(l_PluginActions_1:get("DeleteSelected"), v96);
    v77:addAction(l_PluginActions_1:get("ResetSelected"), v77.props.ResetSelectedKeyframes);
    v77:addAction(l_PluginActions_1:get("SelectAll"), v77.props.SelectAllKeyframes);
    v77:addAction(l_PluginActions_1:get("DeselectAll"), v77.props.DeselectAllKeyframes);
    v77:addAction(l_PluginActions_1:get("ChangeDuration"), v77.props.OnChangeDuration);
    v77:addAction(l_PluginActions_1:get("Undo"), v97);
    v77:addAction(l_PluginActions_1:get("Redo"), v77.props.Redo);
    v77:addAction(l_PluginActions_1:get("TogglePlay"), v95);
    v77:addAction(l_PluginActions_1:get("ToggleBoneVis"), v77.props.ToggleBoneVisibility);
    v77:addAction(l_PluginActions_1:get("ClearBothTangents"), v77.props.OnClearTangentsSelected);
end;
v31.render = function(v98)
    local l_props_8 = v98.props;
    local l_ShowMenu_0 = l_props_8.ShowMenu;
    local l_Clipboard_0 = l_props_8.Clipboard;
    local l_ClipboardType_0 = l_props_8.ClipboardType;
    local l_SelectedKeyframes_3 = l_props_8.SelectedKeyframes;
    local l_MultipleSelected_0 = l_props_8.MultipleSelected;
    local l_Tool_0 = l_props_8.Tool;
    local l_Actions_0 = v98.Actions;
    local l_PluginActions_2 = v98.props.PluginActions;
    if not v4(l_PluginActions_2) and l_Actions_0 ~= nil then
        for _, v109 in ipairs(l_Actions_0) do
            v109.Enabled = false;
        end;
        local l_Channels_0 = v5.CLIPBOARD_TYPE.Channels;
        if not (not l_Clipboard_0 or v4(l_Clipboard_0)) and l_ClipboardType_0 == l_Channels_0 then
            l_PluginActions_2:get("PasteKeyframes").Enabled = true;
        end;
        if not l_SelectedKeyframes_3 or v4(l_SelectedKeyframes_3) then
            l_PluginActions_2:get("SelectAll").Enabled = true;
        else
            l_PluginActions_2:get("DeselectAll").Enabled = true;
            l_PluginActions_2:get("CutSelected").Enabled = true;
            l_PluginActions_2:get("CopySelected").Enabled = true;
            l_PluginActions_2:get("ResetSelected").Enabled = true;
            l_PluginActions_2:get("DeleteSelected").Enabled = true;
        end;
        l_PluginActions_2:get("AddKeyframeAtScrubber").Enabled = true;
        if l_MultipleSelected_0 then
            l_PluginActions_2:get("ChangeDuration").Enabled = true;
        end;
        l_PluginActions_2:get("ClearBothTangents").Enabled = true;
        if not (l_Tool_0 ~= Enum.RibbonTool.Rotate) or l_Tool_0 == Enum.RibbonTool.Move then
            l_PluginActions_2:get("ToggleTool").Enabled = true;
        end;
        l_PluginActions_2:get("Undo").Enabled = true;
        l_PluginActions_2:get("Redo").Enabled = true;
        l_PluginActions_2:get("TogglePlay").Enabled = true;
        l_PluginActions_2:get("AddEvent").Enabled = true;
        l_PluginActions_2:get("ToggleBoneVis").Enabled = true;
    end;
    local _ = v98.props.Localization;
    return not not l_ShowMenu_0 and v1.createElement(v7, {
        Actions = v98:makeMenuActions(), 
        OnMenuOpened = l_props_8.OnMenuOpened
    }) or nil;
end;
v31.willUnmount = function(v112)
    if v112.Connections then
        for _, v114 in ipairs(v112.Connections) do
            v114:Disconnect();
        end;
        v112.Connections = {};
    end;
    if v112.Actions then
        for _, v116 in ipairs(v112.Actions) do
            v116.Enabled = false;
        end;
    end;
end;
return v2.connect(function(v117)
    local l_Status_0 = v117.Status;
    return {
        AnimationData = v117.AnimationData, 
        Clipboard = l_Status_0.Clipboard, 
        ClipboardType = l_Status_0.ClipboardType, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        Playhead = l_Status_0.Playhead, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        Tick = l_Status_0.RightClickContextInfo.Tick, 
        Tool = l_Status_0.Tool, 
        Tracks = l_Status_0.Tracks
    };
end, function(v119)
    return {
        CopySelectedKeyframes = function()
            v119(v15());
            v119(v18({}));
        end, 
        DeleteSelectedKeyframes = function(v120)
            v119(v11());
            v119(v16(v120));
            v119(v18({}));
        end, 
        DeselectAllKeyframes = function()
            v119(v22({}));
            v119(v23({}));
        end, 
        OnEditEvents = function(v121)
            v119(v24(true));
            v119(v21(v121));
        end, 
        PasteKeyframes = function(v122, v123)
            v119(v11());
            v119(v14(v122, v123));
            v119(v18({}));
        end, 
        Redo = function()
            v119(v29());
        end, 
        ResetSelectedKeyframes = function()
            v119(v11());
            v119(v17());
            v119(v18({}));
        end, 
        SelectAllKeyframes = function()
            v119(v20());
            v119(v23({}));
        end, 
        SetTool = function(v124)
            v119(v25(v124));
        end, 
        SplitTrack = function(v125, v126, v127, v128, v129, v130)
            v119(v11());
            v119(v13(v125, v126, v127, v128, v129, v130));
            v119(v18({}));
        end, 
        ToggleBoneVisibility = function()
            v119(v19());
        end, 
        TogglePlay = function(v131)
            v119(v30(v131));
        end, 
        Undo = function(v132)
            v119(v28(v132));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Signals = v6
})(v31)));
