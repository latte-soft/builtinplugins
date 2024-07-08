local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_map_0 = require(l_Parent_0.Packages.Dash).map;
local v3 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local function v8(v6)
    local v7 = l_Stylizer_0:use("HintKeys");
    return v1.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = if not v6.Pressed then v7.HintKeyBackground else v7.HintKeyBackgroundPressed, 
        Font = Enum.Font.SourceSansBold, 
        LayoutOrder = v6.LayoutOrder, 
        Size = UDim2.fromOffset(32, 32), 
        Text = v6.Key == "LeftControl" and "Ctrl" or v6.Key, 
        TextColor3 = if not v6.Pressed then v7.HintKeyTextColor else v7.HintKeyTextColorPressed, 
        TextSize = 24
    }, {
        Corner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 5)
        }), 
        Stroke = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = if not v6.Pressed then v7.HintKeyBorder else v7.HintKeyBorderPressed, 
            Thickness = 5
        })
    });
end;
return function(v9)
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v9.LayoutOrder, 
        Padding = 10, 
        Spacing = 20
    }, (l_map_0(v9.PressedKeys, function(v10)
        return v1.createElement(v8, {
            Key = v10.key, 
            LayoutOrder = v10.index, 
            Pressed = v10.pressed
        });
    end)));
end;
