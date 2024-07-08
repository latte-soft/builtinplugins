local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_IconButton_0 = l_UI_0.IconButton;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Separator_0 = l_UI_0.Separator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v16 = require(script.Parent.Parent.LongText);
local v17 = require(script.Parent.Parent.Parent.Util.counter)();
local function v25(v18)
    local v19 = string.split(v18, "\n");
    local v20 = {};
    local v21 = v19[1];
    local v22 = 0;
    for _, v24 in v19, nil, nil do
        if v21 == v24 then
            v22 = v22 + 1;
        else
            table.insert(v20, v21 .. if v22 > 1 then " (x" .. v22 .. ")" else "");
            v21 = v24;
            v22 = 1;
        end;
    end;
    table.insert(v20, v21 .. if v22 > 1 then " (x" .. v22 .. ")" else "");
    return table.concat(v20, "\n");
end;
local function v27(v26)
    return v2.createElement("Frame", {
        Size = v26.Size, 
        LayoutOrder = v26.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Padding = UDim.new(0, 8)
        }), 
        Prev = v2.createElement(l_IconButton_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(24, 24), 
            Disabled = v26.current <= 1, 
            LeftIcon = "rbxasset://textures/DeveloperFramework/PageNavigation/button_control_previous.png", 
            IconSize = 24, 
            OnClick = v26.onPrev
        }), 
        TextLabel = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(0, 50, 1, 0), 
            Text = ("%*/%*"):format(math.clamp(v26.current, 0, v26.total), v26.total)
        }), 
        Next = v2.createElement(l_IconButton_0, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(24, 24), 
            Disabled = v26.total <= v26.current, 
            LeftIcon = "rbxasset://textures/DeveloperFramework/PageNavigation/button_control_next.png", 
            IconSize = 24, 
            OnClick = v26.onNext
        })
    });
end;
local v28 = v2.PureComponent:extend("FlushDetails");
v28.init = function(v29)
    v29:setState({
        listenerIndex = 1, 
        summaryExpanded = true, 
        consumersExpanded = true, 
        pageHeight = 500, 
        summaryHeight = 32
    });
    v29.onPrevListener = function()
        local l_Event_0 = v29.props.Event;
        if l_Event_0 then
            v29:setState(function(v31)
                return {
                    listenerIndex = math.clamp(v31.listenerIndex - 1, 1, l_Event_0.props.listenerCount)
                };
            end);
            return ;
        else
            return ;
        end;
    end;
    v29.onNextListener = function()
        local l_Event_1 = v29.props.Event;
        if l_Event_1 then
            v29:setState(function(v33)
                return {
                    listenerIndex = math.clamp(v33.listenerIndex + 1, 1, l_Event_1.props.listenerCount)
                };
            end);
            return ;
        else
            return ;
        end;
    end;
end;
v28.didUpdate = function(v34, v35)
    if v34.props.Event ~= v35.Event then
        v34:setState({
            listenerIndex = 1
        });
    end;
end;
v28.render = function(v36)
    local l_Event_2 = v36.props.Event;
    if l_Event_2 then
        local l_props_0 = l_Event_2.props;
        local v39 = nil;
        if not l_Event_2.isStub then
            local v40 = if not l_props_0.listeners then nil else l_props_0.listeners[v36.state.listenerIndex];
            v39 = if not v40 then v36.props.Localization:getText("FlushDetails", "NoTraceback") else if v40.connectTraceback then v25(v40.connectTraceback) else debug.info(v40.callback, "snl");
        else
            v39 = v36.props.Localization:getText("Common", "LoadingStub");
            l_props_0.listenerCount = 0;
        end;
        return v2.createElement(l_Pane_0, {
            [v2.Change.AbsoluteSize] = function(v41)
                v36:setState({
                    pageHeight = v41.AbsoluteSize.Y
                });
            end
        }, {
            FlushDetails = v2.createElement(l_ScrollingFrame_0, {
                Size = UDim2.fromScale(1, 1), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = UDim.new(0, 5)
            }, {
                SummaryInfo = v2.createElement(l_ExpandablePane_0, {
                    Style = "Section", 
                    LayoutOrder = v17(), 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Text = v36.props.Localization:getText("FlushDetails", "SummaryTitle"), 
                    ContentPadding = 5, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Expanded = v36.state.summaryExpanded, 
                    OnExpandedChanged = function()
                        v36:setState(function(v42)
                            return {
                                summaryExpanded = not v42.summaryExpanded, 
                                summaryHeight = if not v42.summaryExpanded then nil else 85
                            };
                        end);
                    end
                }, {
                    v2.createElement(l_TextLabel_0, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Text = if not l_Event_2.isStub then v36.props.Localization:getText("FlushDetails", "Summary", {
                            count = l_props_0.listenerCount, 
                            elapsed = l_props_0.elapsedMs, 
                            timestamp = DateTime.fromUnixTimestampMillis(l_Event_2.timestamp):FormatLocalTime("h:mm:ss.SSS a", "en-us"), 
                            source = l_Event_2.source
                        }) else v36.props.Localization:getText("Common", "LoadingStub"), 
                        [v2.Change.AbsoluteSize] = function(v43)
                            v36:setState({
                                summaryHeight = (v43.AbsoluteSize.Y + v43.AbsolutePosition.Y) + 15
                            });
                        end
                    })
                }), 
                SummarySeparator = v2.createElement(l_Separator_0, {
                    LayoutOrder = v17()
                }), 
                ConsumersInfo = v2.createElement(l_ExpandablePane_0, {
                    Style = "Section", 
                    LayoutOrder = v17(), 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Text = v36.props.Localization:getText("FlushDetails", "ConsumersTitle"), 
                    ContentPadding = 5, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    HeaderComponent = v27, 
                    HeaderComponentProps = {
                        current = v36.state.listenerIndex, 
                        total = l_props_0.listenerCount, 
                        onPrev = v36.onPrevListener, 
                        onNext = v36.onNextListener
                    }, 
                    Expanded = v36.state.consumersExpanded, 
                    OnExpandedChanged = function()
                        v36:setState(function(v44)
                            return {
                                consumersExpanded = not v44.consumersExpanded
                            };
                        end);
                    end
                }, {
                    StackLabel = v2.createElement(v16, {
                        MaxHeight = v36.state.pageHeight - v36.state.summaryHeight, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Font = Enum.Font.RobotoMono, 
                        Text = v39
                    })
                })
            })
        });
    else
        return nil;
    end;
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v28));
