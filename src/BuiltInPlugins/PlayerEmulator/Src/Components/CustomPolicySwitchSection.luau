local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.ToggleItemModule);
local v7 = require(l_Parent_0.Src.Util.Constants);
local v8 = require(l_Parent_0.Src.Actions.OnCustomPolicyEnabledChanged);
local v9 = require(l_Parent_0.Src.Actions.OnCustomPolicySwitchEnabledChanged);
local function _()
    return l_PlayerEmulatorService_0.CustomPoliciesEnabled;
end;
local function _(v11)
    l_PlayerEmulatorService_0.CustomPoliciesEnabled = v11;
end;
local v13 = v2.PureComponent:extend("CustomPolicySwitchSection");
v13.updateCustomPoliciesEnabled = function(v14)
    v14.props.onCustomPolicyEnabledChanged(l_PlayerEmulatorService_0.CustomPoliciesEnabled);
end;
v13.updateCustomPoliciesSwitchEnabled = function(v15, v16)
    v15.props.Plugin:get():SetSetting(v7.CUSTOM_POLICIES_SWITCH_KEY, v16);
    v15.props.onCustomPolicySwitchEnabledChanged(v16);
end;
v13.init = function(v17)
    v17.signalTokens = {};
end;
v13.didMount = function(v18)
    table.insert(v18.signalTokens, (l_PlayerEmulatorService_0:GetPropertyChangedSignal("CustomPoliciesEnabled"):Connect(function()
        v18:updateCustomPoliciesEnabled();
    end)));
    local l_Setting_0 = v18.props.Plugin:get():GetSetting(v7.CUSTOM_POLICIES_SWITCH_KEY);
    if l_Setting_0 == true then
        v18:updateCustomPoliciesSwitchEnabled(l_Setting_0);
    end;
    v18:updateCustomPoliciesEnabled();
end;
v13.willUnmount = function(v20)
    for _, v22 in pairs(v20.signalTokens) do
        v22:Disconnect();
    end;
    v20.signalTokens = nil;
end;
v13.render = function(v23)
    local l_props_0 = v23.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_customPolicySwitchEnabled_0 = l_props_0.customPolicySwitchEnabled;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    if l_props_0.customPolicySwitchActive then
        l_PlayerEmulatorService_0.CustomPoliciesEnabled = l_customPolicySwitchEnabled_0;
        return v2.createElement("Frame", {
            Size = l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            Toggle = v2.createElement(v6, {
                Key = l_Localization_0:getText("CustomPolicySwitchSection", "LabelText"), 
                IsOn = l_customPolicySwitchEnabled_0, 
                Enabled = l_mainSwitchEnabled_0, 
                ToggleCallback = function(_, v31, _)
                    v23:updateCustomPoliciesSwitchEnabled(v31);
                end
            })
        });
    else
        l_PlayerEmulatorService_0.CustomPoliciesEnabled = true;
        return nil;
    end;
end;
return v3.connect(function(v33, _)
    return {
        mainSwitchEnabled = v33.MainSwitch.mainSwitchEnabled, 
        customPolicySwitchEnabled = v33.CustomPolicySwitch.customPolicySwitchEnabled, 
        customPolicySwitchActive = v33.CustomPolicySwitch.customPolicySwitchActive
    };
end, function(v35)
    return {
        onCustomPolicyEnabledChanged = function(v36)
            v35(v8(v36));
        end, 
        onCustomPolicySwitchEnabledChanged = function(v37)
            v35(v9(v37));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v13)));
