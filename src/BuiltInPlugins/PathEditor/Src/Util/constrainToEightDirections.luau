return function(v0)
    local v1 = {
        Vector2.new(1, 0), 
        Vector2.new(-1, 0), 
        Vector2.new(0, 1), 
        Vector2.new(0, -1), 
        Vector2.new(1, 1).Unit, 
        Vector2.new(-1, 1).Unit, 
        Vector2.new(1, -1).Unit, 
        Vector2.new(-1, -1).Unit
    };
    local l_Unit_0 = v0.Unit;
    local v3 = -math.huge;
    local v4 = nil;
    for _, v6 in ipairs(v1) do
        local v7 = v6:Dot(l_Unit_0);
        if v3 < v7 then
            v3 = v7;
            v4 = v6;
        end;
    end;
    return v4 * v0.Magnitude;
end;
