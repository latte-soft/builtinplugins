local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_GetTextSize_0 = require(l_Packages_0.Framework).Util.GetTextSize;
local v4 = require(l_Parent_0.Core.Util.Colors);
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = require(l_Parent_0.Core.Components.RoundFrame);
return function(v7)
    local v8 = v7.Text or "";
    local v9 = l_GetTextSize_0(v8, v5.FONT_SIZE_SMALL, v5.FONT, Vector2.new(0, 0));
    return v2.createElement(v6, {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -16), 
        Size = UDim2.new(0, (12 + v9.x) + 12, 0, (8 + v9.y) + 8), 
        ZIndex = 10, 
        BackgroundColor3 = v4.GRAY_2, 
        BackgroundTransparency = 0.2
    }, {
        TextLabel = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 0, -1), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = v8, 
            Font = v5.FONT, 
            TextSize = v5.FONT_SIZE_SMALL, 
            TextColor3 = v4.GRAY_6
        })
    });
end;
