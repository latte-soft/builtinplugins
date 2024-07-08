local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_IconButton_0 = v2.UI.IconButton;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local v10 = v2.Util.LayoutOrderIterator.new();
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v13 = require(l_script_FirstAncestor_0.Src.Components.DeviceBlueprint);
local v14 = require(l_script_FirstAncestor_0.Src.Util.MousePositionContext);
local v15 = require(l_script_FirstAncestor_0.Src.Components.MappingsContextProvider);
local _ = require(l_script_FirstAncestor_0.Src.Components.MappingsList);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v18 = require(l_script_FirstAncestor_0.Src.Components.MappingsDialog);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v20 = v1.PureComponent:extend("MainPlugin");
v20.init = function(v21, v22)
    v21.state = {
        enabled = false, 
        wrapperRef = nil, 
        editMappingsVisible = false
    };
    v21.toggleEnabled = function()
        v21:setState(function(v23)
            return {
                enabled = not v23.enabled
            };
        end);
    end;
    v21.onClose = function()
        v21:setState({
            enabled = false
        });
    end;
    v21.onRestore = function(v24)
        v21:setState({
            enabled = v24
        });
    end;
    v21.onWidgetEnabledChanged = function(v25)
        v21:setState({
            enabled = v25.Enabled
        });
    end;
    v21.onDockWidgetCreated = function()
        v21.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v21.toggleEnabled);
    end;
    v21.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "ControlsEmulator"
    });
    v21.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v21.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v21.design = l_registerPluginStyles_0(v22.Plugin);
end;
v20.didUpdate = function(v26)
    v26.props.PluginLoaderContext.mainButton:SetActive(v26.state.enabled);
    pcall(function()
        l_StudioDeviceEmulator_0:SetGamepadEmulationEnabled(v26.state.enabled);
    end);
end;
v20.render = function(v27)
    local l_props_0 = v27.props;
    local l_state_0 = v27.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v27.localization, 
        v27.analytics
    }, v1.createElement(v15, {}, {
        v1.createElement(v14.Provider, {
            value = if not v27.state.wrapperRef then v19.DEFAULT_MOUSE_POSITION_CONTEXT_STATE else {
                InputChanged = v27.state.wrapperRef.InputChanged, 
                InputEnded = v27.state.wrapperRef.InputEnded
            }
        }, {
            MainWidget = v1.createElement(l_DockWidget_0, {
                Id = "ControlsEmulator", 
                Enabled = l_state_0.enabled, 
                Title = v27.localization:getText("Plugin", "Name"), 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                InitialDockState = Enum.InitialDockState.Bottom, 
                Size = Vector2.new(640, 480), 
                MinSize = Vector2.new(250, 200), 
                OnClose = v27.onClose, 
                Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
                OnWidgetCreated = v27.onDockWidgetCreated, 
                [v1.Change.Enabled] = v27.onWidgetEnabledChanged
            }, {
                Wrapper = v1.createElement("Frame", {
                    [v1.Tag] = "X-Fill X-Column", 
                    ref = function(v31)
                        v27:setState({
                            wrapperRef = v31
                        });
                    end
                }, {
                    EditMappingsButton = v1.createElement(l_IconButton_0, {
                        LayoutOrder = v10:getNextOrder(), 
                        Text = "Edit Mappings", 
                        OnClick = function()
                            v27:setState({
                                editMappingsVisible = not v27.state.editMappingsVisible
                            });
                        end
                    }), 
                    DeviceBlueprint = v1.createElement(v13, {
                        LayoutOrder = v10:getNextOrder()
                    })
                }), 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v27.design
                })
            }), 
            MappingsDialog = v1.createElement(l_DockWidget_0, {
                Id = "ControlsEmulatorMappings", 
                Enabled = v27.state.editMappingsVisible, 
                Title = "Edit Mappings", 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                InitialDockState = Enum.InitialDockState.Float, 
                Size = Vector2.new(640, 480), 
                MinSize = Vector2.new(250, 200), 
                OnClose = function()
                    v27:setState({
                        editMappingsVisible = false
                    });
                end
            }, {
                v1.createElement(v18, {}); 
                StyleLink = v1.createElement("StyleLink", {
                    StyleSheet = v27.design
                })
            })
        })
    }));
end;
return v20;
