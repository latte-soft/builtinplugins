local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.ReactRoblox);
local v3 = require(l_Parent_0.Packages.Rodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v12 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v18 = require(l_Components_0.RigSelector);
local v19 = require(l_Components_0.ExampleRoactRoduxComponent);
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
local l_ImprovePluginSpeed_RigGenerator_0 = game:GetFastFlag("ImprovePluginSpeed_RigGenerator");
local l_CoreGui_0 = game:GetService("CoreGui");
local v23 = v1.PureComponent:extend("MainPlugin");
v23.init = function(v24, v25)
    v24:setState({
        enabled = false
    });
    v24.toggleEnabled = function()
        if not v24.state.enabled then
            v24.analytics:report("menuOpen");
        else
            v24.analytics:report("menuClose");
            v24.analytics:report("menuCloseManual");
        end;
        v24:setState(function(v26)
            return {
                enabled = not v26.enabled
            };
        end);
    end;
    v24.onClose = function()
        v24.analytics:report("menuClose");
        v24:setState({
            enabled = false
        });
    end;
    v24.onWidgetEnabledChanged = function(v27)
        v24:setState({
            enabled = v27.Enabled
        });
    end;
    v24.store = v3.Store.new(v13, nil, {
        v3.thunkMiddleware
    }, nil);
    v24.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "RigGenerator"
    });
    v24.analytics = l_ContextServices_0.Analytics.new(v12);
    if l_ImprovePluginSpeed_RigGenerator_0 then
        v24:initToolbarAndButton(v25);
    end;
end;
v23.initToolbarAndButton = function(v28, v29)
    v28.toolbar = v29.PluginLoaderContext.toolbar;
    v28.mainButton = v29.PluginLoaderContext.mainButton;
    v28.mainButton:SetActive(v28.state.enabled);
    v29.PluginLoaderContext.mainButtonClickedSignal:Connect(v28.toggleEnabled);
end;
v23.renderButtons = function(v30, v31)
    assert(not l_ImprovePluginSpeed_RigGenerator_0);
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v31, 
            Active = v30.state.enabled, 
            Id = "Generate Rig", 
            Title = v30.localization:getText("Plugin", "Button"), 
            Tooltip = v30.localization:getText("Plugin", "Description"), 
            Icon = "rbxlocaltheme://BuildRig", 
            OnClick = v30.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v23.render = function(v32)
    local l_props_0 = v32.props;
    local l_state_0 = v32.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v32.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v32.localization, 
        v32.analytics
    }, {
        Toolbar = if l_ImprovePluginSpeed_RigGenerator_0 then nil else v1.createElement(l_PluginToolbar_0, {
            Title = if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then v32.localization:getText("Plugin", "Toolbar") else "Rig Generator", 
            RenderButtons = function(v36)
                return v32:renderButtons(v36);
            end
        }), 
        MainWidget = v2.createPortal({
            RigGenerator = v1.createElement("ScreenGui", {
                Enabled = l_state_0.enabled, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                [v2.Change.Enabled] = v32.onWidgetEnabledChanged
            }, {
                ExampleRoactRoduxComponent = v1.createElement(v19), 
                RigSelector = v1.createElement(v18, {
                    MenuCompleted = function()
                        v32:onClose();
                    end
                })
            })
        }, l_CoreGui_0)
    });
end;
if l_ImprovePluginSpeed_RigGenerator_0 then
    v23.didUpdate = function(v37)
        v37.mainButton:SetActive(v37.state.enabled);
    end;
end;
return v23;
