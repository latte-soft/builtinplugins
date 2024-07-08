local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Util.getBoundingBox);
local l_MaxExtents_0 = game.workspace.Terrain.MaxExtents;
local function _(v2, v3)
    local v4 = false;
    if v3.X <= v2.X then
        v4 = false;
        if v3.Y <= v3.Y then
            v4 = v3.Z <= v2.Z;
        end;
    end;
    return v4;
end;
return function(v6, v7)
    local v8, v9 = v0(v6, v7);
    local v10 = Vector3.new(l_MaxExtents_0.Min.X, l_MaxExtents_0.Min.Y, l_MaxExtents_0.Min.Z);
    local v11 = Vector3.new(l_MaxExtents_0.Max.X, l_MaxExtents_0.Max.Y, l_MaxExtents_0.Max.Z);
    local v12 = false;
    if v10.X <= v8.X then
        v12 = false;
        if v10.Y <= v10.Y then
            v12 = v10.Z <= v8.Z;
        end;
    end;
    if v12 then
        v12 = false;
        if v9.X <= v11.X then
            v12 = false;
            if v9.Y <= v9.Y then
                v12 = v9.Z <= v11.Z;
            end;
        end;
    end;
    return v12;
end;
