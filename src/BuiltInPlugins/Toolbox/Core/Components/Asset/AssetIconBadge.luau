local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = require(l_Parent_0.Core.Util.Images);
local v7 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v8 = require(l_Parent_0.Core.Components.TooltipWrapper);
local v9 = v2.PureComponent:extend("AssetIconBadge");
v9.init = function(v10, v11)
    v10.state = {
        isHovered = false
    };
    v10.onMouseEnter = function()
        v10:setState({
            isHovered = true
        });
        v10.props.Modal.onTooltipTriggered(v11.assetId, v5.TOOLTIP_TYPE.HIGH_QUALITY_BADGE);
    end;
    v10.onMouseLeave = function()
        v10:setState({
            isHovered = false
        });
    end;
end;
v9.render = function(v12)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_assetId_0 = l_props_0.assetId;
    local l_isPackage_0 = l_props_0.isPackage;
    local l_floatLeft_0 = l_props_0.floatLeft;
    local l_onMouseEnter_0 = v12.onMouseEnter;
    local l_onMouseLeave_0 = v12.onMouseLeave;
    local l_isHovered_0 = v12.state.isHovered;
    local v22 = l_props_0.Modal.modalStatus:canShowCurrentTooltip(l_assetId_0, v5.TOOLTIP_TYPE.HIGH_QUALITY_BADGE);
    local l_packages_0 = l_Stylizer_0.asset.packages;
    if not l_isPackage_0 then
        return v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(not l_floatLeft_0 and 1 or 0, 1), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(not l_floatLeft_0 and 0.94 or 0.06, 0, 1.06, 0), 
            Size = UDim2.new(0, v5.ASSET_ENDORSED_BADGE_ICON_SIZE, 0, v5.ASSET_ENDORSED_BADGE_ICON_SIZE), 
            Image = v6.ENDORSED_BADGE_ICON, 
            ZIndex = 2, 
            [v2.Event.MouseEnter] = l_onMouseEnter_0, 
            [v2.Event.MouseLeave] = l_onMouseLeave_0
        }, {
            TooltipWrapper = l_isHovered_0 and v2.createElement(v8, {
                Text = l_Localization_0:getText("General", "EndorseBadgeTooltipText"), 
                canShowCurrentTooltip = v22, 
                isHovered = l_isHovered_0
            })
        });
    else
        return v2.createElement("Frame", {
            AnchorPoint = Vector2.new(not l_floatLeft_0 and 1 or 0, 1), 
            Position = UDim2.new(not l_floatLeft_0 and 0.94 or 0.06, 0, 0.94, 0), 
            Size = v5.PACKAGE_BACKGROUND_SIZE, 
            BackgroundColor3 = l_packages_0.backgroundColor, 
            BackgroundTransparency = l_packages_0.backgroundTransparency
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, v5.PACKAGE_BACKGROUND_CORNER_RADIUS)
            }), 
            Image = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = v5.PACKAGE_DETAIL_SIZE, 
                Image = l_packages_0.packageImage, 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                [v2.Event.MouseEnter] = l_onMouseEnter_0, 
                [v2.Event.MouseLeave] = l_onMouseLeave_0
            })
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Modal = v7
})(v9));
