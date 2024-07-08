local v4 = {
    pointOnSideOfLine = function(_, v1, v2, v3)
        return (v3.X - v1.X) * (v2.Y - v1.Y) - (v3.Y - v1.Y) * (v2.X - v1.X);
    end
};
v4.containsPoint = function(_, v6, v7)
    local l_Min_0 = v6.Min;
    local v9 = Vector2.new(l_Min_0.X + v6.Width, l_Min_0.Y);
    local l_Max_0 = v6.Max;
    local v11 = Vector2.new(l_Max_0.X - v6.Width, l_Max_0.Y);
    local v12 = v4:pointOnSideOfLine(l_Min_0, v9, v7);
    local v13 = v4:pointOnSideOfLine(v9, l_Max_0, v7);
    local v14 = v4:pointOnSideOfLine(l_Max_0, v11, v7);
    local v15 = v4:pointOnSideOfLine(v11, l_Min_0, v7);
    local v16 = false;
    if v12 <= 0 then
        v16 = false;
        if v13 <= 0 then
            v16 = false;
            if v14 <= 0 then
                v16 = v15 <= 0;
            end;
        end;
    end;
    return v16;
end;
return v4;
