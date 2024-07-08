return function(v0, v1)
    local v2 = 4;
    local v3 = 16384;
    local v4 = v3 - v2;
    while v4 > 8 do
        local v5 = (v3 + v2) / 2;
        if ((v0.X + v5) * (v0.Y + v5)) * (v0.Z + v5) < v1 then
            v2 = v5;
        else
            v3 = v5;
        end;
        v4 = v3 - v2;
    end;
    local v6 = math.floor(v2 / 4) * 4;
    return v0 + Vector3.new(v6, v6, v6);
end;
