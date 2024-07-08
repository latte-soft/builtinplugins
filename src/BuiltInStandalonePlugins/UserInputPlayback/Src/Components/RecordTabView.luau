local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v11 = require(l_Parent_0.Src.Components.FilterSettingsUIGroup);
local v12 = require(l_Parent_0.Src.Components.DeviceEmulationInfoUIGroup);
local v13 = require(l_Parent_0.Src.Components.ChooseRecordingNamePopUp);
local v14 = require(l_Parent_0.Src.Util.Enums);
local v15 = require(l_Parent_0.Src.Util.DMBridge);
local v16 = require(l_Parent_0.Src.Actions.RecordTab.SetScreenSize);
local v17 = require(l_Parent_0.Src.Actions.RecordTab.SetEmulationDeviceId);
local v18 = require(l_Parent_0.Src.Actions.RecordTab.SetEmulationDeviceOrientation);
local v19 = require(l_Parent_0.Src.Actions.Common.SetPluginState);
local v20 = v1.PureComponent:extend("TabView");
v20.init = function(v21)
    v21.state = {
        SaveRecordingDialogVisible = false, 
        SaveRecordingDialogMessageLocalizationKey = nil, 
        SaveRecordingDialogMessageLocalizationArgs = nil
    };
    v21.onRecordingButtonClicked = function()
        local l_PluginState_0 = v21.props.PluginState;
        if l_PluginState_0 == v14.PluginState.Default then
            if not v15.getIsPlayMode() then
                v21.props.SetPluginState(v14.PluginState.ShouldStartRecording);
                return ;
            else
                v15.onStartRecordingButtonClicked();
                return ;
            end;
        elseif l_PluginState_0 == v14.PluginState.Recording then
            v15.onStopRecordingButtonClicked();
            return ;
        else
            if l_PluginState_0 == v14.PluginState.ShouldStartRecording then
                v21.props.SetPluginState(v14.PluginState.Default);
            end;
            return ;
        end;
    end;
    v21.setSaveRecordingDialogVisible = function(v23, v24)
        v21:setState({
            SaveRecordingDialogVisible = true, 
            SaveRecordingDialogMessageLocalizationKey = v23, 
            SaveRecordingDialogMessageLocalizationArgs = v24
        });
    end;
    v21.onSaveRecordingDialogCancel = function()
        v21:setState({
            SaveRecordingDialogVisible = false
        });
        v15.onSaveRecordingDialogCancel();
    end;
    v21.onSaveRecordingDialogSave = function(v25)
        v21:setState({
            SaveRecordingDialogVisible = false
        });
        v15.onSaveRecordingDialogSave(v25);
    end;
end;
v20.didMount = function(v26)
    v15.connectRecordTabEventListenersWithActions({
        SetEmulationDeviceId = v26.props.SetEmulationDeviceId, 
        SetEmulationDeviceOrientation = v26.props.SetEmulationDeviceOrientation, 
        SetCurrentScreenSize = v26.props.SetCurrentScreenSize, 
        SetSaveRecordingDialogVisible = v26.setSaveRecordingDialogVisible
    });
    v15.onRecordTabShown();
end;
v20.willUnmount = function(v27)
    v15.disconnectRecordTabEventListeners();
    v15.onRecordTabHidden();
    v27.props.SetPluginState(v14.PluginState.Default);
end;
v20.render = function(v28)
    local l_props_0 = v28.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = v28.props.Localization;
    local l_state_0 = v28.state;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    if l_props_0.PluginState == v14.PluginState.Recording then
        v33 = l_Localization_0:getText("RecordTabView", "StatusMessageRecording");
        v34 = l_Localization_0:getText("RecordTabView", "RecordButtonStopRecording");
        v35 = l_StyleModifier_0.Pressed;
        v36 = true;
    elseif l_props_0.PluginState == v14.PluginState.ShouldStartRecording then
        v33 = l_Localization_0:getText("RecordTabView", "StatusMessageShouldRecordOnGamePlayStart");
        v34 = l_Localization_0:getText("RecordTabView", "RecordButtonReadyToRecord");
        v35 = l_StyleModifier_0.Selected;
        v36 = false;
    elseif l_props_0.PluginState == v14.PluginState.Default then
        v33 = l_Localization_0:getText("RecordTabView", "StatusMessageNotRecording");
        v34 = l_Localization_0:getText("RecordTabView", "RecordButtonRecord");
        v35 = nil;
        v36 = false;
    elseif l_props_0.PluginState == v14.PluginState.Disabled then
        v33 = l_Localization_0:getText("RecordTabView", "StatusMessageDisabled");
        v34 = l_Localization_0:getText("RecordTabView", "RecordButtonRecord");
        v35 = l_StyleModifier_0.Disabled;
        v36 = true;
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = l_Stylizer_0.PaddingPx, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        FilterSettings = v1.createElement(v11, {
            LayoutOrder = 1, 
            Disabled = v36, 
            RoduxStoreContext = "recordTabFilter"
        }), 
        DeviceEmulationInfoGroup = v1.createElement(v12, {
            LayoutOrder = 2
        }), 
        RecordingButtonContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            Style = "CornerBox", 
            Size = UDim2.fromOffset(l_Stylizer_0.UIGroupWidthPx, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
            Padding = l_Stylizer_0.PaddingPx, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Button = v1.createElement(l_Button_0, {
                Size = l_Stylizer_0.PrimaryButtonSize, 
                LayoutOrder = 1, 
                Style = "RoundPrimaryRecordButton", 
                StyleModifier = v35, 
                Text = v34, 
                OnClick = v28.onRecordingButtonClicked
            }, {
                v1.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            StatusTextLabel = v1.createElement(l_TextLabel_0, {
                Text = v33, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2, 
                Style = "StatusTextLabel", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        ChooseRecordingNamePopUp = l_state_0.SaveRecordingDialogVisible and v1.createElement(v13, {
            DefaultInputValue = l_Localization_0:getText("RecordTabView", "DefaultRecordingName"), 
            OnSaveButtonPressed = v28.onSaveRecordingDialogSave, 
            OnCancelButtonPressed = v28.onSaveRecordingDialogCancel, 
            MessageLocalizationKey = l_state_0.SaveRecordingDialogMessageLocalizationKey, 
            MessageLocalizationArgs = l_state_0.SaveRecordingDialogMessageLocalizationArgs
        })
    });
end;
return v2.connect(function(v37, _)
    return {
        PluginState = v37.common.pluginState
    };
end, function(v39)
    return {
        SetCurrentScreenSize = function(v40)
            v39(v16(v40));
        end, 
        SetEmulationDeviceId = function(v41)
            v39(v17(v41));
        end, 
        SetEmulationDeviceOrientation = function(v42)
            v39(v18(v42));
        end, 
        SetPluginState = function(v43)
            v39(v19(v43));
        end
    };
end)((l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v20)));
