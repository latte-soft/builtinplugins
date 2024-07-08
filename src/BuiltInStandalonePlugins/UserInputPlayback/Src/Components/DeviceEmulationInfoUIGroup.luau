local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(l_Parent_0.Src.Util.StringFormatters);
local v9 = require(l_Parent_0.Src.Components.UIKeyValueTextLabel);
local v10 = v1.PureComponent:extend("DeviceEmulationInfoUIGroup");
v10.init = function(_)
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
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
            Text = l_Localization_0:getText("RecordTabView", "CurrentRecordingDeviceLabel"), 
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
            DeviceName = v1.createElement(v9, {
                Label = l_Localization_0:getText("RecordTabView", "EmulationDeviceName"), 
                Value = v8.formatDeviceName(l_props_0.EmulationDeviceId, l_Localization_0), 
                LayoutOrder = 1
            }), 
            Orientation = v1.createElement(v9, {
                Label = l_Localization_0:getText("RecordTabView", "EmulationDeviceOrientation"), 
                Value = v8.formatDeviceOrientation(l_props_0.EmulationDeviceOrientation, l_props_0.EmulationDeviceId, l_Localization_0), 
                LayoutOrder = 2
            }), 
            Resolution = v1.createElement(v9, {
                Label = l_Localization_0:getText("RecordTabView", "EmulationDeviceResolution"), 
                Value = v8.format2dResolution(l_props_0.CurrentScreenSize, l_Localization_0:getText("RecordTabView", "ResolutionPixelsName")), 
                LayoutOrder = 3
            })
        })
    });
end;
return v2.connect(function(v16, _)
    return {
        ShouldRecordOnGamePlayStart = v16.recordTab.shouldStart, 
        CurrentScreenSize = v16.recordTab.screenSize, 
        EmulationDeviceId = v16.recordTab.emulationDeviceId, 
        EmulationDeviceOrientation = v16.recordTab.emulationDeviceOrientation, 
        RecordingMode = v16.recordTab.recordingMode
    };
end, nil)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10)));
