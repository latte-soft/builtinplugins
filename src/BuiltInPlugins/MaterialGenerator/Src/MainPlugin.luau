local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.MaterialFramework);
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.ReactUtils);
local v6 = require(l_Parent_0.Packages.ReactRoblox);
local v7 = require(l_Parent_0.Packages.Rodux);
local v8 = require(l_Parent_0.SharedPluginConstants);
local l_ContextStack_0 = v5.ContextStack;
local l_DockWidget_0 = v2.UI.DockWidget;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_StudioServices_0 = v3.Context.StudioServices;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Components_0 = l_Parent_0.Src.Components;
local v18 = require(l_Components_0.App);
local v19 = require(l_Components_0.GenerationProvider);
local v20 = require(l_Components_0.GeneratedMaterialsProvider);
local v21 = require(l_Components_0.PluginSettingsProvider);
local v22 = require(l_Components_0.PreviewProvider);
local v23 = require(l_Components_0.MainView);
local v24 = require(l_Parent_0.Src.Controllers.MaterialPreviewController);
local v25 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v26 = require(l_Parent_0.Src.Flags.getFFlagShowMaterialGeneratorFromElsewhere);
local v27 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerUIChanges);
local v28 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v29 = require(l_Parent_0.Src.Flags.getFFlagMaterialPickerFixButtonState);
local v30 = require(l_Parent_0.Src.Reducers.MainReducer);
local v31 = require(l_Parent_0.Src.Resources.MakeTheme);
local v32 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v35 = require(l_Parent_0.Src.Util.Constants);
local v36 = v4.PureComponent:extend("MainPlugin");
v36.init = function(v37, _)
    if not v26() then
        v37:setState({
            enabled = false
        });
    else
        v37:setState({
            enabled = false, 
            explicitlyOpened = false
        });
    end;
    v37.setEnabled = function(v39)
        if v27() then
            l_MemStorageService_0:setItem(v8.MATERIAL_GENERATOR_ENABLED, (tostring(v39)));
        end;
        v37:setState({
            enabled = v39
        });
    end;
    v37.toggleEnabled = function()
        if not v26() then
            if not v29() then
                v37:setState(function(v40)
                    return {
                        enabled = not v40.enabled
                    };
                end);
                return ;
            else
                v37.setEnabled(not v37.state.enabled);
                return ;
            end;
        elseif not v29() then
            v37:setState(function(v41)
                return {
                    enabled = not v41.enabled, 
                    explicitlyOpened = true
                };
            end);
            return ;
        else
            v37.setEnabled(not v37.state.enabled);
            v37:setState({
                explicitlyOpened = true
            });
            return ;
        end;
    end;
    v37.onClose = function()
        if not v29() then
            v37:setState({
                enabled = false
            });
            return ;
        else
            v37.setEnabled(false);
            return ;
        end;
    end;
    v37.onRestore = function(v42)
        if not v26() then
            if not v29() then
                v37:setState({
                    enabled = v42
                });
            else
                v37.setEnabled(v42);
                return ;
            end;
        elseif not v29() then
            if not v37.state.explicitlyOpened then
                v37:setState({
                    enabled = v42
                });
                return ;
            end;
        elseif not v37.state.explicitlyOpened then
            v37.setEnabled(v42);
            return ;
        end;
    end;
    v37.onDockWidgetCreated = function()
        v37.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v37.toggleEnabled);
    end;
    v37.onWidgetEnabledChanged = function(v43)
        if not v29() then
            v37:setState({
                enabled = v43.Enabled
            });
            return ;
        else
            v37.setEnabled(v43.Enabled);
            return ;
        end;
    end;
    v37.store = v7.Store.new(v30, nil, {
        v7.thunkMiddleware
    }, nil);
    v37.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialGenerator"
    });
    v37.analytics = l_ContextServices_0.Analytics.new(v32);
    if not v25() then
        v37.materialPreviewController = v24.new(v37.store);
    else
        v37.studioServices = l_StudioServices_0.new();
    end;
    if v26() then
        l_MemStorageService_0:Bind(v8.SHOW_MATERIAL_GENERATOR_PLUGIN_EVENT, function()
            if not v29() then
                v37:setState({
                    enabled = true, 
                    explicitlyOpened = true
                });
                return ;
            else
                v37.setEnabled(true);
                v37:setState({
                    explicitlyOpened = true
                });
                return ;
            end;
        end);
        if not v28() then
            l_MemStorageService_0:Bind(v8.DEPRECATED_HIDE_MATERIAL_GENERATOR_PLUGIN_EVENT, function()
                v37.onClose();
            end);
        end;
    end;
end;
v36.willUnmount = function(v44)
    if not v25() then
        if v44.materialPreviewController then
            v44.materialPreviewController:destroy();
        end;
    elseif v44.studioServices then
        v44.studioServices:destroy();
        return ;
    end;
end;
v36.didUpdate = function(v45)
    v45.props.pluginLoaderContext.mainButton:SetActive(v45.state.enabled);
end;
v36.render = function(v46)
    local l_props_0 = v46.props;
    local l_state_0 = v46.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    if not (v29() or not v27()) then
        l_MemStorageService_0:setItem(v8.MATERIAL_GENERATOR_ENABLED, not l_enabled_0 and "false" or "true");
    end;
    local v51 = {
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v31(), 
        v46.localization, 
        v46.analytics
    };
    if not v25() then
        table.insert(v51, l_Store_0.new(v46.store));
        table.insert(v51, v46.materialPreviewController);
        table.insert(v51, l_StudioServices_0.new());
    else
        table.insert(v51, v46.studioServices);
    end;
    return l_ContextServices_0.provide(v51, {
        MainWidget = if not v25() then v4.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "MaterialGenerator", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v46.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = if not v25() then Vector2.new(640, 480) else v35.PLUGIN_SIZE, 
            MinSize = if not v25() then Vector2.new(250, 200) else v35.PLUGIN_MIN_SIZE, 
            OnClose = v46.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v46.onRestore, 
            OnWidgetCreated = v46.onDockWidgetCreated, 
            [v6.Change.Enabled] = v46.onWidgetEnabledChanged
        }, not not l_enabled_0 and {
            Contents = v4.createElement(v23)
        } or nil) else v4.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "MaterialGenerator", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v46.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Left, 
            Size = if not v25() then Vector2.new(640, 480) else v35.PLUGIN_SIZE, 
            MinSize = if not v25() then Vector2.new(250, 200) else v35.PLUGIN_MIN_SIZE, 
            OnClose = v46.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v46.onRestore, 
            OnWidgetCreated = v46.onDockWidgetCreated, 
            [v6.Change.Enabled] = v46.onWidgetEnabledChanged
        }, {
            Content = v4.createElement(l_ContextStack_0, {
                providers = {
                    v4.createElement(v20), 
                    v4.createElement(v19), 
                    v4.createElement(v21), 
                    v4.createElement(v22, {
                        enabled = l_enabled_0
                    })
                }
            }, {
                App = if not l_enabled_0 then nil else v4.createElement(v18)
            })
        })
    });
end;
return v36;
