local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Styling_0 = v2.Styling;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioWidgetsService");
end);
local v8 = if not l_status_0 then nil else l_result_0;
local l_status_1, l_result_1 = pcall(function()
    return game:GetService("RibbonNotificationService");
end);
local v11 = if not l_status_1 then nil else l_result_1;
local l_ContextServices_0 = v2.ContextServices;
local l_registerPluginStyles_0 = l_Styling_0.registerPluginStyles;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Focus_0 = l_ContextServices_0.Focus;
local v17 = require(l_Parent_0.Src.Contexts.AnalyticsContext);
local v18 = require(l_Parent_0.Src.Contexts.TrayVisibleProvider);
local v19 = require(l_Parent_0.Src.Resources.MakeTheme);
local v20 = require(l_Parent_0.Src.Util.AttachmentConstants);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v23 = require(l_Parent_0.Src.Util.TraySize);
local l_TRAY_WIDTH_0 = v23.TRAY_WIDTH;
local l_TRAY_HEIGHT_0 = v23.TRAY_HEIGHT;
local v26 = require(l_Parent_0.Src.Components.App);
local l_NotificationsRibbonAttachment_0 = game:GetFastFlag("NotificationsRibbonAttachment");
local v28 = v1.PureComponent:extend("MainPlugin");
v28.init = function(v29, v30)
    v29.state = {
        enabled = false, 
        widget = nil
    };
    v29.attachmentInfo = v20.DatamodelSessionUnloadedAttachmentInfo;
    v29.toggleEnabled = function(v31, v32, v33)
        local v34 = not v29.state.enabled and v31;
        if not (not v29.state.widget or not v34 and not v32) then
            if not l_NotificationsRibbonAttachment_0 then
                local l_v8_WidgetFromLabel_0 = v8:GetWidgetFromLabel("whatsNewAction");
                local l_StudioAttachment_0 = Instance.new("StudioAttachment");
                l_StudioAttachment_0.IsArrowVisible = false;
                l_StudioAttachment_0.SourceAnchorPoint = v29.attachmentInfo.SourceAnchorPoint;
                l_StudioAttachment_0.TargetAnchorPoint = v29.attachmentInfo.TargetAnchorPoint;
                l_StudioAttachment_0.Offset = v29.attachmentInfo.Offset;
                v29.state.widget.Enabled = true;
                v8:AttachPluginGui(l_v8_WidgetFromLabel_0, v29.state.widget, l_StudioAttachment_0);
            else
                local l_Uri_0 = v30.Plugin:GetUri();
                v30.Plugin:GetPluginComponent("Panels"):SetAttachment({
                    DataModel = l_Uri_0.DataModel, 
                    PluginType = l_Uri_0.PluginType, 
                    PluginId = l_Uri_0.PluginId, 
                    Category = "Panels", 
                    ItemId = "Notifications"
                }, {
                    TargetWidgetUri = {
                        DataModel = "Standalone", 
                        PluginType = "Standalone", 
                        PluginId = "Ribbon", 
                        Category = "Widgets", 
                        ItemId = "RightMezzanine/Notifications"
                    }, 
                    TargetAnchorPoint = Vector2.new(1, 1), 
                    SubjectAnchorPoint = Vector2.new(1, 0), 
                    Offset = Vector2.new(0, 0)
                });
                v29.state.widget.Enabled = true;
            end;
        end;
        if not ((not v29.state.widget or not v34) or not v33) then
            v17.eventHandlers.trayOpened();
        end;
        v29:setState({
            enabled = v31
        });
    end;
    v29.onRestore = function(v38)
        v29:setState({
            enabled = v38
        });
    end;
    v29.onWidgetEnabledChanged = function(v39)
        v29:setState({
            enabled = v39.Enabled
        });
    end;
    v29.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Notifications"
    });
    v29.design = l_registerPluginStyles_0(v30.Plugin);
    v29.toggleNotificationTrayConnection = v11.ToggleNotificationTray:Connect(function(v40, v41)
        v29.toggleEnabled(v40, false, v41);
    end);
    local l_MultipleDocumentInterfaceInstance_0 = v30.Plugin.MultipleDocumentInterfaceInstance;
    v29.dmOpenSession = l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(function(_)
        v29.attachmentInfo = v20.DatamodelSessionLoadedAttachmentInfo;
        if v29.state.enabled then
            v29.toggleEnabled(v29.state.enabled, true, false);
        end;
    end);
    v29.dmCloseSession = l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(function(_)
        v29.attachmentInfo = v20.DatamodelSessionUnloadedAttachmentInfo;
        if v29.state.enabled then
            v29.toggleEnabled(v29.state.enabled, true, false);
        end;
    end);
end;
v28.didMount = function(v45)
    if not v45.state.widget then
        v45:setState({
            widget = v45.props.Plugin:CreateQWidgetPluginGui(l_Parent_0.Name, {
                Size = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                MinSize = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                Modal = false, 
                Callout = true, 
                InitialEnabled = false
            })
        });
        return ;
    else
        return ;
    end;
end;
v28.willUnmount = function(v46)
    v46.toggleNotificationTrayConnection:Disconnect();
    v46.dmOpenSession:Disconnect();
    v46.dmCloseSession:Disconnect();
end;
v28.render = function(v47)
    local l_props_0 = v47.props;
    local l_state_0 = v47.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    if v47.state.widget then
        return l_ContextServices_0.provide({
            l_Plugin_0.new(l_Plugin_1), 
            l_Mouse_0.new(l_Plugin_1:getMouse()), 
            l_Focus_0.new(v47.state.widget), 
            v19(), 
            v47.localization, 
            v17
        }, {
            MainWidget = v1.createElement(l_DockWidget_0, {
                Id = "StudioNotifications", 
                Enabled = l_enabled_0, 
                Title = v47.localization:getText("Plugin", "Name"), 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                InitialDockState = Enum.InitialDockState.Left, 
                Size = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                MinSize = Vector2.new(l_TRAY_WIDTH_0, l_TRAY_HEIGHT_0), 
                ShouldRestore = true, 
                OnWidgetRestored = v47.onRestore, 
                Widget = v47.state.widget, 
                [v1.Change.Enabled] = v47.onWidgetEnabledChanged
            }, {
                AppWithProvider = v1.createElement(v18, {
                    trayVisible = l_enabled_0
                }, {
                    App = v1.createElement(v26)
                }), 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v47.design
                })
            })
        }, true);
    else
        return ;
    end;
end;
return v28;
