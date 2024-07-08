local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v7 = require(l_Parent_0.Core.Util.Constants);
local v8 = require(l_Parent_0.Core.Util.Images);
local v9 = require(l_Parent_0.Core.Util.ToolboxUtilities);
local v10 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v11 = require(l_Parent_0.Core.Components.TooltipWrapper);
local v12 = v3.PureComponent:extend("VerifiedCreatorBadge");
v12.init = function(v13, v14)
    v13.state = {
        isHovered = false
    };
    v13.onMouseEnter = function()
        v13:setState({
            isHovered = true
        });
        v13.props.Modal.onTooltipTriggered(v14.assetId, v7.TOOLTIP_TYPE.HIGH_QUALITY_BADGE);
    end;
    v13.onMouseLeave = function()
        v13:setState({
            isHovered = false
        });
    end;
    v13.onActivated = function()
        v6.onIdVerificationIconClicked(v13.props.assetId);
        l_GuiService_0:OpenBrowserWindow(v9.getVerificationDocumentationUrl());
    end;
end;
v12.render = function(v15)
    local l_props_0 = v15.props;
    local l_assetId_0 = l_props_0.assetId;
    local l_onMouseEnter_0 = v15.onMouseEnter;
    local l_onMouseLeave_0 = v15.onMouseLeave;
    local l_isHovered_0 = v15.state.isHovered;
    return v3.createElement("ImageButton", {
        AnchorPoint = l_props_0.AnchorPoint, 
        Position = l_props_0.Position, 
        LayoutOrder = l_props_0.LayoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(13, 13), 
        Image = v8.WARNING_ICON_SMALL, 
        ImageColor3 = l_props_0.Stylizer.asset.icon.warningColor, 
        ZIndex = 2, 
        [v3.Event.Activated] = v15.onActivated, 
        [v3.Event.MouseEnter] = l_onMouseEnter_0, 
        [v3.Event.MouseLeave] = l_onMouseLeave_0
    }, {
        TooltipWrapper = l_isHovered_0 and v3.createElement(v11, {
            Text = l_props_0.Localization:getText("General", "UnverifiedCreatorBadgeTooltipText"), 
            canShowCurrentTooltip = l_props_0.Modal.modalStatus:canShowCurrentTooltip(l_assetId_0, v7.TOOLTIP_TYPE.HIGH_QUALITY_BADGE), 
            isHovered = l_isHovered_0
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v10
})(v12));
