min = function(...)
    local v0 = {
        ...
    };
    local v1 = nil;
    for _, v3 in ipairs(v0) do
        if v1 then
            if v3 then
                v1 = v3 < v1 and v3 or v1;
            end;
        else
            v1 = v3;
        end;
    end;
    return v1;
end;
max = function(...)
    local v4 = {
        ...
    };
    local v5 = nil;
    for _, v7 in ipairs(v4) do
        if v5 then
            if v7 then
                v5 = v5 < v7 and v7 or v5;
            end;
        else
            v5 = v7;
        end;
    end;
    return v5;
end;
minVector3 = function(...)
    local v8 = {
        ...
    };
    local v9 = nil;
    for _, v11 in ipairs(v8) do
        if v9 then
            if v11 then
                v9 = Vector3.new(min(v9.x, v11.x), min(v9.y, v11.y), min(v9.z, v11.z));
            end;
        else
            v9 = v11;
        end;
    end;
    return v9;
end;
maxVector3 = function(...)
    local v12 = {
        ...
    };
    local v13 = nil;
    for _, v15 in ipairs(v12) do
        if v13 then
            if v15 then
                v13 = Vector3.new(max(v13.x, v15.x), max(v13.y, v15.y), max(v13.z, v15.z));
            end;
        else
            v13 = v15;
        end;
    end;
    return v13;
end;
absVector3 = function(v16)
    return (Vector3.new(math.abs(v16.x), math.abs(v16.y), (math.abs(v16.z))));
end;
distanceVector3 = function(v17, v18)
    return (math.sqrt((math.pow(v18.x - v17.x, 2) + math.pow(v18.y - v17.y, 2)) + math.pow(v18.z - v17.z, 2)));
end;
cleanVector3 = function(v19, v20)
    if not v20 then
        v20 = 0;
    end;
    return (Vector3.new(v19.X == v19.X and v19.X or v20, v19.Y == v19.Y and v19.Y or v20, v19.Z == v19.Z and v19.Z or v20));
end;
local function _(v21, v22, v23)
    return (math.max(math.min(v21, v23), v22));
end;
return {
    min = min, 
    max = max, 
    minVector3 = minVector3, 
    maxVector3 = maxVector3, 
    absVector3 = absVector3, 
    distanceVector3 = distanceVector3, 
    cleanVector3 = cleanVector3, 
    getVector3Sign = function(v25)
        return (Vector3.new(v25.X / math.abs(v25.X == 0 and 1 or v25.X), v25.Y / math.abs(v25.Y == 0 and 1 or v25.Y), v25.Z / math.abs(v25.Z == 0 and 1 or v25.Z)));
    end, 
    customToSymmetric = function(v26)
        local v27 = ((v26.X ~= 0 and v26.X or v26.Y ~= 0 and v26.Y) or v26.Z ~= 0 and v26.Z) or 0;
        return (Vector3.new(v27, v27, v27));
    end, 
    smoothstep = function(v28, v29, v30)
        v30 = math.max(math.min((v30 - v28) / (v29 - v28), 1), 0);
        return (v30 * v30) * (3 - 2 * v30);
    end, 
    colorMultiply = function(v31, v32)
        return Color3.new(v31.r * v32, v31.g * v32, v31.b * v32);
    end, 
    colorAdd = function(v33, v34)
        return Color3.new(v33.r + v34.r, v33.g + v34.g, v33.b + v34.b);
    end
};
