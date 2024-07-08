local v0 = require(script.Parent.Constants);
return function(v1, v2)
    local v3 = v1:Inverse();
    local v4 = v2 * v3.RightVector;
    local v5 = v2 * v3.UpVector;
    local v6 = v2 * v3.LookVector;
    local v7 = (math.abs(v4.x) + math.abs(v4.y)) + math.abs(v4.z);
    local v8 = (math.abs(v5.x) + math.abs(v5.y)) + math.abs(v5.z);
    local v9 = (math.abs(v6.x) + math.abs(v6.y)) + math.abs(v6.z);
    local l_Position_0 = v1.Position;
    local v11 = Vector3.new(v7, v8, v9) / 2;
    return Region3.new(l_Position_0 - v11, l_Position_0 + v11):ExpandToGrid(v0.VOXEL_RESOLUTION);
end;
