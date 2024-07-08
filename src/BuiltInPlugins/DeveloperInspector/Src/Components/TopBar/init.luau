local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.CloseTarget);
local v7 = require(l_Actions_0.RoactInspector.SetPicking);
local v8 = require(l_Actions_0.RoactInspector.SetProfiling);
local v9 = require(l_Actions_0.RoactInspector.Reset);
local v10 = require(l_Actions_0.SetTab);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local v21 = v1.PureComponent:extend("TopBar");
v21.init = function(v22)
    v22.closeTarget = function()
        v22.props.Inspector:get():closeTargetApi();
        v22.props.closeTarget();
        if v22.props.IsProfiling then
            v22.toggleProfiling();
        end;
    end;
    v22.togglePicking = function()
        local v23 = not v22.props.IsPicking;
        local v24 = v22.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v24) then
            v24:setPicking(v23);
        end;
        v22.props.setPicking(v23);
    end;
    v22.toggleProfiling = function()
        local v25 = not v22.props.IsProfiling;
        local v26 = v22.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v26) then
            v26:setProfiling(v25);
        end;
        v22.props.setProfiling(v25);
        if v25 then
            v22.props.selectTab(v22.props.Tabs[2]);
        end;
    end;
end;
v21.didUpdate = function(v27)
    if not v27.props.Active then
        v27.closeTarget();
    end;
end;
v21.didMount = function(v28)
    local v29 = v28.props.PluginActions:get("ToggleProfileRoact");
    v29.Enabled = true;
    v28.toggleProfileConnection = v29.Triggered:Connect(v28.toggleProfiling);
end;
v21.willUnmount = function(v30)
    if v30.props.Active then
        v30.closeTarget();
    end;
    v30.props.PluginActions:get("ToggleProfileRoact").Enabled = false;
    v30.toggleProfileConnection:Disconnect();
end;
v21.render = function(v31)
    local l_props_0 = v31.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.HeaderHeight), 
        Style = "SubtleBox", 
        BorderColor3 = l_Stylizer_0.HeaderBorderColor, 
        BorderSizePixel = 1
    }, {
        Inspect = v1.createElement(l_Button_0, {
            Style = not l_props_0.IsPicking and "RoundSubtle" or "RoundPrimary", 
            Position = UDim2.fromOffset(l_Stylizer_0.Padding, 0), 
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
            LayoutOrder = 1, 
            OnClick = v31.togglePicking
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = "Inspect a UI element"
            }), 
            Icon = v1.createElement(l_Image_0, {
                Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/DeveloperInspector/Inspect.png"
            })
        }), 
        Profile = v1.createElement(l_Button_0, {
            Style = not l_props_0.IsProfiling and "RoundSubtle" or "RoundPrimary", 
            Position = UDim2.fromOffset(l_Stylizer_0.ButtonSize + l_Stylizer_0.Padding * 2, 0), 
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
            LayoutOrder = 2, 
            OnClick = v31.toggleProfiling
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = "Profile a Roact tree (Ctrl+Shift+R)"
            }), 
            Icon = v1.createElement(l_Image_0, {
                Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/DeveloperInspector/Record.png"
            })
        }), 
        Tabs = v1.createElement(l_Pane_0, {
            Position = UDim2.fromOffset(l_Stylizer_0.ButtonSize * 2 + l_Stylizer_0.Padding * 3, l_Stylizer_0.Padding), 
            LayoutOrder = 3
        }, {
            Child = v1.createElement(l_Tabs_0, {
                OnTabSelected = v31.props.selectTab, 
                SelectedTab = l_props_0.SelectedTab, 
                Tabs = l_props_0.Tabs
            })
        }), 
        Right = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_Stylizer_0.Padding, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            TargetName = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_props_0.SelectedTarget.Name, 
                LayoutOrder = 1, 
                TextXAlignment = Enum.TextXAlignment.Right
            }), 
            Close = v1.createElement(l_Button_0, {
                Style = "RoundSubtle", 
                Position = UDim2.fromScale(1, 0), 
                Size = UDim2.fromOffset(l_Stylizer_0.ButtonSize, l_Stylizer_0.ButtonSize), 
                AnchorPoint = Vector2.new(1, 0), 
                LayoutOrder = 4, 
                OnClick = v31.closeTarget
            }, {
                Tooltip = v1.createElement(l_Tooltip_0, {
                    Text = "Close this Roact tree"
                }), 
                Icon = v1.createElement(l_Image_0, {
                    Size = UDim2.fromOffset(l_Stylizer_0.IconSize, l_Stylizer_0.IconSize), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = "rbxasset://textures/DeveloperInspector/Close.png"
                })
            })
        })
    });
end;
return v2.connect(function(v34)
    return {
        Tabs = v34.Targets.tabs, 
        SelectedTab = v34.Targets.selectedTab, 
        SelectedTarget = v34.Targets.selectedTarget, 
        IsPicking = v34.RoactInspector.isPicking, 
        IsProfiling = v34.RoactInspector.isProfiling
    };
end, function(v35)
    return {
        selectTab = function(v36)
            v35(v10(v36));
        end, 
        setPicking = function(v37)
            v35(v7(v37));
        end, 
        setProfiling = function(v38)
            v35(v8(v38));
        end, 
        closeTarget = function()
            v35(v6());
            v35(v9());
        end
    };
end)((l_withContext_0({
    PluginActions = l_ContextServices_0.PluginActions, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Inspector = v4
})(v21)));
