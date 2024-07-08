local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.FitFrame);
local l_FitFrameOnAxis_0 = v2.FitFrameOnAxis;
local l_FitFrameVertical_0 = v2.FitFrameVertical;
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextLabel_0 = v6.UI.TextLabel;
local v10 = v5.PureComponent:extend("LabeledElementListItem");
v10.defaultProps = {
    ContentFillDirection = Enum.FillDirection.Vertical, 
    ContentPadding = UDim.new(0, 0), 
    LabelColumnWidth = UDim.new(0, 100), 
    LayoutOrder = 1, 
    Padding = UDim.new(0, 0), 
    Text = "Label", 
    TextXAlignment = Enum.TextXAlignment.Left, 
    TextYAlignment = Enum.TextYAlignment.Top, 
    OnSizeChanged = function()
    end
};
v10.init = function(v11)
    v11.contentFrameRef = v5.createRef();
    v11.onContentSizeChanged = function()
        local l_props_0 = v11.props;
        if not (l_props_0.IsCollapsed or not l_props_0.OnSizeChanged) then
            l_props_0.OnSizeChanged((l_props_0.Id or l_props_0.Text) or "", v11.contentFrameRef.current.Size);
        end;
    end;
end;
v10.render = function(v13)
    local l_props_1 = v13.props;
    local v15 = nil;
    local v16 = nil;
    if not l_props_1.IsCollapsed then
        v15 = Enum.FillDirection.Horizontal;
        v16 = l_props_1.LabelColumnWidth;
    else
        v15 = Enum.FillDirection.Vertical;
        v16 = UDim.new(1, 0);
    end;
    return v5.createElement(l_FitFrameOnAxis_0, {
        axis = l_FitFrameOnAxis_0.Axis.Vertical, 
        contentPadding = l_props_1.Padding, 
        minimumSize = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        FillDirection = v15, 
        LayoutOrder = l_props_1.LayoutOrder
    }, {
        Label = v5.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(v16, UDim.new(0, 22)), 
            Text = l_props_1.Text, 
            TextXAlignment = l_props_1.TextXAlignment, 
            TextYAlignment = l_props_1.TextYAlignment
        }), 
        Content = v5.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_props_1.ContentPadding, 
            BackgroundTransparency = 1, 
            FillDirection = l_props_1.ContentFillDirection, 
            LayoutOrder = 2, 
            [v5.Change.Size] = v13.onContentSizeChanged, 
            [v5.Ref] = v13.contentFrameRef
        }, v13.props[v5.Children])
    });
end;
local v17 = v5.PureComponent:extend("LabeledElementList");
v17.defaultProps = {
    Collapsible = false, 
    Items = {}, 
    MaximumLabelWidth = math.huge, 
    LayoutOrder = 1
};
v17.init = function(v18)
    v18._frameRef = v5.createRef();
    v18._contentSizeMap = {};
    v18._contentColumnWidth = 0;
    v18._maximumContentWidth = 0;
    v18._labelColumnWidth = 0;
    local function _()
        local v19 = v18._contentColumnWidth < v18._maximumContentWidth;
        v18:setState(function()
            if v19 ~= v18.state.isCollapsed then
                return {
                    isCollapsed = v19
                };
            else
                return nil;
            end;
        end);
    end;
    v18.onSizeChanged = function()
        v18._contentColumnWidth = (v18._frameRef.current.AbsoluteSize.X - v18._labelColumnWidth) - v18.props.Stylizer.LabeledElementList.ItemPaddingHorizontal.Offset;
        local v21 = v18._contentColumnWidth < v18._maximumContentWidth;
        v18:setState(function()
            if v21 ~= v18.state.isCollapsed then
                return {
                    isCollapsed = v21
                };
            else
                return nil;
            end;
        end);
    end;
    v18.onSectionSizeChanged = function(v22, v23)
        v18._contentSizeMap[v22] = v23;
        v18._maximumContentWidth = 0;
        for _, v25 in pairs(v18._contentSizeMap) do
            v18._maximumContentWidth = math.max(v18._maximumContentWidth, v25.X.Offset);
        end;
        local v26 = v18._contentColumnWidth < v18._maximumContentWidth;
        v18:setState(function()
            if v26 ~= v18.state.isCollapsed then
                return {
                    isCollapsed = v26
                };
            else
                return nil;
            end;
        end);
    end;
    v18:setState({
        isCollapsed = false
    });
end;
v17.render = function(v27)
    local l_props_2 = v27.props;
    local l_state_0 = v27.state;
    local l_Items_0 = l_props_2.Items;
    local l_LabeledElementList_0 = l_props_2.Stylizer.LabeledElementList;
    v27._labelColumnWidth = 0;
    for _, v33 in ipairs(l_Items_0) do
        v27._labelColumnWidth = math.max(l_TextService_0:GetTextSize(v33.Text, l_LabeledElementList_0.TextSize, l_LabeledElementList_0.Font, Vector2.new(l_props_2.MaximumLabelWidth, 10000)).X, v27._labelColumnWidth);
    end;
    local v34 = not not l_state_0.isCollapsed and l_LabeledElementList_0.ItemPaddingVertical or l_LabeledElementList_0.ItemPaddingHorizontal;
    local v35 = {};
    for v36, v37 in ipairs(l_Items_0) do
        v35["Item" .. tostring(v36)] = v5.createElement(v10, {
            IsCollapsed = l_state_0.isCollapsed, 
            ContentFillDirection = v37.ContentFillDirection, 
            ContentPadding = l_LabeledElementList_0.ItemContentPadding, 
            LabelColumnWidth = UDim.new(0, v27._labelColumnWidth), 
            LayoutOrder = v36, 
            Padding = v34, 
            Text = v37.Text, 
            TextXAlignment = v37.TextXAlignment, 
            TextYAlignment = v37.TextYAlignment, 
            OnSizeChanged = v27.onSectionSizeChanged
        }, {
            Content = v37.Content
        });
    end;
    return v5.createElement(l_FitFrameVertical_0, {
        contentPadding = l_LabeledElementList_0.SectionPadding, 
        width = UDim.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_2.LayoutOrder, 
        [v5.Change.AbsoluteSize] = v27.onSizeChanged, 
        [v5.Ref] = v27._frameRef
    }, v35);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v17));
