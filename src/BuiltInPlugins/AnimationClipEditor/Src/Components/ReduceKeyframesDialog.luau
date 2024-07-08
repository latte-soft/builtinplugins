local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetReadOnly);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v11 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v14 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v15 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v18 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v19 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v20 = require(l_script_FirstAncestor_0.Src.Util.KeyframeReduction.VisvalingamWhyatt);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v29 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v30 = v3.PureComponent:extend("ReduceKeyframesDialog");
v30.init = function(v31)
    v31.didApply = false;
    v31.animationBackup = nil;
    v31.timestamps = nil;
    v31.lastIndexToDelete = nil;
    v31.onClose = function(v32)
        local l_props_0 = v31.props;
        local v34 = #l_props_0.Tracks;
        local v35 = v11.isChannelAnimation(v31.props.AnimationData);
        local v36 = v31.state.hasMoved or false;
        v31.keepChanges = v32;
        if not v32 then
            l_props_0.Analytics:report("onKeyframeReductionCancel", v34, v35, v36, if not not v31.props.AnimationData and v31.props.AnimationData.Metadata then v31.props.AnimationData.Metadata.Guid else nil);
        else
            l_props_0.Analytics:report("onKeyframeReductionApply", v34, v35, not v31.state.ticks and 0 or #v31.state.ticks, v31.state.keyframes, v36, if not not v31.props.AnimationData and v31.props.AnimationData.Metadata then v31.props.AnimationData.Metadata.Guid else nil);
            l_props_0.AddWaypoint(v31.animationBackup);
        end;
        v31.props.OnClose();
    end;
    v31.onSliderChanged = function(v37)
        v37 = math.round(v37);
        v31:previewVisvalingamWhyatt(v37, v31.state.keyframes);
        v31:setState({
            keyframes = v37, 
            hasMoved = v37 ~= v31.state.initialKeyframes and true or nil
        });
    end;
end;
local function v50(v38)
    local v39 = v18.getRigInfo(v38);
    local l_PartNameToMotor_0 = v39.PartNameToMotor;
    local l_PartNameToAnimConstraint_0 = v39.PartNameToAnimConstraint;
    local l_BoneNameToBone_0 = v39.BoneNameToBone;
    local v43 = {};
    for v44, v45 in pairs(l_PartNameToMotor_0) do
        v43[v44] = v45.Part0.Name;
    end;
    for v46, v47 in pairs(l_BoneNameToBone_0) do
        v43[v46] = v47.Parent.Name;
    end;
    if v29() then
        for v48, v49 in pairs(l_PartNameToAnimConstraint_0) do
            v43[v48] = v49.Attachment0.Parent.Name;
        end;
    end;
    return v43;
end;
local function v51(v52, v53, v54, v55, v56)
    if not v53[v55] then
        local v57 = v52[v55];
        v53[v55] = if not v57 then CFrame.new() else v15.getValue(v57, v56):Orthonormalize().Rotation;
        if v54[v55] then
            v53[v55] = v51(v52, v53, v54, v54[v55], v56) * v53[v55];
        end;
    end;
    return v53[v55];
end;
local function v73(v58, v59)
    local _, _, _, v63, _, _, _, v67, _, _, _, v71 = (if not v59 then v58 else v58 * v59:Inverse()):GetComponents();
    local v72 = (v63 + v67) + v71;
    if v72 >= 3 then
        return 1.5707963267948966;
    elseif v72 <= -1 then
        return -1.5707963267948966;
    else
        return (math.acos((v72 - 1) / 2));
    end;
end;
v30.calculateVisvalingamWhyatt = function(v74)
    local l_sourceData_0 = v74.sourceData;
    local l_RootInstance_0 = v74.props.RootInstance;
    local l_Tracks_0 = l_sourceData_0.Instances.Root.Tracks;
    local l_Name_0 = v18.findRootPart(l_RootInstance_0).Name;
    local v79 = l_Tracks_0[l_Name_0];
    local v80 = v19.getSummaryKeyframes(l_Tracks_0, l_sourceData_0.Metadata.StartTick, l_sourceData_0.Metadata.EndTick);
    table.sort(v80);
    local v81 = v50(l_RootInstance_0);
    local v82 = v1.Dictionary.keys(l_Tracks_0);
    local v83 = table.create(#v80);
    for v84, v85 in ipairs(v80) do
        local v86 = table.create(#v82 + 4);
        table.insert(v86, v85);
        if v79 then
            local l_Position_0 = v15.getValue(v79, v85).Position;
            table.insert(v86, l_Position_0.X);
            table.insert(v86, l_Position_0.Y);
            table.insert(v86, l_Position_0.Z);
        end;
        local v88 = {};
        for _, v90 in ipairs(v82) do
            local v91 = l_Tracks_0[v90];
            if v91.Type == v12.TRACK_TYPES.CFrame then
                v51(l_Tracks_0, v88, v81, v90, v85);
                table.insert(v86, (v73(v88[v90], v88[l_Name_0])));
            elseif v91.Type == v12.TRACK_TYPES.Facs then
                table.insert(v86, (v15.getValue(v91, v85)));
            end;
        end;
        v83[v84] = v86;
    end;
    return v20(v83);
end;
v30.previewVisvalingamWhyatt = function(v92, v93, v94)
    if v93 == v94 then
        return ;
    else
        local v95 = v1.Dictionary.join(v92.workData, {});
        local l_ticks_0 = v92.state.ticks;
        if l_ticks_0 then
            for v97, v98 in v95.Instances, nil, nil do
                for v99, v100 in v98.Tracks, nil, nil do
                    v19.traverseTracks(v99, v100, function(v101, _, v103)
                        local v104 = v11.getTrack(v92.sourceData, v97, v103);
                        if not (not v104 or not v104.Data) then
                            local v105 = table.create(v93);
                            local v106 = table.create(v93);
                            for v107 = 1, v93 do
                                local v108 = l_ticks_0[v107];
                                v106[v108] = v104.Data[v108];
                                if v106[v108] then
                                    table.insert(v105, v108);
                                end;
                            end;
                            table.sort(v105);
                            v101.Keyframes = v105;
                            v101.Data = v106;
                        end;
                    end, true);
                end;
            end;
            v92.props.SetAnimationData(v95);
            v92.props.StepAnimation(v92.props.Playhead);
        end;
        return ;
    end;
end;
v30.didMount = function(v109)
    local l_props_1 = v109.props;
    if l_props_1.Tracks ~= nil and not v14(l_props_1.Tracks) then
        l_props_1.SetReadOnly(true);
        l_props_1.SetSelectedKeyframes({});
        v109.animationBackup = v13(l_props_1.AnimationData);
        v109.sourceData = v13(l_props_1.AnimationData);
        if v11.clearTrackSequences(v109.sourceData) then
            v109.props.SetAnimationData(v109.sourceData);
            v109.props.StepAnimation(v109.props.Playhead);
        end;
        for _, v112 in v109.sourceData.Instances, nil, nil do
            for v113, v114 in v112.Tracks, nil, nil do
                v19.traverseTracks(v113, v114, function(v115)
                    for _, v117 in v115.Data, nil, nil do
                        v117.LeftTangent = nil;
                        v117.RightTangent = nil;
                    end;
                end, true);
            end;
        end;
        v109.workData = v13(v109.sourceData);
        local v118 = v109:calculateVisvalingamWhyatt();
        v109:setState({
            initialKeyframes = #v118, 
            keyframes = #v118, 
            ticks = v118, 
            hasMoved = false
        });
        return ;
    else
        v109.onClose(false);
        return ;
    end;
end;
v30.willUnmount = function(v119)
    if not v119.keepChanges then
        v119.props.UpdateAnimationData(v119.animationBackup);
    end;
    v119.keepChanges = false;
    v119.animationBackup = nil;
    v119.sourceData = nil;
    v119.workData = nil;
    v119.props.SetReadOnly(false);
end;
v30.render = function(v120)
    local l_Stylizer_0 = v120.props.Stylizer;
    local l_Localization_0 = v120.props.Localization;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local l_keyframes_0 = v120.state.keyframes;
    local l_ticks_1 = v120.state.ticks;
    local v126 = not l_ticks_1 and 3 or math.max(#l_ticks_1, 3);
    local v127 = not l_keyframes_0 and 2 or math.max(l_keyframes_0, 2);
    local v128 = l_ticks_1 and #l_ticks_1 > 2;
    local v129 = l_Localization_0:getText("OptimizeKeyframes", "Keyframes");
    if l_ticks_1 then
        v129 = v129 .. string.format(" %d / %d", l_keyframes_0, #l_ticks_1);
    end;
    return v3.createElement(l_StyledDialog_0, {
        MinContentSize = Vector2.new(400, 100), 
        Size = Vector2.new(400, 100), 
        TextSize = l_dialogTheme_0.textSize, 
        Resizable = false, 
        Buttons = {
            {
                Key = false, 
                Text = l_Localization_0:getText("Dialog", "Cancel"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = l_Localization_0:getText("Dialog", "Ok"), 
                Style = "RoundPrimary"
            }
        }, 
        OnButtonPressed = v120.onClose, 
        OnClose = v120.onClose, 
        Title = l_Localization_0:getText("Title", "OptimizeKeyframes")
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        KeyframePane = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Padding = 10, 
            Spacing = 15, 
            LayoutOrder = 1
        }, {
            KeyframesText = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v129, 
                TextColor3 = l_Stylizer_0.TextColor, 
                BackgroundTransparency = 1, 
                TextWrapped = true
            })
        }), 
        Slider = v3.createElement(l_Slider_0, {
            Size = UDim2.new(1, 0, 0, 30), 
            Min = 2, 
            Max = v126, 
            Value = v127, 
            Disabled = not v128, 
            OnValueChanged = v120.onSliderChanged, 
            LayoutOrder = 2
        })
    });
end;
return v4.connect(function(v130)
    return {
        AnimationData = v130.AnimationData, 
        Tracks = v130.Status.Tracks, 
        Playhead = v130.Status.Playhead, 
        RootInstance = v130.Status.RootInstance
    };
end, function(v131)
    return {
        AddWaypoint = function(v132)
            v131(v8(v132));
        end, 
        SetAnimationData = function(v133)
            v131(v5(v133));
        end, 
        SetReadOnly = function(v134)
            v131(v6(v134));
        end, 
        SetSelectedKeyframes = function(v135)
            v131(v7(v135));
        end, 
        StepAnimation = function(v136)
            v131(v9(v136));
        end, 
        UpdateAnimationData = function(v137)
            v131(v10(v137));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v30)));
