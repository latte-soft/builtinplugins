local _ = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_KeyboardListener_0 = v5.UI.KeyboardListener;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v11 = require(l_Actions_0.SetCreatingAnimationFromVideo);
local v12 = require(l_Actions_0.SetEditorMode);
local v13 = require(l_Actions_0.SetEventEditingTick);
local v14 = require(l_Actions_0.SetFrameRate);
local v15 = require(l_Actions_0.SetGridSpeed);
local v16 = require(l_Actions_0.SetIsDirty);
local v17 = require(l_Actions_0.SetIsLegacyAnimSaves);
local v18 = require(l_Actions_0.SetLastSelectedPath);
local v19 = require(l_Actions_0.SetMotorData);
local v20 = require(l_Actions_0.SetPlayState);
local v21 = require(l_Actions_0.SetReduceKeyframesDialogMode);
local v22 = require(l_Actions_0.SetRightClickContextInfo);
local v23 = require(l_Actions_0.SetSelectedTracks);
local v24 = require(l_Actions_0.SetSelectedTrackInstances);
local v25 = require(l_Actions_0.SetTopTrackIndex);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v27 = require(l_Components_0.AnimationControlPanel.AnimationControlPanel);
local v28 = require(l_Components_0.TrackList.AnimationEventsTrack);
local v29 = require(l_Components_0.ChangeFPSPrompt);
local v30 = require(l_Components_0.ChangeGridSpeedPrompt);
local v31 = require(l_Components_0.ChangePlaybackSpeedPrompt);
local v32 = require(l_Components_0.FacialAnimationRecorder.FacialAnimationRecorder);
local v33 = require(l_Components_0.FloorGrid);
local v34 = require(l_Components_0.InactiveCover);
local v35 = require(l_Components_0.InstanceSelector);
local v36 = require(l_Components_0.MigrationDialog);
local v37 = require(l_Components_0.Playback);
local v38 = require(l_Components_0.ProgressScreen);
local v39 = require(l_Components_0.PromoteToCurvesPrompt);
local v40 = require(l_Components_0.RecordingModeCover);
local v41 = require(l_Components_0.ReduceKeyframesDialog);
local v42 = require(l_Components_0.SettingsButton);
local v43 = require(l_Components_0.StartScreen);
local v44 = require(l_Components_0.TrackActions);
local v45 = require(l_Components_0.TrackList.TrackColors);
local v46 = require(l_Components_0.TrackEditor);
local v47 = require(l_Components_0.TrackList.TrackList);
local v48 = require(l_Components_0.TrackList.TrackListBorder);
local v49 = require(l_Components_0.TrackList.TrackScrollbar);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v51 = require(l_Thunks_0.AddTrack);
local v52 = require(l_Thunks_0.History.AddWaypoint);
local v53 = require(l_Thunks_0.AttachEditor);
local v54 = require(l_Thunks_0.CancelAnimationFromVideoImport);
local v55 = require(l_Thunks_0.LoadAnimationData);
local v56 = require(l_Thunks_0.MoveSelectedTrack);
local v57 = require(l_Thunks_0.PromoteKeyframeSequence);
local v58 = require(l_Thunks_0.ReleaseEditor);
local v59 = require(l_Thunks_0.Playback.SetPlaybackSpeed);
local v60 = require(l_Thunks_0.SetSelectedTracks);
local v61 = require(l_Thunks_0.SetTopTrackIndex);
local v62 = require(l_Thunks_0.SetTracksExpanded);
local v63 = require(l_Thunks_0.SortAndSetSelectedTrackInstances);
local v64 = require(l_Thunks_0.SwitchEditorMode);
local v65 = require(l_Thunks_0.ValueChanged);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v67 = require(l_Util_0.AnimationData);
local v68 = require(l_Util_0.Constants);
local v69 = require(l_Util_0.Input);
local v70 = require(l_Util_0.PathUtils);
local v71 = require(l_Util_0.RigInfo);
local v72 = require(l_Util_0.RigUtils);
local v73 = require(l_Util_0.TrackUtils);
local v74 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v75 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v76 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
local v77 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v78 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagResetTopTrackIndex);
local v79 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridSpeed);
local v80 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v81 = v3.PureComponent:extend("EditorController");
v81.init = function(v82)
    v82.state = {
        TopTrackIndex = if v77() then nil else 1, 
        AbsoluteSize = Vector2.new(), 
        TrackListWidth = v68.TRACK_LIST_START_WIDTH, 
        showContextMenu = false, 
        showChangeFPSPrompt = false, 
        showChangeGridSpeedPrompt = false, 
        showChangePlaybackSpeedPrompt = false, 
        showPromotePrompt = false
    };
    v82.nameToPart = {};
    v82.showChangeFPSPrompt = function()
        v82:setState({
            showChangeFPSPrompt = true
        });
    end;
    v82.hideChangeFPSPrompt = function()
        v82:setState({
            showChangeFPSPrompt = false
        });
    end;
    v82.showChangeGridSpeedPrompt = function()
        v82:setState({
            showChangeGridSpeedPrompt = true
        });
    end;
    v82.hideChangeGridSpeedPrompt = function()
        v82:setState({
            showChangeGridSpeedPrompt = false
        });
    end;
    v82.showChangePlaybackSpeedPrompt = function()
        v82:setState({
            showChangePlaybackSpeedPrompt = true
        });
    end;
    v82.hideChangePlaybackSpeedPrompt = function()
        v82:setState({
            showChangePlaybackSpeedPrompt = false
        });
    end;
    v82.hideReduceKeyframesDialog = function()
        v82.props.SetReduceKeyframesDialogMode(v68.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden);
    end;
    v82.setTopTrackIndex = if v78() then nil else function(v83)
        local l_Tracks_0 = v82.props.Tracks;
        if #l_Tracks_0 > 0 then
            if not v77() then
                v82:setState({
                    TopTrackIndex = math.clamp(v83, 1, #l_Tracks_0)
                });
            else
                v82.props.SetTopTrackIndex_ACTION((math.clamp(v83, 1, #l_Tracks_0)));
                return ;
            end;
        end;
    end;
    v82.onScroll = function(v85)
        local v86 = if v77() or v78() then v82.props.TopTrackIndex else v82.state.TopTrackIndex;
        if not v78() then
            v82.setTopTrackIndex(v86 - (v85 > 0 and 1 or -1));
            return ;
        else
            v82.props.SetTopTrackIndex(v86 - (v85 > 0 and 1 or -1));
            return ;
        end;
    end;
    v82.onSizeUpdate = function(v87)
        v82:setState({
            AbsoluteSize = v87.AbsoluteSize, 
            TrackListWidth = math.min(v82.state.TrackListWidth, v87.AbsoluteSize.X - v68.TIMELINE_MIN_WIDTH)
        });
    end;
    v82.showMenu = function(v88, v89, v90, v91)
        v82.props.SetPlayState(v68.PLAY_STATE.Pause);
        v82.props.SetRightClickContextInfo({
            Path = v89, 
            TrackType = v90, 
            RotationType = v91, 
            InstanceName = v88
        });
        v82:setState({
            showContextMenu = true
        });
    end;
    v82.hideMenu = function()
        v82:setState({
            showContextMenu = false
        });
    end;
    v82.showPromotePrompt = function()
        v82:setState({
            showPromotePrompt = true
        });
    end;
    v82.hidePromotePrompt = function()
        v82:setState({
            showPromotePrompt = false
        });
    end;
    v82.cancelCreateFromVideo = function()
        v82.props.CancelAnimationFromVideoImport(v82.props.Analytics);
    end;
    v82.updateTrackListWidth = function(v92)
        v82:setState({
            TrackListWidth = math.clamp(v92.Position.X, v68.TRACK_LIST_MIN_WIDTH, v82.state.AbsoluteSize.X - v68.TIMELINE_MIN_WIDTH)
        });
    end;
    v82.controlSelectTrack = function(v93)
        local l_props_0 = v82.props;
        local l_SelectedTracks_0 = l_props_0.SelectedTracks;
        local l_SetSelectedTracks_0 = l_props_0.SetSelectedTracks;
        if not l_SelectedTracks_0 or not v70.findPath(l_SelectedTracks_0, v93) then
            l_props_0.SetLastSelectedPath(v93);
            l_SetSelectedTracks_0(v2.List.join(l_SelectedTracks_0 or {}, {
                v93
            }));
            return ;
        else
            l_SetSelectedTracks_0(v70.removePath(l_SelectedTracks_0, v93));
            return ;
        end;
    end;
    v82.shiftSelectTrack = function(v97)
        local l_props_1 = v82.props;
        local l_Tracks_1 = l_props_1.Tracks;
        local l_SetSelectedTracks_1 = l_props_1.SetSelectedTracks;
        local v101 = nil;
        local v102 = nil;
        local l_LastSelectedPath_0 = v82.props.LastSelectedPath;
        for v104, v105 in ipairs(l_Tracks_1) do
            if l_LastSelectedPath_0 and v105.Name == l_LastSelectedPath_0[1] then
                v102 = v104;
            elseif v105.Name == v97[1] then
                v101 = v104;
            end;
        end;
        if v101 ~= nil and v102 ~= nil then
            local v106 = math.min(v101, v102);
            local v107 = math.max(v101, v102);
            local v108 = {};
            for v109 = v106, v107 do
                table.insert(v108, {
                    l_Tracks_1[v109].Name
                });
            end;
            l_SetSelectedTracks_1(v108);
            return ;
        else
            v82.props.SetLastSelectedPath(v97);
            l_SetSelectedTracks_1({
                v97
            });
            return ;
        end;
    end;
    v82.findCurrentParts = if v77() then nil else function(v110, v111)
        local v112 = {};
        if v111 == nil then
            return ;
        else
            local v113 = v71.getRigInfo(v111);
            v82.KinematicParts = v113.Parts;
            v82.PartsToMotors = v113.PartNameToMotor;
            if not ((not v110 or not v111) or not v82.KinematicParts) and #v82.KinematicParts > 0 then
                for _, v115 in ipairs(v110) do
                    local v116 = v115[1];
                    local v117 = v71.getBoneByName(v111, v116);
                    if not v117 then
                        table.insert(v112, v82.nameToPart[v116]);
                    else
                        table.insert(v112, v117);
                    end;
                end;
            end;
            if not v76() then
                local l_SetSelectedTrackInstances_0 = v82.props.SetSelectedTrackInstances;
                if v112 and #v112 > 0 then
                    l_SetSelectedTrackInstances_0(v112);
                end;
            elseif v112 and #v112 > 0 then
                v82.props.SortAndSetSelectedTrackInstances(v112);
                return ;
            end;
            return ;
        end;
    end;
    v82.onTrackSelected = function(v119)
        local l_props_2 = v82.props;
        local l_SetSelectedTracks_2 = l_props_2.SetSelectedTracks;
        local l_AnimationData_0 = v82.props.AnimationData;
        local l_EditorMode_0 = v82.props.EditorMode;
        if not v82.controlDown then
            if v67.isChannelAnimation(l_AnimationData_0) or not v82.shiftDown then
                l_props_2.SetLastSelectedPath(v119);
                l_SetSelectedTracks_2({
                    v119
                });
            else
                v82.shiftSelectTrack(v119);
            end;
        else
            v82.controlSelectTrack(v119);
        end;
        if not v77() then
            v82.findCurrentParts({
                v119
            }, l_props_2.RootInstance);
        end;
        l_props_2.Analytics:report("onTrackSelected", v119[1], "TrackList", l_EditorMode_0, if not not l_AnimationData_0 and l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil);
    end;
    v82.addTrackWrapper = function(v124, v125, v126)
        v82.props.AddTrack(v124, v125, v126, nil, nil, v82.props.Analytics);
    end;
    v82.createAnimationWrapper = function(v127)
        v82.props.CreateAnimation(v127, v82.props.Analytics);
    end;
    v82.attachEditorWrapper = function()
        v82.props.AttachEditor(v82.props.Analytics);
    end;
    v82.applyValueToFacsSliderPartners = function(v128, v129, v130, v131, v132)
        if v130 ~= v68.TRACK_TYPES.Facs then
            return ;
        else
            local v133 = v129[1];
            local v134 = v68.FacsCrossMappings[v133];
            if v132 ~= 0 then
                local v135 = {
                    [v68.FacsNames.EyesLookLeft] = v68.FacsNames.EyesLookRight, 
                    [v68.FacsNames.EyesLookRight] = v68.FacsNames.EyesLookLeft, 
                    [v68.FacsNames.EyesLookUp] = v68.FacsNames.EyesLookUp, 
                    [v68.FacsNames.EyesLookDown] = v68.FacsNames.EyesLookDown
                };
                if v135[v133] then
                    v82.props.ValueChanged(v128, {
                        v135[v133]
                    }, v68.TRACK_TYPES.Facs, nil, v131, 0, v82.props.Analytics);
                end;
            end;
            if v134 ~= nil then
                local l_sliderGroup_0 = v134.sliderGroup;
                if l_sliderGroup_0 and v132 > 0 then
                    local _ = nil;
                    v82.props.ValueChanged(v128, {
                        if v134.indexInGroup == 1 then l_sliderGroup_0[2] else l_sliderGroup_0[1]
                    }, v68.TRACK_TYPES.Facs, nil, v131, 0, v82.props.Analytics);
                end;
                if v82.props.SymmetryEnabled then
                    local l_symmetryPartner_0 = v134.symmetryPartner;
                    if l_symmetryPartner_0 then
                        v82.applyValueToSymmetryPartner(v128, l_symmetryPartner_0, v130, v131, v132);
                    end;
                end;
            end;
            return ;
        end;
    end;
    v82.applyValueToSymmetryPartner = function(v139, v140, v141, v142, v143)
        v82.props.ValueChanged(v139, {
            v140
        }, v141, nil, v142, v143, v82.props.Analytics);
        if not (v143 ~= nil) or v143 <= 0 then
            return ;
        else
            local v144 = v68.FacsCrossMappings[v140];
            local l_sliderGroup_1 = v144.sliderGroup;
            if l_sliderGroup_1 then
                local _ = nil;
                v82.props.ValueChanged(v139, {
                    if v144.indexInGroup == 1 then l_sliderGroup_1[2] else l_sliderGroup_1[1]
                }, v141, nil, v142, 0, v82.props.Analytics);
                return ;
            else
                return ;
            end;
        end;
    end;
    v82.onValueChanged = function(v147, v148, v149, v150, v151, v152)
        local l_AnimationData_1 = v82.props.AnimationData;
        if v67.isChannelAnimation(l_AnimationData_1) then
            local l_DefaultEulerAnglesOrder_0 = v82.props.DefaultEulerAnglesOrder;
            local v155 = v67.getTrack(l_AnimationData_1, v147, {
                v148[1]
            });
            if not ((not v155 or not v155.Components) or not v155.Components[v68.PROPERTY_KEYS.Rotation]) then
                v150 = v155.Components[v68.PROPERTY_KEYS.Rotation].Type;
                if v150 == v68.TRACK_TYPES.EulerAngles then
                    l_DefaultEulerAnglesOrder_0 = v155.EulerAnglesOrder;
                end;
            end;
            v73.traverseValue(v149, v152, function(v156, v157, v158)
                v82.props.ValueChanged(v147, v2.List.join(v148, v157), v156, v150, v151, v158, v82.props.Analytics);
            end, v150, l_DefaultEulerAnglesOrder_0);
        else
            v82.props.ValueChanged(v147, v148, v149, v150, v151, v152, v82.props.Analytics);
        end;
        if v149 == v68.TRACK_TYPES.Facs then
            v82.applyValueToFacsSliderPartners(v147, v148, v149, v151, v152);
        end;
    end;
    v82.promoteKeyframeSequence = function()
        v82.props.PromoteKeyframeSequence(v82.props.Analytics);
        v82.props.SwitchEditorMode(v68.EDITOR_MODE.CurveCanvas, v82.props.Analytics);
    end;
end;
v81.didUpdate = function(v159, v160)
    if (not (v160.RootInstance == v159.props.RootInstance) or next(v159.nameToPart) == nil) and v159.props.RootInstance ~= nil then
        if not v77() then
            local v161 = v71.getRigInfo(v159.props.RootInstance);
            v159.KinematicParts = v161.Parts;
            v159.PartsToMotors = v161.PartNameToMotor;
            for _, v163 in ipairs(v159.KinematicParts) do
                v159.nameToPart[v163.Name] = v163;
            end;
        else
            for _, v165 in ipairs(v71.getRigInfo(v159.props.RootInstance).Parts) do
                v159.nameToPart[v165.Name] = v165;
            end;
        end;
    end;
    if not v77() and v160.SelectedTracks ~= v159.props.SelectedTracks then
        v159.findCurrentParts(v159.props.SelectedTracks, v159.props.RootInstance);
    end;
    if v160.Playhead ~= v159.props.Playhead then
        v159.props.Signals:get(v68.SIGNAL_KEYS.ScrubberChanged):Fire();
    end;
end;
v81.render = function(v166)
    local l_props_3 = v166.props;
    local l_state_0 = v166.state;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local v170 = 0;
    local v171 = 0;
    local v172 = 0;
    local l_Active_0 = l_props_3.Active;
    local l_Playhead_0 = l_props_3.Playhead;
    local v175 = if not v80() then l_props_3.ShowAsSeconds else nil;
    local l_TimelineUnit_0 = l_props_3.TimelineUnit;
    local l_EditingLength_0 = l_props_3.EditingLength;
    local v178 = if v77() or v78() then l_props_3.TopTrackIndex else l_state_0.TopTrackIndex;
    local l_TrackListWidth_0 = l_state_0.TrackListWidth;
    local l_Tracks_2 = l_props_3.Tracks;
    local l_UnusedTracks_0 = l_props_3.UnusedTracks;
    local l_UnusedFacs_0 = l_props_3.UnusedFacs;
    local l_HorizontalScroll_0 = l_props_3.HorizontalScroll;
    local l_HorizontalZoom_0 = l_props_3.HorizontalZoom;
    local l_VerticalScroll_0 = l_props_3.VerticalScroll;
    local l_VerticalZoom_0 = l_props_3.VerticalZoom;
    local l_AnimationData_2 = l_props_3.AnimationData;
    local l_ShowEvents_0 = l_props_3.ShowEvents;
    local l_SelectedTracks_1 = l_props_3.SelectedTracks;
    local l_RootInstance_0 = l_props_3.RootInstance;
    local l_AbsoluteSize_0 = l_state_0.AbsoluteSize;
    local v192 = l_props_3.PlayState == v68.PLAY_STATE.Record;
    local l_inReviewState_0 = l_props_3.inReviewState;
    local l_showChangeFPSPrompt_0 = l_state_0.showChangeFPSPrompt;
    local l_showChangeGridSpeedPrompt_0 = l_state_0.showChangeGridSpeedPrompt;
    local l_showChangePlaybackSpeedPrompt_0 = l_state_0.showChangePlaybackSpeedPrompt;
    local v197 = l_AnimationData_2 ~= nil;
    local l_showPromotePrompt_0 = l_state_0.showPromotePrompt;
    local v199 = v67.isChannelAnimation(l_AnimationData_2);
    local l_CreatingAnimationFromVideo_0 = l_props_3.CreatingAnimationFromVideo;
    local l_AnimationImportProgress_0 = l_props_3.AnimationImportProgress;
    local l_AnimationImportStatus_0 = l_props_3.AnimationImportStatus;
    if l_AnimationData_2 then
        local v203 = v73.getZoomRange(l_props_3.AnimationData, l_HorizontalScroll_0, l_HorizontalZoom_0, l_EditingLength_0);
        v170 = v203.Start;
        v171 = v203.End;
        v172 = l_AnimationData_2.Metadata.EndTick;
    end;
    l_ShowEvents_0 = l_ShowEvents_0 and v197;
    local v204 = nil;
    v204 = if not not l_props_3.RootInstance and l_props_3.RootInstance.Name then l_props_3.RootInstance.Name else "";
    local v205 = l_props_3.ZIndex or 1;
    local l_Position_0 = l_props_3.Position;
    local l_Size_0 = l_props_3.Size;
    local v208 = (not not l_ShowEvents_0 and v68.TRACK_HEIGHT or 0) + v68.SUMMARY_TRACK_HEIGHT;
    local v209 = l_props_3.EditorMode == v68.EDITOR_MODE.DopeSheet;
    local v210 = l_props_3.ReduceKeyframesDialogMode ~= v68.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden;
    local v211 = l_props_3.LegacyAnimationInstances and #l_props_3.LegacyAnimationInstances > 0;
    local l_GridSpeed_0 = l_props_3.GridSpeed;
    if v79() and l_GridSpeed_0 == v68.GRIDSPEEDS.FromRig then
        local v213 = l_props_3.RootInstance and l_props_3.RootInstance:FindFirstChildOfClass("Humanoid");
        l_GridSpeed_0 = not v213 and 0 or v213.WalkSpeed;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = v205, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        [v3.Change.AbsoluteSize] = v166.onSizeUpdate
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TrackListAndControlContainer = v3.createElement("Frame", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, l_TrackListWidth_0, 1, 0), 
            LayoutOrder = 0, 
            ZIndex = 2
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            AnimationControlPanel = v3.createElement(v27, {
                StartTick = v170, 
                EndTick = v171, 
                Playhead = l_Playhead_0, 
                EditingLength = l_EditingLength_0, 
                AnimationData = l_props_3.AnimationData, 
                IsLegacyAnimSaves = l_props_3.IsLegacyAnimSaves, 
                ShowAsSeconds = if not v80() then v175 else nil, 
                TimelineUnit = l_TimelineUnit_0, 
                IsChannelAnimation = v199, 
                LayoutOrder = 0
            }), 
            EventsAndTracks = v3.createElement("ImageButton", {
                Size = UDim2.new(0, l_TrackListWidth_0, 1, -v68.TIMELINE_HEIGHT), 
                BackgroundTransparency = 1, 
                ImageTransparency = 1, 
                LayoutOrder = 1, 
                [v3.Event.Activated] = function()
                    if not v76() then
                        l_props_3.SetLastSelectedPath(nil);
                        l_props_3.SetSelectedTracks({});
                        if not v77() then
                            l_props_3.SetSelectedTrackInstances({});
                        end;
                        return ;
                    else
                        l_props_3.ClearSelectedTrackInstances();
                        l_props_3.SetLastSelectedPath(nil);
                        return ;
                    end;
                end
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                EventsTitle = l_ShowEvents_0 and v3.createElement(v28, {
                    LayoutOrder = 0, 
                    Indent = 1, 
                    OnButtonClick = function()
                        l_props_3.SetEventEditingTick(l_Playhead_0);
                    end
                }), 
                TrackListAndScrollBar = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, not not l_ShowEvents_0 and -v68.TRACK_HEIGHT or 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    TrackList = v3.createElement(v47, {
                        Size = UDim2.new(1, -v68.SCROLL_BAR_SIZE - 1, 1, 0), 
                        TopTrackIndex = v178, 
                        Tracks = l_Tracks_2, 
                        SelectedTracks = l_SelectedTracks_1, 
                        UnusedTracks = l_UnusedTracks_0, 
                        UnusedFacs = l_UnusedFacs_0, 
                        AnimationData = l_AnimationData_2, 
                        Playhead = l_Playhead_0, 
                        RootName = v204, 
                        OnScroll = v166.onScroll, 
                        OpenContextMenu = v166.showMenu, 
                        ToggleTrackExpanded = l_props_3.SetTracksExpanded, 
                        OnTrackAdded = v166.addTrackWrapper, 
                        OnValueChanged = v166.onValueChanged, 
                        OnChangeBegan = l_props_3.AddWaypoint, 
                        OnTrackSelected = v166.onTrackSelected
                    }), 
                    TrackScrollbarFrame = v3.createElement("Frame", {
                        Size = UDim2.new(0, v68.SCROLL_BAR_SIZE, 1, 0), 
                        Position = UDim2.new(1, -v68.SCROLL_BAR_SIZE, 0, 0), 
                        BackgroundColor3 = l_Stylizer_0.scrollBarTheme.backgroundColor
                    }, {
                        TrackScrollbar = v3.createElement(v49, {
                            Size = UDim2.new(1, 0, 1, -v68.SCROLL_BAR_SIZE - 1), 
                            TopTrackIndex = v178, 
                            NumTracks = not not l_Tracks_2 and #l_Tracks_2 or 0, 
                            SetTopTrackIndex = if not v78() then v166.setTopTrackIndex else v166.props.SetTopTrackIndex, 
                            OnScroll = v166.onScroll
                        })
                    })
                }), 
                KeyboardListener = v3.createElement(l_KeyboardListener_0, {
                    OnKeyPressed = function(v214)
                        if not v69.isUp(v214.KeyCode) then
                            if not v69.isDown(v214.KeyCode) then
                                if not v69.isLeft(v214.KeyCode) then
                                    if not v69.isRight(v214.KeyCode) then
                                        if not v69.isControl(v214.KeyCode) then
                                            if v69.isShift(v214.KeyCode) then
                                                v166.shiftDown = true;
                                            end;
                                            return ;
                                        else
                                            v166.controlDown = true;
                                            return ;
                                        end;
                                    else
                                        l_props_3.ExpandSelectedTracks(l_SelectedTracks_1);
                                        return ;
                                    end;
                                else
                                    l_props_3.CloseSelectedTracks(l_SelectedTracks_1);
                                    return ;
                                end;
                            else
                                l_props_3.MoveSelectedTrack(1);
                                return ;
                            end;
                        else
                            l_props_3.MoveSelectedTrack(-1);
                            return ;
                        end;
                    end, 
                    OnKeyReleased = function(v215)
                        if not v69.isControl(v215.KeyCode) then
                            if v69.isShift(v215.KeyCode) then
                                v166.shiftDown = false;
                            end;
                            return ;
                        else
                            v166.controlDown = false;
                            return ;
                        end;
                    end
                }), 
                IgnoreLayout = not not v197 and v3.createElement("Folder", {}, {
                    TrackColors = v3.createElement(v45, {
                        Tracks = l_Tracks_2, 
                        TopTrackIndex = v178, 
                        Position = UDim2.new(0, 0, 0, v208), 
                        MaxHeight = l_AbsoluteSize_0.Y - v208
                    })
                }) or nil
            })
        }), 
        TrackListBorder = v3.createElement(v48, {
            OnDragMoved = v166.updateTrackListWidth, 
            ZIndex = 3
        }), 
        TrackEditor = v197 and v3.createElement(v46, {
            ZIndex = v205, 
            TopTrackIndex = v178, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, (-l_TrackListWidth_0 - v68.SCROLL_BAR_SIZE) - v68.SCROLL_BAR_PADDING, 1, 0), 
            StartTick = v170, 
            EndTick = v171, 
            LastTick = v172, 
            Playhead = l_Playhead_0, 
            FrameRate = l_props_3.FrameRate, 
            ShowAsSeconds = if not v80() then v175 else nil, 
            TimelineUnit = l_TimelineUnit_0, 
            ShowEvents = l_ShowEvents_0, 
            HorizontalScroll = l_HorizontalScroll_0, 
            HorizontalZoom = l_HorizontalZoom_0, 
            VerticalScroll = l_VerticalScroll_0, 
            VerticalZoom = l_VerticalZoom_0, 
            OnScroll = v166.onScroll, 
            IsChannelAnimation = v199, 
            ColorsPosition = v208, 
            OnPromoteRequested = v166.showPromotePrompt
        }), 
        SettingsAndVerticalScrollBar = v197 and v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v68.SCROLL_BAR_SIZE, 1, 0), 
            LayoutOrder = 3
        }, {
            SettingsButton = v3.createElement(v42, {
                OnChangeFPS = v166.showChangeFPSPrompt, 
                OnChangeGridSpeed = v166.showChangeGridSpeedPrompt, 
                OnChangePlaybackSpeed = v166.showChangePlaybackSpeedPrompt
            }), 
            TrackScrollbar = not not v209 and v3.createElement(v49, {
                Size = UDim2.new(1, 0, 1, (-v68.SCROLL_BAR_SIZE - v68.TIMELINE_HEIGHT) - 1), 
                Position = UDim2.new(0, 0, 0, v68.TIMELINE_HEIGHT), 
                TopTrackIndex = v178, 
                NumTracks = not not l_Tracks_2 and #l_Tracks_2 or 0, 
                SetTopTrackIndex = if not v78() then v166.setTopTrackIndex else v166.props.SetTopTrackIndex, 
                OnScroll = v166.onScroll
            }) or nil
        }), 
        StartScreen = (not v197 and not v211) and v3.createElement(v43, {
            RootInstance = l_RootInstance_0, 
            Size = UDim2.new(1, -l_TrackListWidth_0, 1, 0), 
            LayoutOrder = 2, 
            OnCreateAnimation = v166.createAnimationWrapper, 
            PlayState = l_props_3.PlayState, 
            inReviewState = l_props_3.inReviewState
        }), 
        Playback = (l_Active_0 and v197) and v3.createElement(v37), 
        FacialAnimationRecorder = ((l_Active_0 and v74()) and (v192 or l_inReviewState_0)) and v3.createElement(v32), 
        RecordingModeCover = ((l_Active_0 and v74()) and v192) and v3.createElement(v40), 
        InstanceSelector = l_Active_0 and v3.createElement(v35), 
        FloorGrid = (l_Active_0 and v197) and v3.createElement(v33, {
            Playhead = l_props_3.Playhead, 
            RootInstance = l_props_3.RootInstance, 
            Speed = l_GridSpeed_0
        }), 
        TrackActions = (l_Active_0 and v197) and v3.createElement(v44, {
            ShowMenu = l_state_0.showContextMenu, 
            OnMenuOpened = v166.hideMenu, 
            IsChannelAnimation = v199
        }), 
        InactiveCover = not l_Active_0 and v3.createElement(v34, {
            OnFocused = v166.attachEditorWrapper
        }), 
        ProgressScreen = l_CreatingAnimationFromVideo_0 and v3.createElement(v38, {
            OnCancelled = v166.cancelCreateFromVideo, 
            Progress = l_AnimationImportProgress_0, 
            Status = l_AnimationImportStatus_0
        }), 
        ChangeFPSPrompt = l_showChangeFPSPrompt_0 and v3.createElement(v29, {
            FrameRate = l_props_3.FrameRate, 
            SetFrameRate = l_props_3.SetFrameRate, 
            OnClose = v166.hideChangeFPSPrompt
        }), 
        ChangeGridSpeedPrompt = if not not v79() and l_showChangeGridSpeedPrompt_0 then v3.createElement(v30, {
            GridSpeed = l_GridSpeed_0, 
            SetGridSpeed = l_props_3.SetGridSpeed, 
            OnClose = v166.hideChangeGridSpeedPrompt
        }) else nil, 
        ChangePlaybackSpeedPrompt = l_showChangePlaybackSpeedPrompt_0 and v3.createElement(v31, {
            PlaybackSpeed = l_props_3.PlaybackSpeed, 
            SetPlaybackSpeed = l_props_3.SetPlaybackSpeed, 
            OnClose = v166.hideChangePlaybackSpeedPrompt
        }), 
        PromotePrompt = if not l_showPromotePrompt_0 then nil else v3.createElement(v39, {
            OnPromote = v166.promoteKeyframeSequence, 
            OnClose = v166.hidePromotePrompt
        }), 
        ReduceKeyframesDialog = if not v210 then nil else v3.createElement(v41, {
            OnClose = v166.hideReduceKeyframesDialog
        }), 
        MigrationDialog = if not v211 then nil else v3.createElement(v36)
    });
end;
v81.didMount = function(v216)
    local l_props_4 = v216.props;
    local l_SnapMode_0 = l_props_4.SnapMode;
    if not v80() then
        l_props_4.Analytics:report("onEditorOpened", not l_props_4.ShowAsSeconds and "Frames" or "Seconds", false, l_SnapMode_0);
    else
        l_props_4.Analytics:report("onEditorOpened", l_props_4.TimelineUnit, false, l_SnapMode_0);
    end;
    l_props_4.AttachEditor(l_props_4.Analytics);
    v216.props.SetEditorMode(v68.EDITOR_MODE.DopeSheet);
    v216.openedTimestamp = os.time();
end;
v81.willUnmount = function(v219)
    local l_props_5 = v219.props;
    v72.resetAllFacsValuesInFaceControls(l_props_5.RootInstance);
    l_props_5.Analytics:report("onEditorModeSwitch", l_props_5.EditorMode, nil, os.time() - l_props_5.EditorModeSwitchTime, if not not l_props_5.AnimationData and l_props_5.AnimationData.Metadata then l_props_5.AnimationData.Metadata.Guid else nil);
    l_props_5.ReleaseEditor(l_props_5.Analytics);
    l_props_5.Analytics:report("onEditorClosed", os.time() - v219.openedTimestamp);
end;
return v4.connect(function(v221)
    local l_Status_0 = v221.Status;
    return {
        Active = l_Status_0.Active, 
        Analytics = v221.Analytics, 
        AnimationData = v221.AnimationData, 
        AnimationImportProgress = l_Status_0.AnimationImportProgress, 
        AnimationImportStatus = l_Status_0.AnimationImportStatus, 
        CreatingAnimationFromVideo = l_Status_0.CreatingAnimationFromVideo, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        EditingLength = l_Status_0.EditingLength, 
        EditorMode = l_Status_0.EditorMode, 
        EditorModeSwitchTime = l_Status_0.EditorModeSwitchTime, 
        FrameRate = l_Status_0.FrameRate, 
        GridSpeed = l_Status_0.GridSpeed, 
        HorizontalScroll = l_Status_0.HorizontalScroll, 
        HorizontalZoom = l_Status_0.HorizontalZoom, 
        IKEnabled = l_Status_0.IKEnabled, 
        IKMode = l_Status_0.IKMode, 
        inReviewState = l_Status_0.inReviewState, 
        IsLegacyAnimSaves = l_Status_0.IsLegacyAnimSaves, 
        LastSelectedPath = l_Status_0.LastSelectedPath, 
        LegacyAnimationInstances = l_Status_0.LegacyAnimationInstances, 
        MotorData = l_Status_0.MotorData, 
        PinnedParts = l_Status_0.PinnedParts, 
        PlaybackSpeed = l_Status_0.PlaybackSpeed, 
        Playhead = l_Status_0.Playhead, 
        PlayState = l_Status_0.PlayState, 
        ReduceKeyframesDialogMode = l_Status_0.ReduceKeyframesDialogMode, 
        RootInstance = l_Status_0.RootInstance, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        ShowAsSeconds = if not v80() then l_Status_0.ShowAsSeconds else nil, 
        ShowEvents = l_Status_0.ShowEvents, 
        SnapMode = l_Status_0.SnapMode, 
        SymmetryEnabled = l_Status_0.SymmetryEnabled, 
        TimelineUnit = l_Status_0.TimelineUnit, 
        TopTrackIndex = l_Status_0.TopTrackIndex, 
        Tracks = l_Status_0.Tracks, 
        UnusedFacs = l_Status_0.UnusedFacs, 
        UnusedTracks = l_Status_0.UnusedTracks, 
        VerticalScroll = l_Status_0.VerticalScroll, 
        VerticalZoom = l_Status_0.VerticalZoom
    };
end, function(v223)
    return {
        SetLastSelectedPath = function(v224)
            v223(v18(v224));
        end, 
        SetTracksExpanded = function(v225, v226)
            v223(v62(v225, v226, false));
        end, 
        SetSelectedTrackInstances = if v76() or v77() then nil else function(v227)
            v223(v24(v227));
        end, 
        ClearSelectedTrackInstances = function()
            if not v77() then
                v223(v24({}));
                v223(v23({}));
                return ;
            else
                v223(v60({}));
                return ;
            end;
        end, 
        SortAndSetSelectedTrackInstances = function(v228)
            v223(v63(v228));
        end, 
        SetSelectedTracks = function(v229)
            if not v77() then
                v223(v23(v229));
                return ;
            else
                v223(v60(v229));
                return ;
            end;
        end, 
        MoveSelectedTrack = function(v230)
            v223(v56(v230));
        end, 
        ExpandSelectedTracks = function(v231)
            v223(v62(v231, true, true));
        end, 
        CloseSelectedTracks = function(v232)
            v223(v62(v232, false, true));
        end, 
        AddTrack = function(v233, v234, v235, v236, v237, v238)
            v223(v52());
            v223(v51(v233, v234, v235, v236, v237, v238));
        end, 
        SetRightClickContextInfo = function(v239)
            v223(v22(v239));
        end, 
        ValueChanged = function(v240, v241, v242, v243, v244, v245, v246)
            v223(v65(v240, v241, v242, v243, v244, v245, v246));
        end, 
        AddWaypoint = function()
            v223(v52());
        end, 
        AttachEditor = function(v247)
            v223(v53(v247));
        end, 
        ReleaseEditor = function(v248)
            v223(v58(v248));
        end, 
        SetEventEditingTick = function(v249)
            v223(v13(v249));
        end, 
        SetMotorData = not v75() and function(v250)
            v223(v19(v250));
        end or nil, 
        CreateAnimation = function(v251, v252)
            local v253 = v67.newRigAnimation(v251);
            v223(v55(v253, v252));
            v223(v16(false));
            v223(v17(false));
            v252:report("onCreateNewAnimation", v251, if not v253.Metadata then nil else v253.Metadata.Guid);
        end, 
        SetFrameRate = function(v254)
            v223(v14(v254));
        end, 
        SetGridSpeed = function(v255)
            v223(v15(v255));
        end, 
        SetPlaybackSpeed = function(v256)
            v223(v59(v256));
        end, 
        PromoteKeyframeSequence = function(v257)
            v223(v57(v257));
        end, 
        SetEditorMode = function(v258)
            v223(v12(v258));
        end, 
        SetPlayState = function(v259)
            v223(v20(v259));
        end, 
        SetReduceKeyframesDialogMode = function(v260)
            v223(v21(v260));
        end, 
        SwitchEditorMode = function(v261, v262)
            v223(v64(v261, v262));
        end, 
        SetCreatingAnimationFromVideo = function(v263)
            v223(v11(v263));
        end, 
        CancelAnimationFromVideoImport = function(v264)
            v223(v54(v264));
        end, 
        SetTopTrackIndex_ACTION = function(v265)
            v223(v25(v265));
        end, 
        SetTopTrackIndex = function(v266)
            v223(v61(v266));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v9, 
    Stylizer = l_ContextServices_0.Stylizer
})(v81)));
