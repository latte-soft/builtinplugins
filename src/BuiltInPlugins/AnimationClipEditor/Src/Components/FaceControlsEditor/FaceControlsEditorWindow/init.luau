local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v4.UI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v10 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v11 = v2.PureComponent:extend("FaceControlsEditorWindow");
local v12 = Vector2.new(v8.faceControlsEditorOriginalWidth, 310);
local v13 = Vector2.new(185, 110);
local l_Slider_0 = v4.UI.Slider;
local l_DragBox_0 = v4.UI.DragBox;
local l_Checkbox_0 = v4.UI.Checkbox;
local l_Pane_0 = v4.UI.Pane;
local l_Button_0 = v4.UI.Button;
local v19 = require(l_script_FirstAncestor_0.Src.Thunks.ValueChanged);
local v20 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetSymmetryEnabled);
local v22 = require(l_script_FirstAncestor_0.Src.Actions.SetAutoFocusFaceEnabled);
local v23 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v24 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local v25 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_FaceControlsMapping_0 = require(script:WaitForChild("FaceControlsMapping"));
local l_StyleModifier_0 = v4.Util.StyleModifier;
local v28 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
v11.init = function(v29)
    v29.state = {
        Tooltip = nil, 
        treeArray = {}, 
        showContextMenu = false, 
        currentlyEditedFacsProperties = {}, 
        scaleFactor = 1
    };
    v29.onAbsoluteSizeChange = function(v30)
        local l_X_0 = v30.AbsoluteSize.X;
        local l_Y_0 = v30.AbsoluteSize.Y;
        v29:setState({
            panelWidth = l_X_0, 
            panelHeight = l_Y_0, 
            scaleFactor = math.min(math.clamp(l_X_0 / v8.faceControlsEditorOriginalWidth, 0.05, 1.65), (l_Y_0 - (v8.faceControlsEditorTogglesContainerHeight + v8.faceControlsEditorDiagramPadding * 2)) / ((v8.faceControlsEditorDiagramPadding + (v8.faceControlsEditorFaceFrontDiagramHeight + v8.faceControlsEditorFaceSideDiagramHeight)) + v8.faceControlsEditoSpacingBetweenDiagrams))
        });
    end;
    v29.showContextMenu = function()
        v29:setState({
            showContextMenu = true
        });
    end;
    v29.hideContextMenu = function()
        v29:setState({
            showContextMenu = false
        });
    end;
    v29.setValues = function(v33, v34)
        v29:setState({
            currentMax = v34, 
            currentMin = v33
        });
    end;
    v29.hideFaceControlsEditor = function()
        local l_props_0 = v29.props;
        if l_props_0.ShowFaceControlsEditorPanel then
            l_props_0.SetShowFaceControlsEditorPanel(false);
        end;
        if l_props_0.FaceControlsEditorEnabled then
            l_props_0.SetFaceControlsEditorEnabled(false);
        end;
    end;
    v29.onDockWidgetLoaded = function(v36)
        if v36:IsA("PluginGui") then
            v36:BindToClose(v29.hideFaceControlsEditor);
        end;
    end;
    v29.onTreeUpdated = function(v37)
        v29:setState({
            treeArray = v37
        });
    end;
    v29.changeSelectedTrack = function(v38)
        local l_state_0 = v29.state;
        local l_props_1 = v29.props;
        local l_treeArray_0 = l_state_0.treeArray;
        local l_SelectedTrack_0 = l_props_1.SelectedTrack;
        local l_SetSelectedTracks_0 = l_props_1.SetSelectedTracks;
        local v44 = 0;
        for v45, v46 in ipairs(l_treeArray_0) do
            if l_SelectedTrack_0 and l_SelectedTrack_0[1] == v46 then
                v44 = v45;
                break;
            end;
        end;
        l_SetSelectedTracks_0({
            {
                l_treeArray_0[math.clamp(v44 + v38, 1, #l_treeArray_0)]
            }
        });
    end;
end;
v11.addAction = function(v47, v48, v49)
    if v48 then
        v48.Enabled = false;
        table.insert(v47.Actions, v48);
        table.insert(v47.Connections, v48.Triggered:Connect(v49));
    end;
end;
v11.didMount = function(v50)
    local l_PluginActions_0 = v50.props.PluginActions;
    v50.Connections = {};
    v50.Actions = {};
    v50:addAction(l_PluginActions_0:get("FocusCamera"), function()
        if not v28() then
            focusFace(v50.props);
            return ;
        else
            v9.focusCameraOnFace(v50.props.RootInstance);
            return ;
        end;
    end);
end;
v11.willUnmount = function(v52)
    if v52.Connections then
        for _, v54 in ipairs(v52.Connections) do
            v54:Disconnect();
        end;
        v52.Connections = {};
    end;
    if v52.Actions then
        for _, v56 in ipairs(v52.Actions) do
            v56.Enabled = false;
        end;
    end;
    v52.hideFaceControlsEditor();
end;
getFacsListData = function()
    local v57 = {};
    for v58, _ in pairs(v8.FacsControlToRegionMap) do
        v57[v58] = {
            Name = v58, 
            Instance = "Root", 
            Type = v8.TRACK_TYPES.Facs
        };
    end;
    v57 = v25.Dictionary.values(v57);
    table.sort(v57, function(v60, v61)
        return v60.Name < v61.Name;
    end);
    return v57;
end;
formatNumber = function(v62)
    local l_NUMBER_PRECISION_0 = v8.NUMBER_PRECISION;
    return (tostring(math.floor(0.5 + v62 * l_NUMBER_PRECISION_0) / l_NUMBER_PRECISION_0));
end;
prepAndTriggerSliderContextMenu = function(v64, v65, v66, v67, v68, v69)
    local v70 = {
        v65.Name
    };
    if v69 then
        table.insert(v70, v69[1]);
        table.insert(v70, v69[2]);
        if v66.SymmetryEnabled then
            local l_symmetryPartner_0 = v8.FacsCrossMappings[v69[1]].symmetryPartner;
            if l_symmetryPartner_0 then
                table.insert(v70, l_symmetryPartner_0);
            end;
            l_symmetryPartner_0 = v8.FacsCrossMappings[v69[2]].symmetryPartner;
            if l_symmetryPartner_0 then
                table.insert(v70, l_symmetryPartner_0);
            end;
        end;
    end;
    if v66.SymmetryEnabled then
        v68 = v67.symmetryPartner;
        if v68 then
            table.insert(v70, v68);
        end;
    end;
    v64.state.currentlyEditedFacsProperties = v70;
    v64.state.showContextMenu = true;
    v64:showContextMenu();
end;
getSliderTooltipText = function(v72, v73)
    local l_Name_0 = v72.Name;
    local l_sliderGroup_0 = v8.FacsCrossMappings[v72.Name].sliderGroup;
    local v76 = formatNumber(v73.currentValue);
    if l_sliderGroup_0 then
        if v73.Tooltip and v73.currentValue == v73.defaultValue then
            l_Name_0 = v73.Tooltip;
            v76 = 0;
        elseif v73.currentValue < 0.5 then
            l_Name_0 = l_sliderGroup_0[1];
            v76 = formatNumber((math.clamp(1 - v73.currentValue * 2, 0, 1)));
        else
            l_Name_0 = l_sliderGroup_0[2];
            v76 = formatNumber((v73.currentValue - 0.5) * 2);
        end;
    end;
    return l_Name_0 .. ": " .. v76;
end;
handleSliderOnValueChanged = function(v77, v78, v79, v80, v81, v82, v83, v84, v85, v86)
    v82.currentValue = v79;
    v77:setState({
        Tooltip = getSliderTooltipText(v78, v82), 
        Value = math.clamp(v82.currentValue, v80, v81)
    });
    local l_Name_1 = v78.Name;
    local l_props_2 = v77.props;
    local l_v79_0 = v79;
    if v84 and v83.indexInGroup == 1 then
        local v90 = nil;
        v90 = if v83.indexInGroup == 1 then v84[2] else v84[1];
        local v91 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v90];
        local v92 = 0;
        if v79 <= 0.5 then
            l_v79_0 = math.clamp(1 - v79 * 2, 0, 1);
            v92 = 0;
        else
            l_v79_0 = 0;
            v92 = (v79 - 0.5) * 2;
        end;
        local v93 = 0.5 + v92 * 0.5;
        v91.currentValue = v93;
        triggerValueChanged(l_props_2, v90, v92);
        if v77.props.SymmetryEnabled then
            local v94 = nil;
            local v95 = nil;
            v95 = v8.FacsCrossMappings[v90].symmetryPartner;
            if v95 then
                v94 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v95];
            end;
            if v94 then
                v94.currentValue = v93;
            end;
            if v95 then
                triggerValueChanged(l_props_2, v95, v92);
            end;
        end;
    end;
    if not v84 or v84 and v83.indexInGroup == 1 then
        triggerValueChanged(l_props_2, l_Name_1, l_v79_0);
    end;
    if not (not v77.props.SymmetryEnabled or not v86) then
        v86.currentValue = v79;
        triggerValueChanged(l_props_2, v85, l_v79_0);
    end;
end;
makeFacsOnFaceDiagramSliderUIItems = function(v96, _, _)
    local v99 = {};
    local l_Stylizer_0 = v96.props.Stylizer;
    for _, v102 in ipairs((getFacsListData())) do
        local v103 = "Facs_" .. v102.Name;
        local v104 = v8.FacsCrossMappings[v102.Name];
        local v105 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v102.Name];
        local l_sliderGroup_1 = v104.sliderGroup;
        if v105 and (not l_sliderGroup_1 or l_sliderGroup_1 and v104.indexInGroup == 1) then
            local v107 = nil;
            local v108 = nil;
            if v96.props.SymmetryEnabled then
                v108 = v104.symmetryPartner;
                if v108 then
                    v107 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v108];
                end;
            end;
            local v109 = 43;
            if v105.customWidth then
                v109 = v105.customWidth;
            end;
            local v110 = math.clamp(v105.currentValue, 0, 1);
            local v111 = l_sliderGroup_1 ~= nil;
            local l_faceSliderMaxValueTheme_0 = l_Stylizer_0.faceSliderMaxValueTheme;
            if l_faceSliderMaxValueTheme_0 then
                l_faceSliderMaxValueTheme_0 = true;
                if v110 ~= 0 then
                    l_faceSliderMaxValueTheme_0 = true;
                    if v110 ~= 1 then
                        l_faceSliderMaxValueTheme_0 = v111 and v110 == 0.5;
                    end;
                end;
            end;
            do
                local l_v107_0, l_v108_0 = v107, v108;
                v99[v103 .. "_rotatedSliderContainer"] = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(v105.position.X.Scale, v105.position.X.Offset * v96.state.scaleFactor, v105.position.Y.Scale, v105.position.Y.Offset * v96.state.scaleFactor), 
                    Size = UDim2.new(0, v109 * v96.state.scaleFactor, 0, 2 * v96.state.scaleFactor), 
                    Rotation = v105.rotation, 
                    LayoutOrder = 2, 
                    ZIndex = 100
                }, {
                    Scrubber = v2.createElement(l_Slider_0, {
                        Style = if not l_faceSliderMaxValueTheme_0 then l_Stylizer_0.faceSliderTheme else l_Stylizer_0.faceSliderMaxValueTheme, 
                        Disabled = false, 
                        Min = 0, 
                        Max = 1, 
                        Tooltip = getSliderTooltipText(v102, v105), 
                        Value = v110, 
                        FillFromCenter = v111, 
                        OnRightClick = function()
                            prepAndTriggerSliderContextMenu(v96, v102, v96.props, v104, l_v108_0, l_sliderGroup_1);
                        end, 
                        OnChangeBegan = function()
                            v96.props.AddWaypoint();
                            local v115 = {
                                {
                                    v102.Name
                                }
                            };
                            if l_v108_0 then
                                table.insert(v115, {
                                    l_v108_0
                                });
                            end;
                            if l_sliderGroup_1 then
                                local v116 = l_sliderGroup_1[2];
                                table.insert(v115, {
                                    v116
                                });
                                if l_v108_0 then
                                    table.insert(v115, {
                                        v8.FacsCrossMappings[v116].symmetryPartner
                                    });
                                end;
                            end;
                            v96.props.SetSelectedTracks(v115);
                        end, 
                        OnValueChanged = function(v117)
                            handleSliderOnValueChanged(v96, v102, v117, 0, 1, v105, v104, l_sliderGroup_1, l_v108_0, l_v107_0);
                        end, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 8), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
    end;
    return v2.createFragment(v99);
end;
triggerValueChanged = function(v118, v119, v120)
    if not v118.ReadOnly then
        v118.ValueChanged("Root", {
            v119
        }, v8.TRACK_TYPES.Facs, nil, v118.Playhead, v120, v118.Analytics);
    end;
end;
makeEyesControlDragBox = function(v121, _, _)
    local v124 = {};
    local l_Stylizer_1 = v121.props.Stylizer;
    local l_EyesDragBox_0 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap.EyesDragBox;
    local v127 = Vector2.new(math.clamp(l_EyesDragBox_0.currentValue.X, -1, 1), (math.clamp(l_EyesDragBox_0.currentValue.Y, -1, 1)));
    local v128 = true;
    if v127.X ~= -1 then
        v128 = true;
        if v127.X ~= 1 then
            v128 = true;
            if v127.Y ~= -1 then
                v128 = true;
                if v127.Y ~= 1 then
                    v128 = false;
                    if v127.X == 0 then
                        v128 = v127.Y == 0;
                    end;
                end;
            end;
        end;
    end;
    v124.EyesDragBox = v2.createElement(l_DragBox_0, {
        Style = if not v128 then l_Stylizer_1.faceDragBoxTheme else l_Stylizer_1.faceDragBoxMaxValueTheme, 
        Disabled = false, 
        MinX = -1, 
        MaxX = 1, 
        MinY = -1, 
        MaxY = 1, 
        Tooltip = "EyesLook", 
        Value = v127, 
        OnRightClick = function()
            local v129 = {};
            table.insert(v129, v8.FacsNames.EyesLookLeft);
            table.insert(v129, v8.FacsNames.EyesLookRight);
            table.insert(v129, v8.FacsNames.EyesLookUp);
            table.insert(v129, v8.FacsNames.EyesLookDown);
            v121.state.currentlyEditedFacsProperties = v129;
            v121.state.showContextMenu = true;
            v121:showContextMenu();
        end, 
        OnChangeBegan = function()
            v121.props.AddWaypoint();
            v121.props.SetSelectedTracks({
                {
                    v8.FacsNames.EyesLookLeft
                }, 
                {
                    v8.FacsNames.EyesLookRight
                }, 
                {
                    v8.FacsNames.EyesLookUp
                }, 
                {
                    v8.FacsNames.EyesLookDown
                }
            });
        end, 
        OnValueChanged = function(v130)
            l_EyesDragBox_0.currentValue = v130;
            v121:setState({
                Tooltip = "EyesLook", 
                Value = Vector2.new(math.clamp(l_EyesDragBox_0.currentValue.X, -1, 1), (math.clamp(l_EyesDragBox_0.currentValue.Y, -1, 1)))
            });
            local l_props_3 = v121.props;
            local v132 = v130.X <= 0 and -v130.X or 0;
            local v133 = v130.X >= 0 and v130.X or 0;
            local v134 = v130.Y <= 0 and -v130.Y or 0;
            local v135 = v130.Y >= 0 and v130.Y or 0;
            triggerValueChanged(l_props_3, v8.FacsNames.EyesLookRight, v132);
            triggerValueChanged(l_props_3, v8.FacsNames.EyesLookLeft, v133);
            triggerValueChanged(l_props_3, v8.FacsNames.EyesLookUp, v134);
            triggerValueChanged(l_props_3, v8.FacsNames.EyesLookDown, v135);
        end, 
        Position = UDim2.new(l_EyesDragBox_0.position.X.Scale, l_EyesDragBox_0.position.X.Offset * v121.state.scaleFactor, l_EyesDragBox_0.position.Y.Scale, l_EyesDragBox_0.position.Y.Offset * v121.state.scaleFactor), 
        Size = UDim2.new(0, 36 * v121.state.scaleFactor, 0, 28 * v121.state.scaleFactor), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    });
    return v2.createFragment(v124);
end;
getTrackValuesForEyeDragBox = function(v136, v137)
    if v136 then
        local v138 = v136.Tracks[v8.FacsNames.EyesLookLeft];
        local v139 = v136.Tracks[v8.FacsNames.EyesLookRight];
        local v140 = v136.Tracks[v8.FacsNames.EyesLookUp];
        local v141 = v136.Tracks[v8.FacsNames.EyesLookDown];
        local l_EyesDragBox_1 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap.EyesDragBox;
        if not ((v138 or v139) or v140) and not v141 then
            l_EyesDragBox_1.currentValue = l_EyesDragBox_1.defaultValue;
            return ;
        else
            local v143 = not not v138 and v23.getValue(v138, v137) or 0;
            local v144 = not not v139 and v23.getValue(v139, v137) or 0;
            local v145 = not not v140 and v23.getValue(v140, v137) or 0;
            l_EyesDragBox_1.currentValue = Vector2.new(v143 ~= 0 and v143 or -v144, v145 ~= 0 and -v145 or (not not v141 and v23.getValue(v141, v137) or 0));
            return ;
        end;
    else
        return ;
    end;
end;
v11.makeContextMenuActions = function(v146, v147)
    local l_props_4 = v146.props;
    local v149 = {};
    table.insert(v149, {
        Text = v147:getText("ContextMenu", "ResetSelected"), 
        OnItemClicked = function()
            if v146.state.currentlyEditedFacsProperties then
                for _, v151 in ipairs(v146.state.currentlyEditedFacsProperties) do
                    triggerValueChanged(l_props_4, v151, 0);
                end;
            end;
        end
    });
    return v149;
end;
v11.getCurrentValues = function(v152)
    local l_props_5 = v152.props;
    local l_Root_0 = l_props_5.AnimationData.Instances.Root;
    if l_Root_0 == nil then
        return ;
    else
        local l_Playhead_0 = l_props_5.Playhead;
        local v156 = v10.getFaceControls(l_props_5.RootInstance);
        if v156 ~= nil then
            for _, v158 in pairs(v8.FacsNames) do
                local v159 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v158];
                if l_Root_0 and l_Root_0.Tracks ~= nil then
                    local v160 = l_Root_0.Tracks[v158];
                    if not (v160 ~= nil) or v160.Type ~= v8.TRACK_TYPES.Facs then
                        v156[v158] = 0;
                        if v159 then
                            v159.currentValue = v159.defaultValue;
                        end;
                    end;
                else
                    v156[v158] = 0;
                end;
            end;
        end;
        if l_Root_0.Tracks == nil then
            return ;
        else
            getTrackValuesForEyeDragBox(l_Root_0, l_Playhead_0);
            for v161, v162 in pairs(l_Root_0.Tracks) do
                local v163 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v161];
                v162.Instance = "Root";
                local v164 = nil;
                if v163 ~= nil then
                    local v165 = v8.FacsCrossMappings[v161];
                    local l_sliderGroup_2 = v165.sliderGroup;
                    v163.currentValue = v163.defaultValue;
                    v164 = v23.getValue(v162, l_Playhead_0);
                    if v164 ~= nil then
                        if not l_sliderGroup_2 then
                            v163.currentValue = v164;
                        else
                            local v167 = nil;
                            v167 = if v165.indexInGroup == 1 then l_sliderGroup_2[2] else l_sliderGroup_2[1];
                            if v165.indexInGroup == 1 then
                                v163.currentValue = math.clamp(0.5 - v164 * 0.5, 0, 1);
                                if l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v167].currentValue > 0.5 then
                                    local v168 = 0;
                                    local v169 = l_Root_0.Tracks[v167];
                                    if v169 then
                                        v168 = v23.getValue(v169, l_Playhead_0);
                                    end;
                                    local v170 = 0.5 + v168 * 0.5;
                                    if v168 > 0 then
                                        v163.currentValue = v170;
                                    end;
                                end;
                            else
                                local _ = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v167];
                                local v172 = 0.5 + v164 * 0.5;
                                if v164 > 0 then
                                    v163.currentValue = v172;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            return ;
        end;
    end;
end;
resetAllValuesInMapping = function()
    for _, v174 in ipairs((getFacsListData())) do
        local v175 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap[v174.Name];
        if v175 then
            v175.currentValue = v175.defaultValue;
        end;
    end;
    local l_EyesDragBox_2 = l_FaceControlsMapping_0.FacsControlToFaceSliderInfoMap.EyesDragBox;
    l_EyesDragBox_2.currentValue = l_EyesDragBox_2.defaultValue;
end;
v11.willUpdate = function(v177, v178)
    if v178.RootInstance ~= v177.props.RootInstance then
        local l_RootInstance_0 = v177.props.RootInstance;
        if l_RootInstance_0 ~= nil then
            v9.resetAllFacsValuesInFaceControls(l_RootInstance_0);
        end;
        resetAllValuesInMapping();
        handleFocusFace(v178);
    end;
    if v178.ShowFaceControlsEditorPanel ~= v177.ShowFaceControlsEditorPanel and v178.ShowFaceControlsEditorPanel == true then
        v177.ShowFaceControlsEditorPanel = true;
        handleFocusFace(v178);
    end;
end;
getFacsKeysWithNonZerovalueCount = function(v180, v181)
    local v182 = 0;
    if v180 then
        local l_Root_1 = v180.Instances.Root;
        if l_Root_1 then
            for _, v185 in pairs(v8.FacsNames) do
                local v186 = l_Root_1.Tracks[v185];
                if v186 then
                    local v187 = v23.getValue(v186, v181);
                    if v187 and v187 ~= 0 then
                        v182 = v182 + 1;
                    end;
                end;
            end;
            return v182;
        else
            return v182;
        end;
    else
        return v182;
    end;
end;
handleFocusFace = function(v188)
    if v188.AutoFocusFaceEnabled then
        if not v28() then
            focusFace(v188);
        else
            v9.focusCameraOnFace(v188.RootInstance);
            return ;
        end;
    end;
end;
focusFace = function(v189)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local v191 = v10.getFaceControls(v189.RootInstance);
    if v191 ~= nil then
        local l_Parent_0 = v191.Parent;
        if l_Parent_0 and l_Parent_0:IsA("BasePart") then
            local v193 = 0.75;
            v193 = 0.75;
            if l_CurrentCamera_0.FieldOfView ~= 70 then
                v193 = 0.75 / (l_CurrentCamera_0.FieldOfView / 70);
            end;
            l_CurrentCamera_0.CFrame = CFrame.new(l_Parent_0.Position + l_Parent_0.CFrame.LookVector * (v193 * 2), l_Parent_0.CFrame.Position);
            l_CurrentCamera_0.Focus = l_Parent_0.CFrame;
        else
            return ;
        end;
    end;
end;
v11.render = function(v194)
    local l_Localization_0 = v194.props.Localization;
    local l_props_6 = v194.props;
    if v9.canUseFaceControlsEditor(l_props_6.RootInstance) then
        local l_showContextMenu_0 = v194.state.showContextMenu;
        local l_Stylizer_2 = l_props_6.Stylizer;
        local l_Stylizer_3 = v194.props.Stylizer;
        local l_AnimationData_0 = l_props_6.AnimationData;
        local l_Playhead_1 = l_props_6.Playhead;
        l_props_6.PluginActions:get("FocusCamera").Enabled = true;
        if l_AnimationData_0 ~= nil then
            v194:getCurrentValues();
        end;
        local v202 = getFacsKeysWithNonZerovalueCount(l_AnimationData_0, l_Playhead_1);
        local v203 = nil;
        if v202 == 0 then
            v203 = l_StyleModifier_0.Disabled;
        end;
        return v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "FaceControlsEditor", 
            Title = l_Localization_0:getText("Title", "FaceControlsEditor"), 
            Name = "FaceControlsEditor", 
            ZIndexBehavior = Enum.ZIndexBehavior.Global, 
            InitialDockState = Enum.InitialDockState.Left, 
            InitialEnabled = true, 
            InitialEnabledShouldOverrideRestore = true, 
            Size = v12, 
            MinSize = v13, 
            OnClose = v194.hideFaceControlsEditor, 
            Enabled = true, 
            [v2.Ref] = v194.onDockWidgetLoaded
        }, {
            Container = v2.createElement(l_Pane_0, {
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = -2, 
                [v2.Change.AbsoluteSize] = v194.onAbsoluteSizeChange
            }, {
                FaceFrontContainer = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                    Size = UDim2.new(1, 0, 0, 213), 
                    Position = UDim2.new(0, v8.faceControlsEditorDiagramPadding, 0, v8.faceControlsEditorDiagramPadding), 
                    ZIndex = -1
                }, {
                    FaceFrontViewImage = v2.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0, 0), 
                        Size = UDim2.new(0, v8.faceControlsEditorFaceFrontDiagramWidth * v194.state.scaleFactor, 0, v8.faceControlsEditorFaceFrontDiagramHeight * v194.state.scaleFactor), 
                        Position = UDim2.new(0, 0, 0, 6), 
                        Image = "rbxasset://textures/FaceControlsEditor/face_frontView.png", 
                        BackgroundTransparency = 1, 
                        ImageTransparency = 0, 
                        ZIndex = 0
                    }); 
                    makeFacsOnFaceDiagramSliderUIItems(v194, l_Stylizer_3, l_Localization_0), 
                    makeEyesControlDragBox(v194, l_Stylizer_3, l_Localization_0)
                }), 
                FaceSideContainer = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Stylizer_2.backgroundColor, 
                    Size = UDim2.new(1, 0, 0, 213), 
                    Position = UDim2.new(0, v8.faceControlsEditorDiagramPadding, 0, (v8.faceControlsEditoSpacingBetweenDiagrams + v8.faceControlsEditorFaceFrontDiagramHeight) * v194.state.scaleFactor), 
                    BackgroundTransparency = 1
                }, {
                    SideviewImage = v2.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0, 0), 
                        Size = UDim2.new(0, v8.faceControlsEditorFaceSideDiagramWidth * v194.state.scaleFactor, 0, v8.faceControlsEditorFaceSideDiagramHeight * v194.state.scaleFactor), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Image = "rbxasset://textures/FaceControlsEditor/face_sideView.png", 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    })
                }), 
                ContextMenu = l_showContextMenu_0 and v2.createElement(v24, {
                    Actions = v194:makeContextMenuActions(l_Localization_0), 
                    OnMenuOpened = v194.hideContextMenu
                }), 
                AdditionalControlsContainer = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0, 10, 1, -v8.faceControlsEditorTogglesContainerHeight), 
                    Size = UDim2.new(0, 200, 0, v8.faceControlsEditorTogglesContainerHeight), 
                    ZIndex = 400
                }, {
                    CheckboxesList = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    CheckboxSymmetry = v2.createElement(l_Checkbox_0, {
                        Text = l_Localization_0:getText("Title", "Symmetry"), 
                        Checked = v194.props.SymmetryEnabled, 
                        size = v194.props.elementSize, 
                        OnClick = function(_)
                            v194.props.SymmetryEnabled = not v194.props.SymmetryEnabled;
                            v194.props.SetSymmetryEnabled(v194.props.SymmetryEnabled);
                        end, 
                        LayoutOrder = 1, 
                        ZIndex = 401
                    }), 
                    CheckboxAutoFocusFace = v2.createElement(l_Checkbox_0, {
                        Text = l_Localization_0:getText("Title", "AutoFocusFace"), 
                        Checked = v194.props.AutoFocusFaceEnabled, 
                        size = v194.props.elementSize, 
                        LayoutOrder = 2, 
                        OnClick = function(_)
                            v194.props.AutoFocusFaceEnabled = not v194.props.AutoFocusFaceEnabled;
                            v194.props.SetAutoFocusFaceEnabled(v194.props.AutoFocusFaceEnabled);
                            handleFocusFace(v194.props);
                        end
                    })
                }), 
                BottomFrame = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 52), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundColor3 = l_Stylizer_2.ikTheme.headerColor, 
                    BorderSizePixel = 0
                }, {
                    WideResetAllButton = v2.createElement(l_Button_0, {
                        Text = l_Localization_0:getText("Title", "ResetAll"), 
                        AnchorPoint = Vector2.new(0.5, 1), 
                        Position = UDim2.new(0.5, 0, 1, -10), 
                        IsRound = true, 
                        Size = UDim2.new(1, -10, 0, 32), 
                        StyleModifier = v203, 
                        LayoutOrder = 3, 
                        OnClick = function()
                            l_props_6.AddWaypoint();
                            v9.resetAllFacsValuesInFaceControls(l_props_6.RootInstance);
                            local l_Root_2 = l_AnimationData_0.Instances.Root;
                            resetAllValuesInMapping();
                            for _, v208 in pairs(v8.FacsNames) do
                                local v209 = l_Root_2.Tracks[v208];
                                if not (not v209 or not v23.getValue(v209, l_props_6.Playhead)) then
                                    triggerValueChanged(l_props_6, v208, 0);
                                end;
                            end;
                        end
                    })
                })
            })
        });
    else
        v194.hideFaceControlsEditor();
        return ;
    end;
end;
return v3.connect(function(v210, _)
    local l_Status_0 = v210.Status;
    return {
        Tool = v210.Status.Tool, 
        SelectedTrackInstances = v210.Status.SelectedTrackInstances, 
        RootInstance = v210.Status.RootInstance, 
        faceControlsEditorEnabled = v210.Status.FaceControlsEditorEnabled, 
        Playhead = v210.Status.Playhead, 
        Tracks = v210.Status.Tracks, 
        PlayState = l_Status_0.PlayState, 
        AnimationData = v210.AnimationData, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        SymmetryEnabled = l_Status_0.SymmetryEnabled, 
        AutoFocusFaceEnabled = l_Status_0.AutoFocusFaceEnabled, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(v213)
    return {
        ValueChanged = function(v214, v215, v216, v217, v218, v219, v220)
            v213(v19(v214, v215, v216, v217, v218, v219, v220));
        end, 
        AddWaypoint = function()
            v213(v20());
        end, 
        SetSymmetryEnabled = function(v221)
            v213(v21(v221));
        end, 
        SetAutoFocusFaceEnabled = function(v222)
            v213(v22(v222));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    PluginActions = l_ContextServices_0.PluginActions
})(v11)));
