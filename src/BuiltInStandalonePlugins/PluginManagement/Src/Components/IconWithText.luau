local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.FitFrame);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_FitFrameHorizontal_0 = v2.FitFrameHorizontal;
local l_FitTextLabel_0 = v2.FitTextLabel;
local v7 = v1.PureComponent:extend("IconWithText");
v7.defaultProps = {
    Image = "", 
    imageSize = 16, 
    imageTopPadding = 0, 
    TextSize = 14
};
v7.render = function(v8)
    local l_Stylizer_0 = v8.props.Stylizer;
    local l_Image_0 = v8.props.Image;
    local l_imageSize_0 = v8.props.imageSize;
    local l_imageTopPadding_0 = v8.props.imageTopPadding;
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_Text_0 = v8.props.Text;
    local v15 = v8.props.TextColor3 or l_Stylizer_0.TextColor;
    local l_TextSize_0 = v8.props.TextSize;
    return v1.createElement(l_FitFrameHorizontal_0, {
        BackgroundTransparency = 1, 
        FillDirection = Enum.FillDirection.Horizontal, 
        height = UDim.new(0, l_TextSize_0), 
        LayoutOrder = l_LayoutOrder_0, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        IconContainer = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Size = UDim2.new(0, l_imageSize_0, 0, l_imageSize_0)
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_imageTopPadding_0)
            }), 
            Icon = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_Image_0, 
                ImageColor3 = v15, 
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_imageSize_0, 0, l_imageSize_0)
            })
        }), 
        CountText = v1.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Font = l_Stylizer_0.Font, 
            Text = l_Text_0, 
            TextColor3 = v15, 
            TextSize = l_TextSize_0, 
            width = l_FitTextLabel_0.Width.FitToText
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
