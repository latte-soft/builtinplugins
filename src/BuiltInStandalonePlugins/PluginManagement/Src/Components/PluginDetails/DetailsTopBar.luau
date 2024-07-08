local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.FitFrame);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Util.Constants);
local v6 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v7 = require(l_Parent_0.Src.ContextServices.Navigation);
local l_FitFrameVertical_0 = v2.FitFrameVertical;
local v9 = v1.Component:extend("DetailsTopBar");
v9.defaultProps = {
    name = ""
};
v9.init = function(v10)
    v10.onBackButtonActivated = function()
        v10.props.Navigation:get().navigation.goBack();
    end;
end;
v9.render = function(v11)
    local l_assetId_0 = v11.props.assetId;
    local l_LayoutOrder_0 = v11.props.LayoutOrder;
    local l_name_0 = v11.props.name;
    local l_Stylizer_0 = v11.props.Stylizer;
    return v1.createElement(l_FitFrameVertical_0, {
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderSizePixel = 0, 
        contentPadding = UDim.new(0, 18), 
        FillDirection = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_LayoutOrder_0, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        width = UDim.new(1, 0), 
        margin = {
            top = 18, 
            bottom = 18, 
            left = 0, 
            right = 0
        }
    }, {
        BackButton = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Image = "rbxasset://textures/PluginManagement/back.png", 
            ImageColor3 = l_Stylizer_0.TextColor, 
            Size = UDim2.new(0, 32, 0, 32), 
            [v1.Event.Activated] = v11.onBackButtonActivated
        }), 
        Border = v1.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.BorderColor, 
            LayoutOrder = 1, 
            Size = UDim2.new(0, 1, 0, v5.DETAILS_THUMBNAIL_SIZE)
        }), 
        Thumbnail = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v11.props.API:get().Images.AssetThumbnailUrl(l_assetId_0), 
            LayoutOrder = 2, 
            Size = UDim2.new(0, v5.DETAILS_THUMBNAIL_SIZE, 0, v5.DETAILS_THUMBNAIL_SIZE)
        }), 
        Name = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.FontBold, 
            LayoutOrder = 3, 
            Size = UDim2.new(0.5, -(v5.THUMBNAIL_SIZE + v5.PLUGIN_HORIZONTAL_PADDING), 0, 20), 
            Text = l_name_0, 
            TextColor3 = l_Stylizer_0.TextColor, 
            TextSize = 18, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return (l_withContext_0({
    Navigation = v7, 
    Stylizer = l_ContextServices_0.Stylizer, 
    API = v6
})(v9));
