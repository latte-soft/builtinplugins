local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v11 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v14 = require(l_Parent_0.Src.Components.GraphicsPane);
local v15 = require(l_Parent_0.Src.Components.NetworkPane);
local v16 = require(l_Parent_0.Src.Components.MultiTouchPane);
local v17 = require(l_Parent_0.Src.Controllers.MultiTouchController);
local v18 = v2.PureComponent:extend("MainPlugin");
require(l_Parent_0.Bin.defineLuaFlags);
local function _()
    return game:GetFastFlag("StudioEnableMultiTouchGestureEmulation") and game:GetFastFlag("StudioUnlockMouseWhenEmulating");
end;
v18.init = function(v20, _)
    v20.state = {
        enabled = false
    };
    v20.toggleEnabled = function()
        v20:setState(function(v22)
            return {
                enabled = not v22.enabled
            };
        end);
    end;
    v20.onClose = function()
        v20:setState({
            enabled = false
        });
    end;
    v20.onRestore = function(v23)
        v20:setState({
            enabled = v23
        });
    end;
    v20.onDockWidgetCreated = function()
        v20.props.pluginLoaderContext.mainButtonClickedSignal:Connect(v20.toggleEnabled);
    end;
    v20.onWidgetEnabledChanged = function(v24)
        v20:setState({
            enabled = v24.Enabled
        });
    end;
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "DeviceEmulator"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    if game:GetFastFlag("StudioEnableMultiTouchGestureEmulation") and game:GetFastFlag("StudioUnlockMouseWhenEmulating") then
        v20.multiTouchController = v17.new();
    end;
end;
v18.willUnmount = function(v25)
    if v25.multiTouchController then
        v25.multiTouchController:destroy();
    end;
end;
v18.didUpdate = function(v26)
    v26.props.pluginLoaderContext.mainButton:SetActive(v26.state.enabled);
end;
v18.render = function(v27)
    local l_props_0 = v27.props;
    local l_state_0 = v27.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v32 = v2.createElement(v14, {});
    local v33 = v2.createElement(v15, {});
    local v34 = nil;
    if game:GetFastFlag("StudioEnableMultiTouchGestureEmulation") and game:GetFastFlag("StudioUnlockMouseWhenEmulating") then
        v34 = v2.createElement(v16, {});
    end;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v11(), 
        v27.localization, 
        v27.analytics
    }, {
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "DeviceEmulator", 
            Enabled = l_enabled_0, 
            Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
            Title = v27.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Bottom, 
            Size = Vector2.new(360, 420), 
            MinSize = Vector2.new(300, 200), 
            OnClose = v27.onClose, 
            ShouldRestore = true, 
            OnWidgetRestored = v27.onRestore, 
            OnWidgetCreated = v27.onDockWidgetCreated, 
            [v2.Change.Enabled] = v27.onWidgetEnabledChanged
        }, {
            MainPane = v2.createElement(l_Pane_0, {
                Style = "Box", 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromOffset(0, 0)
            }, {
                ScrollingFrame = v2.createElement(l_ScrollingFrame_0, {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromScale(0, 0), 
                    Layout = Enum.FillDirection.Vertical, 
                    Position = UDim2.fromScale(0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                }, {
                    ContainerPane = v2.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        Position = UDim2.fromScale(0, 0), 
                        Layout = Enum.FillDirection.Vertical, 
                        Padding = 5, 
                        Spacing = 5
                    }, {
                        GraphicsPane = v32, 
                        NetworkPane = v33, 
                        MultiTouchPane = v34
                    })
                })
            })
        })
    });
end;
return v18;
