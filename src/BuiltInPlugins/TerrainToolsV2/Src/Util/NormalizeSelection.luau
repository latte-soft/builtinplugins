return function(v0, v1)
    local v2 = v0.Rotation * v1;
    return CFrame.new(v0.Position), (Vector3.new(math.abs(v2.x), math.abs(v2.y), (math.abs(v2.z))));
end;
