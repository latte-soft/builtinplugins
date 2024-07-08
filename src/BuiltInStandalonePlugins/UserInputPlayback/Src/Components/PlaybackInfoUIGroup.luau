local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(l_Parent_0.Src.Components.UIKeyValueTextLabel);
local v9 = require(l_Parent_0.Src.Util.StringFormatters);
local v10 = require(l_Parent_0.Src.Util.DMBridge);
local _ = require(l_Parent_0.Src.Types);
local l_PlaybackTab_0 = l_Parent_0.Src.Actions.PlaybackTab;
local v13 = require(l_PlaybackTab_0.SetCurrentRecordingDurationSec);
local v14 = require(l_PlaybackTab_0.SetCurrentRecordingNumEvents);
local v15 = require(l_PlaybackTab_0.SetCurrentRecordingResolution);
local v16 = require(l_PlaybackTab_0.SetCurrentRecordingDeviceId);
local v17 = require(l_PlaybackTab_0.SetCurrentRecordingDeviceOrientation);
local v18 = v1.PureComponent:extend("PlaybackInfoUIGroup");
v18.init = function(v19)
    v19.state = {
        dataValid = false
    };
    v19.onPlaybackInfoChanged = function(v20, v21, v22)
        if v20 ~= nil then
            local l_props_0 = v19.props;
            l_props_0.SetCurrentRecordingDurationSec(v21);
            l_props_0.SetCurrentRecordingNumEvents(v22);
            l_props_0.SetCurrentRecordingDeviceId(v20.deviceId);
            l_props_0.SetCurrentRecordingDeviceOrientation(v20.orientation);
            local l_resolution_0 = v20.resolution;
            l_props_0.SetCurrentRecordingResolution((Vector2.new(l_resolution_0[1], l_resolution_0[2])));
            v19:setState({
                dataValid = true
            });
            return ;
        else
            v19:setState({
                dataValid = false
            });
            return ;
        end;
    end;
end;
v18.didMount = function(v25)
    v10.connectPlaybackInfoChangedCallback(v25.onPlaybackInfoChanged);
end;
v18.willUnmount = function(_)
    v10.disconnectPlaybackInfoChangedCallback();
end;
v18.render = function(v27)
    if v27.state.dataValid then
        local l_props_1 = v27.props;
        local l_Localization_0 = l_props_1.Localization;
        local l_Stylizer_0 = l_props_1.Stylizer;
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
            Label = v1.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("PlaybackTabView", "RecordingInfoLabel"), 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            KeyValuePairs = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                RecordingDuration = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingDuration"), 
                    Value = string.format("%.2f ", l_props_1.CurrentRecordingDurationSec) .. l_Localization_0:getText("PlaybackTabView", "SecondsUnitAbbrevation"), 
                    LayoutOrder = 1
                }), 
                NumberOfEvents = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingNumberOfEvents"), 
                    Value = tostring(l_props_1.CurrentRecordingNumEvents), 
                    LayoutOrder = 2
                }), 
                RecordingDeviceId = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingDevice"), 
                    Value = v9.formatDeviceName(l_props_1.CurrentRecordingDeviceId, l_Localization_0), 
                    LayoutOrder = 3
                }), 
                RecordingOrientation = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingOrientation"), 
                    Value = v9.formatDeviceOrientation(l_props_1.CurrentRecordingDeviceOrientation, l_props_1.CurrentRecordingDeviceId, l_Localization_0), 
                    LayoutOrder = 4
                }), 
                RecordingResolution = v1.createElement(v8, {
                    Label = l_Localization_0:getText("PlaybackTabView", "RecordingResolution"), 
                    Value = v9.format2dResolution(l_props_1.CurrentRecordingResolution, l_Localization_0:getText("RecordTabView", "ResolutionPixelsName")), 
                    LayoutOrder = 5
                })
            })
        });
    else
        return nil;
    end;
end;
return v2.connect(function(v31, _)
    return {
        CurrentRecordingDurationSec = v31.playbackTab.currentRecordingDurationSec, 
        CurrentRecordingNumEvents = v31.playbackTab.currentRecordingNumEvents, 
        CurrentRecordingDeviceId = v31.playbackTab.currentRecordingDeviceId, 
        CurrentRecordingDeviceOrientation = v31.playbackTab.currentRecordingDeviceOrientation, 
        CurrentRecordingResolution = v31.playbackTab.currentRecordingResolution
    };
end, function(v33)
    return {
        SetCurrentRecordingDurationSec = function(v34)
            v33(v13(v34));
        end, 
        SetCurrentRecordingDeviceId = function(v35)
            v33(v16(v35));
        end, 
        SetCurrentRecordingNumEvents = function(v36)
            v33(v14(v36));
        end, 
        SetCurrentRecordingResolution = function(v37)
            v33(v15(v37));
        end, 
        SetCurrentRecordingDeviceOrientation = function(v38)
            v33(v17(v38));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v18)));
