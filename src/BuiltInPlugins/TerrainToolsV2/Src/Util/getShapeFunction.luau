local l_Shape_0 = require(script.Parent.TerrainEnums).Shape;
local v21 = {
    [l_Shape_0.Block] = function(v1, v2, v3)
        local v4 = v2:VectorToObjectSpace(v1);
        return (math.min(v3.x - math.abs(v4.x), v3.y - math.abs(v4.y), v3.z - math.abs(v4.z), 1));
    end, 
    [l_Shape_0.Ball] = function(v5, v6, v7)
        local v8 = v6:VectorToObjectSpace(v5);
        return (math.min(v7.x - math.abs(v8.x), math.min(v7.x, v7.y, v7.z) - v8.Magnitude, 1));
    end, 
    [l_Shape_0.CylinderRotate] = function(v9, v10, v11)
        local v12 = v10:VectorToObjectSpace(v9);
        return (math.min(v11.x - math.abs(v12.x), math.min(v11.y, v11.z) - math.sqrt(v12.y * v12.y + v12.z * v12.z), 1));
    end, 
    [l_Shape_0.Cylinder] = function(v13, v14, v15)
        local v16 = v14:VectorToObjectSpace(v13);
        return (math.min(v15.y - math.abs(v16.y), math.min(v15.x, v15.z) - math.sqrt(v16.x * v16.x + v16.z * v16.z), 1));
    end, 
    [l_Shape_0.Wedge] = function(v17, v18, v19)
        local v20 = v18:VectorToObjectSpace(v17);
        return v20.z * (v19.y / v19.z) - v20.y > 1 and math.min(v19.x - math.abs(v20.x), v19.y - math.abs(v20.y), v19.z - math.abs(v20.z), 1) or 0;
    end
};
return function(v22)
    assert(v21[v22], ("getShapeFunction() got invalid shape \"%s\""):format((tostring(v22))));
    return v21[v22];
end;
