local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.Src.Reducers);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local v15 = require(l_Parent_0.Src.InitialStoreState);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v18 = require(script.Parent.TagManager);
local v19 = require(l_Parent_0.Src.Util.createAnalyticsHandlers);
local l_Components_0 = l_Parent_0.Src.Components;
local v21 = require(l_Components_0.MainGui);
local v22 = require(l_Components_0.WorldView);
local l_ImprovePluginSpeed_TagEditor_0 = game:GetFastFlag("ImprovePluginSpeed_TagEditor");
local v24 = v2.PureComponent:extend("MainPlugin");
v24.init = function(v25, _)
    v25.state = {
        enabled = false
    };
    v25.store = v3.Store.new(v13, v15, {
        v3.thunkMiddleware
    }, nil);
    v25.toggleEnabled = function()
        v25:setState(function(v27)
            v25:setEnabled(not v27.enabled, true);
        end);
    end;
    v25.onClose = function()
        v25:setEnabled(false, true);
    end;
    v25.onRestore = function(v28)
        v25:setEnabled(v28, false);
    end;
    v25.onDockWidgetCreated = function()
        if l_ImprovePluginSpeed_TagEditor_0 then
            v25.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v25.toggleEnabled);
        end;
    end;
    v25.onWidgetEnabledChanged = function(v29)
        v25:setEnabled(v29.Enabled, true);
    end;
    v25.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "TagEditor"
    });
    v25.analytics = l_ContextServices_0.Analytics.new(v19);
    v25.manager = v18.new(v25.store, v25.analytics);
end;
v24.sendWindowEnabledAnalytics = function(v30, v31)
    if v30.analytics then
        v30.analytics:report("toggleWidget");
        v30.analytics:report(not v31 and "closeWidget" or "openWidget");
        return ;
    else
        return ;
    end;
end;
v24.setEnabled = function(v32, v33, v34)
    v32:setState(function(v35)
        if v35.enabled == v33 then
            return nil;
        else
            v32.analytics:report("opened");
            if v34 then
                v32:sendWindowEnabledAnalytics(v33);
            end;
            v32.manager:SetEnabled(v33);
            return {
                enabled = v33
            };
        end;
    end);
end;
if not l_ImprovePluginSpeed_TagEditor_0 then
    v24.renderButtons = function(v36, v37)
        return {
            ToggleEditor = v2.createElement(l_PluginButton_0, {
                Toolbar = v37, 
                Active = v36.state.enabled, 
                Title = "TagEditor", 
                Tooltip = "", 
                Icon = "", 
                OnClick = v36.toggleEnabled, 
                ClickableWhenViewportHidden = true
            })
        };
    end;
end;
v24.render = function(v38)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v38.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v38.localization, 
        v38.analytics
    }, {
        Toolbar = if l_ImprovePluginSpeed_TagEditor_0 then nil else v2.createElement(l_PluginToolbar_0, {
            Title = "tagEditorToolbar", 
            RenderButtons = function(v42)
                return v38:renderButtons(v42);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "TagEditor", 
            Enabled = l_state_0.enabled, 
            Widget = if not l_ImprovePluginSpeed_TagEditor_0 then nil else l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v38.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(300, 200), 
            MinSize = Vector2.new(200, 250), 
            OnClose = v38.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v38.onRestore, 
            OnWidgetCreated = if not l_ImprovePluginSpeed_TagEditor_0 then nil else v38.onDockWidgetCreated, 
            [v2.Change.Enabled] = v38.onWidgetEnabledChanged
        }, {
            MainGui = v2.createElement(v21)
        }), 
        WorldView = v2.createElement(v22)
    });
end;
return v24;
