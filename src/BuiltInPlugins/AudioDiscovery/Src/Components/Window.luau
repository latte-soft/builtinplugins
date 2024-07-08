local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Src.Thunks.DiscoverAudio);
local v4 = require(l_Parent_0.Src.Actions.SetDialog);
local v5 = require(l_Parent_0.Src.Actions.Unpause);
local v6 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v6.UI;
local l_DropShadow_0 = l_UI_0.DropShadow;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v15 = require(l_Parent_0.Src.Components.LeftPanel);
local v16 = require(l_Parent_0.Src.Components.RightPanel);
local v17 = v1.PureComponent:extend("Window");
v17.render = function(v18)
    local l_props_0 = v18.props;
    local l_Localization_1 = l_props_0.Localization;
    local v21 = v1.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        Size = UDim2.new(1, 0, 1, 0), 
        Layout = Enum.FillDirection.Horizontal
    }, {
        Left = v1.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(0.65, 0, 1, 0), 
            Style = "Box", 
            LayoutOrder = 1
        }, {
            Top = v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 0, 34), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = 5, 
                LayoutOrder = 1
            }, {
                Info = v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 1, 
                    Text = l_Localization_1:getText("Plugin", "LeftPaneInfo") .. (" (%d)"):format(#l_props_0.Rows), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = Enum.Font.SourceSansBold
                }), 
                Refresh = v1.createElement(l_Button_0, {
                    Text = l_Localization_1:getText("Plugin", "Refresh"), 
                    OnClick = l_props_0.Refresh, 
                    Size = UDim2.fromOffset(80, 24), 
                    Position = UDim2.fromScale(1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    Style = "Round"
                })
            }), 
            Main = v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 1, -34), 
                ClipsDescendants = true, 
                LayoutOrder = 2
            }, {
                Child = v1.createElement(v15)
            })
        }), 
        Right = v1.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(0.35, 0, 1, 0), 
            Style = "Box", 
            LayoutOrder = 2
        }, {
            Top = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = 5, 
                LayoutOrder = 1
            }, {
                Info = v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = l_Localization_1:getText("Plugin", "RightPaneInfo"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = Enum.Font.SourceSansBold
                })
            }), 
            Main = v1.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 1, -34), 
                ClipsDescendants = true, 
                LayoutOrder = 2
            }, {
                Child = v1.createElement(v16)
            })
        })
    });
    if not l_props_0.Paused then
        if not l_props_0.Dialog then
            return v21;
        else
            return v1.createElement(l_Pane_0, {
                Style = "Box"
            }, {
                Pane = v21, 
                Overlay = v1.createElement(l_Pane_0, {
                    Active = true, 
                    Style = "Box", 
                    BackgroundTransparency = 0.2, 
                    ZIndex = 2
                }, {
                    Dialog = v1.createElement(l_Pane_0, {
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Size = UDim2.fromOffset(400, 250)
                    }, {
                        DropShadow = v1.createElement(l_DropShadow_0, {}, {
                            Child = v1.createElement(l_Pane_0, {
                                Style = "Box", 
                                Layout = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                                Padding = 20, 
                                Spacing = 5
                            }, {
                                Title = v1.createElement(l_TextLabel_0, {
                                    TextSize = 24, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    Text = l_Localization_1:getText("Dialog", "Title"), 
                                    AutomaticSize = Enum.AutomaticSize.Y, 
                                    Size = UDim2.fromScale(1, 0), 
                                    LayoutOrder = 1
                                }), 
                                Text = v1.createElement(l_TextLabel_0, {
                                    TextSize = 17, 
                                    TextXAlignment = Enum.TextXAlignment.Left, 
                                    Text = l_Localization_1:getText("Dialog", "Text"), 
                                    RichText = true, 
                                    AutomaticSize = Enum.AutomaticSize.Y, 
                                    Size = UDim2.fromScale(1, 0), 
                                    TextWrapped = true, 
                                    LayoutOrder = 2
                                }), 
                                Close = v1.createElement(l_Button_0, {
                                    Text = l_Localization_1:getText("Dialog", "Close"), 
                                    OnClick = l_props_0.CloseDialog, 
                                    Size = UDim2.fromOffset(120, 32), 
                                    LayoutOrder = 3, 
                                    Style = "Round"
                                })
                            })
                        })
                    })
                })
            });
        end;
    else
        return v1.createElement(l_Pane_0, {
            Style = "Box"
        }, {
            Pane = v21, 
            Overlay = v1.createElement(l_Pane_0, {
                Active = true, 
                Style = "Box", 
                BackgroundTransparency = 0.2, 
                ZIndex = 2
            }, {
                Dialog = v1.createElement(l_Pane_0, {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromOffset(400, 150)
                }, {
                    DropShadow = v1.createElement(l_DropShadow_0, {}, {
                        Child = v1.createElement(l_Pane_0, {
                            Style = "Box", 
                            Layout = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            Padding = 20, 
                            Spacing = 5
                        }, {
                            Title = v1.createElement(l_TextLabel_0, {
                                TextSize = 24, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                Text = l_Localization_1:getText("PausedDialog", "Title"), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.fromScale(1, 0), 
                                LayoutOrder = 1
                            }), 
                            Text = v1.createElement(l_TextLabel_0, {
                                TextSize = 17, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                Text = l_Localization_1:getText("PausedDialog", "Text"), 
                                RichText = true, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Size = UDim2.fromScale(1, 0), 
                                TextWrapped = true, 
                                LayoutOrder = 2
                            }), 
                            Close = v1.createElement(l_Button_0, {
                                Text = l_Localization_1:getText("PausedDialog", "Close"), 
                                OnClick = v18.props.Unpause, 
                                Size = UDim2.fromOffset(120, 32), 
                                LayoutOrder = 3, 
                                Style = "Round"
                            })
                        })
                    })
                })
            })
        });
    end;
end;
return v2.connect(function(v22, _)
    return {
        Paused = v22.Audio.Paused, 
        Dialog = v22.Audio.Dialog, 
        Rows = v22.Audio.Rows
    };
end, function(v24)
    return {
        Refresh = function()
            v24(v3());
        end, 
        CloseDialog = function()
            v24(v4(false));
        end, 
        Unpause = function()
            v24(v5());
            v24(v3());
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0
})(v17)));
