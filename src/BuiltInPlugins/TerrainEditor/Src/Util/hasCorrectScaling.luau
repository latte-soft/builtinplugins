local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3, v4)
    local v5 = (v4.X / v1.VoxelResolution) / v3.Width;
    local v6 = (v4.Z / v1.VoxelResolution) / v3.Height;
    local v7 = true;
    if v5 > v1.MaxScaleFactor then
        v7 = v6 <= v1.MaxScaleFactor;
    end;
    return v7;
end;
