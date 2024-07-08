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
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.MaterialPreview);
local v18 = require(l_Components_0.StatusIcon);
local v19 = require(l_Parent_0.Src.Util.CalculateFillWidth);
local v20 = v2.PureComponent:extend("MaterialListItem");
v20.render = function(v21)
    local l_props_0 = v21.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_MaterialListItem_0 = l_props_0.Stylizer.MaterialListItem;
    local l_ApplyToSelection_0 = l_props_0.ApplyToSelection;
    local l_Hover_0 = l_props_0.Hover;
    local l_Material_0 = l_props_0.Material;
    local l_MaterialDescription_0 = l_props_0.MaterialDescription;
    local l_MaterialName_0 = l_props_0.MaterialName;
    local l_MaterialVariant_0 = l_Material_0.MaterialVariant;
    local l_Material_1 = l_Material_0.Material;
    local l_Selected_0 = l_props_0.Selected;
    local l_Status_0 = l_props_0.Status;
    local l_Height_0 = l_MaterialListItem_0.Height;
    return v2.createElement(l_Button_0, {
        DisableHover = l_props_0.MenuHover, 
        LayoutOrder = l_props_0.LayoutOrder, 
        OnClick = l_props_0.OnClick, 
        OnMouseEnter = l_props_0.OnMouseEnter, 
        OnMouseLeave = l_props_0.OnMouseLeave, 
        Style = not l_Selected_0 and "Round" or "RoundActive", 
        Size = UDim2.fromScale(1, 1)
    }, {
        Content = v2.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_MaterialListItem_0.Spacing, 
            Size = UDim2.new(1, -10, 1, 0)
        }, {
            MaterialPreview = v2.createElement(v17, {
                Clone = false, 
                Hover = l_Hover_0, 
                LayoutOrder = 1, 
                Material = l_Material_1, 
                MaterialVariant = l_MaterialVariant_0, 
                Size = UDim2.fromOffset(l_Height_0, l_Height_0), 
                Static = true
            }), 
            NameLabel = v2.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Size = UDim2.new(v19({
                    UDim.new(0, l_Height_0), 
                    if not (not not l_MaterialVariant_0 or false) then UDim.new(0, 0) else l_MaterialListItem_0.IconSize.X, 
                    if not ((not l_MaterialVariant_0 and l_Status_0) and l_Status_0 ~= Enum.PropertyStatus.Ok) then UDim.new(0, 0) else l_MaterialListItem_0.IconSize.X, 
                    if not l_Hover_0 then UDim.new(0, 0) else l_MaterialListItem_0.ButtonSize.X
                }, 0, l_MaterialListItem_0.Spacing), UDim.new(0, l_Height_0))
            }, {
                Name = v2.createElement(l_TextLabel_0, {
                    Size = UDim2.fromScale(1, 1), 
                    Text = l_MaterialName_0, 
                    TextSize = l_MaterialListItem_0.TextSize, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextWrapped = false
                })
            }), 
            ApplyToSelection = if not l_Hover_0 then nil else v2.createElement(l_Button_0, {
                LayoutOrder = 3, 
                OnClick = l_ApplyToSelection_0, 
                Position = l_MaterialListItem_0.ApplyIconPosition, 
                Size = l_MaterialListItem_0.ButtonSize, 
                Style = "Round"
            }, {
                Image = v2.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = l_MaterialListItem_0.IconSize, 
                    Style = l_MaterialListItem_0.ApplyIcon
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_Localization_1:getText("TopBar", "Apply")
                })
            }), 
            MaterialVariantIcon = if not l_MaterialVariant_0 then nil else v2.createElement(l_Container_0, {
                LayoutOrder = 4, 
                Size = l_MaterialListItem_0.IconSize
            }, {
                Image = v2.createElement(l_Image_0, {
                    Style = l_MaterialListItem_0.MaterialVariantIcon
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_MaterialDescription_0
                })
            }), 
            StatusIcon = if not not l_Status_0 and l_Status_0 ~= Enum.PropertyStatus.Ok then v2.createElement(v18, {
                LayoutOrder = 5, 
                Material = l_Material_0, 
                Size = l_MaterialListItem_0.IconSize, 
                Status = l_Status_0
            }) else nil
        })
    });
end;
return l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v20);
