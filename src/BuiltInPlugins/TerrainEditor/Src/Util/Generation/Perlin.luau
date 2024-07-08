return function(v0)
    return function(v1, v2, v3)
        local v4 = v3 or 1;
        return math.noise((v1.X / v4 + v2 * 17) + v0, v1.Y / v4 - v0, v1.Z / v4 - v2 * v2);
    end;
end;
