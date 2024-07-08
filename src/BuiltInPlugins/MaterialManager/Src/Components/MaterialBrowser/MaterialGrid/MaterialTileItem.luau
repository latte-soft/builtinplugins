local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Container_0 = l_UI_0.Container;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.MaterialPreview);
local v18 = require(l_Components_0.StatusIcon);
local v19 = v2.PureComponent:extend("MaterialTileItem");
v19.render = function(v20)
    local l_props_0 = v20.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_MaterialTileItem_0 = l_props_0.Stylizer.MaterialTileItem;
    local l_ApplyToSelection_0 = l_props_0.ApplyToSelection;
    local l_Hover_0 = l_props_0.Hover;
    local l_Material_0 = l_props_0.Material;
    local l_MaterialDescription_0 = l_props_0.MaterialDescription;
    local l_MaterialName_0 = l_props_0.MaterialName;
    local l_MaterialVariant_0 = l_Material_0.MaterialVariant;
    local l_MaterialTileSize_0 = l_props_0.MaterialTileSize;
    local l_Material_1 = l_Material_0.Material;
    local l_Selected_0 = l_props_0.Selected;
    local l_Status_0 = l_props_0.Status;
    local v34 = UDim2.fromOffset(l_MaterialTileSize_0, l_MaterialTileSize_0);
    local l_Padding_0 = l_MaterialTileItem_0.Padding;
    local l_TextSize_0 = l_MaterialTileItem_0.TextSize;
    return v2.createElement(l_Button_0, {
        DisableHover = l_props_0.MenuHover, 
        LayoutOrder = l_props_0.LayoutOrder, 
        OnClick = l_props_0.OnClick, 
        OnMouseEnter = l_props_0.OnMouseEnter, 
        OnMouseLeave = l_props_0.OnMouseLeave, 
        Style = not l_Selected_0 and "Round" or "RoundActive", 
        Size = v34
    }, {
        Content = v2.createElement(l_Container_0, {
            Size = v34
        }, {
            MaterialPreview = v2.createElement(v17, {
                Clone = false, 
                Hover = l_Hover_0, 
                LayoutOrder = 1, 
                Material = l_Material_1, 
                MaterialVariant = l_MaterialVariant_0, 
                Position = UDim2.fromOffset(0, 0), 
                Size = v34, 
                Static = true
            }), 
            Gradient = if l_MaterialTileSize_0 >= 100 then v2.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 1), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Position = l_MaterialTileItem_0.GradientPosition, 
                Size = l_MaterialTileItem_0.GradientSize, 
                ZIndex = 2
            }, {
                Gradient = v2.createElement(l_Image_0, {
                    Size = UDim2.fromScale(1, 1), 
                    Style = {
                        Image = if not l_Hover_0 then l_MaterialTileItem_0.Gradient else l_MaterialTileItem_0.GradientHover
                    }
                })
            }) else nil, 
            NameLabel = if l_MaterialTileSize_0 >= 100 then v2.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0, 1), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Position = UDim2.new(0, l_Padding_0, 1, -l_Padding_0), 
                Size = if not l_MaterialVariant_0 then UDim2.new(1, -2 * l_Padding_0, 0, l_TextSize_0) else UDim2.new(1, -2 * l_Padding_0 - l_MaterialTileItem_0.IconSize.X.Offset, 0, l_TextSize_0), 
                ZIndex = 3
            }, {
                Name = v2.createElement(l_TruncatedTextLabel_0, {
                    Size = UDim2.fromScale(1, 1), 
                    Text = l_MaterialName_0, 
                    TextSize = l_TextSize_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = false
                })
            }) else nil
        }), 
        MaterialVariantIcon = if not l_Material_0.MaterialVariant then nil else v2.createElement(l_Container_0, {
            AnchorPoint = l_MaterialTileItem_0.MaterialVariantIconAnchorPoint, 
            LayoutOrder = 2, 
            Position = l_MaterialTileItem_0.MaterialVariantIconPosition, 
            Size = l_MaterialTileItem_0.IconSize, 
            ZIndex = 2
        }, {
            Image = v2.createElement(l_Image_0, {
                Style = l_MaterialTileItem_0.MaterialVariantIcon
            }), 
            Tooltip = v2.createElement(l_Tooltip_0, {
                Text = l_MaterialDescription_0
            })
        }), 
        StatusIcon = if not not l_Status_0 and l_Status_0 ~= Enum.PropertyStatus.Ok then v2.createElement(v18, {
            LayoutOrder = 3, 
            Material = l_Material_0, 
            Position = l_MaterialTileItem_0.StatusIconPosition, 
            Size = l_MaterialTileItem_0.IconSize, 
            Status = l_Status_0, 
            ZIndex = 2
        }) else nil, 
        ApplyToSelection = if not l_Hover_0 then nil else v2.createElement(l_Button_0, {
            AnchorPoint = l_MaterialTileItem_0.ApplyIconAnchorPoint, 
            LayoutOrder = 4, 
            OnClick = l_ApplyToSelection_0, 
            Position = l_MaterialTileItem_0.ApplyIconPosition, 
            Size = l_MaterialTileItem_0.ButtonSize, 
            Style = "Round"
        }, {
            Image = v2.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = l_MaterialTileItem_0.IconSize, 
                Style = l_MaterialTileItem_0.ApplyIcon
            }), 
            Tooltip = v2.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("TopBar", "Apply")
            })
        })
    });
end;
return l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v19);
