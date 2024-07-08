return {
    rotateVector = function(_, v1, v2)
        local v3 = math.rad(v1);
        local v4 = math.cos(v3);
        local v5 = math.sin(v3);
        return (Vector2.new(v2.X * v4 - v2.Y * v5, v2.Y * v4 + v2.X * v5));
    end
};
