local l_useState_0 = require(script:FindFirstAncestor("TerrainEditor").Packages.React).useState;
return function()
    local v1, v2 = l_useState_0(Region3.new(Vector3.new(-64, -64, -64), (Vector3.new(64, 64, 64))));
    return v1, v2;
end;
