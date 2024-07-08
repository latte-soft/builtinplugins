local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Components.TextOffset);
local v4 = require(l_Parent_0.Src.Util.Constants);
local v5 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v13 = v1.PureComponent:extend("TextEditor");
local v14 = v5.Left.rawValue();
local v15 = v5.Right.rawValue();
local v16 = v5.Top.rawValue();
local v17 = v5.Bottom.rawValue();
v13.createOffset = function(v18, v19)
    local l_props_0 = v18.props;
    local l_Localization_1 = l_props_0.Localization;
    local v22 = nil;
    local v23 = nil;
    if v19 == v14 then
        v22 = l_Localization_1:getText("TextEditor", "Left");
        v23 = 1;
    elseif v19 == v15 then
        v22 = l_Localization_1:getText("TextEditor", "Right");
        v23 = 2;
    elseif v19 == v16 then
        v22 = l_Localization_1:getText("TextEditor", "Top");
        v23 = 3;
    elseif v19 == v17 then
        v22 = l_Localization_1:getText("TextEditor", "Bottom");
        v23 = 4;
    end;
    return v1.createElement(v3, {
        orientation = v19, 
        labelText = v22, 
        sliceRect = l_props_0.sliceRect, 
        setSliceRect = l_props_0.setSliceRect, 
        pixelDimensions = l_props_0.pixelDimensions, 
        layoutOrder = v23
    });
end;
v13.render = function(v24)
    local l_props_1 = v24.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Localization_2 = l_props_1.Localization;
    local l_size_0 = l_props_1.size;
    local v29 = l_Localization_2:getText("ImageEditor", "ImageSize");
    local l_pixelDimensions_0 = l_props_1.pixelDimensions;
    return v1.createElement(l_Pane_0, {
        Position = l_props_1.position, 
        Size = l_size_0, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Spacing = l_Stylizer_0.OffsetItemSpacing, 
        LayoutOrder = l_props_1.layoutOrder
    }, {
        OffsetLabel = v1.createElement(l_TextLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.new(1, 0, 0, v4.TEXTSIZE), 
            Text = l_Localization_2:getText("TextEditor", "Offsets"), 
            TextSize = v4.TEXTSIZE, 
            TextXAlignment = Enum.TextXAlignment.Center
        }), 
        LeftInput = v24:createOffset(v14), 
        RightInput = v24:createOffset(v15), 
        TopInput = v24:createOffset(v16), 
        BottomInput = v24:createOffset(v17), 
        PixelDimensionsText = v1.createElement(l_TextLabel_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.PixelDimensionsHeightPx), 
            Text = if not l_pixelDimensions_0 then l_Localization_2:getText("ImageEditor", "ImageSizeError") else v29 .. (":\n%d x %d px"):format(l_pixelDimensions_0.X, l_pixelDimensions_0.Y), 
            TextSize = v4.TEXTSIZE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            TextWrapped = true, 
            LayoutOrder = 5
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
