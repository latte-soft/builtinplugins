local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v4.UI;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local function _()
    return l_PlayerEmulatorService_0.PseudolocalizationEnabled;
end;
local function v14(v13)
    l_PlayerEmulatorService_0.PseudolocalizationEnabled = v13;
end;
local function _()
    return l_PlayerEmulatorService_0.PlayerEmulationEnabled;
end;
local v16 = v2.PureComponent:extend("PseudolocalizationSection");
v16.initPseudolocalizationEnabled = function(v17)
    local l_Setting_0 = v17.props.Plugin:get():GetSetting(v7.PSEUDOLOCALIZATION_ENABLED_SETTING_KEY);
    if l_Setting_0 then
        l_PlayerEmulatorService_0.PseudolocalizationEnabled = l_Setting_0;
    end;
end;
v16.onPlayerEmulationEnabledChanged = function(v19)
    if not l_PlayerEmulatorService_0.PlayerEmulationEnabled then
        l_PlayerEmulatorService_0.PseudolocalizationEnabled = false;
        return ;
    else
        l_PlayerEmulatorService_0.PseudolocalizationEnabled = v19.state.pseudolocalizationEnabled;
        return ;
    end;
end;
v16.onPseudolocalizationChanged = function(v20)
    local l_PseudolocalizationEnabled_0 = l_PlayerEmulatorService_0.PseudolocalizationEnabled;
    v20:setState({
        pseudolocalizationEnabled = l_PseudolocalizationEnabled_0
    });
    v20.props.Plugin:get():SetSetting(v7.PSEUDOLOCALIZATION_ENABLED_SETTING_KEY, l_PseudolocalizationEnabled_0);
end;
v16.init = function(v22)
    v22.state = {
        pseudolocalizationEnabled = l_PlayerEmulatorService_0.PseudolocalizationEnabled
    };
end;
v16.didMount = function(v23)
    local _ = l_PlayerEmulatorService_0:GetPropertyChangedSignal("PseudolocalizationEnabled"):Connect(function()
        v23:onPseudolocalizationChanged();
    end);
    v23:initPseudolocalizationEnabled();
end;
v16.render = function(v25)
    local l_state_0 = v25.state;
    local l_props_0 = v25.props;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_pseudolocalizationEnabled_0 = l_state_0.pseudolocalizationEnabled;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        Size = l_Stylizer_0.PSEUDOLOCALIZATION_SECTION_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        PseudolocalizationModule = v2.createElement("Frame", {
            Size = l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_props_0.Localization:getText("LanguageSection", "PseudolocalizationLabelText"), 
                StyleModifier = if not l_mainSwitchEnabled_0 then l_StyleModifier_0.Disabled else nil, 
                LayoutOrder = 1
            }), 
            Toggle = v2.createElement(l_ToggleButton_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Disabled = not l_mainSwitchEnabled_0, 
                OnClick = v14, 
                Position = UDim2.new(0, l_Stylizer_0.TOGGLE_BUTTON_OFFSET, 0.5, -l_Stylizer_0.TOGGLE_BUTTON_HEIGHT / 2), 
                Selected = l_pseudolocalizationEnabled_0, 
                LayoutOrder = 2
            })
        })
    });
end;
return v3.connect(function(v31, _)
    return {
        mainSwitchEnabled = v31.MainSwitch.mainSwitchEnabled
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v16)));
