local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Colors_0 = v2.Style.Colors;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = v1.PureComponent:extend("CGEAlert");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_CGEAlert_0 = l_props_0.Stylizer.CGEAlert;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = l_CGEAlert_0.Padding, 
        BackgroundColor3 = l_Colors_0.darker(l_CGEAlert_0.BackgroundColor, l_CGEAlert_0.BackgroundColorHoverDarkerMultiplier), 
        Size = UDim2.fromScale(1, 0), 
        OnClick = l_props_0.OnClick
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = l_CGEAlert_0.CornerRadius
        }), 
        UIStroke = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = l_CGEAlert_0.BorderColor
        }), 
        Inner = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Padding = l_CGEAlert_0.LinePadding, 
            Spacing = l_CGEAlert_0.LineSpacing, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Size = UDim2.fromScale(1, 0)
        }, {
            TopBar = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0)
            }, {
                Title = v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = ("<b>%*</b>"):format(l_props_0.Title), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    RichText = true, 
                    LayoutOrder = 1
                }), 
                RightSide = v1.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Position = UDim2.fromScale(1, 0), 
                    Size = UDim2.fromOffset(0, 18), 
                    LayoutOrder = 2
                }, {
                    PrimaryAction = v1.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Font = l_CGEAlert_0.PrimaryActionFont, 
                        RichText = true, 
                        Text = ("<u>%*</u>"):format((l_Localization_0:getText("Common", "LearnMore"))), 
                        TextColor = l_CGEAlert_0.TextColor
                    })
                })
            }), 
            Body = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_props_0.Body, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = true
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v8));
