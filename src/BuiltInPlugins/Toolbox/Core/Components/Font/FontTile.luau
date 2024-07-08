local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Packages_0.Dash);
local l_withAbsoluteSizeAndPosition_0 = v3.Wrappers.withAbsoluteSizeAndPosition;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_Pane_0 = v3.UI.Pane;
local l_TextLabel_0 = v3.UI.TextLabel;
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local _ = require(l_Parent_0.Core.Components.AssetLogicWrapper);
local v13 = require(l_Parent_0.Core.Util.Constants);
local v14 = require(l_Parent_0.Core.Components.Asset.Preview.PopUpWrapperButton);
local v15 = require(l_Parent_0.Core.Util.Urls);
local v16 = UDim2.new(0, -14, 0, 14);
local l_FONT_TILE_HEIGHT_0 = v13.FONT_TILE_HEIGHT;
local v18 = v2.PureComponent:extend("FontTile");
v18.defaultProps = {
    Size = UDim2.new(1, 0, 0, l_FONT_TILE_HEIGHT_0)
};
v18.init = function(v19, _)
    v19.wasAssetBoundsWithinScrollingBounds = false;
    v19.state = {
        isHovered = false
    };
    v19.onMouseEnter = function()
        v19:setState(function()
            return {
                isHovered = true
            };
        end);
    end;
    v19.onMouseLeave = function()
        v19:setState(function()
            return {
                isHovered = false
            };
        end);
    end;
    v19.logImpression = function()
        local l_props_0 = v19.props;
        local l_AssetInfo_0 = l_props_0.AssetInfo;
        if l_props_0.LogImpression then
            v19.wasAssetBoundsWithinScrollingBounds = l_props_0.LogImpression(l_AssetInfo_0, l_props_0.AbsoluteSize, l_props_0.AbsolutePosition, v19.wasAssetBoundsWithinScrollingBounds);
        end;
    end;
end;
v18.didMount = function(v23)
    local l_props_1 = v23.props;
    local l_AssetInfo_1 = l_props_1.AssetInfo;
    local l_LogImpression_0 = l_props_1.LogImpression;
    if not (not l_AssetInfo_1 or not l_LogImpression_0) then
        v23.logImpression();
    end;
end;
v18.didUpdate = function(v27, v28, _)
    local l_props_2 = v27.props;
    if not (v28.AbsolutePosition == l_props_2.AbsolutePosition and v28.ParentAbsoluteSize == l_props_2.ParentAbsoluteSize) or v28.AbsoluteSize ~= l_props_2.AbsoluteSize then
        v27.logImpression();
    end;
end;
v18.render = function(v31)
    local l_props_3 = v31.props;
    local l_state_0 = v31.state;
    local l_Asset_0 = l_props_3.AssetInfo.Asset;
    local v35 = not l_Asset_0 and "" or tostring(l_Asset_0.Id);
    local v36 = not l_Asset_0 and "" or tostring(l_Asset_0.Name);
    local v37 = v15.constructAssetThumbnailUrl(v35, 1200, 80, "FontFamily");
    local l_isHovered_0 = l_state_0.isHovered;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_backgroundColor_0 = l_Stylizer_0.fontTile.backgroundColor;
    if l_isHovered_0 then
        l_backgroundColor_0 = l_Stylizer_0.fontTile.hoveredBackgroundColor;
    end;
    local l_textFillColor_0 = l_Stylizer_0.fontTile.textFillColor;
    local v42 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, v6.join({
        BackgroundColor = l_backgroundColor_0, 
        BorderSizePixel = 1, 
        LayoutOrder = l_props_3.LayoutOrder, 
        OnClick = l_props_3.OnAssetPreviewButtonClicked, 
        Padding = {
            Right = 1
        }, 
        Size = l_props_3.Size, 
        Style = "BorderBox", 
        [v2.Event.MouseEnter] = v31.onMouseEnter, 
        [v2.Event.MouseLeave] = v31.onMouseLeave
    }, l_props_3.WrapperProps), {
        AssetPreviewTriggerButtonFrame = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, 0, 0, 0), 
            ZIndex = 200
        }, {
            AssetPreviewTriggerButton = v2.createElement(v14, {
                onClick = l_props_3.OnAssetPreviewButtonClicked, 
                position = v16, 
                ShowIcon = l_isHovered_0
            })
        }), 
        UIGradientFrame = v2.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundColor3 = l_backgroundColor_0, 
            BorderSizePixel = 0, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, 60, 1, -2), 
            ZIndex = 100
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        TileComponent = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            Padding = {
                Bottom = 12, 
                Left = 10, 
                Right = 0, 
                Top = 12
            }, 
            Size = UDim2.new(1, 0, 0, 0), 
            Spacing = 8
        }, {
            FontTitle = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = v13.FONT, 
                LayoutOrder = v42:getNextOrder(), 
                Text = v36, 
                TextSize = v13.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            FontThumbnailPane = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor = l_backgroundColor_0, 
                BorderSizePixel = 0, 
                ClipsDescendants = true, 
                LayoutOrder = v42:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                FontThumbnail = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v37, 
                    ImageColor3 = l_textFillColor_0, 
                    Size = UDim2.new(0, 600, 0, 40)
                })
            })
        })
    });
end;
return l_withAbsoluteSizeAndPosition_0((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v18)));
