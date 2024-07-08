local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_Pane_0 = v2.UI.Pane;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = require(l_script_FirstAncestor_0.Src.Components.AudioEqualizerEditor);
local v14 = v1.PureComponent:extend("MainPlugin");
v14.init = function(v15, v16)
    local v17 = {
        LowGain = 0, 
        MidGain = 0, 
        HighGain = 0, 
        MidRange = NumberRange.new(200, 20000)
    };
    v15.state = {
        enabled = false, 
        instanceId = -1, 
        instanceName = "", 
        initialEqData = v17, 
        analysisEnabled = true, 
        closeDMConnection = nil, 
        forceRerender = false
    };
    v15.setDisabled = function()
        if v15.state.closeDMConnection then
            v15.state.closeDMConnection:Disconnect();
        end;
        v16.Plugin:Invoke("OnStopEditing");
        v15:setState({
            enabled = false, 
            initialEqData = v17, 
            instanceId = -1, 
            instanceName = "", 
            closeDMConnection = nil
        });
    end;
    v15.onChanged = function(v18)
        v16.Plugin:Invoke("OnEdit", v18);
    end;
    v15.onAttachAnalyzer = function(v19)
        v16.Plugin:Invoke("OnAttachAnalyzer", v19);
    end;
    v15.setAnalysisEnabled = function(v20)
        v15:setState({
            analysisEnabled = v20
        });
    end;
    v15.onWidgetEnabledChanged = function(_)
        v15.setDisabled();
        v15:setState({
            forceRerender = not v15.state.forceRerender
        });
    end;
    v16.Plugin:OnInvoke("OnOpen", function(v22, v23, v24)
        local l_FocusedDataModelSession_0 = v16.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 then
            v15:setState({
                closeDMConnection = l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function()
                    v15.setDisabled();
                end)
            });
        end;
        v15:setState({
            enabled = true, 
            instanceId = v23, 
            instanceName = v24, 
            initialEqData = v22
        });
    end);
    v16.Plugin:OnInvoke("OnInstanceChanged", function(v26)
        v15:setState({
            initialEqData = v26
        });
    end);
    v15.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AudioEqualizerEditor"
    });
    v15.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v15.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v15.design = l_registerPluginStyles_0(v16.Plugin);
end;
v14.didUpdate = function(_)
end;
v14.render = function(v28)
    local l_props_0 = v28.props;
    local l_state_0 = v28.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v28.localization, 
        v28.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AudioEqualizerEditor", 
            Enabled = l_enabled_0, 
            Title = v28.localization:getText("Plugin", "Name") .. " - " .. l_state_0.instanceName, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v28.setDisabled, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v28.onDockWidgetCreated, 
            ShouldRestore = false, 
            [v1.Change.Enabled] = v28.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                {
                    ["AudioEqualizerEditor_" .. l_state_0.instanceId] = v1.createElement(v13, {
                        Enabled = l_enabled_0, 
                        EqData = l_state_0.initialEqData, 
                        OnChanged = v28.onChanged, 
                        AnalysisEnabled = v28.state.analysisEnabled, 
                        SetAnalysisEnabled = v28.setAnalysisEnabled
                    })
                }
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v28.design
            })
        })
    });
end;
return v14;
