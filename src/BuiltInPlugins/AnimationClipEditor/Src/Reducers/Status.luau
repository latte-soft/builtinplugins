local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_join_0 = v2.Dictionary.join;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local _ = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v7 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
return v1.createReducer({
    Active = false, 
    AnimationFromVideoErroredOut = false, 
    AnimationFromVideoUploadStartTime = nil, 
    AnimationImportProgress = 0, 
    AnimationImportStatus = v4.ANIMATION_FROM_VIDEO_STATUS.Initializing, 
    AutoFocusFaceEnabled = false, 
    Clipboard = {}, 
    ClipboardType = nil, 
    CreatingAnimationFromVideo = false, 
    DefaultEulerAnglesOrder = Enum.RotationOrder.XYZ, 
    DefaultRotationType = v4.DEFAULT_ROTATION_TYPE, 
    EditingLength = 0, 
    EditorMode = v4.EDITOR_MODE.DopeSheet, 
    EditorModeSwitchTime = nil, 
    EventEditingTick = nil, 
    FaceControlsEditorOpenedTimestamp = nil, 
    FrameRate = v4.DEFAULT_FRAMERATE, 
    GridSpeed = 0, 
    haveToSetBackToNotLooping = false, 
    HorizontalScroll = 0, 
    HorizontalZoom = 0, 
    IKEnabled = false, 
    IKMode = v4.IK_MODE.FullBody, 
    IKOpenedTimestamp = nil, 
    inReviewState = false, 
    IsDirty = false, 
    IsLegacyAnimSaves = false, 
    LastSelectedPath = nil, 
    LegacyAnimationInstances = {}, 
    PinnedParts = {}, 
    PlaybackSpeed = 1, 
    PlaybackStartInfo = {}, 
    Playhead = 0, 
    PlayState = v4.PLAY_STATE.Pause, 
    ReadOnly = false, 
    ReduceKeyframesDialogMode = v4.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden, 
    RightClickContextInfo = {}, 
    RootInstance = nil, 
    SelectedEvents = {}, 
    SelectedKeyframes = {}, 
    SelectedTracks = nil, 
    ShowAsSeconds = not v7() and true or nil, 
    ShowEvents = true, 
    ShowFaceControlsEditorPanel = false, 
    ShowTree = false, 
    SnapMode = v4.SNAP_MODES.Frames, 
    SymmetryEnabled = false, 
    TimelineUnit = v4.TIMELINE_UNITS.SecondsDecimal, 
    Tool = Enum.RibbonTool.Rotate, 
    TopTrackIndex = 1, 
    Tracks = {}, 
    UnusedFacs = {}, 
    UnusedTracks = {}, 
    VerticalScroll = 0, 
    VerticalZoom = 0, 
    VisualizeBones = true, 
    WorldSpace = false
}, {
    SetActive = function(v8, v9)
        return l_join_0(v8, {
            Active = v9.active
        });
    end, 
    SetAnimationFromVideoErroredOut = function(v10, v11)
        return l_join_0(v10, {
            AnimationFromVideoErroredOut = v11.animationFromVideoErroredOut
        });
    end, 
    SetAnimationFromVideoUploadStartTime = function(v12, v13)
        return l_join_0(v12, {
            AnimationFromVideoUploadStartTime = v13.animationFromVideoUploadStartTime
        });
    end, 
    SetAnimationImportProgress = function(v14, v15)
        return l_join_0(v14, {
            AnimationImportProgress = v15.animationImportProgress
        });
    end, 
    SetAnimationImportStatus = function(v16, v17)
        return l_join_0(v16, {
            AnimationImportStatus = v17.animationImportStatus
        });
    end, 
    SetAutoFocusFaceEnabled = function(v18, v19)
        return l_join_0(v18, {
            AutoFocusFaceEnabled = v19.autoFocusFaceEnabled
        });
    end, 
    SetBoneVisualization = function(v20, v21)
        return l_join_0(v20, {
            VisualizeBones = v21.visualizeBones
        });
    end, 
    SetClipboard = function(v22, v23)
        return l_join_0(v22, {
            Clipboard = v23.clipboard, 
            ClipboardType = v23.clipboardType
        });
    end, 
    SetCreatingAnimationFromVideo = function(v24, v25)
        return l_join_0(v24, {
            CreatingAnimationFromVideo = v25.creatingAnimationFromVideo
        });
    end, 
    SetDefaultEulerAnglesOrder = function(v26, v27)
        return l_join_0(v26, {
            DefaultEulerAnglesOrder = v27.defaultEulerAnglesOrder
        });
    end, 
    SetDefaultRotationType = function(v28, v29)
        return l_join_0(v28, {
            DefaultRotationType = v29.defaultRotationType
        });
    end, 
    SetEditingLength = function(v30, v31)
        return l_join_0(v30, {
            EditingLength = v31.editingLength
        });
    end, 
    SetEditorMode = function(v32, v33)
        return l_join_0(v32, {
            EditorMode = v33.editorMode, 
            EditorModeSwitchTime = v33.editorModeSwitchTime
        });
    end, 
    SetEventEditingTick = function(v34, v35)
        return l_join_0(v34, {
            EventEditingTick = v35.eventEditingTick or v2.None
        });
    end or nil, 
    SetFaceControlsEditorOpenedTimestamp = function(v36, v37)
        return l_join_0(v36, {
            FaceControlsEditorOpenedTimestamp = v37.FaceControlsEditorOpenedTimestamp
        });
    end, 
    SetFrameRate = function(v38, v39)
        return l_join_0(v38, {
            FrameRate = v39.frameRate
        });
    end, 
    SetGridSpeed = function(v40, v41)
        return l_join_0(v40, {
            GridSpeed = v41.gridSpeed
        });
    end, 
    SetHaveToSetBackToNotLooping = function(v42, v43)
        return l_join_0(v42, {
            haveToSetBackToNotLooping = v43.haveToSetBackToNotLooping
        });
    end, 
    SetHorizontalScrollZoom = function(v44, v45)
        return l_join_0(v44, {
            HorizontalScroll = v45.horizontalScroll, 
            HorizontalZoom = v45.horizontalZoom
        });
    end, 
    SetIKEnabled = function(v46, v47)
        return l_join_0(v46, {
            IKEnabled = v47.ikEnabled
        });
    end, 
    SetIKMode = function(v48, v49)
        return l_join_0(v48, {
            IKMode = v49.ikMode
        });
    end, 
    SetIKOpenedTimestamp = function(v50, v51)
        return l_join_0(v50, {
            IKOpenedTimestamp = v51.iKOpenedTimestamp
        });
    end, 
    SetInReviewState = function(v52, v53)
        return l_join_0(v52, {
            inReviewState = v53.inReviewState
        });
    end, 
    SetIsDirty = function(v54, v55)
        return l_join_0(v54, {
            IsDirty = v55.isDirty
        });
    end, 
    SetIsLegacyAnimSaves = function(v56, v57)
        return l_join_0(v56, {
            IsLegacyAnimSaves = v57.isLegacyAnimSaves
        });
    end, 
    SetLastSelectedPath = function(v58, v59)
        return l_join_0(v58, {
            LastSelectedPath = v59.lastSelectedPath or v2.None
        });
    end, 
    SetLegacyAnimationInstances = function(v60, v61)
        return l_join_0(v60, {
            LegacyAnimationInstances = v61.legacyAnimationInstances
        });
    end, 
    SetMotorData = not v5() and function(v62, v63)
        return l_join_0(v62, {
            MotorData = v63.motorData
        });
    end or nil, 
    SetPinnedParts = function(v64, v65)
        return l_join_0(v64, {
            PinnedParts = v65.pinnedParts
        });
    end, 
    SetPlaybackSpeed = function(v66, v67)
        return l_join_0(v66, {
            PlaybackSpeed = v67.playbackSpeed
        });
    end, 
    SetPlaybackStartInfo = function(v68, v69)
        return l_join_0(v68, {
            PlaybackStartInfo = v69.playbackStartInfo
        });
    end, 
    SetPlayhead = function(v70, v71)
        return l_join_0(v70, {
            Playhead = v71.playhead
        });
    end, 
    SetPlayState = function(v72, v73)
        return l_join_0(v72, {
            PlayState = v73.playState
        });
    end, 
    SetReadOnly = function(v74, v75)
        return l_join_0(v74, {
            ReadOnly = v75.readOnly
        });
    end, 
    SetReduceKeyframesDialogMode = function(v76, v77)
        return l_join_0(v76, {
            ReduceKeyframesDialogMode = v77.reduceKeyframesDialogMode
        });
    end, 
    SetRightClickContextInfo = function(v78, v79)
        return l_join_0(v78, {
            RightClickContextInfo = v79.rightClickContextInfo
        });
    end, 
    SetRootInstance = function(v80, v81)
        return l_join_0(v80, {
            RootInstance = v81.rootInstance or v2.None
        });
    end, 
    SetSelectedEvents = function(v82, v83)
        return l_join_0(v82, {
            SelectedEvents = v83.selected
        });
    end, 
    SetSelectedKeyframes = function(v84, v85)
        return l_join_0(v84, {
            SelectedKeyframes = v85.selected
        });
    end, 
    SetSelectedTrackInstances = function(v86, v87)
        return l_join_0(v86, {
            SelectedTrackInstances = v87.selectedTrackInstances or v2.None
        });
    end, 
    SetSelectedTracks = function(v88, v89)
        return l_join_0(v88, {
            SelectedTracks = v89.selectedTracks or v2.None
        });
    end, 
    SetShowAsSeconds = not v7() and function(v90, v91)
        return l_join_0(v90, {
            ShowAsSeconds = v91.showAsSeconds
        });
    end or nil, 
    SetShowEvents = function(v92, v93)
        return l_join_0(v92, {
            ShowEvents = v93.showEvents
        });
    end, 
    SetShowFaceControlsEditorPanel = function(v94, v95)
        return l_join_0(v94, {
            ShowFaceControlsEditorPanel = v95.showFaceControlsEditorPanel
        });
    end, 
    SetShowTree = function(v96, v97)
        return l_join_0(v96, {
            ShowTree = v97.showTree
        });
    end, 
    SetSnapMode = function(v98, v99)
        return l_join_0(v98, {
            SnapMode = v99.snapMode
        });
    end, 
    SetStartingPose = function(v100, v101)
        return l_join_0(v100, {
            StartingPose = v101.startingPose or v2.None
        });
    end, 
    SetSymmetryEnabled = function(v102, v103)
        return l_join_0(v102, {
            SymmetryEnabled = v103.symmetryEnabled
        });
    end, 
    SetTimelineUnit = function(v104, v105)
        return l_join_0(v104, {
            TimelineUnit = v105.timelineUnit
        });
    end, 
    SetTool = function(v106, v107)
        return l_join_0(v106, {
            Tool = v107.tool
        });
    end, 
    SetTopTrackIndex = function(v108, v109)
        return l_join_0(v108, {
            TopTrackIndex = v109.topTrackIndex
        });
    end, 
    SetTracks = function(v110, v111)
        return l_join_0(v110, {
            Tracks = v111.tracks, 
            UnusedTracks = v111.unusedTracks, 
            UnusedFacs = v111.unusedFacs
        });
    end, 
    SetVerticalScrollZoom = function(v112, v113)
        return l_join_0(v112, {
            VerticalScroll = v113.verticalScroll, 
            VerticalZoom = v113.verticalZoom
        });
    end, 
    ToggleWorldSpace = function(v114, _)
        return l_join_0(v114, {
            WorldSpace = not v114.WorldSpace
        });
    end
});
