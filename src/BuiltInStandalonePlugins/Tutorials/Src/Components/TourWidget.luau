local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = game:DefineFastFlag("StudioTourFixIconButtonAlignment", false);
local v3 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseExtensibilityApi)();
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local _ = require(l_Parent_0.Src.Util.TutorialTypes);
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_IconButton_0 = l_UI_0.IconButton;
local l_PaginationDots_0 = l_UI_0.PaginationDots;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v18 = require(l_Parent_0.Src.Components.Compliment);
local v19 = require(l_Parent_0.Src.Components.HintKeys);
local v20 = require(l_Parent_0.Src.Util.counter);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local l_insert_0 = table.insert;
local v23 = v1.PureComponent:extend("TourWidget");
v23.init = function(v24)
    v24.state = {
        showTopics = false, 
        jumpToTopic = nil
    };
    v24.windowRef = v1.createRef();
    v24.complimentRef = v1.createRef();
    v24.lastSize = nil;
    v24.onClose = not v3 and function()
        v24.props.OnQuit();
    end or nil;
    v24.onToggleTopics = function()
        v24:setState({
            showTopics = not v24.state.showTopics
        });
    end;
    v24.onSelectTopic = function(v25)
        if v25 < v24.props.StepData.topic then
            v24.props.OnSelectTopic(v25);
            v24:setState({
                showTopics = false, 
                jumpToTopic = v1.None
            });
            return ;
        else
            v24:setState({
                jumpToTopic = v25
            });
            return ;
        end;
    end;
    v24.onJumpDialogAction = function(v26)
        if v26 == "accept" then
            v24.props.OnSelectTopic(v24.state.jumpToTopic);
            v24:setState({
                showTopics = false, 
                jumpToTopic = v1.None
            });
            return ;
        else
            v24:setState({
                jumpToTopic = v1.None
            });
            return ;
        end;
    end;
    v24.onAbsoluteSizeChanged = function()
        local v27 = nil;
        local v28 = 0;
        if v24.complimentRef.current ~= nil then
            v27 = v24.complimentRef;
        else
            v27 = v24.windowRef;
            v28 = 275;
        end;
        if v27.current then
            if v24.lastSize ~= v27.current.AbsoluteSize then
                local l_AbsoluteSize_0 = v27.current.AbsoluteSize;
                l_AbsoluteSize_0 = Vector2.new(math.max(v28, l_AbsoluteSize_0.X), l_AbsoluteSize_0.Y);
                if not v3 then
                    game:GetService("StudioWidgetsService"):GetWidgetFromPluginGui(v24.props.Widget):SetFixedSize(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
                    v24.lastSize = l_AbsoluteSize_0;
                else
                    local l_props_0 = v24.props;
                    local l_Plugin_0 = l_props_0.Plugin;
                    l_Plugin_0:GetPluginComponent("Panels"):SetSize(l_join_0(l_Plugin_0:GetUri(), {
                        Category = "Panels", 
                        ItemId = l_props_0.Widget.Name
                    }), l_AbsoluteSize_0);
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v23.getTopicList = function(v32, v33)
    local l_props_1 = v32.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local v37 = {};
    local v38 = v20();
    local l_StepData_0 = l_props_1.StepData;
    for v40, v41 in l_StepData_0.topics, nil, nil do
        local v42 = v40 == v33;
        local v43 = if not v42 then l_Stylizer_1.TopicTextColor else l_Stylizer_1.SelectedTopicTextColor;
        l_insert_0(v37, v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = l_Stylizer_1.PaddingSmall, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.CircleSize + l_Stylizer_1.PaddingSmall)
        }, {
            Number = v1.createElement(l_Pane_0, {
                BackgroundColor3 = l_Stylizer_1.CircleColor, 
                Padding = l_Stylizer_1.PaddingSmall, 
                Size = UDim2.fromOffset(l_Stylizer_1.CircleSize, l_Stylizer_1.CircleSize)
            }, {
                Corner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_Stylizer_1.CircleSize)
                }), 
                Text = v1.createElement(l_TextLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Font = Enum.Font.SourceSansBold, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Text = ("%d"):format(v40), 
                    TextColor = v43
                })
            }), 
            Title = v1.createElement(l_IconButton_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Cursor = not v42 and "PointingHand" or nil, 
                Disabled = v42, 
                DisabledTextColor = v43, 
                OnClick = function()
                    v32.onSelectTopic(v40);
                end, 
                LayoutOrder = v38(), 
                Style = "IconOnly", 
                Text = l_Localization_1:getText(l_StepData_0.id, "topic_" .. v41), 
                TextColor = v43
            })
        }));
    end;
    return v37;
end;
v23.render = function(v44)
    local l_props_2 = v44.props;
    local l_state_0 = v44.state;
    local v47 = v20();
    local l_Stylizer_2 = l_props_2.Stylizer;
    local l_Localization_2 = l_props_2.Localization;
    local l_StepData_1 = l_props_2.StepData;
    if l_StepData_1 then
        local l_step_0 = l_StepData_1.step;
        if l_step_0 then
            local v52 = l_step_0.kind == "Completed";
            local v53 = l_step_0.kind == "Skipped";
            return v1.createElement(l_DockWidget_0, {
                OnClose = if not v3 then v44.onClose else nil, 
                ShouldRestore = true, 
                Title = not v3 and "" or l_props_2.Widget.Name, 
                Widget = l_props_2.Widget
            }, {
                Window = if not (v52 or v53) then v44:renderWindow() else v1.createElement(v18, {
                    IconSize = l_Stylizer_2.IconSize, 
                    Image = l_Stylizer_2.CheckmarkImage, 
                    LayoutOrder = v47(), 
                    Text = if not v53 then l_Localization_2:getText(l_StepData_1.id, ("%s_Compliment"):format(l_step_0.id)) else l_step_0.description, 
                    PaneRef = v44.complimentRef, 
                    [v1.Change.AbsoluteSize] = v44.onAbsoluteSizeChanged
                }), 
                Dialog = v1.createElement(l_StyledDialog_0, {
                    Buttons = {
                        {
                            Key = "accept", 
                            Text = l_Localization_2:getText("Tutorial", "Skip")
                        }, 
                        {
                            Key = "cancel", 
                            Text = l_Localization_2:getText("Tutorial", "Back")
                        }
                    }, 
                    Enabled = l_state_0.jumpToTopic ~= nil, 
                    MinContentSize = Vector2.new(450, 100), 
                    Modal = true, 
                    OnClose = v44.onJumpDialogAction, 
                    OnButtonPressed = v44.onJumpDialogAction, 
                    Size = UDim2.fromOffset(450, 100), 
                    Style = "AcceptCancel", 
                    Title = l_Localization_2:getText(l_StepData_1.id, "Title")
                }, {
                    Content = v1.createElement(l_Pane_0, {
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Layout = Enum.FillDirection.Vertical, 
                        Spacing = 20
                    }, {
                        Title = v1.createElement(l_TextLabel_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            LayoutOrder = v47(), 
                            Style = "Title", 
                            Text = l_Localization_2:getText("SkipDialog", "Title"), 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        Text = v1.createElement(l_TextLabel_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            LayoutOrder = v47(), 
                            Size = UDim2.fromScale(1, 0), 
                            Text = l_Localization_2:getText("SkipDialog", "Text"), 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    })
                })
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v23.renderWindow = function(v54)
    local l_props_3 = v54.props;
    local l_state_1 = v54.state;
    local v57 = v20();
    local l_StepData_2 = l_props_3.StepData;
    local l_step_1 = l_StepData_2.step;
    local l_Stylizer_3 = l_props_3.Stylizer;
    local l_Localization_3 = l_props_3.Localization;
    local v62 = l_Localization_3:getText(l_StepData_2.id, "topic_" .. l_StepData_2.topics[l_StepData_2.topic]);
    local v63 = l_Localization_3:getText("Tutorial", "TopicNumber"):format(l_StepData_2.topic, #l_StepData_2.topics);
    local l_PressedKeys_0 = l_props_3.PressedKeys;
    local l_showNext_0 = l_StepData_2.showNext;
    local v66 = false;
    if l_StepData_2.topic == 1 then
        v66 = l_StepData_2.topicStep == 1;
    end;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Padding = l_Stylizer_3.Padding, 
        Spacing = l_Stylizer_3.Padding, 
        Style = "Box", 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        ref = v54.windowRef, 
        [v1.Change.AbsoluteSize] = v54.onAbsoluteSizeChanged
    }, {
        TopicBar = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v57(), 
            Size = UDim2.fromScale(1, 0), 
            Spacing = l_Stylizer_3.PaddingSmall
        }, {
            CurrentTopic = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v57(), 
                Layout = Enum.FillDirection.Vertical, 
                Size = UDim2.new(1, -60, 0, 0), 
                Spacing = l_Stylizer_3.PaddingSmall
            }, {
                TopicNumber = v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v57(), 
                    Text = v63, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Label"
                }), 
                TopicName = v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v57(), 
                    Text = v62, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Semibold"
                })
            }), 
            List = v1.createElement(l_IconButton_0, {
                Cursor = "PointingHand", 
                OnClick = v54.onToggleTopics, 
                LayoutOrder = v57(), 
                LeftIcon = if not l_state_1.showTopics then l_Stylizer_3.ListImage else l_Stylizer_3.ListSelectedImage, 
                Size = l_Stylizer_3.IconSize, 
                Style = "IconOnly", 
                Text = not v2 and "" or nil
            }), 
            Close = v1.createElement(l_IconButton_0, {
                Cursor = "PointingHand", 
                OnClick = v54.props.OnQuit, 
                LayoutOrder = v57(), 
                LeftIcon = l_Stylizer_3.CloseImage, 
                Size = l_Stylizer_3.IconSize, 
                Style = "IconOnly", 
                Text = not v2 and "" or nil
            })
        }), 
        Separator = v1.createElement(l_Separator_0, {
            LayoutOrder = v57()
        }), 
        Scroller = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v57(), 
            Padding = 0, 
            Spacing = UDim.new(0, l_Stylizer_3.Padding)
        }, if not l_state_1.showTopics then {
            StepTitle = if not l_step_1.title then nil else v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v57(), 
                Style = "Title", 
                Text = l_step_1.title
            }), 
            StepDescription = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v57(), 
                RichText = true, 
                Size = UDim2.fromScale(1, 0), 
                Text = l_step_1.description, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Keys = if not l_PressedKeys_0 then nil else v1.createElement(v19, {
                LayoutOrder = v57(), 
                PressedKeys = l_PressedKeys_0
            })
        } else v54:getTopicList(l_StepData_2.topic)), 
        NavigationRow = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v57()
        }, {
            Back = if v66 then nil else v1.createElement(l_IconButton_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Cursor = "PointingHand", 
                OnClick = l_props_3.OnBack, 
                LayoutOrder = v57(), 
                Style = "Link", 
                Text = l_Localization_3:getText("Tutorial", "Back")
            }), 
            PaginationDots = v1.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Layout = Enum.FillDirection.Horizontal, 
                Position = UDim2.fromScale(0.5, 0.5), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                Child = v1.createElement(l_PaginationDots_0, {
                    Count = l_StepData_2.topicStepCount, 
                    OnSelected = function()
                    end, 
                    SelectedIndex = l_StepData_2.topicStep
                })
            }), 
            Next = v1.createElement(l_IconButton_0, {
                AnchorPoint = Vector2.new(1, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Cursor = "PointingHand", 
                LayoutOrder = v57(), 
                OnClick = l_props_3.OnNext, 
                Position = UDim2.fromScale(1, 0), 
                Style = not l_showNext_0 and "Link" or "Primary", 
                Text = if not l_showNext_0 then l_Localization_3:getText("Tutorial", "Skip") else l_Localization_3:getText("Plugin", "Next")
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v23));
