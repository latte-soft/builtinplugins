local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("HierarchyLines");
v4.render = function(v5)
    local l_props_0 = v5.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_IsLeafNode_0 = l_props_0.IsLeafNode;
    local l_InActiveChain_0 = l_props_0.InActiveChain;
    local l_IsChildNode_0 = l_props_0.IsChildNode;
    local l_IsExpanded_0 = l_props_0.IsExpanded;
    local l_Indent_0 = l_props_0.Indent;
    local l_Height_0 = l_props_0.Height;
    local l_IKHeight_0 = l_props_0.IKHeight;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Highlight_0 = l_props_0.Highlight;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local v18 = l_Indent_0 > 0 and 20 or 0;
    local v19 = not l_IsLeafNode_0 and 6 or 3;
    local v20 = l_Indent_0 > 1 and (l_Indent_0 - 1) * 20 or 0;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v20 + v18, 0, 0), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Indent = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Size = UDim2.new(0, v20, 1, 0)
        }), 
        VerticalLine = (not l_IsLeafNode_0 and l_IsExpanded_0) and v1.createElement("Frame", {
            Size = UDim2.new(0, 1, 0, l_Height_0 - 6), 
            BorderSizePixel = 0, 
            BackgroundTransparency = l_Stylizer_0.ikTheme.transparency, 
            Position = UDim2.new(0, (v20 + v18) + 6, 0, 6), 
            BackgroundColor3 = not not l_Highlight_0 and l_Stylizer_0.ikTheme.ikLineColor or l_Stylizer_0.ikTheme.lineColor, 
            ZIndex = 2
        }), 
        IKVerticalLine = ((not l_IsLeafNode_0 and l_IsExpanded_0) and l_InActiveChain_0) and v1.createElement("Frame", {
            Size = UDim2.new(0, 1, 0, (math.max(l_IKHeight_0 - 6, 0))), 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, (v20 + v18) + 6, 0, 6), 
            BackgroundColor3 = l_Stylizer_0.ikTheme.ikLineColor, 
            BorderColor3 = l_Stylizer_0.ikTheme.ikLineColor, 
            ZIndex = 3
        }), 
        HorizontalLine = l_IsChildNode_0 and v1.createElement("Frame", {
            Size = UDim2.new(0, v18 - v19, 0, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = not (not not l_Highlight_0 and l_InActiveChain_0) and l_Stylizer_0.ikTheme.transparency or 0, 
            BackgroundColor3 = not not l_Highlight_0 and l_Stylizer_0.ikTheme.ikLineColor or l_Stylizer_0.ikTheme.lineColor, 
            Position = UDim2.new(0, v20 + 6, 0, 0), 
            ZIndex = 2
        }), 
        LeafNode = l_IsLeafNode_0 and v1.createElement("ImageLabel", {
            Size = UDim2.new(0, 6, 0, 6), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = l_Stylizer_0.ikTheme.leafNodeImage, 
            ImageColor3 = not not l_IsSelected_0 and l_Stylizer_0.ikTheme.primaryTextColor or l_Stylizer_0.ikTheme.lineColor, 
            Position = UDim2.new(0, v20 + v18, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            ZIndex = 4
        }), 
        Toggle = not l_IsLeafNode_0 and v1.createElement("ImageButton", {
            Size = UDim2.new(0, 12, 0, 12), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = not not l_IsExpanded_0 and l_Stylizer_0.ikTheme.collapseImage or l_Stylizer_0.ikTheme.expandImage, 
            ImageColor3 = not not l_IsSelected_0 and l_Stylizer_0.ikTheme.primaryTextColor or l_Stylizer_0.ikTheme.lineColor, 
            Position = UDim2.new(0, v20 + v18, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            AutoButtonColor = false, 
            ZIndex = 4, 
            [v1.Event.MouseButton1Click] = function()
                l_props_0.ToggleExpanded(l_props_0.Element);
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
