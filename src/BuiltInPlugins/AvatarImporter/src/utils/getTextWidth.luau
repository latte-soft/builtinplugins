local l_TextService_0 = game:GetService("TextService");
local v1 = Vector2.new(math.huge, math.huge);
return function(v2, v3, v4)
    return l_TextService_0:GetTextSize(v2, v3, v4, v1).X;
end;
