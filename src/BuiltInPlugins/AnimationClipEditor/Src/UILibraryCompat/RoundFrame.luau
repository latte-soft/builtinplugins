local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = Rect.new(3, 3, 13, 13);
local v6 = Color3.fromRGB(27, 42, 53);
local v7 = UDim2.new(0, 100, 0, 100);
local v8 = v2.PureComponent:extend("RoundFrame");
v8.init = function(v9, v10)
    v9.elementType = not (v10.OnActivated ~= nil) and "ImageLabel" or "ImageButton";
end;
v8.render = function(v11)
    local l_Stylizer_0 = v11.props.Stylizer;
    local l_props_0 = v11.props;
    local l_roundFrame_0 = l_Stylizer_0.roundFrame;
    local l_BackgroundColor3_0 = l_props_0.BackgroundColor3;
    local l_BackgroundTransparency_0 = l_props_0.BackgroundTransparency;
    local v17 = l_props_0.BorderColor3 or v6;
    local v18 = l_props_0.BorderSizePixel or 1;
    local v19 = l_props_0.Size or v7;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_OnActivated_0 = l_props_0.OnActivated;
    local l_OnMouseEnter_0 = l_props_0.OnMouseEnter;
    local l_OnMouseLeave_0 = l_props_0.OnMouseLeave;
    local _ = nil;
    return v2.createElement(v11.elementType, {
        Size = v19, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0, 
        BackgroundTransparency = 1, 
        ImageColor3 = l_BackgroundColor3_0, 
        ImageTransparency = l_BackgroundTransparency_0, 
        Image = l_roundFrame_0.backgroundImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v5, 
        [v2.Event.MouseEnter] = l_OnMouseEnter_0, 
        [v2.Event.MouseLeave] = l_OnMouseLeave_0, 
        [v2.Event.Activated] = l_OnActivated_0, 
        [v2.Change.AbsoluteSize] = l_props_0[v2.Change.AbsoluteSize], 
        [v2.Change.AbsolutePosition] = l_props_0[v2.Change.AbsolutePosition]
    }, {
        Border = v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = v17, 
            ImageTransparency = v18 == 0 and 1 or l_BackgroundTransparency_0, 
            Image = l_roundFrame_0.borderImage, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v5, 
            SliceScale = v18
        }, l_props_0[v2.Children])
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
