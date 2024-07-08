local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Util.Constants);
local v4 = require(l_Parent_0.Core.ContextServices.ModalContext);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Core.Components.TooltipWrapper);
local v8 = v2.PureComponent:extend("AssetName");
v8.init = function(v9, v10)
    v9.state = {
        isHovered = false
    };
    v9.onMouseEnter = function()
        v9:setState({
            isHovered = true
        });
        v9.props.Modal.onTooltipTriggered(v10.assetId, v3.TOOLTIP_TYPE.ASSET_NAME);
    end;
    v9.onMouseLeave = function()
        v9:setState({
            isHovered = false
        });
    end;
end;
v8.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_assetId_0 = l_props_0.assetId;
    local l_assetName_0 = l_props_0.assetName;
    local v16 = l_props_0.LayoutOrder or 0;
    local l_ASSET_NAME_HEIGHT_0 = v3.ASSET_NAME_HEIGHT;
    if l_props_0.NumberRows ~= nil then
        l_ASSET_NAME_HEIGHT_0 = v3.ASSET_NAME_ONE_LINE_HEIGHT * l_props_0.NumberRows;
    end;
    local v18 = l_props_0.Modal.modalStatus:canShowCurrentTooltip(l_assetId_0, v3.TOOLTIP_TYPE.ASSET_NAME);
    local l_assetName_1 = l_Stylizer_0.asset.assetName;
    local l_isHovered_0 = v11.state.isHovered;
    return v2.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        LayoutOrder = v16, 
        Size = UDim2.new(1, 0, 0, l_ASSET_NAME_HEIGHT_0), 
        Text = l_assetName_0, 
        TextColor3 = l_assetName_1.textColor, 
        Font = l_props_0.Font, 
        TextSize = l_props_0.TextSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        ClipsDescendants = true, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        [v2.Event.MouseEnter] = v11.onMouseEnter, 
        [v2.Event.MouseLeave] = v11.onMouseLeave
    }, {
        TooltipWrapper = l_isHovered_0 and v2.createElement(v7, {
            Text = l_assetName_0, 
            canShowCurrentTooltip = v18, 
            isHovered = l_isHovered_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v4
})(v8));
