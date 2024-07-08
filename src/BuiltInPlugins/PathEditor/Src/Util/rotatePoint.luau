rotatePoint = function(v0, v1, v2)
    if not (v0.Magnitude ~= 0) or v2 == 0 then
        return v0;
    else
        local v3 = math.rad(v2);
        local v4 = math.sin(v3);
        local v5 = math.cos(v3);
        local v6 = v0 - v1;
        return v1 + Vector2.new(v6.X * v5 - v6.Y * v4, v6.Y * v5 + v6.X * v4);
    end;
end;
return rotatePoint;
