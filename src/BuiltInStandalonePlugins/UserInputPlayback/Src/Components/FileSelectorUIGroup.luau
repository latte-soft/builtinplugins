local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TimeProgressBar_0 = l_UI_0.TimeProgressBar;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v12 = require(l_Parent_0.Src.Components.LabeledToggleButton);
local v13 = require(l_Parent_0.Src.Components.RecordingFileSelector);
local v14 = require(l_Parent_0.Src.Util.Enums);
local v15 = require(l_Parent_0.Src.Util.DMBridge);
local v16 = require(l_Parent_0.Src.Actions.Common.SetPluginState);
local v17 = require(l_Parent_0.Src.Actions.PlaybackTab.SetShouldSetEmulationDevice);
local v18 = v1.PureComponent:extend("FileSelectorUIGroup");
v18.init = function(v19)
    v19.state = {
        canStartPlaying = false
    };
    v19.toggleEmulationEnabled = function()
        local l_props_0 = v19.props;
        l_props_0.SetShouldSetEmulationDevice(not l_props_0.ShouldSetEmulationDevice, l_props_0.RoduxStoreContext);
    end;
    v19.onPlayButtonClicked = function()
        local l_PluginState_0 = v19.props.PluginState;
        if not (l_PluginState_0 == v14.PluginState.Default) or not v19.state.canStartPlaying then
            if l_PluginState_0 == v14.PluginState.Playing then
                v15.onStopPlaybackButtonClicked();
                return ;
            else
                if l_PluginState_0 == v14.PluginState.ShouldStartPlayback then
                    v19.props.SetPluginState(v14.PluginState.Default);
                end;
                return ;
            end;
        elseif not v15.getIsPlayMode() then
            v19.props.SetPluginState(v14.PluginState.ShouldStartPlayback);
            return ;
        else
            v15.onStartPlaybackButtonClicked();
            return ;
        end;
    end;
    v19.onCanStartPlaying = function(v22)
        v19:setState({
            canStartPlaying = v22
        });
    end;
end;
v18.render = function(v23)
    local l_props_1 = v23.props;
    local l_state_0 = v23.state;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = false;
    local v32 = false;
    if l_props_1.PluginState == v14.PluginState.Playing then
        v28 = l_Localization_0:getText("PlaybackTabView", "StatusMessagePlaying");
        v29 = l_Localization_0:getText("PlaybackTabView", "PlayButtonStop");
        v30 = l_StyleModifier_0.Pressed;
        v32 = true;
        v31 = true;
    elseif l_props_1.PluginState == v14.PluginState.ShouldStartPlayback then
        v28 = l_Localization_0:getText("PlaybackTabView", "StatusMessageShouldStartPlayback");
        v29 = l_Localization_0:getText("PlaybackTabView", "PlayButtonReady");
        v30 = l_StyleModifier_0.Selected;
        v32 = false;
    elseif l_props_1.PluginState == v14.PluginState.Default then
        v28 = l_Localization_0:getText("PlaybackTabView", "StatusMessageNotPlaying");
        v29 = l_Localization_0:getText("PlaybackTabView", "PlayButtonPlay");
        v30 = if not l_state_0.canStartPlaying then l_StyleModifier_0.Disabled else nil;
        v32 = false;
    elseif l_props_1.PluginState == v14.PluginState.Disabled then
        v28 = l_Localization_0:getText("PlaybackTabView", "StatusMessageDisabled");
        v29 = l_Localization_0:getText("PlaybackTabView", "PlayButtonPlay");
        v30 = l_StyleModifier_0.Disabled;
        v32 = true;
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Style = "CornerBox", 
        Size = UDim2.fromOffset(l_Stylizer_0.UIGroupWidthPx, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
        Padding = l_Stylizer_0.PaddingPx, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        RecordingFileSelector = v1.createElement(v13, {
            OnCanStartPlaying = v23.onCanStartPlaying
        }), 
        LoadingBar = v31 and v1.createElement(l_TimeProgressBar_0, {
            Width = l_Stylizer_0.ProgressBarWidth, 
            LayoutOrder = 2, 
            TotalTime = l_props_1.CurrentRecordingDurationSec
        }), 
        Button = v1.createElement(l_Button_0, {
            Size = l_Stylizer_0.PrimaryButtonSize, 
            LayoutOrder = 3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Style = "RoundPrimaryPlayButton", 
            StyleModifier = v30, 
            Text = v29, 
            OnClick = v23.onPlayButtonClicked
        }, {
            v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        EmulationEnabled = v1.createElement(v12, {
            Selected = l_props_1.ShouldSetEmulationDevice, 
            OnClick = v23.toggleEmulationEnabled, 
            Text = l_Localization_0:getText("PlaybackTabView", "SetEmulationDeviceLabel"), 
            Disabled = v32, 
            LayoutOrder = 4
        }), 
        StatusTextLabel = v1.createElement(l_TextLabel_0, {
            Text = v28, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 5, 
            Style = "StatusTextLabel", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        })
    });
end;
return v2.connect(function(v33, _)
    return {
        ShouldSetEmulationDevice = v33.playbackTab.shouldSetEmulationDevice, 
        PluginState = v33.common.pluginState, 
        CurrentRecordingDurationSec = v33.playbackTab.currentRecordingDurationSec
    };
end, function(v35)
    return {
        SetPluginState = function(v36)
            v35(v16(v36));
        end, 
        SetShouldSetEmulationDevice = function(v37)
            v35(v17(v37));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v18)));
