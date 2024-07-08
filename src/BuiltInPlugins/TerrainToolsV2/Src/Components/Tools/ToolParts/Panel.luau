local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local v5 = UDim.new(0, 12);
local v6 = v2.PureComponent:extend(script.Name);
v6.init = function(v7, v8)
    local v9 = v8.Padding or v5;
    v7.mainFrameRef = v2.createRef();
    v7.mainLayoutRef = v2.createRef();
    v7.contentFrameRef = v2.createRef();
    v7.contentLayoutRef = v2.createRef();
    v7.state = {
        padding = v9, 
        isExpanded = true
    };
    v7.onExpandedStateChanged = function()
        v7:setState({
            isExpanded = not v7.state.isExpanded
        });
    end;
    v7.updateMainSize = function()
        local l_current_0 = v7.mainFrameRef.current;
        local l_current_1 = v7.mainLayoutRef.current;
        if not (not l_current_1 or not l_current_0) then
            l_current_0.Size = UDim2.new(1, 0, 0, l_current_1.AbsoluteContentSize.Y);
        end;
    end;
    v7.updateContentSize = function()
        local l_current_2 = v7.contentFrameRef.current;
        local l_current_3 = v7.contentLayoutRef.current;
        if not (not l_current_3 or not l_current_2) then
            l_current_2.Size = UDim2.new(1, 0, 0, l_current_3.AbsoluteContentSize.Y + v5.Offset);
        end;
    end;
end;
v6.render = function(v14)
    local v15 = v14.props.Theme:get();
    local l_panelTheme_0 = v15.panelTheme;
    local v17 = v14.props.Title or "Title";
    local l_LayoutOrder_0 = v14.props.LayoutOrder;
    local l_isSubsection_0 = v14.props.isSubsection;
    local l_isExpanded_0 = v14.state.isExpanded;
    local l_padding_0 = v14.state.padding;
    local v22 = not not l_isExpanded_0 and l_panelTheme_0.openIcon or l_panelTheme_0.closeIcon;
    local v23 = v14.props[v2.Children];
    if v23 then
        v23.UIListLayout = v2.createElement("UIListLayout", {
            Padding = l_padding_0, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v14.contentLayoutRef, 
            [v2.Change.AbsoluteContentSize] = v14.updateContentSize
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 40), 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v14.mainFrameRef
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = v5, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v14.mainLayoutRef, 
            [v2.Change.AbsoluteContentSize] = v14.updateMainSize
        }), 
        ToggleButton = v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 28), 
            BackgroundColor3 = l_panelTheme_0.panelColor, 
            BorderSizePixel = 0, 
            BackgroundTransparency = not l_isSubsection_0 and 0 or 1, 
            LayoutOrder = 1, 
            [v2.Event.Activated] = v14.onExpandedStateChanged
        }, {
            v2.createElement("ImageLabel", {
                Size = UDim2.new(0, 20, 0, 28), 
                BackgroundTransparency = 1
            }, {
                v2.createElement("ImageLabel", {
                    Image = v22, 
                    Size = UDim2.new(0, 10, 0, 10), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Fit
                })
            }), 
            v2.createElement("TextLabel", {
                Text = v17 or "Title", 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 20, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextColor3 = v15.textColor, 
                Font = v15.panelTheme.font, 
                TextSize = v15.panelTheme.textSize
            })
        }), 
        Content = l_isExpanded_0 and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v2.Ref] = v14.contentFrameRef
        }, v23)
    });
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v6));
