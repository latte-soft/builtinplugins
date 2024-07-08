local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v11 = require(l_Parent_0.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Resources.LocalizedStrings;
local l_Components_0 = l_Parent_0.Plugin.Components;
local v15 = require(l_Components_0.Gui);
local v16 = require(l_Components_0.CannotConfigureSelectionDialog);
local v17 = v2.PureComponent:extend("MainPlugin");
v17.init = function(v18, v19)
    local l_Plugin_1 = v19.Plugin;
    v18.state = {
        enabled = false, 
        uiDmLoaded = false, 
        cannotConfigureSelectionDialogVisible = false
    };
    local l_MultipleDocumentInterfaceInstance_0 = l_Plugin_1.MultipleDocumentInterfaceInstance;
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionStarted:Connect(function(_)
        v18:setState(function()
            return {
                uiDmLoaded = true
            };
        end);
    end);
    l_MultipleDocumentInterfaceInstance_0.DataModelSessionEnded:Connect(function(_)
        v18:setState(function()
            return {
                uiDmLoaded = false
            };
        end);
    end);
    if l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession then
        v18:setState(function()
            return {
                uiDmLoaded = true
            };
        end);
    end;
    local function _(v24)
        if v24 == v18.state.enabled then
            return ;
        else
            v18:setState({
                enabled = v24
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", v24);
            return ;
        end;
    end;
    v18.toggleEnabled = function()
        local v26 = not v18.state.enabled;
        if v26 == v18.state.enabled then
            return ;
        else
            v18:setState({
                enabled = v26
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", v26);
            return ;
        end;
    end;
    v18.onClose = function()
        if v18.state.enabled == false then
            return ;
        else
            v18:setState({
                enabled = false
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", false);
            return ;
        end;
    end;
    v18.onRestore = function(v27)
        if v27 == v18.state.enabled then
            return ;
        else
            v18:setState({
                enabled = v27
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", v27);
            return ;
        end;
    end;
    v18.onWidgetEnabledChanged = function(v28)
        local l_Enabled_0 = v28.Enabled;
        if l_Enabled_0 == v18.state.enabled then
            return ;
        else
            v18:setState({
                enabled = l_Enabled_0
            });
            l_Plugin_1:Invoke("WindowEnabledChanged", l_Enabled_0);
            return ;
        end;
    end;
    v18.trackPollGuiEnabled = l_Plugin_1:OnInvoke("PollGuiEnabled", function()
        l_Plugin_1:Invoke("WindowEnabledChanged", v18.state.enabled);
    end);
    v18.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "CGE"
    });
    v18.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    v18.onAttemptModifyInPlayMode = function()
        print(v18.localization:getText("Info", "CannotModifyInPlayModeMessage"));
    end;
    v18.onCannotConfigureSelection = function()
        v18:setState({
            cannotConfigureSelectionDialogVisible = true
        });
    end;
    v18.onCloseCannotConfigureSelectionDialog = function()
        v18:setState({
            cannotConfigureSelectionDialogVisible = false
        });
    end;
end;
v17.renderButtons = function(v30, v31)
    return {
        Toggle = v2.createElement(l_PluginButton_0, {
            Toolbar = v31, 
            Active = v30.state.enabled, 
            Id = "collisionGroupsEditorButton", 
            Title = v30.localization:getText("Main", "Title"), 
            Tooltip = v30.localization:getText("Main", "Title"), 
            Icon = "rbxlocaltheme://CollisionGroups", 
            OnClick = v30.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v17.render = function(v32)
    local l_props_0 = v32.props;
    local l_state_0 = v32.state;
    local l_Plugin_2 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_2), 
        l_Mouse_0.new(l_Plugin_2:getMouse()), 
        v11(), 
        v32.localization, 
        v32.analytics
    }, {
        Toolbar = v2.createElement(l_PluginToolbar_0, {
            Title = "collisionGroupsEditorToolbar", 
            RenderButtons = function(v36)
                return v32:renderButtons(v36);
            end
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "CollisionGroupsEditor", 
            Enabled = l_state_0.enabled and l_state_0.uiDmLoaded, 
            Title = v32.localization:getText("Main", "Title"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Right, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(128, 200), 
            OnClose = v32.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v32.onRestore, 
            [v2.Change.Enabled] = v32.onWidgetEnabledChanged
        }, {
            Gui = v2.createElement(v15, {
                plugin = l_Plugin_2, 
                OnAttemptModifyInPlayMode = v32.onAttemptModifyInPlayMode, 
                OnCannotConfigureSelection = v32.onCannotConfigureSelection
            }), 
            CannotConfigureSelectionDialog = l_state_0.cannotConfigureSelectionDialogVisible and v2.createElement(v16, {
                Enabled = true, 
                OnClose = v32.onCloseCannotConfigureSelectionDialog
            })
        })
    });
end;
v17.willUnmount = function(v37)
    v37.trackPollGuiEnabled:Disconnect();
end;
return v17;
