return function(v0, v1, v2)
    local v3 = {
        Vector3.new(v1.X / 2, v1.Y / 2, v1.Z / 2), 
        Vector3.new(-v1.X / 2, v1.Y / 2, v1.Z / 2), 
        Vector3.new(v1.X / 2, -v1.Y / 2, v1.Z / 2), 
        Vector3.new(v1.X / 2, v1.Y / 2, -v1.Z / 2), 
        Vector3.new(-v1.X / 2, -v1.Y / 2, v1.Z / 2), 
        Vector3.new(-v1.X / 2, v1.Y / 2, -v1.Z / 2), 
        Vector3.new(v1.X / 2, -v1.Y / 2, -v1.Z / 2), 
        (Vector3.new(-v1.X / 2, -v1.Y / 2, -v1.Z / 2))
    };
    local v4 = Vector3.new(math.huge, math.huge, math.huge);
    local v5 = Vector3.new(-math.huge, -math.huge, -math.huge);
    for _, v7 in v3, nil, nil do
        local v8 = if not v2 then v0 * v7 else v0.Position + v7;
        v4 = Vector3.new(math.min(v4.X, v8.X), math.min(v4.Y, v8.Y), (math.min(v4.Z, v8.Z)));
        v5 = Vector3.new(math.max(v5.X, v8.X), math.max(v5.Y, v8.Y), (math.max(v5.Z, v8.Z)));
    end;
    return v4, v5;
end;
