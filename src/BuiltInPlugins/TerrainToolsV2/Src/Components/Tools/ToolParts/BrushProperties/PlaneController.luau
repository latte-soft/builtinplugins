local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v11 = require(l_Parent_0.Src.Components.Tools.ToolParts.LabeledElementPair);
local v12 = v2.PureComponent:extend(script.Name);
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_0 = l_props_0.Localization;
    local v16 = l_props_0.Theme:get();
    local l_EditPlaneMode_0 = l_props_0.EditPlaneMode;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v19 = l_Localization_0:getText("BrushSettings", "EditPlane");
    local v20 = l_Localization_0:getText("BrushSettings", "EditPlaneTooltip");
    local _ = nil;
    return v2.createElement(v11, {
        Size = UDim2.new(1, 0, 0, 18), 
        Text = v19, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ToggleButton = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = 4
        }, {
            Action = v2.createElement(l_Button_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(0, 114, 0, 22), 
                Style = "RoundPrimary", 
                Text = if not l_EditPlaneMode_0 then l_Localization_0:getText("BrushSettings", "Edit") else l_Localization_0:getText("BrushSettings", "Apply"), 
                OnClick = function()
                    v13.props.SetEditPlaneMode(not v13.props.EditPlaneMode);
                end
            }, {
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = v20
                })
            }), 
            Reset = v2.createElement(l_IconButton_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(0, 22, 0, 22), 
                IconColor = v16.iconButton.buttonIconColor, 
                LeftIcon = v16.iconButton.resetIcon, 
                OnClick = v13.props.Reset
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Theme = v5.DEPRECATED_Theme
})(v12));
