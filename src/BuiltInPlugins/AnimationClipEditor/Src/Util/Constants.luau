local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = game:DefineFastFlag("ACEFixEditorControllerClamp", false);
local v2 = {
    PLUGIN_NAME = "AnimationClipEditor", 
    PLUGIN_ICON = "rbxlocaltheme://AnimationEditor", 
    CHECK_IMAGE = "rbxasset://textures/ui/LuaChat/icons/ic-check@2x.png", 
    SETTINGS = {
        EulerAnglesOrder = "ACE_EulerAnglesOrder", 
        RotationType = "ACE_RotationType", 
        ShowAsSeconds = "ACE_ShowAsSeconds", 
        SnapMode = "ACE_SnapMode", 
        TimelineUnit = "ACE_TimelineUnit"
    }, 
    FOLDERS = {
        AnimSaves = "RBX_ANIMSAVES", 
        Microbones = "RBX_MICROBONE_NODES"
    }, 
    ANIMATION_UPLOAD_SUCCESS_EVENT_NAME = "animationUploadSuccess", 
    ZOOM_INCREMENT = 0.04, 
    DEFAULT_FRAMERATE = 30, 
    MIN_FRAMERATE = 1, 
    MAX_FRAMERATE = 120, 
    MIN_PLAYBACK_SPEED = 0.01, 
    MAX_PLAYBACK_SPEED = 10, 
    MAX_TIME = 1800, 
    TICK_FREQUENCY = 2400, 
    DEFAULT_TICK_FREQUENCY = 2400, 
    MAX_DISPLAYED_TIME = 30, 
    MIN_TIMELINE_RANGE = 30, 
    MAIN_FLOATING_SIZE = Vector2.new(640, 200), 
    MAIN_TEST_SIZE = Vector2.new(1024, 200), 
    MAX_WAYPOINT_SIZE = 20, 
    MIN_SPACE_BETWEEN_KEYS = 8, 
    TRACK_PADDING_SMALL = 72, 
    TRACK_PADDING_MEDIUM = 84, 
    TRACK_PADDING_LARGE = 96, 
    SUMMARY_TRACK_HEIGHT = 22, 
    TRACK_HEIGHT = 22, 
    EVENT_MARKER_SIZE = UDim2.new(0, 6, 0, 20), 
    EVENT_MARKER_BORDER_SIZE = UDim2.new(0, 8, 0, 22), 
    TIMELINE_HEIGHT = 24, 
    CONTROLS_WIDTH = 200, 
    TIME_DISPLAY_WIDTH = 100, 
    SCROLL_BAR_SIZE = 17, 
    SCROLL_BAR_PADDING = 2, 
    TRACK_LIST_START_WIDTH = not v1 and 440 or 445, 
    TRACK_LIST_MIN_WIDTH = 440, 
    TIMELINE_MIN_WIDTH = not v1 and 200 or 190, 
    INDENT_PADDING = 8, 
    ARROW_SIZE = 10, 
    TRACKLIST_BUTTON_SIZE = 16, 
    TRACKLIST_RIGHT_PADDING = 8, 
    NUMBERBOX_WIDTH = 80, 
    NUMBERBOX_PADDING = 4, 
    NUMBERBOX_DRAG_MULTIPLIER = 0.05, 
    NUMBERBOX_FACS_DRAG_MULTIPLIER = 0.01, 
    NUMBERTRACK_PADDING = 5, 
    KEYFRAME_WIDTH = 6, 
    KEYFRAME_BORDER_SIZE = 1, 
    KEYFRAME_BORDER_SIZE_SELECTED = 2, 
    SUMMARY_KEYFRAME_WIDTH = 8, 
    MAX_VISIBLE_KEYFRAMES = 1000, 
    LENGTH_PADDING = 1, 
    NUM_TICKS = 5, 
    TICK_SPACING = 125, 
    SCALE_NUM_TICKS = 5, 
    SCALE_TICK_SPACING = 300, 
    PROMPT_SIZE = UDim2.new(0, 320, 0, 130), 
    PROMPT_BUTTON_SIZE = Vector2.new(100, 25), 
    PROMPT_BUTTON_PADDING = 10, 
    PROMPT_VERTICAL_PADDING = 15, 
    PROMPT_HORIZONTAL_PADDING = 20, 
    TRANSLATION_STIFFNESS = 0.7, 
    ROTATION_STIFFNESS = 0.7, 
    MIN_TRANSLATION_STIFFNESS = 0.01, 
    MIN_ROTATION_STIFFNESS = 0.01, 
    MIN_EFFECTOR_DISTANCE = 10, 
    JOINT_TYPES = {
        AnimationConstraint = "AnimationConstraint", 
        Bone = "Bone", 
        Motor6D = "Motor6D"
    }, 
    BONE_NODE_COLOR = Color3.fromRGB(232, 112, 240), 
    BONE_LINK_COLOR = Color3.fromRGB(107, 50, 124), 
    BONE_CONE_COLOR = Color3.fromRGB(207, 88, 224), 
    BONE_NODE_TRANSPARENCY = 0.15, 
    BONE_LINK_TRANSPARENCY = 0.45, 
    BONE_TRANSPARENCY_DEFAULT = 0.3, 
    BONE_TRANSPARENCY_HOVER = 0, 
    BONE_COLOR_DEFAULT = Color3.fromRGB(207, 88, 224), 
    BONE_COLOR_HOVER = Color3.fromRGB(300, 88, 224), 
    BONE_COLOR_SELECTED = Color3.fromRGB(13, 105, 172), 
    LENGTH_TO_RADIUS_RATIO = 15, 
    SNAP_TO_KEYFRAME_THRESHOLD = 30, 
    SNAP_MODES = {
        Keyframes = "Keyframes", 
        Frames = "Frames", 
        None = "None"
    }, 
    TEMPORARY_CONSTRAINTS = "ROBLOX_R15_IK_CONSTRAINTS", 
    DEFAULT_IMPORTED_NAME = "Imported Animation Clip", 
    DEFAULT_AUTOSAVE_NAME = "Automatic Save", 
    DEFAULT_KEYFRAME_NAME = "Keyframe", 
    FACE_CONTROLS_FOLDER = "FaceControls", 
    TRACK_TYPES = {
        CFrame = "CFrame", 
        Facs = "Facs", 
        Other = "Other", 
        Position = "Position", 
        Number = "Number", 
        Angle = "Angle", 
        Quaternion = "Quaternion", 
        EulerAngles = "EulerAngles"
    }, 
    INSTANCE_TYPES = {
        Skeleton = if require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport)() then nil else "Skeleton", 
        Rig = "Rig"
    }, 
    PROPERTY_KEYS = {
        Position = "Position", 
        Rotation = "Rotation", 
        X = "X", 
        Y = "Y", 
        Z = "Z"
    }, 
    ACTION_KEYS = {
        Edit = "Edit", 
        Delete = "Delete"
    }, 
    CLIP_DROPDOWN_TYPES = {
        Clip = "Clip", 
        NewClip = "New Clip", 
        Separator = "Separator"
    }, 
    RIG_ERRORS = {
        NameCollision = "NameCollision", 
        BoneNameCollision = "BoneNameCollision", 
        NoMotors = "NoMotors", 
        PartsAnchored = "PartsAnchored", 
        MissingPart0 = "MissingPart0_Migrated", 
        MissingPart1 = "MissingPart1_Migrated", 
        MultipleParents = "MultipleParents_Migrated", 
        CircularRig = "CircularRig", 
        NoAnimationController = "NoAnimationController", 
        FaceControlsParent = "FaceControlsParent", 
        MultipleFaceControls = "MultipleFaceControls"
    }, 
    EDITOR_ERRORS = {
        OpenedWhileRunning = "OpenedWhileRunning"
    }, 
    EDITOR_ERRORS_HEADER_KEY = "EditorErrorsHeader", 
    EDITOR_ERRORS_KEY = "EditorErrors", 
    RIG_ERRORS_HEADER_KEY = "ErrorsHeader", 
    RIG_ERRORS_KEY = "RigErrors", 
    DIALOG_KEY = "Dialog", 
    TIMELINE_UNITS = {
        SecondsDecimal = "SecondsDecimal", 
        Seconds = "Seconds", 
        Frames = "Frames"
    }, 
    TIMELINE_UNITS_ORDER = {
        "SecondsDecimal", 
        "Seconds", 
        "Frames"
    }, 
    FRAMERATES = {
        FPS_24 = 24, 
        FPS_30 = 30, 
        FPS_60 = 60, 
        FPS_120 = 120, 
        CUSTOM = -1
    }, 
    GRIDSPEEDS = {
        Static = 0, 
        Default = 16, 
        FromRig = "FromRig", 
        Custom = "Custom"
    }, 
    PLAYBACK_SPEEDS = {
        PBS_025 = 0.25, 
        PBS_05 = 0.5, 
        PBS_1 = 1, 
        PBS_2 = 2, 
        PBS_4 = 4, 
        CUSTOM = -1
    }, 
    CLIPBOARD_TYPE = {
        Events = "Events", 
        Keyframes = "Keyframes", 
        Channels = "Channels"
    }, 
    MENU_SEPARATOR = {
        ShowSeparator = true
    }, 
    KEYFRAME_STYLE = {
        Primary = "Primary", 
        Error = "Error", 
        PrimaryError = "PrimaryError", 
        [Enum.PoseEasingStyle.Bounce] = "Bounce", 
        [Enum.PoseEasingStyle.Constant] = "Constant", 
        [Enum.PoseEasingStyle.Cubic] = "Cubic", 
        [Enum.PoseEasingStyle.Elastic] = "Elastic"
    }, 
    MENU_ICONS = {
        [Enum.PoseEasingStyle.Linear] = "rbxasset://textures/AnimationEditor/image_keyframe_linear_unselected.png", 
        [Enum.PoseEasingStyle.Bounce] = "rbxasset://textures/AnimationEditor/image_keyframe_bounce_unselected.png", 
        [Enum.PoseEasingStyle.Constant] = "rbxasset://textures/AnimationEditor/image_keyframe_constant_unselected.png", 
        [Enum.PoseEasingStyle.Cubic] = "rbxasset://textures/AnimationEditor/image_keyframe_cubic_unselected.png", 
        [Enum.PoseEasingStyle.Elastic] = "rbxasset://textures/AnimationEditor/image_keyframe_elastic_unselected.png"
    }, 
    IK_MODE = {
        BodyPart = "BodyPart", 
        FullBody = "FullBody"
    }, 
    SIGNAL_KEYS = {
        SelectionChanged = "SelectionChanged", 
        ScrubberChanged = "ScrubberChanged"
    }, 
    R15_PARTS = {
        UpperTorso = "UpperTorso", 
        LowerTorso = "LowerTorso", 
        LeftFoot = "LeftFoot", 
        RightFoot = "RightFoot", 
        HumanoidRootPart = "HumanoidRootPart", 
        Head = "Head", 
        RightUpperLeg = "RightUpperLeg", 
        RightLowerLeg = "RightLowerLeg", 
        RightHand = "RightHand", 
        LeftUpperLeg = "LeftUpperLeg", 
        LeftLowerLeg = "LeftLowerLeg", 
        LeftHand = "LeftHand", 
        RightUpperArm = "RightUpperArm", 
        RightLowerArm = "RightLowerArm", 
        LeftUpperArm = "LeftUpperArm", 
        LeftLowerArm = "LeftLowerArm"
    }, 
    CONSTRAINTS_CONFIG = {
        Ankle = {
            Type = "BallSocketConstraint", 
            LimitsEnabled = false, 
            Restitution = 0, 
            TwistLimitsEnabled = false, 
            UpperAngle = 20, 
            TwistLowerAngle = -20, 
            TwistUpperAngle = 20
        }, 
        Knee = {
            Type = "HingeConstraint", 
            LimitsEnabled = true, 
            LowerAngle = -135, 
            Restitution = 0, 
            UpperAngle = -10
        }, 
        Hip = {
            Type = "BallSocketConstraint", 
            LimitsEnabled = true, 
            Restitution = 0, 
            TwistLimitsEnabled = true, 
            UpperAngle = 80, 
            TwistLowerAngle = -3, 
            TwistUpperAngle = 3, 
            Axis = Vector3.new(0, -1, 0), 
            SecondaryAxis = Vector3.new(0, 0, 1)
        }, 
        Waist = {
            Type = "HingeConstraint", 
            LimitsEnabled = true, 
            LowerAngle = -90, 
            Restitution = 0, 
            UpperAngle = 90
        }, 
        Shoulder = {
            Type = "BallSocketConstraint", 
            LimitsEnabled = true, 
            Restitution = 0, 
            TwistLimitsEnabled = false, 
            UpperAngle = 170, 
            TwistLowerAngle = -90, 
            TwistUpperAngle = 135
        }, 
        Elbow = {
            Type = "HingeConstraint", 
            LimitsEnabled = true, 
            LowerAngle = 0, 
            Restitution = 0, 
            UpperAngle = 135
        }, 
        Wrist = {
            Type = "BallSocketConstraint", 
            LimitsEnabled = true, 
            Restitution = 0, 
            TwistLimitsEnabled = true, 
            UpperAngle = 20, 
            TwistLowerAngle = 0, 
            TwistUpperAngle = 0
        }, 
        Neck = {
            Type = "BallSocketConstraint", 
            LimitsEnabled = true, 
            Restitution = 0, 
            TwistLimitsEnabled = false, 
            UpperAngle = 30, 
            TwistLowerAngle = -70, 
            TwistUpperAngle = 70
        }
    }, 
    FACS_REGIONS = {
        Mouth = "Mouth", 
        Jaw = "Jaw", 
        Brows = "Brows", 
        Eyes = "Eyes", 
        Tongue = "Tongue", 
        Other = "Other"
    }, 
    POSE_EASING_STYLE_TO_KEY_INTERPOLATION = {
        [Enum.PoseEasingStyle.Constant] = Enum.KeyInterpolationMode.Constant, 
        [Enum.PoseEasingStyle.Linear] = Enum.KeyInterpolationMode.Linear, 
        [Enum.PoseEasingStyle.Cubic] = Enum.KeyInterpolationMode.Cubic, 
        [Enum.PoseEasingStyle.Bounce] = Enum.KeyInterpolationMode.Cubic, 
        [Enum.PoseEasingStyle.Elastic] = Enum.KeyInterpolationMode.Cubic
    }, 
    KEY_INTERPOLATION_MODE_ORDER = {
        Enum.KeyInterpolationMode.Linear, 
        Enum.KeyInterpolationMode.Constant, 
        Enum.KeyInterpolationMode.Cubic
    }, 
    EASING_STYLE_ORDER = {
        Enum.PoseEasingStyle.Linear, 
        Enum.PoseEasingStyle.Constant, 
        Enum.PoseEasingStyle.Cubic, 
        Enum.PoseEasingStyle.Elastic, 
        Enum.PoseEasingStyle.Bounce
    }, 
    EASING_DIRECTION_ORDER = {
        Enum.PoseEasingDirection.In, 
        Enum.PoseEasingDirection.Out, 
        Enum.PoseEasingDirection.InOut
    }, 
    EULER_ANGLES_ORDER = {
        Enum.RotationOrder.XYZ, 
        Enum.RotationOrder.XZY, 
        Enum.RotationOrder.YXZ, 
        Enum.RotationOrder.YZX, 
        Enum.RotationOrder.ZXY, 
        Enum.RotationOrder.ZYX
    }, 
    SLOPES = {
        Right = "Right", 
        Left = "Left"
    }, 
    DRAG_MODE = {
        Keyframe = "Keyframe", 
        Tangent = "Tangent"
    }, 
    PLAY_STATE = {
        Reverse = "Reverse", 
        Pause = "Pause", 
        Play = "Play", 
        Record = "Record"
    }, 
    EDITOR_MODE = {
        DopeSheet = "DopeSheet", 
        CurveCanvas = "CurveCanvas"
    }, 
    CURVE_WIDTH = 1, 
    CURVE_WIDTH_SELECTED = 2, 
    CURVE_RESOLUTION = 25, 
    CURVE_REFINEMENT = 5, 
    CURVE_INTERVAL = 5, 
    CURVE_CANVAS_PADDING = 0.1, 
    CURVE_CANVAS_MIN_RANGE = 0.2, 
    TANGENT_CONTROL_LENGTH = 0.09, 
    TANGENT_CONTROL_WIDTH = 1, 
    SCRUBBER_MARKER_WIDTH = 3, 
    NUMBER_PRECISION = 1000, 
    NUMBER_FACS_PRECISION = 100, 
    SCALE_TYPE = {
        Number = "Position", 
        Angle = "Angle"
    }, 
    TICK_LABEL_SIZE = UDim2.new(0, 25, 0, 15), 
    TOGGLE_EDITOR_BUTTON_WIDTH = 17, 
    TOGGLE_EDITOR_BUTTON_HEIGHT = 16, 
    CLAMPED_AUTO_TANGENT_THRESHOLD = 0.25, 
    ANIMATION_FROM_VIDEO_STATUS = {
        Initializing = 0, 
        Pending = 1, 
        Processing = 2, 
        RequiresModeration = 3, 
        Error = 4, 
        ModerationRejected = 5, 
        Success = 6, 
        InputTooLong = 7, 
        InputHasNoPerson = 8, 
        InputUnstable = 9, 
        TimedOut = 10, 
        Cancelled = 11, 
        MultiplePeopleInFrame = 12, 
        UploadingData = 1001, 
        ErrorUploadingData = 2001
    }, 
    ANIMATION_TYPE = {
        KeyframeSequence = "KeyframeSequence", 
        CurveAnimation = "CurveAnimation"
    }, 
    CANVAS_ZOOM_INCREMENT = 0.1, 
    REDUCE_KEYFRAMES_DIALOG_MODE = {
        Hidden = "Hidden", 
        FromImportFBX = "FromImportFBX", 
        FromImportLiveAnimationCreator = "FromImportLiveAnimationCreator", 
        FromImportFaceRecorder = "FromImportFaceRecorder", 
        FromMenu = "FromMenu"
    }, 
    NAMED_KEYFRAMES_CHANNEL = "NamedKeyframeEvent", 
    LEAF_BONE_LENGTH_RATIO = 0.75
};
v2.MAIN_MINIMUM_SIZE = Vector2.new((v2.TRACK_LIST_MIN_WIDTH + v2.TIMELINE_MIN_WIDTH) + (not v1 and 0 or 10), 200);
v2.MAX_ANIMATION_LENGTH = v2.MAX_TIME * v2.TICK_FREQUENCY;
v2.TRACKS_SUBSETS_TYPE = {
    Face = "Face", 
    Body = "Body"
};
v2.PartToConstraintConfigMap = {
    [v2.R15_PARTS.UpperTorso] = v2.CONSTRAINTS_CONFIG.Waist, 
    [v2.R15_PARTS.RightUpperLeg] = v2.CONSTRAINTS_CONFIG.Hip, 
    [v2.R15_PARTS.LeftUpperLeg] = v2.CONSTRAINTS_CONFIG.Hip, 
    [v2.R15_PARTS.RightUpperArm] = v2.CONSTRAINTS_CONFIG.Shoulder, 
    [v2.R15_PARTS.LeftUpperArm] = v2.CONSTRAINTS_CONFIG.Shoulder, 
    [v2.R15_PARTS.Head] = v2.CONSTRAINTS_CONFIG.Neck, 
    [v2.R15_PARTS.LeftLowerArm] = v2.CONSTRAINTS_CONFIG.Elbow, 
    [v2.R15_PARTS.LeftHand] = v2.CONSTRAINTS_CONFIG.Wrist, 
    [v2.R15_PARTS.RightLowerArm] = v2.CONSTRAINTS_CONFIG.Elbow, 
    [v2.R15_PARTS.RightHand] = v2.CONSTRAINTS_CONFIG.Wrist, 
    [v2.R15_PARTS.LeftLowerLeg] = v2.CONSTRAINTS_CONFIG.Knee, 
    [v2.R15_PARTS.LeftFoot] = v2.CONSTRAINTS_CONFIG.Ankle, 
    [v2.R15_PARTS.RightLowerLeg] = v2.CONSTRAINTS_CONFIG.Knee, 
    [v2.R15_PARTS.RightFoot] = v2.CONSTRAINTS_CONFIG.Ankle
};
v2.R15links = {
    [v2.R15_PARTS.LowerTorso] = v2.R15_PARTS.HumanoidRootPart, 
    [v2.R15_PARTS.UpperTorso] = v2.R15_PARTS.LowerTorso, 
    [v2.R15_PARTS.RightUpperLeg] = v2.R15_PARTS.LowerTorso, 
    [v2.R15_PARTS.LeftUpperLeg] = v2.R15_PARTS.LowerTorso, 
    [v2.R15_PARTS.RightUpperArm] = v2.R15_PARTS.UpperTorso, 
    [v2.R15_PARTS.LeftUpperArm] = v2.R15_PARTS.UpperTorso, 
    [v2.R15_PARTS.Head] = v2.R15_PARTS.UpperTorso, 
    [v2.R15_PARTS.LeftLowerArm] = v2.R15_PARTS.LeftUpperArm, 
    [v2.R15_PARTS.LeftHand] = v2.R15_PARTS.LeftLowerArm, 
    [v2.R15_PARTS.RightLowerArm] = v2.R15_PARTS.RightUpperArm, 
    [v2.R15_PARTS.RightHand] = v2.R15_PARTS.RightLowerArm, 
    [v2.R15_PARTS.LeftLowerLeg] = v2.R15_PARTS.LeftUpperLeg, 
    [v2.R15_PARTS.LeftFoot] = v2.R15_PARTS.LeftLowerLeg, 
    [v2.R15_PARTS.RightLowerLeg] = v2.R15_PARTS.RightUpperLeg, 
    [v2.R15_PARTS.RightFoot] = v2.R15_PARTS.RightLowerLeg
};
v2.FacsControlToRegionMap = {
    ChinRaiserUpperLip = v2.FACS_REGIONS.Mouth, 
    ChinRaiser = v2.FACS_REGIONS.Mouth, 
    FlatPucker = v2.FACS_REGIONS.Mouth, 
    Funneler = v2.FACS_REGIONS.Mouth, 
    LowerLipSuck = v2.FACS_REGIONS.Mouth, 
    LipPresser = v2.FACS_REGIONS.Mouth, 
    LipsTogether = v2.FACS_REGIONS.Mouth, 
    MouthLeft = v2.FACS_REGIONS.Mouth, 
    MouthRight = v2.FACS_REGIONS.Mouth, 
    Pucker = v2.FACS_REGIONS.Mouth, 
    UpperLipSuck = v2.FACS_REGIONS.Mouth, 
    LeftCheekPuff = v2.FACS_REGIONS.Mouth, 
    LeftDimpler = v2.FACS_REGIONS.Mouth, 
    LeftLipCornerDown = v2.FACS_REGIONS.Mouth, 
    LeftLowerLipDepressor = v2.FACS_REGIONS.Mouth, 
    LeftLipCornerPuller = v2.FACS_REGIONS.Mouth, 
    LeftLipStretcher = v2.FACS_REGIONS.Mouth, 
    LeftUpperLipRaiser = v2.FACS_REGIONS.Mouth, 
    RightCheekPuff = v2.FACS_REGIONS.Mouth, 
    RightDimpler = v2.FACS_REGIONS.Mouth, 
    RightLipCornerDown = v2.FACS_REGIONS.Mouth, 
    RightLowerLipDepressor = v2.FACS_REGIONS.Mouth, 
    RightLipCornerPuller = v2.FACS_REGIONS.Mouth, 
    RightLipStretcher = v2.FACS_REGIONS.Mouth, 
    RightUpperLipRaiser = v2.FACS_REGIONS.Mouth, 
    JawDrop = v2.FACS_REGIONS.Jaw, 
    JawLeft = v2.FACS_REGIONS.Jaw, 
    JawRight = v2.FACS_REGIONS.Jaw, 
    Corrugator = v2.FACS_REGIONS.Brows, 
    LeftBrowLowerer = v2.FACS_REGIONS.Brows, 
    LeftOuterBrowRaiser = v2.FACS_REGIONS.Brows, 
    LeftNoseWrinkler = v2.FACS_REGIONS.Brows, 
    LeftInnerBrowRaiser = v2.FACS_REGIONS.Brows, 
    RightBrowLowerer = v2.FACS_REGIONS.Brows, 
    RightOuterBrowRaiser = v2.FACS_REGIONS.Brows, 
    RightInnerBrowRaiser = v2.FACS_REGIONS.Brows, 
    RightNoseWrinkler = v2.FACS_REGIONS.Brows, 
    EyesLookDown = v2.FACS_REGIONS.Eyes, 
    EyesLookLeft = v2.FACS_REGIONS.Eyes, 
    EyesLookUp = v2.FACS_REGIONS.Eyes, 
    EyesLookRight = v2.FACS_REGIONS.Eyes, 
    LeftCheekRaiser = v2.FACS_REGIONS.Eyes, 
    LeftEyeUpperLidRaiser = v2.FACS_REGIONS.Eyes, 
    LeftEyeClosed = v2.FACS_REGIONS.Eyes, 
    RightCheekRaiser = v2.FACS_REGIONS.Eyes, 
    RightEyeUpperLidRaiser = v2.FACS_REGIONS.Eyes, 
    RightEyeClosed = v2.FACS_REGIONS.Eyes, 
    TongueDown = v2.FACS_REGIONS.Tongue, 
    TongueOut = v2.FACS_REGIONS.Tongue, 
    TongueUp = v2.FACS_REGIONS.Tongue
};
v2.FacsNames = {
    ChinRaiserUpperLip = "ChinRaiserUpperLip", 
    ChinRaiser = "ChinRaiser", 
    FlatPucker = "FlatPucker", 
    Funneler = "Funneler", 
    LowerLipSuck = "LowerLipSuck", 
    LipPresser = "LipPresser", 
    LipsTogether = "LipsTogether", 
    MouthLeft = "MouthLeft", 
    MouthRight = "MouthRight", 
    Pucker = "Pucker", 
    UpperLipSuck = "UpperLipSuck", 
    LeftCheekPuff = "LeftCheekPuff", 
    LeftDimpler = "LeftDimpler", 
    LeftLipCornerDown = "LeftLipCornerDown", 
    LeftLowerLipDepressor = "LeftLowerLipDepressor", 
    LeftLipCornerPuller = "LeftLipCornerPuller", 
    LeftLipStretcher = "LeftLipStretcher", 
    LeftUpperLipRaiser = "LeftUpperLipRaiser", 
    RightCheekPuff = "RightCheekPuff", 
    RightDimpler = "RightDimpler", 
    RightLipCornerDown = "RightLipCornerDown", 
    RightLowerLipDepressor = "RightLowerLipDepressor", 
    RightLipCornerPuller = "RightLipCornerPuller", 
    RightLipStretcher = "RightLipStretcher", 
    RightUpperLipRaiser = "RightUpperLipRaiser", 
    JawDrop = "JawDrop", 
    JawLeft = "JawLeft", 
    JawRight = "JawRight", 
    Corrugator = "Corrugator", 
    LeftBrowLowerer = "LeftBrowLowerer", 
    LeftOuterBrowRaiser = "LeftOuterBrowRaiser", 
    LeftNoseWrinkler = "LeftNoseWrinkler", 
    LeftInnerBrowRaiser = "LeftInnerBrowRaiser", 
    RightBrowLowerer = "RightBrowLowerer", 
    RightOuterBrowRaiser = "RightOuterBrowRaiser", 
    RightInnerBrowRaiser = "RightInnerBrowRaiser", 
    RightNoseWrinkler = "RightNoseWrinkler", 
    EyesLookDown = "EyesLookDown", 
    EyesLookLeft = "EyesLookLeft", 
    EyesLookUp = "EyesLookUp", 
    EyesLookRight = "EyesLookRight", 
    LeftCheekRaiser = "LeftCheekRaiser", 
    LeftEyeUpperLidRaiser = "LeftEyeUpperLidRaiser", 
    LeftEyeClosed = "LeftEyeClosed", 
    RightCheekRaiser = "RightCheekRaiser", 
    RightEyeUpperLidRaiser = "RightEyeUpperLidRaiser", 
    RightEyeClosed = "RightEyeClosed", 
    TongueDown = "TongueDown", 
    TongueOut = "TongueOut", 
    TongueUp = "TongueUp"
};
v2.FacsCrossMappings = {
    ChinRaiserUpperLip = {}, 
    ChinRaiser = {}, 
    FlatPucker = {}, 
    Funneler = {}, 
    LowerLipSuck = {}, 
    LipPresser = {}, 
    LipsTogether = {}, 
    MouthLeft = {
        sliderGroup = {
            v2.FacsNames.MouthRight, 
            v2.FacsNames.MouthLeft
        }, 
        indexInGroup = 2
    }, 
    MouthRight = {
        sliderGroup = {
            v2.FacsNames.MouthRight, 
            v2.FacsNames.MouthLeft
        }, 
        indexInGroup = 1
    }, 
    Pucker = {}, 
    UpperLipSuck = {}, 
    LeftCheekPuff = {
        symmetryPartner = v2.FacsNames.RightCheekPuff
    }, 
    LeftDimpler = {
        symmetryPartner = v2.FacsNames.RightDimpler
    }, 
    LeftLipCornerDown = {
        symmetryPartner = v2.FacsNames.RightLipCornerDown
    }, 
    LeftLowerLipDepressor = {
        symmetryPartner = v2.FacsNames.RightLowerLipDepressor
    }, 
    LeftLipCornerPuller = {
        symmetryPartner = v2.FacsNames.RightLipCornerPuller
    }, 
    LeftLipStretcher = {
        symmetryPartner = v2.FacsNames.RightLipStretcher
    }, 
    LeftUpperLipRaiser = {
        symmetryPartner = v2.FacsNames.RightUpperLipRaiser
    }, 
    RightCheekPuff = {
        symmetryPartner = v2.FacsNames.LeftCheekPuff
    }, 
    RightDimpler = {
        symmetryPartner = v2.FacsNames.LeftDimpler
    }, 
    RightLipCornerDown = {
        symmetryPartner = v2.FacsNames.LeftLipCornerDown
    }, 
    RightLowerLipDepressor = {
        symmetryPartner = v2.FacsNames.LeftLowerLipDepressor
    }, 
    RightLipCornerPuller = {
        symmetryPartner = v2.FacsNames.LeftLipCornerPuller
    }, 
    RightLipStretcher = {
        symmetryPartner = v2.FacsNames.LeftLipStretcher
    }, 
    RightUpperLipRaiser = {
        symmetryPartner = v2.FacsNames.LeftUpperLipRaiser
    }, 
    JawDrop = {}, 
    JawLeft = {
        sliderGroup = {
            v2.FacsNames.JawRight, 
            v2.FacsNames.JawLeft
        }, 
        indexInGroup = 2
    }, 
    JawRight = {
        sliderGroup = {
            v2.FacsNames.JawRight, 
            v2.FacsNames.JawLeft
        }, 
        indexInGroup = 1
    }, 
    Corrugator = {}, 
    LeftBrowLowerer = {
        symmetryPartner = v2.FacsNames.RightBrowLowerer
    }, 
    LeftOuterBrowRaiser = {
        symmetryPartner = v2.FacsNames.RightOuterBrowRaiser
    }, 
    LeftNoseWrinkler = {
        symmetryPartner = v2.FacsNames.RightNoseWrinkler
    }, 
    LeftInnerBrowRaiser = {
        symmetryPartner = v2.FacsNames.RightInnerBrowRaiser
    }, 
    RightBrowLowerer = {
        symmetryPartner = v2.FacsNames.LeftBrowLowerer
    }, 
    RightOuterBrowRaiser = {
        symmetryPartner = v2.FacsNames.LeftOuterBrowRaiser
    }, 
    RightInnerBrowRaiser = {
        symmetryPartner = v2.FacsNames.LeftInnerBrowRaiser
    }, 
    RightNoseWrinkler = {
        symmetryPartner = v2.FacsNames.LeftNoseWrinkler
    }, 
    EyesLookDown = {}, 
    EyesLookLeft = {}, 
    EyesLookUp = {}, 
    EyesLookRight = {}, 
    LeftCheekRaiser = {
        symmetryPartner = v2.FacsNames.RightCheekRaiser
    }, 
    LeftEyeUpperLidRaiser = {
        sliderGroup = {
            v2.FacsNames.LeftEyeClosed, 
            v2.FacsNames.LeftEyeUpperLidRaiser
        }, 
        indexInGroup = 2, 
        symmetryPartner = v2.FacsNames.RightEyeUpperLidRaiser
    }, 
    LeftEyeClosed = {
        sliderGroup = {
            v2.FacsNames.LeftEyeClosed, 
            v2.FacsNames.LeftEyeUpperLidRaiser
        }, 
        indexInGroup = 1, 
        symmetryPartner = v2.FacsNames.RightEyeClosed
    }, 
    RightCheekRaiser = {
        symmetryPartner = v2.FacsNames.LeftCheekRaiser
    }, 
    RightEyeUpperLidRaiser = {
        sliderGroup = {
            v2.FacsNames.RightEyeClosed, 
            v2.FacsNames.RightEyeUpperLidRaiser
        }, 
        indexInGroup = 2, 
        symmetryPartner = v2.FacsNames.LeftEyeUpperLidRaiser
    }, 
    RightEyeClosed = {
        sliderGroup = {
            v2.FacsNames.RightEyeClosed, 
            v2.FacsNames.RightEyeUpperLidRaiser
        }, 
        indexInGroup = 1, 
        symmetryPartner = v2.FacsNames.LeftEyeClosed
    }, 
    TongueDown = {
        sliderGroup = {
            v2.FacsNames.TongueUp, 
            v2.FacsNames.TongueDown
        }, 
        indexInGroup = 2
    }, 
    TongueUp = {
        sliderGroup = {
            v2.FacsNames.TongueUp, 
            v2.FacsNames.TongueDown
        }, 
        indexInGroup = 1
    }, 
    TongueOut = {}
};
v2.faceControlsEditorOriginalWidth = 240;
v2.faceControlsEditorFaceFrontDiagramWidth = 220;
v2.faceControlsEditorFaceFrontDiagramHeight = 310;
v2.faceControlsEditorFaceSideDiagramWidth = 220;
v2.faceControlsEditorFaceSideDiagramHeight = 190;
v2.faceControlsEditorDiagramPadding = 10;
v2.faceControlsEditoSpacingBetweenDiagrams = 40;
v2.faceControlsEditorTogglesContainerHeight = 95;
v2.COMPONENT_TRACK_TYPES = {
    [v2.TRACK_TYPES.CFrame] = {
        _Order = {
            v2.PROPERTY_KEYS.Position, 
            v2.PROPERTY_KEYS.Rotation
        }, 
        [v2.PROPERTY_KEYS.Position] = v2.TRACK_TYPES.Position, 
        [v2.PROPERTY_KEYS.Rotation] = v2.TRACK_TYPES.EulerAngles
    }, 
    [v2.TRACK_TYPES.Position] = {
        _Order = {
            v2.PROPERTY_KEYS.X, 
            v2.PROPERTY_KEYS.Y, 
            v2.PROPERTY_KEYS.Z
        }, 
        [v2.PROPERTY_KEYS.X] = v2.TRACK_TYPES.Number, 
        [v2.PROPERTY_KEYS.Y] = v2.TRACK_TYPES.Number, 
        [v2.PROPERTY_KEYS.Z] = v2.TRACK_TYPES.Number
    }
};
v2.COMPONENT_TRACK_TYPES[v2.TRACK_TYPES.EulerAngles] = {
    _Order = {
        v2.PROPERTY_KEYS.X, 
        v2.PROPERTY_KEYS.Y, 
        v2.PROPERTY_KEYS.Z
    }, 
    [v2.PROPERTY_KEYS.X] = v2.TRACK_TYPES.Angle, 
    [v2.PROPERTY_KEYS.Y] = v2.TRACK_TYPES.Angle, 
    [v2.PROPERTY_KEYS.Z] = v2.TRACK_TYPES.Angle
};
v2.COMPONENT_PATH_VALUE = {
    [v2.PROPERTY_KEYS.Position] = 1, 
    [v2.PROPERTY_KEYS.Rotation] = 2, 
    [v2.PROPERTY_KEYS.X] = 1, 
    [v2.PROPERTY_KEYS.Y] = 2, 
    [v2.PROPERTY_KEYS.Z] = 3
};
v2.COMPONENT_PATH_BASE_SCALE = 0.1;
v2.KEYFRAME_STYLE[Enum.KeyInterpolationMode.Constant] = "Constant";
v2.KEYFRAME_STYLE[Enum.KeyInterpolationMode.Cubic] = "Cubic";
v2.TRACK_THEME_MAPPING = {
    [v2.TRACK_TYPES.Number] = {
        [v2.PROPERTY_KEYS.X] = "positionX", 
        [v2.PROPERTY_KEYS.Y] = "positionY", 
        [v2.PROPERTY_KEYS.Z] = "positionZ"
    }, 
    [v2.TRACK_TYPES.Angle] = {
        [v2.PROPERTY_KEYS.X] = "rotationX", 
        [v2.PROPERTY_KEYS.Y] = "rotationY", 
        [v2.PROPERTY_KEYS.Z] = "rotationZ"
    }
};
v2.TICK_LABEL_POSITION = {
    [v2.SCALE_TYPE.Number] = UDim2.new(0.3, 0, 0.5, 0), 
    [v2.SCALE_TYPE.Angle] = UDim2.new(0.7, 0, 0.5, 0)
};
v2.DEFAULT_ROTATION_TYPE = v2.TRACK_TYPES.EulerAngles;
return v2;
