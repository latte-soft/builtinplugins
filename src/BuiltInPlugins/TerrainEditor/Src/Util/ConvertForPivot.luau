local l_PivotPosition_0 = require(script:FindFirstAncestor("TerrainEditor").Src.Types).PivotPosition;
return function(v1, v2, v3)
    local v4 = v3 / 2;
    if v1 == l_PivotPosition_0.Top then
        return (Vector3.new(v2.X, v2.Y - v4, v2.Z));
    elseif v1 == l_PivotPosition_0.Bottom then
        return (Vector3.new(v2.X, v2.Y + v4, v2.Z));
    else
        return v2;
    end;
end;
