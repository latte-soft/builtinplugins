local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v13 = require(l_script_FirstAncestor_0.Src.Util.SerializationUtil);
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v18 = require(l_script_FirstAncestor_0.Src.Components.AttenuationCurveRenderer);
local v19 = v1.PureComponent:extend("MainPlugin");
v19.init = function(v20, v21)
    v20.state = {
        enabled = false, 
        instanceId = -1, 
        instanceName = "", 
        initialCurveData = {}, 
        currentCurveData = {}, 
        closeDMConnection = nil, 
        forceRerender = false
    };
    v20.setDisabled = function()
        if v20.state.closeDMConnection then
            v20.state.closeDMConnection:Disconnect();
        end;
        v21.Plugin:Invoke("OnStopEditing");
        v20:setState({
            enabled = false, 
            initialCurveData = {}, 
            currentCurveData = {}, 
            instanceId = -1, 
            instanceName = "", 
            closeDMConnection = nil
        });
    end;
    v20.onChanged = function(v22)
        v21.Plugin:Invoke("OnEdit", v13.stringifyCurveTable(v22));
        v20:setState({
            currentCurveData = v22
        });
    end;
    v20.onWidgetEnabledChanged = function(_)
        v20.setDisabled();
        v20:setState({
            forceRerender = not v20.state.forceRerender
        });
    end;
    v21.Plugin:OnInvoke("OnOpen", function(v24, v25, v26)
        local l_FocusedDataModelSession_0 = v21.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 then
            v20:setState({
                closeDMConnection = l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function()
                    v20.setDisabled();
                end)
            });
        end;
        local v28 = v13.destringifyCurveTable(v24);
        v20:setState({
            enabled = true, 
            instanceId = v25, 
            instanceName = v26, 
            initialCurveData = v28, 
            currentCurveData = v28
        });
    end);
    v20.store = v2.Store.new(v12, nil, {
        v2.thunkMiddleware
    }, nil);
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AttenuationCurveEditor"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v20.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v20.design = l_registerPluginStyles_0(v21.Plugin);
end;
v19.didUpdate = function(_)
end;
v19.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v30.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v30.localization, 
        v30.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AttenuationCurveEditor", 
            Enabled = l_enabled_0, 
            Title = v30.localization:getText("Plugin", "Name") .. " - " .. l_state_0.instanceName, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(540, 300), 
            OnClose = v30.setDisabled, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v30.onDockWidgetCreated, 
            ShouldRestore = false, 
            [v1.Change.Enabled] = v30.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                ["AttenuationCurveEditor_" .. l_state_0.instanceId] = v1.createElement(v18, {
                    CurveData = l_state_0.initialCurveData, 
                    Enabled = l_enabled_0, 
                    OnChanged = v30.onChanged, 
                    OnSave = v30.setDisabled
                })
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v30.design
            })
        })
    });
end;
return v19;
