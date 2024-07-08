local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_BrushShape_0 = require(l_script_FirstAncestor_0.Src.Types).BrushShape;
return function(v3, v4, v5, v6)
    local v7 = 1;
    local v8 = 1;
    if v4 > 2 then
        if v5 == l_BrushShape_0.Sphere then
            local v9 = math.sqrt((v3.X * v3.X + v3.Y * v3.Y) + v3.Z * v3.Z);
            return math.max(0, (math.min(1, (v6 - v9) / v1.VoxelResolution))), (math.cos((math.min(1, v9 / v6) * 3.141592653589793) * 0.5));
        elseif v5 == l_BrushShape_0.Cylinder then
            local v10 = math.sqrt(v3.X * v3.X + v3.Z * v3.Z);
            v8 = math.cos((math.min(1, v10 / v6) * 3.141592653589793) * 0.5);
            v7 = math.max(0, (math.min(1, (v6 - v10) / v1.VoxelResolution)));
        end;
    end;
    return v7, v8;
end;
