local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Images);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.Urls);
local v8 = require(l_Util_0.Colors);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = v2.PureComponent:extend("ImagePicker");
local l_FONT_SIZE_MEDIUM_0 = v6.FONT_SIZE_MEDIUM;
local v13 = Vector2.new(512, 256);
v11.init = function(v14, _)
    v14.state = {
        hovered = false
    };
    v14.onMouseEnter = function(_, _, _)
        if v14.props.ChooseThumbnail then
            v14:setState({
                hovered = true
            });
        end;
    end;
    v14.onMouseLeave = function(_, _, _)
        v14:setState({
            hovered = false
        });
    end;
end;
v11.getStatus = function(v22)
    local l_state_0 = v22.state;
    local l_props_0 = v22.props;
    local l_IconFile_0 = l_props_0.IconFile;
    local l_ThumbnailStatus_0 = l_props_0.ThumbnailStatus;
    local l_hovered_0 = l_state_0.hovered;
    local _ = nil;
    local v29 = true;
    if l_ThumbnailStatus_0 ~= "Completed" then
        v29 = l_ThumbnailStatus_0 == nil;
    end;
    return if not l_IconFile_0 then if l_ThumbnailStatus_0 then l_props_0.Localization:getText("ThumbnailStatus", l_ThumbnailStatus_0) else "" else l_props_0.Localization:getText("AssetConfigPreview", "Preview"), not (l_hovered_0 or v29 and l_IconFile_0 == nil);
end;
v11.render = function(v30)
    local l_props_1 = v30.props;
    local l_state_1 = v30.state;
    local l_Size_0 = l_props_1.Size;
    local l_Position_0 = l_props_1.Position;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_IconFile_1 = l_props_1.IconFile;
    local l_AssetId_0 = l_props_1.AssetId;
    local l_ChooseThumbnail_0 = l_props_1.ChooseThumbnail;
    local l_hovered_1 = l_state_1.hovered;
    local v40, v41 = v30:getStatus(l_props_1.Localization);
    local l_PLUGIN_TEMP_0 = v5.PLUGIN_TEMP;
    if not l_IconFile_1 then
        if l_AssetId_0 then
            l_PLUGIN_TEMP_0 = v7.constructAssetThumbnailUrl(l_AssetId_0, v6.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v6.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE);
        end;
    else
        l_PLUGIN_TEMP_0 = l_IconFile_1:GetTemporaryId();
    end;
    return v2.createElement("ImageButton", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Image = l_PLUGIN_TEMP_0, 
        [v2.Event.Activated] = l_ChooseThumbnail_0, 
        [v2.Event.MouseEnter] = v30.onMouseEnter, 
        [v2.Event.mouseLeave] = v30.onMouseLeave, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ChangeIndication = v2.createElement("ImageLabel", {
            Visible = l_hovered_1, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 1.5, 0), 
            Image = v5.GRADIENT, 
            ImageColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 1, 
            ImageRectSize = v13
        }), 
        StatusFrame = v41 and v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 1, -40), 
            Size = UDim2.new(1, 0, 0, 40), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.5
        }, {
            Status = v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Text = v40, 
                TextColor3 = v8.WHITE, 
                TextSize = l_FONT_SIZE_MEDIUM_0, 
                Font = v6.FONT, 
                BackgroundTransparency = 1
            })
        }), 
        ChangeLabel = l_hovered_1 and v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, -15), 
            Size = UDim2.new(1, 0, 0, 30), 
            BackgroundTransparency = 1, 
            Text = l_props_1.Localization:getText("AssetConfigPreview", "Change"), 
            TextColor3 = v8.WHITE, 
            TextSize = l_FONT_SIZE_MEDIUM_0, 
            Font = v6.FONT, 
            ZIndex = 2
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));
