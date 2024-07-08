local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getBoundingBox);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
return function(v3, v4, v5)
    local v6 = nil;
    local v7 = nil;
    if not v2() then
        local v8 = {
            Vector3.new(v4.X / 2, v4.Y / 2, v4.Z / 2), 
            Vector3.new(-v4.X / 2, v4.Y / 2, v4.Z / 2), 
            Vector3.new(v4.X / 2, -v4.Y / 2, v4.Z / 2), 
            Vector3.new(v4.X / 2, v4.Y / 2, -v4.Z / 2), 
            Vector3.new(-v4.X / 2, -v4.Y / 2, v4.Z / 2), 
            Vector3.new(-v4.X / 2, v4.Y / 2, -v4.Z / 2), 
            Vector3.new(v4.X / 2, -v4.Y / 2, -v4.Z / 2), 
            (Vector3.new(-v4.X / 2, -v4.Y / 2, -v4.Z / 2))
        };
        v6 = Vector3.new(math.huge, math.huge, math.huge);
        v7 = Vector3.new(-math.huge, -math.huge, -math.huge);
        for _, v10 in v8, nil, nil do
            local v11 = if not v5 then v3 * v10 else v3.Position + v10;
            v6 = Vector3.new(math.min(v6.X, v11.X), math.min(v6.Y, v11.Y), (math.min(v6.Z, v11.Z)));
            v7 = Vector3.new(math.max(v7.X, v11.X), math.max(v7.Y, v11.Y), (math.max(v7.Z, v11.Z)));
        end;
    else
        local v12, v13 = v1(v3, v4, v5);
        v6 = v12;
        v7 = v13;
    end;
    return (Region3int16.new(Vector3int16.new(math.floor(v6.X / 4), math.floor(v6.Y / 4), (math.floor(v6.Z / 4))), Vector3int16.new(math.ceil(v7.X / 4), math.ceil(v7.Y / 4), (math.ceil(v7.Z / 4)))));
end;
