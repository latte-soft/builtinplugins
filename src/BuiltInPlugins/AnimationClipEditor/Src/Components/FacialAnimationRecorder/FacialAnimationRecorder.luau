local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_CoreGui_0 = game:GetService("CoreGui");
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.LoadRecorderFrames);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.SetFacialRecordingMode);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetHaveToSetBackToNotLooping);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v14 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.CameraSelectionDialog);
local v15 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.ShowStyledDialog);
local v16 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.WarningDialog);
local v17 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.WarningOverlay);
local v18 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local l_RunService_0 = game:GetService("RunService");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v22 = v1.PureComponent:extend("FacialAnimationRecorder");
local v23 = game:DefineFastInt("FacialAnimationRecorderMaxRecordingTimeInSeconds", 60);
local v24 = game:DefineFastString("ACEFaceRecorderBiometricsLink", "https://en.help.roblox.com/hc/articles/8064749848980");
local v25 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyleModifier_0 = v25.Util.StyleModifier;
local _ = v25.Util.StyleValue;
local l_UI_0 = v25.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = v25.UI.Button;
local _ = l_UI_0.TextLabel;
local l_Container_0 = l_UI_0.Container;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local v36 = require(script.Parent.FlashingDot);
local v37 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v38 = require(l_script_FirstAncestor_0.Src.Actions.SetInReviewState);
local v39 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local l_Selection_0 = game:GetService("Selection");
local v41 = false;
local v42 = false;
v22.init = function(v43)
    v43.presentationGui = l_CoreGui_0.RobloxGui;
    v43.focus = l_Focus_0.new(v43.presentationGui);
    v43:setState({
        remainingSeconds = 0, 
        shouldShowCameraSelectionDialog = false, 
        isAgeRestricted = false, 
        shouldShowNoCamerasWarning = false, 
        deniedCameraPermission = false
    });
    v43.startRecording = function()
        v43.timeAtStartOfRecording = os.clock();
        v43.props.Analytics:report("onFacialAnimationRecordingStartRecording");
        v43:setState({
            isRecording = true
        });
    end;
    v43.resetLooping = function()
        local l_props_0 = v43.props;
        if l_props_0.haveToSetBackToNotLooping then
            l_props_0.haveToSetBackToNotLooping = false;
            local l_AnimationData_0 = l_props_0.AnimationData;
            if not (not l_AnimationData_0 or not l_AnimationData_0.Metadata.Looping) then
                v18.setLooping(l_AnimationData_0, false);
                l_props_0:SetAnimationData(l_AnimationData_0);
            end;
            return ;
        else
            return ;
        end;
    end;
    v43.endRecording = function()
        v43.timeAtEndOfRecording = os.clock();
        local l_props_1 = v43.props;
        l_props_1.Analytics:report("onFacialAnimationRecordingEndRecording", not not v43.timeAtStartOfRecording and v43.timeAtEndOfRecording - v43.timeAtStartOfRecording or 0);
        l_props_1.SetInReviewState(true);
        v43:setState({
            isRecording = false
        });
        v41 = v18.hasFacsData(v43.props.AnimationData);
        l_props_1:LoadRecorderFrames(v43.RecordedFrames, l_props_1.Analytics);
        l_props_1.SetFacialRecordingMode(false);
        v43:disconnect();
        l_props_1.StepAnimation(0);
        l_props_1.SetPlayState(v9.PLAY_STATE.Play);
        local v47 = nil;
        v47 = l_Selection_0.SelectionChanged:Connect(function(_)
            v47:Disconnect();
            l_props_1.SetInReviewState(false);
        end);
    end;
    v43.showCameraSelectionDialog = function()
        v43:setState({
            shouldShowCameraSelectionDialog = true
        });
    end;
    v43.hideCameraSelectionDialog = function()
        v43:setState({
            shouldShowCameraSelectionDialog = false
        });
    end;
    v43.movePlayheadToBeginning = function()
        wait(0.1);
        if v43.props.RootInstance then
            v43.props.StepAnimation(0);
        end;
    end;
    v43.dismissSelf = function()
        local l_props_2 = v43.props;
        l_props_2.SetInReviewState(false);
        l_props_2.SetFacialRecordingMode(false);
        v43.movePlayheadToBeginning();
    end;
    v43.toggleRecording = function()
        if not v43.state.isRecording then
            v43.startRecording();
            return ;
        else
            v43.endRecording();
            return ;
        end;
    end;
    v43.triggerReRecording = function()
        local l_props_3 = v43.props;
        l_props_3.Analytics:report("onFacialAnimationRecordingReRecordPressed");
        v42 = true;
        v43.resetLooping();
        l_props_3.SetPlayState(v9.PLAY_STATE.Pause);
        v43.movePlayheadToBeginning();
        v43.props.SetInReviewState(false);
        v43.props.SetFacialRecordingMode(true);
        v43:InitializeRecordingMode();
    end;
    v43.showAgeRestrictionError = function()
        local l_props_4 = v43.props;
        local l_Localization_0 = l_props_4.Localization;
        v43:setState({
            isAgeRestricted = true
        });
        v15(l_props_4.Plugin, l_props_4.Localization, l_props_4.Stylizer, l_props_4.Mouse, v16, {
            Title = l_Localization_0:getText("FaceCapture", "WarningTitle"), 
            TitleText = l_Localization_0:getText("FaceCapture", "AgeRestrictedTitle"), 
            BodyText = l_Localization_0:getText("FaceCapture", "AgeRestrictedBody"), 
            Buttons = {
                {
                    Key = "Ok", 
                    Text = l_props_4.Localization:getText("FaceCapture", "WarningDialogOk"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonPressed = v43.dismissSelf, 
            OnClose = v43.dismissSelf
        });
    end;
    v43.showBiometricDataCollectionDialog = function()
        local l_props_5 = v43.props;
        local l_Localization_1 = l_props_5.Localization;
        local l_FacialAnimationRecordingService_0 = game:GetService("FacialAnimationRecordingService");
        v15(l_props_5.Plugin, l_props_5.Localization, l_props_5.Stylizer, l_props_5.Mouse, v16, {
            Title = l_Localization_1:getText("FaceCapture", "WarningTitle"), 
            TitleText = l_Localization_1:getText("FaceCapture", "BioDataCollectionTitle"), 
            BodyText = l_Localization_1:getText("FaceCapture", "BioDataCollectionBody"), 
            Buttons = {
                {
                    Key = "Disagree", 
                    Text = l_Localization_1:getText("FaceCapture", "BioDataCollectionDisagree"), 
                    Style = "Round"
                }, 
                {
                    Key = "Agree", 
                    Text = l_Localization_1:getText("FaceCapture", "BioDataCollectionAgree"), 
                    Style = "Round"
                }
            }, 
            OnButtonPressed = function(v56)
                if v56 == "Agree" then
                    l_FacialAnimationRecordingService_0.BiometricDataConsent = true;
                    v43:StartupInitialize();
                    return ;
                else
                    v43.dismissSelf();
                    return ;
                end;
            end, 
            OnClose = v43.dismissSelf, 
            learnMoreUrl = v24, 
            learnMoreLabel = l_Localization_1:getText("FaceCapture", "LearnMoreLabel")
        });
    end;
    v43.numberOfCameras = function()
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v58 = 0;
        for _ in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            v58 = v58 + 1;
        end;
        return v58;
    end;
    v43.checkAndShowCameraWarning = function()
        v43:setState({
            shouldShowNoCamerasWarning = v43.numberOfCameras() == 0
        });
    end;
    v43.checkOrRequestCameraPermission = function()
        local l_FacialAnimationRecordingService_1 = game:GetService("FacialAnimationRecordingService");
        local v61 = {
            AUTHORIZED = "AUTHORIZED", 
            DENIED = "DENIED"
        };
        local l_status_0, l_result_0 = pcall(function()
            return l_FacialAnimationRecordingService_1:CheckOrRequestCameraPermission();
        end);
        if l_status_0 then
            v43:setState({
                deniedCameraPermission = l_result_0 == v61.DENIED
            });
            return ;
        else
            return ;
        end;
    end;
end;
v22.updateAvatarData = function(v64)
    local l_RootInstance_0 = v64.props.RootInstance;
    if not v64.Animator then
        v64.Animator = v8.getAnimationController(l_RootInstance_0):FindFirstChildOfClass("Animator");
    end;
end;
v22.InitializeRecordingMode = function(v66)
    if l_FaceAnimatorService_0 then
        l_FaceAnimatorService_0.FlipHeadOrientation = false;
        if not l_FaceAnimatorService_0:IsStarted() then
            l_FaceAnimatorService_0:Init(true, false);
        end;
        task.defer(v66.checkOrRequestCameraPermission);
        v66.RecordInfo = {};
        v66.RecordedFrames = {};
        v66.HeartbeatCount = 0;
        v7.clearPose(v66.props.Status.RootInstance);
        v7.focusCameraOnFace(v66.props.RootInstance);
        v66:updateAvatarData();
        v66.animation = Instance.new("TrackerStreamAnimation");
        v66.track = v66.Animator:LoadStreamAnimation(v66.animation);
        if v66.track then
            v66.track:Play();
            v66.heartbeatSignal = l_RunService_0.Heartbeat:Connect(function(v67)
                local l_v66_0 = v66;
                l_v66_0.HeartbeatCount = l_v66_0.HeartbeatCount + 1;
                l_v66_0 = v66.state.isRecording;
                if math.fmod(v66.HeartbeatCount, 30) == 0 then
                    v66.checkAndShowCameraWarning();
                end;
                v66:updateAvatarData();
                l_FaceAnimatorService_0:Step();
                v66.Animator:StepAnimations(v67);
                local l_TrackerData_0, v70, v71 = v66.track:GetTrackerData();
                local v72 = v71 > 0;
                v66:setState({
                    isCameraReady = v72
                });
                if not (not l_v66_0 or not v72) then
                    if not v66.RecordInfo.startTime then
                        v66.RecordInfo.startTime = v71;
                    end;
                    local l_v23_0 = v23;
                    local v74 = v71 - v66.RecordInfo.startTime;
                    local v75 = l_v23_0 - v74;
                    if v75 < 0 then
                        v66.endRecording();
                    end;
                    local v76 = math.floor(v74 * v9.TICK_FREQUENCY + 0.5);
                    local v77 = {};
                    for v78, v79 in pairs(l_TrackerData_0) do
                        v77[v78] = v79;
                    end;
                    v77.Head = v70;
                    v66.RecordedFrames[v76] = v77;
                    local v80 = math.floor(v75);
                    if v66.state.remainingSeconds ~= v80 then
                        v66:setState({
                            remainingSeconds = v80
                        });
                    end;
                end;
            end);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v22.StartupInitialize = function(v81)
    local l_FacialAnimationRecordingService_2 = game:GetService("FacialAnimationRecordingService");
    v42 = false;
    v41 = false;
    v81.props.SetInReviewState(false);
    v81.resetLooping();
    if not l_FacialAnimationRecordingService_2:IsAgeRestricted() then
        if l_FacialAnimationRecordingService_2.BiometricDataConsent then
            v81:InitializeRecordingMode();
            return ;
        else
            v81.showBiometricDataCollectionDialog();
            return ;
        end;
    else
        v81.showAgeRestrictionError();
        return ;
    end;
end;
v22.didMount = function(v83)
    v83:StartupInitialize();
end;
v22.render = function(v84)
    local l_props_6 = v84.props;
    local l_Stylizer_0 = l_props_6.Stylizer;
    local l_Localization_2 = v84.props.Localization;
    local l_isRecording_0 = v84.state.isRecording;
    local l_inReviewState_0 = l_props_6.inReviewState;
    local _ = l_props_6.haveToSetBackToNotLooping;
    local l_isCameraReady_0 = v84.state.isCameraReady;
    local l_isAgeRestricted_0 = v84.state.isAgeRestricted;
    local l_remainingSeconds_0 = v84.state.remainingSeconds;
    local l_deniedCameraPermission_0 = v84.state.deniedCameraPermission;
    local l_shouldShowCameraSelectionDialog_0 = v84.state.shouldShowCameraSelectionDialog;
    local l_shouldShowNoCamerasWarning_0 = v84.state.shouldShowNoCamerasWarning;
    local _ = l_props_6.StepAnimation;
    local _ = v84.state.AnimationData;
    local l_faceCaptureDefaultButtonIconColor_0 = l_Stylizer_0.faceCaptureTheme.faceCaptureDefaultButtonIconColor;
    local l_stopRecordingButtonImage_0 = l_Stylizer_0.faceCaptureTheme.stopRecordingButtonImage;
    local l_errorIcon_0 = l_Stylizer_0.faceCaptureTheme.errorIcon;
    return l_ContextServices_0.provide({
        v84.focus
    }, {
        RecordingPanelPortal = not l_isAgeRestricted_0 and v1.createElement(v1.Portal, {
            target = v84.presentationGui
        }, {
            RecordingPanelContainer = v1.createElement(l_Container_0, {
                Size = UDim2.new(0, 160, 0, 38), 
                Position = UDim2.new(0.5, 0, 1, -5), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Padding = {
                    Left = 5, 
                    Right = 5
                }
            }, {
                RecordingPanel = v1.createElement(l_Pane_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Padding = {
                        Left = 40, 
                        Right = 40
                    }, 
                    Layout = Enum.FillDirection.Horizontal, 
                    Spacing = 3, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    ZIndex = 1, 
                    Style = "RoundBox", 
                    Image = "", 
                    BackgroundColor3 = l_props_6.Stylizer.Color, 
                    BackgroundTransparency = 0.1, 
                    ImageTransparency = 0.1
                }, {
                    Corner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    RecordButton = not l_inReviewState_0 and v1.createElement(l_Button_0, {
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        ImageTransparency = 1, 
                        BackgroundTransparency = 0.5, 
                        BorderSizePixel = 1, 
                        OnClick = v84.toggleRecording, 
                        Text = "", 
                        LayoutOrder = 1, 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, 
                        StyleModifier = not l_isCameraReady_0 and l_StyleModifier_0.Disabled or nil
                    }, {
                        Image = v1.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Image = not not l_isRecording_0 and l_stopRecordingButtonImage_0 or "rbxasset://textures/AnimationEditor/FaceCaptureUI/button_control_record.png"
                        }), 
                        Tooltip = v1.createElement(l_Tooltip_0, {
                            Text = not not l_isRecording_0 and l_Localization_2:getText("FaceCapture", "TooltipStopRecording") or l_Localization_2:getText("FaceCapture", "TooltipStartRecording")
                        }); 
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    }), 
                    ReRecordButton = l_inReviewState_0 and v1.createElement(l_Button_0, {
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        ImageTransparency = 1, 
                        BackgroundTransparency = 0.5, 
                        BorderSizePixel = 1, 
                        OnClick = v84.triggerReRecording, 
                        Text = "", 
                        LayoutOrder = 1, 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, 
                        StyleModifier = not l_isCameraReady_0 and l_StyleModifier_0.Disabled or nil
                    }, {
                        Image = v1.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/ReRecordButton.png", 
                            ImageColor3 = l_faceCaptureDefaultButtonIconColor_0
                        }), 
                        Tooltip = v1.createElement(l_Tooltip_0, {
                            Text = l_Localization_2:getText("FaceCapture", "TooltipReRecording")
                        }); 
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    }), 
                    FlashingDot = l_isRecording_0 and v1.createElement(v36, {
                        Size = UDim2.new(0, 20, 0, 7), 
                        PaddingLeft = 30, 
                        LayoutOrder = 2
                    }), 
                    TextLabelButton = l_isCameraReady_0 and v1.createElement(l_Button_0, {
                        Size = (not not l_isRecording_0 and l_remainingSeconds_0) and UDim2.new(0, 68, 1, 0) or UDim2.new(0, 60, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        ImageTransparency = 1, 
                        BackgroundTransparency = 0.5, 
                        BorderSizePixel = 1, 
                        OnClick = (not not l_inReviewState_0 and v84.triggerReRecording or not (l_inReviewState_0 or l_isRecording_0) and v84.toggleRecording) or (not l_inReviewState_0 and l_isRecording_0) and v84.toggleRecording, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextTruncate = Enum.TextTruncate.None, 
                        TextSize = 15, 
                        Text = not not l_inReviewState_0 and l_Localization_2:getText("FaceCapture", "PanelReRecording") or not l_inReviewState_0 and (l_isRecording_0 and l_remainingSeconds_0 .. " sec   " or l_Localization_2:getText("FaceCapture", "PanelReady")), 
                        LayoutOrder = 3, 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            TextColor = l_props_6.Stylizer.TextColor
                        }
                    }), 
                    LoadingIndicator = (not l_inReviewState_0 and not l_isCameraReady_0) and v1.createElement(l_LoadingIndicator_0, {
                        Size = UDim2.new(0, 60, 0, 15), 
                        LayoutOrder = 2
                    }), 
                    CameraSelectionButton = (not l_inReviewState_0 and not l_isRecording_0) and v1.createElement(l_Button_0, {
                        Size = UDim2.fromOffset(30, 30), 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, 
                        Text = "", 
                        TextSize = 30, 
                        OnClick = v84.showCameraSelectionDialog, 
                        LayoutOrder = 4
                    }, {
                        Image = v1.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/MoreButton.png", 
                            ImageColor3 = l_faceCaptureDefaultButtonIconColor_0
                        }), 
                        Tooltip = v1.createElement(l_Tooltip_0, {
                            Text = l_Localization_2:getText("FaceCapture", "TooltipCameraSettings"), 
                            Position = UDim2.new(0, 50, 0, 50)
                        }); 
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    })
                }), 
                DismissButton = v1.createElement(l_Button_0, {
                    Style = {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, 
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 10, 
                    OnClick = function()
                        v84.dismissSelf();
                    end
                }, {
                    Image = v1.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 16, 0, 16), 
                        Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/CloseButton.png"
                    })
                })
            }), 
            WarningsPane = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0.5, 0, 1, -50), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = 8, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                ZIndex = 1, 
                Style = "RoundBox", 
                ImageTransparency = 1
            }, {
                NoCameraWarningOverlay = l_shouldShowNoCamerasWarning_0 and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "NoCameraWarningText"), 
                    Image = l_errorIcon_0, 
                    LayoutOrder = 1
                }), 
                CameraPermissionDeniedWarningOverlay = l_deniedCameraPermission_0 and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "CameraPermissionDeniedWarningText"), 
                    Image = l_errorIcon_0, 
                    LayoutOrder = 2
                }), 
                DetectingCameraOverlay = ((((not l_inReviewState_0 and not l_isCameraReady_0) and not l_isRecording_0) and not l_shouldShowNoCamerasWarning_0) and not l_deniedCameraPermission_0) and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "DetectingCameraTitle"), 
                    Image = "", 
                    LayoutOrder = 3
                }), 
                PreviousFacsWillBeOverwrittenInfoOverlay = (((l_inReviewState_0 and l_isCameraReady_0) and not l_isRecording_0) and (((not v42 and v41) and v84.timeAtEndOfRecording) and os.clock() - v84.timeAtEndOfRecording <= 5)) and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "OverwritingPreviousFacsTracksBody"), 
                    Image = "", 
                    LayoutOrder = 4
                })
            })
        }), 
        CameraSelectionDialog = l_shouldShowCameraSelectionDialog_0 and v1.createElement(v14, {
            OnClose = v84.hideCameraSelectionDialog
        })
    });
end;
v22.disconnect = function(v102)
    if v102.heartbeatSignal then
        v102.heartbeatSignal:Disconnect();
    end;
    if v102.track then
        v102.track:Stop(0);
    end;
    if v102.Animator then
        v102.Animator:StepAnimations(0);
    end;
end;
v22.willUnmount = function(v103)
    v42 = false;
    v103.resetLooping();
    v103.props.SetInReviewState(false);
    v103:disconnect();
end;
return v2.connect(function(v104, _)
    return {
        AnimationData = v104.AnimationData, 
        PlayState = v104.Status.PlayState, 
        RootInstance = v104.Status.RootInstance, 
        Status = v104.Status, 
        inReviewState = v104.Status.inReviewState, 
        haveToSetBackToNotLooping = v104.Status.haveToSetBackToNotLooping
    };
end, function(v106)
    return {
        LoadRecorderFrames = function(v107, v108, v109)
            v106(v10(v107, v108, v109));
        end, 
        SetFacialRecordingMode = function(v110)
            v106(v11(v110));
        end, 
        SetInReviewState = function(v111)
            v106(v38(v111));
        end, 
        SetPlayState = function(v112)
            v106(v37(v112));
        end, 
        StepAnimation = function(v113)
            v106(v39(v113));
        end, 
        SetHaveToSetBackToNotLooping = function(v114)
            v106(v12(v114));
        end, 
        SetAnimationData = function(_, v116)
            v106(v13(v116));
            local _ = v116.Metadata.Looping;
            v106(v39(0));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin
})(v22)));
