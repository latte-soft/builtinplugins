local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.AnimationControlPanel.AnimationClipDropdown);
local v7 = require(l_script_FirstAncestor_0.Src.Components.AnimationControlPanel.MediaControls);
local v8 = require(l_script_FirstAncestor_0.Src.Components.AnimationControlPanel.TimeDisplay);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Playback.TogglePlay);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.ToggleLooping);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.SkipAnimation);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateEditingLength);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v16 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v17 = v1.PureComponent:extend("AnimationControlPanel");
v17.init = function(v18)
    v18.toggleLoopingWrapper = function()
        return v18.props.ToggleLooping(v18.props.Analytics);
    end;
    v18.loadAnimationDataWrapper = function(v19)
        return v18.props.LoadAnimationData(v19, v18.props.Analytics);
    end;
    v18.skipBackwardWrapper = function()
        return v18.props.SkipBackward(v18.props.Analytics);
    end;
    v18.skipForwardWrapper = function()
        return v18.props.SkipForward(v18.props.Analytics);
    end;
    v18.setPlayStateWrapper = function(v20)
        return v18.props.SetPlayState(v20, v18.props.Analytics);
    end;
    v18.goToFirstFrameWrapper = function()
        return v18.props.StepAnimation(0);
    end;
    v18.goToLastFrameWrapper = function()
        local l_props_0 = v18.props;
        return l_props_0.StepAnimation(l_props_0.AnimationData.Metadata.EndTick);
    end;
end;
v17.render = function(v22)
    local l_props_1 = v22.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_AnimationData_0 = l_props_1.AnimationData;
    local l_IsLegacyAnimSaves_0 = l_props_1.IsLegacyAnimSaves;
    local l_PlayState_0 = l_props_1.PlayState;
    local l_RootInstance_0 = l_props_1.RootInstance;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.TIMELINE_HEIGHT), 
        BorderSizePixel = 1, 
        LayoutOrder = 0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        AnimationClipDropdown = v1.createElement(v6, {
            AnimationName = not not l_AnimationData_0 and l_AnimationData_0.Metadata.Name or "", 
            IsLegacyAnimSaves = l_IsLegacyAnimSaves_0, 
            RootInstance = l_RootInstance_0, 
            LoadAnimationData = v22.loadAnimationDataWrapper, 
            InstanceType = (l_RootInstance_0 and l_AnimationData_0) and l_AnimationData_0.Instances.Root.Type, 
            LayoutOrder = 0, 
            IsChannelAnimation = l_props_1.IsChannelAnimation
        }), 
        MediaControls = v1.createElement(v7, {
            PlayState = l_PlayState_0, 
            IsLooping = not not l_AnimationData_0 and (l_AnimationData_0.Metadata and l_AnimationData_0.Metadata.Looping or false), 
            SkipBackward = v22.skipBackwardWrapper, 
            SkipForward = v22.skipForwardWrapper, 
            SetPlayState = v22.setPlayStateWrapper, 
            ToggleLooping = v22.toggleLoopingWrapper, 
            GoToFirstFrame = v22.goToFirstFrameWrapper, 
            GoToLastFrame = v22.goToLastFrameWrapper, 
            LayoutOrder = 1
        }), 
        TimeDisplay = v1.createElement(v8, {
            StartTick = l_props_1.StartTick, 
            EndTick = l_props_1.EndTick, 
            FrameRate = l_props_1.FrameRate, 
            ShowAsTime = if not v16() then if not v16() then l_props_1.ShowAsSeconds else nil else nil, 
            TimelineUnit = l_props_1.TimelineUnit, 
            AnimationData = l_AnimationData_0, 
            Playhead = l_props_1.Playhead, 
            EditingLength = l_props_1.EditingLength, 
            StepAnimation = l_props_1.StepAnimation, 
            UpdateEditingLength = l_props_1.UpdateEditingLength, 
            ReadOnly = l_props_1.ReadOnly, 
            LayoutOrder = 2
        })
    });
end;
return v2.connect(function(v29)
    return {
        FrameRate = v29.Status.FrameRate, 
        PlayState = v29.Status.PlayState, 
        ReadOnly = v29.Status.ReadOnly, 
        RootInstance = v29.Status.RootInstance
    };
end, function(v30)
    return {
        ToggleLooping = function(v31)
            v30(v10(v31));
        end, 
        StepAnimation = function(v32)
            v30(v11(v32));
        end, 
        SetPlayState = function(v33)
            v30(v15(v33));
        end, 
        LoadAnimationData = function(v34, v35)
            v30(v12(v34, v35));
        end, 
        UpdateEditingLength = function(v36)
            v30(v14(v36));
        end, 
        SkipBackward = function(v37)
            v30(v13(false, v37));
        end, 
        SkipForward = function(v38)
            v30(v13(true, v38));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics
})(v17)));
