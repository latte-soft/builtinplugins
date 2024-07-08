local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v1.ContextServices.withContext;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Stylizer_0 = v1.Style.Stylizer;
local v8 = v2.PureComponent:extend("ErrorBox");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_ErrorBox_0 = l_props_0.Stylizer.ErrorBox;
    local v12 = l_props_0.Padding or l_ErrorBox_0.Padding;
    local v13 = l_props_0.MaxWidth or l_ErrorBox_0.MaxWidth;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v12), 
            PaddingLeft = UDim.new(0, v12), 
            PaddingRight = UDim.new(0, v12 + l_ErrorBox_0.RightPadding), 
            PaddingBottom = UDim.new(0, v12)
        }), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v13, math.huge)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Color = l_ErrorBox_0.PrimaryColor, 
            Thickness = 1, 
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_ErrorBox_0.CornerRadius)
        }), 
        CloseButton = v2.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = l_ErrorBox_0.CloseButtonPosition, 
            Size = l_ErrorBox_0.CloseButtonSize, 
            Style = "ErrorClose", 
            OnClick = v9.props.Close, 
            ZIndex = 1000
        }), 
        MainWarningLabel = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 20, 
            TextWrapped = true, 
            TextColor = l_ErrorBox_0.PrimaryColor, 
            Text = l_props_0.Text, 
            LayoutOrder = 1
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v13 - 2 * v12, math.huge)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v8));
