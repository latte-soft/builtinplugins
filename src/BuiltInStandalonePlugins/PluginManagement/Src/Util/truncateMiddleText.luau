local l_TextService_0 = game:GetService("TextService");
return function(v1, v2, v3, v4)
    local v5 = "";
    local v6 = string.len(v1);
    if l_TextService_0:GetTextSize(v1, v2, v3, Vector2.new()).X < v4 then
        return v1;
    else
        for v7 = 1, math.ceil(v6 / 2) do
            local v8 = v1:sub(1, v7) .. "..." .. v1:sub(v6 - (v7 - 1), v6);
            if l_TextService_0:GetTextSize(v8, v2, v3, Vector2.new()).X + 2 < v4 then
                v5 = v8;
            else
                break;
            end;
        end;
        return v5;
    end;
end;
