local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_formatLocalDateTime_0 = v3.Util.formatLocalDateTime;
local v7 = require(l_Parent_0.Core.Components.AssetConfiguration.VersionDivider);
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.Urls);
local v11 = require(l_Util_0.Images);
local v12 = v2.PureComponent:extend("VersionItem");
local v13 = {
    CURRENT = 1, 
    SELECTED = 2, 
    DEFAULT = 3
};
v12.init = function(v14, _)
    v14.state = {};
end;
v12.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local _ = l_Stylizer_0.versions;
    local v20 = l_props_0.ItemInfo or {};
    local l_IsCurrent_0 = l_props_0.IsCurrent;
    local l_SelectVersion_0 = l_props_0.SelectVersion;
    local v23 = nil;
    v23 = if not l_IsCurrent_0 then if l_SelectVersion_0 == v20.assetVersionNumber then v13.SELECTED else v13.DEFAULT else v13.CURRENT;
    local _ = v10.constructAssetThumbnailUrl(v20.assetId, v9.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v9.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
    local l_versions_1 = l_Stylizer_0.versions;
    local l_createElement_0 = v2.createElement;
    local v27 = "Frame";
    local v28 = {
        Size = l_props_0.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    };
    local v29 = {
        Version = v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 120, 0, 25), 
            Size = UDim2.new(1, -67, 0, 20), 
            Text = "V" .. tostring(v20.assetVersionNumber), 
            TextColor3 = l_versions_1.textColor, 
            Font = v9.FONT_BOLD, 
            TextSize = v9.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        LastChange = v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.new(0, 120, 0, 35), 
            Size = UDim2.new(1, -67, 0, 20), 
            Text = l_formatLocalDateTime_0(v20.created, "L LTS", v16.props.Localization:getLocale()), 
            TextColor3 = l_versions_1.textColor, 
            Font = v9.FONT, 
            TextSize = v9.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        })
    };
    local v30 = false;
    if v23 ~= v13.CURRENT then
        v30 = v2.createElement("ImageButton", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -160, 0.5, 0), 
            Size = UDim2.new(0, 28, 0, 28), 
            Image = v11.MAKE_CURRENT_VERSION, 
            BackgroundTransparency = 1, 
            ImageColor3 = v23 == v13.DEFAULT and l_versions_1.buttonDefaultColor or l_versions_1.buttonSelectedColor, 
            [v2.Event.Activated] = function(_)
                l_props_0.ItemClickCallBack(v20);
            end, 
            BorderSizePixel = 0
        });
    end;
    v29.SelectButton = v30;
    v29.Divider = v2.createElement(v7, {
        AnchorPoint = l_props_0.DividerAnchorPoint, 
        Position = l_props_0.DividerPosition, 
        Size = l_props_0.DividerSize, 
        BorderSizePixel = 0
    });
    return l_createElement_0(v27, v28, v29);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
