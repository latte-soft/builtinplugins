local l_game_FastInt_0 = game:GetFastInt("TerrainEditorScalingPrecision");
return function(v1, v2, v3)
    local v4 = {
        Vector3.new(v2.X / 2, v2.Y / 2, v2.Z / 2), 
        Vector3.new(-v2.X / 2, v2.Y / 2, v2.Z / 2), 
        Vector3.new(v2.X / 2, -v2.Y / 2, v2.Z / 2), 
        Vector3.new(v2.X / 2, v2.Y / 2, -v2.Z / 2), 
        Vector3.new(-v2.X / 2, -v2.Y / 2, v2.Z / 2), 
        Vector3.new(-v2.X / 2, v2.Y / 2, -v2.Z / 2), 
        Vector3.new(v2.X / 2, -v2.Y / 2, -v2.Z / 2), 
        (Vector3.new(-v2.X / 2, -v2.Y / 2, -v2.Z / 2))
    };
    local v5 = Vector3.new(math.huge, math.huge, math.huge);
    local v6 = Vector3.new(-math.huge, -math.huge, -math.huge);
    for _, v8 in v4, nil, nil do
        local v9 = nil;
        v9 = if not v3 then v1 * v8 else v1.Position + v8;
        v5 = Vector3.new(math.min(v5.X, v9.X), math.min(v5.Y, v9.Y), (math.min(v5.Z, v9.Z)));
        v6 = Vector3.new(math.max(v6.X, v9.X), math.max(v6.Y, v9.Y), (math.max(v6.Z, v9.Z)));
    end;
    local l_l_game_FastInt_0_0 = l_game_FastInt_0;
    v5 = Vector3.new(math.round(v5.X * l_l_game_FastInt_0_0) / l_l_game_FastInt_0_0, math.round(v5.Y * l_l_game_FastInt_0_0) / l_l_game_FastInt_0_0, math.round(v5.Z * l_l_game_FastInt_0_0) / l_l_game_FastInt_0_0);
    v6 = Vector3.new(math.round(v6.X * l_l_game_FastInt_0_0) / l_l_game_FastInt_0_0, math.round(v6.Y * l_l_game_FastInt_0_0) / l_l_game_FastInt_0_0, math.round(v6.Z * l_l_game_FastInt_0_0) / l_l_game_FastInt_0_0);
    return (Region3int16.new(Vector3int16.new(math.floor(v5.X / 4), math.floor(v5.Y / 4), (math.floor(v5.Z / 4))), Vector3int16.new(math.ceil(v6.X / 4), math.ceil(v6.Y / 4), (math.ceil(v6.Z / 4)))));
end;
