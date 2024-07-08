local l_PivotType_0 = require(script.Parent.TerrainEnums).PivotType;
return function(v1, v2, v3)
    local v4 = v3 / 2;
    if v1 == l_PivotType_0.Top then
        return (Vector3.new(v2.x, v2.y - v4, v2.z));
    elseif v1 == l_PivotType_0.Center then
        return v2;
    elseif v1 == l_PivotType_0.Bottom then
        return (Vector3.new(v2.x, v2.y + v4, v2.z));
    else
        return v2;
    end;
end;
