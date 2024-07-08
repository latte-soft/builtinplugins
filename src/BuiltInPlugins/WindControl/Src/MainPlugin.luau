local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v11 = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocol);
local v12 = require(l_Parent_0.Src.Util.Telemetry.WindsockOrigin);
local v13 = require(l_Parent_0.Src.Util.Telemetry.WindsockUsage);
local _ = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocolTypes);
local v15 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v16 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v19 = require(l_Parent_0.Src.Components.MainGui);
local l_EnableWindControlPluginPropertyButton_0 = game:GetFastFlag("EnableWindControlPluginPropertyButton");
local l_EnableWindControlPluginRibbonButton_0 = game:GetFastFlag("EnableWindControlPluginRibbonButton");
local l_EnableWindControlRBXTelemetry_0 = game:GetFastFlag("EnableWindControlRBXTelemetry");
local v23 = v1.PureComponent:extend("MainPlugin");
v23.init = function(v24, _)
    v24:setState({
        enabled = false
    });
    v24.log = function(v26, v27)
        v24.telemetry:logRobloxTelemetryEvent(v26, nil, l_join_0({
            placeId = game.PlaceId
        }, v27));
    end;
    v24.logUsageReport = function(v28)
        if v15:totalCount() > 0 then
            v24.log(v13, {
                ctx = v28, 
                textFieldCount = v15.textFieldCount, 
                sliderCount = v15.sliderCount, 
                greenCircleCount = v15.greenCircleCount
            });
            v15:reset();
        end;
    end;
    v24.toggleEnabled = function()
        v24:setState(function(v29)
            return {
                enabled = not v29.enabled
            };
        end);
    end;
    v24.toggleFromRibbon = function()
        v24.toggleEnabled();
        if v24.state.enabled then
            v24.logUsageReport("widgetDisabled");
            return ;
        else
            v24.log(v12, {
                ctx = "ribbon"
            });
            return ;
        end;
    end;
    v24.toggleFromProperties = function()
        v24.toggleEnabled();
        if v24.state.enabled then
            v24.logUsageReport("widgetDisabled");
            return ;
        else
            v24.log(v12, {
                ctx = "properties"
            });
            return ;
        end;
    end;
    v24.onClose = function()
        v24:setState({
            enabled = false
        });
    end;
    v24.onRestore = function(v30)
        v24:setState({
            enabled = v30
        });
    end;
    v24.onWidgetEnabledChanged = function(v31)
        v24:setState({
            enabled = v31.Enabled
        });
    end;
    v24.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "WindControl"
    });
    v24.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v24.telemetry = v11.new();
    if l_EnableWindControlPluginPropertyButton_0 then
        if not l_EnableWindControlRBXTelemetry_0 then
            v24.onOpenWindControlEditorConnection = l_MemStorageService_0:bind("openGlobalWindControl", v24.toggleEnabled);
        else
            v24.onOpenWindControlEditorConnection = l_MemStorageService_0:bind("openGlobalWindControl", v24.toggleFromProperties);
            return ;
        end;
    end;
end;
v23.renderButtons = function(v32, v33)
    local l_enabled_0 = v32.state.enabled;
    if not l_EnableWindControlPluginRibbonButton_0 then
        return {
            Toggle = v1.createElement(l_PluginButton_0, {
                Toolbar = v33, 
                Active = l_enabled_0, 
                Id = "wind_control_toggle_button", 
                Title = v32.localization:getText("Plugin", "Button"), 
                Tooltip = v32.localization:getText("Plugin", "Description"), 
                Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
                OnClick = if not l_EnableWindControlRBXTelemetry_0 then v32.toggleEnabled else v32.toggleFromRibbon, 
                ClickableWhenViewportHidden = true
            })
        };
    else
        return {
            Toggle = v1.createElement(l_PluginButton_0, {
                Toolbar = v33, 
                Active = l_enabled_0, 
                Title = "WindControl", 
                Tooltip = "", 
                Icon = "", 
                OnClick = if not l_EnableWindControlRBXTelemetry_0 then v32.toggleEnabled else v32.toggleFromRibbon, 
                ClickableWhenViewportHidden = false
            })
        };
    end;
end;
v23.render = function(v35)
    local l_Plugin_1 = v35.props.Plugin;
    local l_enabled_1 = v35.state.enabled;
    local _ = nil;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v16(), 
        v35.localization, 
        v35.analytics
    }, {
        MainGui = l_enabled_1 and v1.createElement(v19, {}), 
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = if not l_EnableWindControlPluginRibbonButton_0 then v35.localization:getText("Plugin", "Toolbar") else "windControl", 
            RenderButtons = function(v39)
                return v35:renderButtons(v39);
            end
        })
    });
end;
v23.willUnmount = function(v40)
    if not (not l_EnableWindControlRBXTelemetry_0 or not v40.analytics) then
        v40.logUsageReport("placeClosing");
    end;
    if not (not l_EnableWindControlPluginPropertyButton_0 or not v40.onOpenWindControlEditorConnection) then
        v40.onOpenWindControlEditorConnection:Disconnect();
        v40.onOpenWindControlEditorConnection = nil;
    end;
end;
return v23;
