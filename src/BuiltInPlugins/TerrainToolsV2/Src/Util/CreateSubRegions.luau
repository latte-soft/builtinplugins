local v0 = require(script.Parent.Parent.Parent.Src.Util.ConvertTransformToRegion);
local function _(v1)
    return (Vector3.new(math.floor(v1.X), math.floor(v1.Y), (math.floor(v1.Z))));
end;
local function _(v3)
    return (Vector3.new(math.ceil(v3.X), math.ceil(v3.Y), (math.ceil(v3.Z))));
end;
return function(v5, v6)
    local v7 = {};
    local v8 = {};
    local v9 = v0(v5, v6);
    local v10 = Vector3.new(v9.Min.X, v9.Min.Y, v9.Min.Z);
    local v11 = Vector3.new(v9.Max.X, v9.Max.Y, v9.Max.Z);
    local v12 = v10 / 400;
    local v13 = Vector3.new(math.floor(v12.X), math.floor(v12.Y), (math.floor(v12.Z))) * 400;
    local v14 = v11 / 400;
    local v15 = Vector3.new(math.ceil(v14.X), math.ceil(v14.Y), (math.ceil(v14.Z))) * 400;
    v12 = Region3int16.new(Vector3int16.new(v13.X, v13.Y, v13.Z), Vector3int16.new(v15.X, v15.Y, v15.Z));
    for v16 = v12.Min.X, v12.Max.X, 400 do
        for v17 = v12.Min.Y, v12.Max.Y, 400 do
            for v18 = v12.Min.Z, v12.Max.Z, 400 do
                local v19 = Vector3.new(v16, v17, v18):Max(v10);
                local v20 = Vector3.new(v16 + 400, v17 + 400, v18 + 400):Min(v11);
                if (v20.X > v19.X and v20.Y > v19.Y) and v20.Z > v19.Z then
                    table.insert(v7, Region3int16.new(Vector3int16.new(v19.X, v19.Y, v19.Z) - v9.Min, Vector3int16.new(v20.X, v20.Y, v20.Z) - v9.Min));
                    table.insert(v8, (Vector3int16.new(v19.X, v19.Y, v19.Z)));
                end;
            end;
        end;
    end;
    return v7, v8;
end;
