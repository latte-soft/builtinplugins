local l_Parent_0 = script.Parent.Parent;
local l_Src_0 = l_Parent_0.Src;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Src_0.Reducers.MainReducer);
local v13 = require(l_Src_0.Resources.MakeTheme);
local v14 = require(l_Src_0.Resources.AnalyticsHolder);
local l_SourceStrings_0 = l_Src_0.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Src_0.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Src_0.Components;
local v18 = require(l_Components_0.Callstack.CallstackWindow);
local v19 = require(l_Components_0.Watch.WatchWindow);
local v20 = require(l_Components_0.Breakpoints.BreakpointsWindow);
local v21 = require(l_Components_0.Watch.WatchComponent);
local v22 = require(l_Components_0.Common.DebuggerToolbarButtons);
local v23 = require(l_Src_0.Middleware.MainMiddleware);
local v24 = require(l_Src_0.Util.DebugConnectionListener.DebugConnectionListener);
local v25 = require(l_Src_0.Util.MetaBreakpointManagerListener.MetaBreakpointManagerListener);
local v26 = require(l_Src_0.Util.CrossDMScriptChangeListener.CrossDMScriptChangeListener);
local v27 = require(l_Src_0.Util.DebuggerUIServiceListener.DebuggerUIServiceListener);
local v28 = require(l_Src_0.Util.MakePluginActions);
local v29 = v2.PureComponent:extend("MainPlugin");
v29.init = function(v30, v31)
    local l_Plugin_1 = v31.Plugin;
    v30.state = {
        callstackWindow = {
            Enabled = false
        }, 
        breakpointsWindow = {
            Enabled = false
        }, 
        watchWindow = {
            Enabled = false
        }, 
        uiDmLoaded = false
    };
    local l_MultipleDocumentInterfaceInstance_0 = l_Plugin_1.MultipleDocumentInterfaceInstance;
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(function(_)
        v30:setState(function()
            return {
                uiDmLoaded = true
            };
        end);
    end);
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(function(_)
        v30:setState(function()
            return {
                uiDmLoaded = false
            };
        end);
    end);
    if l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession then
        v30:setState(function()
            return {
                uiDmLoaded = true
            };
        end);
    end;
    v30.toggleWidgetEnabled = function(v36)
        local v37 = not v30.state[v36].Enabled;
        v30:setState(function(_)
            return {
                [v36] = {
                    Enabled = v37
                }
            };
        end);
    end;
    v30.onWidgetClose = function(v39)
        v30:setState(function(_)
            return {
                [v39] = {
                    Enabled = false
                }
            };
        end);
    end;
    v30.setWidgetEnabledState = function(v41, v42)
        v30:setState(function(_)
            return {
                [v41] = {
                    Enabled = v42
                }
            };
        end);
    end;
    v30.store = v3.Store.new(v12, nil, v23);
    v30.debugConnectionListener = v24.new(v30.store);
    v30.metaBreakpointManagerListener = v25.new(v30.store);
    v30.scriptChangeServiceListener = v26.new(v30.store);
    v30.debuggerUIServiceListener = v27.new(v30.store);
    v30.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Debugger"
    });
    v30.analytics = v14;
    v30.pluginActions = l_ContextServices_0.PluginActions.new(v31.Plugin, v28.getActionsWithShortcuts(v30.localization));
end;
v29.renderButtons = function(v44, v45)
    local l_state_0 = v44.state;
    return {
        ToggleCallstack = v2.createElement(l_PluginButton_0, {
            Name = "callStackDockWidgetActionV2", 
            Toolbar = v45, 
            Active = l_state_0.callstackWindow.Enabled, 
            Title = "Callstack", 
            Tooltip = "", 
            icon = "rbxlocaltheme://CallStack", 
            OnClick = function()
                v44.toggleWidgetEnabled("callstackWindow");
            end, 
            ClickableWhenViewportHidden = true
        }), 
        ToggleBreakpointsWindow = v2.createElement(l_PluginButton_0, {
            Name = "breakpointsDockWidgetActionV2", 
            Toolbar = v45, 
            Active = l_state_0.breakpointsWindow.Enabled, 
            Title = "Breakpoints", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Breakpoint", 
            OnClick = function()
                v44.toggleWidgetEnabled("breakpointsWindow");
            end, 
            ClickableWhenViewportHidden = true
        }), 
        ToggleWatchWindow = v2.createElement(l_PluginButton_0, {
            Name = "watchDockWidgetActionV2", 
            Toolbar = v45, 
            Active = l_state_0.watchWindow.Enabled, 
            Title = "Watch", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Watch", 
            OnClick = function()
                v44.toggleWidgetEnabled("watchWindow");
            end, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v29.render = function(v47)
    local l_props_0 = v47.props;
    local l_state_1 = v47.state;
    local l_Plugin_2 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Store_0.new(v47.store), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v13(), 
        v47.localization, 
        v47.analytics, 
        v47.pluginActions
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = "Debugger", 
            RenderButtons = function(v51)
                return v47:renderButtons(v51);
            end
        }), 
        ToolbarWithRoduxConnection = v2.createElement(v22), 
        CallstackWindow = v2.createElement(v18, {
            Enabled = (l_state_1.uiDmLoaded and l_state_1.callstackWindow) and l_state_1.callstackWindow.Enabled, 
            OnClose = function()
                v47.onWidgetClose("callstackWindow");
            end, 
            OnRestore = function(v52)
                v47.setWidgetEnabledState("callstackWindow", v52);
            end, 
            OnWidgetEnabledChanged = function(v53)
                v47.setWidgetEnabledState("callstackWindow", v53.Enabled);
            end
        }), 
        BreakpointsWindow = v2.createElement(v20, {
            Enabled = (l_state_1.uiDmLoaded and l_state_1.breakpointsWindow) and l_state_1.breakpointsWindow.Enabled, 
            OnClose = function()
                v47.onWidgetClose("breakpointsWindow");
            end, 
            OnRestore = function(v54)
                v47.setWidgetEnabledState("breakpointsWindow", v54);
            end, 
            OnWidgetEnabledChanged = function(v55)
                v47.setWidgetEnabledState("breakpointsWindow", v55.Enabled);
            end
        }), 
        WatchWindow = v2.createElement(v19, {
            Enabled = (l_state_1.uiDmLoaded and l_state_1.watchWindow) and l_state_1.watchWindow.Enabled, 
            OnClose = function()
                v47.onWidgetClose("watchWindow");
            end, 
            OnRestore = function(v56)
                v47.setWidgetEnabledState("watchWindow", v56);
            end, 
            OnWidgetEnabledChanged = function(v57)
                v47.setWidgetEnabledState("watchWindow", v57.Enabled);
            end
        }, {
            Watch = v2.createElement(v21)
        })
    });
end;
v29.willUnmount = function(v58)
    if v58.debugConnectionListener then
        v58.debugConnectionListener:destroy();
        v58.debugConnectionListener = nil;
    end;
    if v58.metaBreakpointManagerListener then
        v58.metaBreakpointManagerListener:destroy();
        v58.metaBreakpointManagerListener = nil;
    end;
    if v58.scriptChangeServiceListener then
        v58.scriptChangeServiceListener:destroy();
        v58.scriptChangeServiceListener = nil;
    end;
    if v58.debuggerUIServiceListener then
        v58.debuggerUIServiceListener:destroy();
        v58.debuggerUIServiceListener = nil;
    end;
end;
return v29;
