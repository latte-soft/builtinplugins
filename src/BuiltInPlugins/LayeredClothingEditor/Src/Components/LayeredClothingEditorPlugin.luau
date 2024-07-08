local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.AvatarToolsShared);
local v6 = require(l_Parent_0.Packages.LuaMeshEditingModule.Tools.PointTool);
local l_ConfirmDialog_0 = v5.Components.ConfirmDialog;
local l_LuaMeshEditingModuleContext_0 = v5.Contexts.LuaMeshEditingModuleContext;
local l_EditingItemContext_0 = v5.Contexts.EditingItemContext;
local l_Signals_0 = v5.Contexts.Signals;
local l_RunService_0 = game:GetService("RunService");
local l_DockWidget_0 = v4.UI.DockWidget;
local l_ContextServices_0 = v4.ContextServices;
local v14 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v15 = require(l_Parent_0.Src.Reducers.MainReducer);
local v16 = require(l_Parent_0.Src.Middleware.MainMiddleware);
local v17 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local v18 = require(l_Parent_0.Src.Resources.PluginTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v21 = require(l_Parent_0.Src.Components.LayeredClothingEditor);
local v22 = require(l_Parent_0.Src.Thunks.CloseEditor);
local _ = require(l_Parent_0.Src.Thunks.ReleaseEditor);
local v24 = require(l_Parent_0.Src.Util.makePluginActions);
local v25 = require(l_Parent_0.Src.Util.Constants);
local v26 = require(l_Parent_0.Src.Util.ShowDialog);
local v27 = require(l_Parent_0.Bin.ClothesHelper);
local v28 = require(l_Parent_0.Src.Thunks.FinishSelectingFromExplorer);
local v29 = v2.PureComponent:extend("LayeredClothingEditorPlugin");
local v30 = Vector2.new(380, 550);
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
v29.showEditorInPlayModeError = function(v32)
    v26(v32.plugin, v32.localization, l_ConfirmDialog_0, {
        Text = v32.localization:getText("EditorErrors", "OpenedWhileRunning")
    });
end;
v29.init = function(v33)
    local l_plugin_0 = v33.props.plugin;
    l_plugin_0.Name = "AccessoryFittingTool";
    v33.plugin = l_ContextServices_0.Plugin.new(l_plugin_0);
    v33.state = {
        enabled = false
    };
    v33.store = v3.Store.new(v15, {}, v16);
    v33.theme = v18.makePluginTheme();
    v33.analytics = l_ContextServices_0.Analytics.new(v17);
    v33.localization = l_ContextServices_0.Localization.new({
        pluginName = "AccessoryFittingTool", 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        libraries = {
            [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v5.Resources.SourceStrings, 
                translationResourceTable = v5.Resources.LocalizedStrings
            }
        }
    });
    local v35 = if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then l_plugin_0:CreateToolbar(v33.localization:getText("Meta", "ToolbarName")) else l_plugin_0:CreateToolbar("Avatar");
    v33.toolbarButton = v35:CreateButton("LayeredClothingEditorButton", v33.localization:getText("Main", "Tooltip"), "rbxlocaltheme://AccessoryFittingTool", v33.localization:getText("Main", "ToolbarButton"));
    v27:init(v33.plugin, v35, v33.localization, v33.analytics);
    v33.onClose = function()
        v33:setState({
            enabled = false
        });
        v33.store:dispatch(v22(l_plugin_0, v33.analytics, v33.meshEditingContext));
    end;
    v33.onToggleWidget = function()
        if l_RunService_0:IsEdit() then
            if not v33.state.enabled then
                l_plugin_0:Activate(true);
                v33.analytics:getHandler("PluginOpened")();
            end;
            v33:setState(function(v36)
                return {
                    enabled = not v36.enabled
                };
            end);
            if not v33.state.enabled then
                v33.store:dispatch(v22(l_plugin_0, v33.analytics, v33.meshEditingContext));
            end;
            return ;
        else
            v33:showEditorInPlayModeError();
            return ;
        end;
    end;
    v33.pluginActions = l_ContextServices_0.PluginActions.new(l_plugin_0, v24(l_plugin_0, v33.localization));
    v33.signals = l_Signals_0.new(v25.SIGNAL_KEYS);
    v33.editingItemContext = l_EditingItemContext_0.new();
    local v37 = v6.new();
    v37:setFalloff(v25.DEFAULT_FALLOFF);
    v33.meshEditingContext = l_LuaMeshEditingModuleContext_0.new({
        [v25.TOOL_MODE.Point] = v37
    });
    v33.toolbarButton.Click:connect(v33.onToggleWidget);
    v33.onFocus = function()
        game:GetService("Selection"):Set({});
        if not l_plugin_0:IsActivatedWithExclusiveMouse() then
            l_plugin_0:Activate(true);
        end;
        task.delay(0, function()
            v33.toolbarButton:SetActive(true);
            v33.signals:get(v25.SIGNAL_KEYS.PluginWindowFocused):Fire();
        end);
    end;
    v33.onWidgetEnabledChanged = function(v38)
        if not v38.Enabled or l_RunService_0:IsEdit() then
            v33:setState({
                enabled = v38.Enabled
            });
            return ;
        else
            v33:setState({
                enabled = false
            });
            v33:showEditorInPlayModeError();
            return ;
        end;
    end;
end;
v29.render = function(v39)
    v39.toolbarButton:SetActive(v39.state.enabled);
    if not v39.state.enabled then
        v39.store:dispatch(v28());
    end;
    return v2.createElement(v14, {
        plugin = v39.plugin, 
        analytics = v39.analytics, 
        localization = v39.localization, 
        theme = v39.theme, 
        store = v39.store, 
        pluginActions = v39.pluginActions, 
        mouse = v39.props.plugin:getMouse(), 
        signals = v39.signals, 
        editingItemContext = v39.editingItemContext, 
        meshEditingContext = v39.meshEditingContext
    }, {
        Widget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "LayeredClothingEditor", 
            Title = v39.localization:getText("Main", "Title"), 
            Enabled = v39.state.enabled, 
            Size = v30, 
            InitialDockState = Enum.InitialDockState.Left, 
            MinSize = v30, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            ShouldRestore = true, 
            Plugin = v39.plugin, 
            OnClose = v39.onClose, 
            OnWidgetRestored = function()
            end, 
            OnWidgetFocused = v39.onFocus, 
            [v2.Change.Enabled] = v39.onWidgetEnabledChanged
        }, {
            LayeredClothingEditor = v39.state.enabled and v2.createElement(v21)
        })
    });
end;
return v29;
