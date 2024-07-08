local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_Parent_0.Src.Components.ConvertToPackageWindow.AssetThumbnailPreview);
local v5 = require(l_Parent_0.Src.Util.LayoutOrderIterator);
local v6 = v1.PureComponent:extend("PreviewArea");
v6.render = function(v7)
    local l_props_0 = v7.props;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, l_props_0.TotalWidth, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_props_0.Stylizer.previewArea.backgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 5), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        }), 
        AssetThumbnailPreview = v1.createElement(v4, {
            Size = UDim2.new(0, 150, 0, 150), 
            ShowTitle = false, 
            LayoutOrder = v5.new():getNextOrder()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
