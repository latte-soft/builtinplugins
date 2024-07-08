local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.ReactRoblox);
local v5 = require(l_Parent_0.Packages.Rodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v6.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v6.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v16 = require(l_Parent_0.Src.Reducers.MainReducer);
local v17 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.UpdateSelectedIndex);
local v20 = require(l_Actions_0.UpdateSearchTerm);
local v21 = require(l_Actions_0.UpdateEvents);
local v22 = require(l_Actions_0.ClearEvents);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v26 = require(l_Components_0.ControlledSplitPane);
local v27 = require(l_Components_0.Topbar);
local v28 = require(l_Components_0.EventList);
local v29 = require(l_Components_0.Details);
local v30 = v3.PureComponent:extend("MainPlugin");
v30.init = function(v31, _)
    v31:setState({
        enabled = false
    });
    v31.toggleEnabled = function()
        v31:setState(function(v33)
            return {
                enabled = not v33.enabled
            };
        end);
    end;
    v31.onClose = function()
        v31:setState({
            enabled = false
        });
    end;
    v31.onRestore = function(v34)
        v31:setState({
            enabled = v34
        });
    end;
    v31.onWidgetEnabledChanged = function(v35)
        v31:setState({
            enabled = v35.Enabled
        });
    end;
    v31.store = v5.Store.new(v16, nil, {
        v5.thunkMiddleware
    }, nil);
    if not (l_RunService_0:IsEdit() or not l_RunService_0:IsClient()) then
        local l___RoduxDevtoolsPluginBridge_0 = (workspace.CurrentCamera or workspace):FindFirstChild("__RoduxDevtoolsPluginBridge");
        if not l___RoduxDevtoolsPluginBridge_0 or not l___RoduxDevtoolsPluginBridge_0:IsA("BindableEvent") then
            v31.devtoolsBridge = Instance.new("BindableEvent");
            v31.devtoolsBridge.Name = "__RoduxDevtoolsPluginBridge";
            v31.devtoolsBridge.Archivable = false;
            v31.devtoolsBridge.Parent = workspace.CurrentCamera or workspace;
        else
            v31.devtoolsBridge = l___RoduxDevtoolsPluginBridge_0;
        end;
        v31.pluginBatchHandlers = {
            updateEvents = function(v37)
                v31.store:dispatch(v21(v37));
            end, 
            updateEvent = function(v38)
                v31.store:dispatch(v21({
                    [v38.index] = v38.event
                }));
            end
        };
        v31.devtoolsBridge.Event:Connect(function(v39, v40)
            if v39 ~= "PluginBatchPackets" then
                return ;
            else
                for _, v42 in v40, nil, nil do
                    local v43 = v31.pluginBatchHandlers[v42.type];
                    if v43 then
                        local l_status_0, l_result_0 = pcall(v43, v42.props);
                        if not l_status_0 then
                            warn((("RoduxDevtools plugin encountered an error while processing packet '%*': %*"):format(v42.type, l_result_0)));
                        end;
                    else
                        warn(("RoduxDevtools plugin received an unknown packet type '%*'"):format(v42.type), v42);
                    end;
                end;
                return ;
            end;
        end);
    end;
    v31.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "RoduxDevtools"
    });
    v31.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
end;
v30.willUnmount = function(v46)
    if v46.devtoolsBridge then
        v46.devtoolsBridge:Destroy();
    end;
end;
v30.renderButtons = function(v47, v48)
    return {
        Toggle = v3.createElement(l_PluginButton_0, {
            Toolbar = v48, 
            Active = v47.state.enabled, 
            Id = "RoduxDevtools_ToggleButton", 
            Title = v47.localization:getText("Plugin", "Button"), 
            Tooltip = v47.localization:getText("Plugin", "Description"), 
            Icon = "rbxasset://textures/RoduxDevtools/ToolbarIcon.png", 
            OnClick = v47.toggleEnabled, 
            ClickableWhenViewportHidden = true
        })
    };
end;
v30.render = function(v49)
    local l_props_0 = v49.props;
    local l_state_0 = v49.state;
    local l_Plugin_1 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v49.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v17(), 
        v49.localization, 
        v49.analytics
    }, {
        Toolbar = v3.createElement(l_PluginToolbar_0, {
            Title = v49.localization:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v53)
                return v49:renderButtons(v53);
            end
        }), 
        MainWidget = v3.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "RoduxDevtools", 
            Enabled = l_state_0.enabled, 
            Title = v49.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(400, 250), 
            OnClose = v49.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v49.onRestore, 
            [v4.Change.Enabled] = v49.onWidgetEnabledChanged
        }, {
            Main = v3.createElement(l_Pane_0, {
                Style = "Box", 
                Padding = 5
            }, {
                Topbar = v3.createElement(v27, {
                    OnSearch = function(v54)
                        v49.store:dispatch(v20(v54));
                    end, 
                    OnClearList = function()
                        v49.devtoolsBridge:Fire("DevtoolsCall", "Clear");
                        v49.store:dispatch(v19(0));
                        v49.store:dispatch(v22());
                    end
                }), 
                Sections = v3.createElement(v26, {
                    UseScale = false, 
                    ClampSize = true, 
                    UseDeficit = true, 
                    Position = UDim2.fromOffset(0, 37), 
                    Size = UDim2.new(1, 0, 1, -37), 
                    MinSizes = {
                        UDim.new(0, 150), 
                        UDim.new(0, 100)
                    }, 
                    MaxSizes = {
                        UDim.new(0, 600), 
                        nil
                    }, 
                    InitialSizes = {
                        UDim.new(0, 300), 
                        UDim.new(1, -300)
                    }
                }, {
                    v3.createElement(l_Pane_0, {
                        Style = "BorderBox", 
                        Padding = 1
                    }, {
                        EventList = v3.createElement(v28, {
                            OnSelected = function(v55)
                                local v56 = v49.store:getState().events[v55];
                                if v56 then
                                    if v56.isStub then
                                        v49.devtoolsBridge:Fire("DevtoolsCall", "_fillPluginStubAtIndex", v55);
                                    end;
                                    v49.store:dispatch(v19(v55));
                                    return ;
                                else
                                    return ;
                                end;
                            end
                        })
                    }), 
                    v3.createElement(l_Pane_0, {
                        Style = "BorderBox", 
                        Padding = 1
                    }, {
                        Details = v3.createElement(v29, {
                            OnSetState = function(v57)
                                v49.devtoolsBridge:Fire("DevtoolsCall", "RevertToStateAtIndex", v57);
                            end, 
                            OnUndoAction = function(v58)
                                v49.devtoolsBridge:Fire("DevtoolsCall", "UndoActionAtIndex", v58);
                            end, 
                            OnRedoAction = function(v59)
                                v49.devtoolsBridge:Fire("DevtoolsCall", "RedoActionAtIndex", v59);
                            end
                        })
                    })
                })
            })
        })
    });
end;
return v30;
