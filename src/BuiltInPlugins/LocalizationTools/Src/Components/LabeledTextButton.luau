local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v10 = v1.PureComponent:extend("LabeledTextButton");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LabelText_0 = l_props_0.LabelText;
    local l_ButtonText_0 = l_props_0.ButtonText;
    local l_Active_0 = l_props_0.Active;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height)
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_Stylizer_0.LabelWidth, 1, 0), 
            Text = l_LabelText_0, 
            StyleModifier = if not l_Active_0 then l_StyleModifier_0.Disabled else nil, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        ButtonContainer = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 1, 0)
        }, {
            Button = v1.createElement(l_Button_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                OnClick = not not l_Active_0 and l_props_0.OnButtonClick or function()
                end, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonHeight), 
                Style = not l_Active_0 and "DisabledTextButton" or "TextButton", 
                Text = l_ButtonText_0
            }, {
                v1.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
