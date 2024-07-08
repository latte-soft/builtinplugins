local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_PluginToolbar_0 = v2.UI.PluginToolbar;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v11 = require(l_Components_0.AlertDialog);
local v12 = require(l_Components_0.StatusButton);
local v13 = require(l_Parent_0.Src.Controllers.ServiceController);
local v14 = v1.PureComponent:extend("MainPlugin");
v14.init = function(v15)
    v15.serviceController = v13.new();
    v15:setState({
        alertEnabled = false, 
        deviceName = "", 
        vrEnabled = false
    });
    v15.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "VRStatus"
    });
    v15.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v14.didMount = function(v16)
    local l_serviceController_0 = v16.serviceController;
    local v18 = l_serviceController_0:getService("UserGameSettings");
    local v19 = l_serviceController_0:getService("VRService");
    v16:setState({
        deviceName = v19.VRDeviceName, 
        vrEnabled = v18.VREnabled
    });
    v16._deviceNameConnection = v19:GetPropertyChangedSignal("VRDeviceName"):Connect(function()
        v16:setState({
            deviceName = v19.VRDeviceName
        });
    end);
    v16._vrEnabledConnection = v18:GetPropertyChangedSignal("VREnabled"):Connect(function()
        v16:setState({
            vrEnabled = v18.VREnabled
        });
    end);
end;
v14.willUnmount = function(v20)
    if v20._deviceNameConnection then
        v20._deviceNameConnection:Disconnect();
        v20._deviceNameConnection = nil;
    end;
    if v20._vrEnabledConnection then
        v20._vrEnabledConnection:Disconnect();
        v20._vrEnabledConnection = nil;
    end;
end;
v14.renderButtons = function(v21, v22)
    local l_state_0 = v21.state;
    return {
        Toggle = v1.createElement(v12, {
            toolbar = v22, 
            enabled = l_state_0.alertEnabled, 
            showAlert = function()
                v21:setState({
                    alertEnabled = true
                });
            end, 
            deviceName = l_state_0.deviceName, 
            vrEnabled = l_state_0.vrEnabled
        })
    };
end;
v14.render = function(v24)
    local l_props_0 = v24.props;
    local l_state_1 = v24.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v7(), 
        v24.localization, 
        v24.analytics, 
        v24.serviceController
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = v24.localization:getText("Plugin", "Name"), 
            RenderButtons = function(v28)
                return v24:renderButtons(v28);
            end
        }); 
        v1.createElement(v11, {
            OnClose = function()
                v24:setState({
                    alertEnabled = false
                });
            end, 
            enabled = l_state_1.alertEnabled, 
            deviceName = l_state_1.deviceName, 
            vrEnabled = l_state_1.vrEnabled
        })
    });
end;
return v14;
