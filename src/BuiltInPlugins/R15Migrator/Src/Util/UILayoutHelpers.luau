local v0 = {};
local l_TextService_0 = game:GetService("TextService");
v0.getTextSize = function(v2, v3, v4, v5)
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v2, v3, v4, Vector2.new(math.huge, math.huge));
    local v7 = v5 or Vector2.new(0, 0);
    return UDim2.new(0, l_l_TextService_0_TextSize_0.X + v7.X, 0, l_l_TextService_0_TextSize_0.Y + v7.Y);
end;
v0.getTextHeight = function(v8, v9, v10, v11)
    return v0.getTextSize(v8, v9, v10, v11).Y.Offset;
end;
return v0;
