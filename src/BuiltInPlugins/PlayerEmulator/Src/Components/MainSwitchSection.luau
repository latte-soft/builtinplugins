local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local v10 = require(l_Parent_0.Src.Util.Constants);
local v11 = require(l_Parent_0.Src.Actions.OnPlayerEmulationEnabledChanged);
local function _()
    return l_PlayerEmulatorService_0.PlayerEmulationEnabled;
end;
local function v14(v13)
    l_PlayerEmulatorService_0.PlayerEmulationEnabled = v13;
end;
local v15 = v2.PureComponent:extend("MainSwitchSection");
v15.initEnabledStatus = function(v16)
    if v16.props.Plugin:get():GetSetting(v10.MAIN_SWITCH_KEY) == true then
        l_PlayerEmulatorService_0.PlayerEmulationEnabled = true;
    end;
end;
v15.updatePlayerEmulationEnabled = function(v17, v18)
    v17.props.Plugin:get():SetSetting(v10.MAIN_SWITCH_KEY, v18);
    v17.props.onPlayerEmulationEnabledChanged(v18);
end;
v15.init = function(v19)
    v19.signalTokens = {};
end;
v15.didMount = function(v20)
    table.insert(v20.signalTokens, (l_PlayerEmulatorService_0:GetPropertyChangedSignal("PlayerEmulationEnabled"):Connect(function()
        v20:updatePlayerEmulationEnabled(l_PlayerEmulatorService_0.PlayerEmulationEnabled);
    end)));
    v20:initEnabledStatus();
end;
v15.willUnmount = function(v21)
    for _, v23 in pairs(v21.signalTokens) do
        v23:Disconnect();
    end;
    v21.signalTokens = nil;
end;
v15.render = function(v24)
    local l_props_0 = v24.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        Size = l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_props_0.Localization:getText("MainSwitchSection", "LabelText"), 
            LayoutOrder = 1
        }), 
        Toggle = v2.createElement(l_ToggleButton_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            LayoutOrder = 2, 
            OnClick = v14, 
            Position = UDim2.new(0, l_Stylizer_0.TOGGLE_BUTTON_OFFSET, 0.5, -l_Stylizer_0.TOGGLE_BUTTON_HEIGHT / 2), 
            Selected = l_props_0.mainSwitchEnabled
        })
    });
end;
return v3.connect(function(v27, _)
    return {
        mainSwitchEnabled = v27.MainSwitch.mainSwitchEnabled
    };
end, function(v29)
    return {
        onPlayerEmulationEnabledChanged = function(v30)
            v29(v11(v30));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15)));
