local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Util.Images);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_withForwardRef_0 = v3.Wrappers.withForwardRef;
local v9 = v2.PureComponent:extend("StyledScrollingFrame");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local _ = l_props_0.AutomaticCanvasSize;
    local v14 = l_props_0.Position or UDim2.new(0, 0, 0, 0);
    local v15 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local v16 = l_props_0.CanvasSize or UDim2.new(1, 0, 1, 0);
    local v17 = l_props_0.LayoutOrder or 1;
    local v18 = l_props_0.ZIndex or 1;
    local v19 = l_props_0.Visible ~= nil and l_props_0.Visible or l_props_0.Visible == nil;
    local l_onScroll_0 = l_props_0.onScroll;
    local l_ForwardRef_0 = l_props_0.ForwardRef;
    local v22 = l_props_0[v2.Children];
    local l_scrollingEnabled_0 = l_props_0.scrollingEnabled;
    local l_scrollingFrame_0 = l_Stylizer_0.scrollingFrame;
    return v2.createElement("ImageButton", {
        Position = v14, 
        Size = v15, 
        BackgroundTransparency = 1, 
        LayoutOrder = v17, 
        ZIndex = v18, 
        Visible = v19, 
        AutoButtonColor = false
    }, {
        ScrollBarBackground = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(0, v4.SCROLLBAR_BACKGROUND_THICKNESS, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_props_0.BackgroundColor or l_scrollingFrame_0.scrollbarBackgroundColor
        }), 
        ScrollingFrame = v2.createElement("ScrollingFrame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, -v4.SCROLLBAR_PADDING, 1, 0), 
            CanvasSize = v16, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ScrollBarThickness = v4.SCROLLBAR_THICKNESS, 
            ZIndex = 2, 
            TopImage = v5.SCROLLBAR_TOP_IMAGE, 
            MidImage = v5.SCROLLBAR_MIDDLE_IMAGE, 
            BottomImage = v5.SCROLLBAR_BOTTOM_IMAGE, 
            ScrollBarImageColor3 = l_scrollingFrame_0.scrollbarImageColor, 
            ScrollingEnabled = l_scrollingEnabled_0, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            [v2.Change.AbsoluteSize] = l_props_0.OnAbsoluteSizeChanged, 
            [v2.Change.CanvasPosition] = l_onScroll_0, 
            [v2.Ref] = l_ForwardRef_0
        }, v22)
    });
end;
return (l_withForwardRef_0((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9))));
