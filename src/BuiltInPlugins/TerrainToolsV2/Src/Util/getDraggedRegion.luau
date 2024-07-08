local v0 = require(script.Parent.Parent.Parent.Src.Util.Constants);
return function(v1, v2)
    local v3 = v1.Position / v0.GRID_SIZE;
    local v4 = Vector3.new(math.floor(v3.x) * v0.GRID_SIZE, math.floor(v3.y) * v0.GRID_SIZE, math.floor(v3.z) * v0.GRID_SIZE);
    local v5 = v2.Position / v0.GRID_SIZE;
    local v6 = Vector3.new(math.floor(v5.x) * v0.GRID_SIZE, math.floor(v5.y) * v0.GRID_SIZE, math.floor(v5.z) * v0.GRID_SIZE);
    local v7 = v4:Min(v6);
    local v8 = v6:Max(v4);
    return {
        size = (v8 - v7):Max((Vector3.new(v0.GRID_SIZE, v0.GRID_SIZE, v0.GRID_SIZE))), 
        transform = CFrame.new((v8 + v7) / 2)
    };
end;
