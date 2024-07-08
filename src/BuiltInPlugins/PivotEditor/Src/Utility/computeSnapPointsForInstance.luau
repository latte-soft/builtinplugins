local v0 = {
    Vector3.new(0, 0, 0), 
    Vector3.new(-1, -1, -1), 
    Vector3.new(1, -1, -1), 
    Vector3.new(-1, 1, -1), 
    Vector3.new(1, 1, -1), 
    Vector3.new(-1, -1, 1), 
    Vector3.new(1, -1, 1), 
    Vector3.new(-1, 1, 1), 
    Vector3.new(1, 1, 1), 
    Vector3.new(-1, 0, 0), 
    Vector3.new(1, 0, 0), 
    Vector3.new(0, -1, 0), 
    Vector3.new(0, 1, 0), 
    Vector3.new(0, 0, -1), 
    Vector3.new(0, 0, 1), 
    Vector3.new(1, 1, 0), 
    Vector3.new(-1, 1, 0), 
    Vector3.new(-1, -1, 0), 
    Vector3.new(1, -1, 0), 
    Vector3.new(0, 1, 1), 
    Vector3.new(0, -1, 1), 
    Vector3.new(0, -1, -1), 
    Vector3.new(0, 1, -1), 
    Vector3.new(1, 0, 1), 
    Vector3.new(-1, 0, 1), 
    Vector3.new(-1, 0, -1), 
    (Vector3.new(1, 0, -1))
};
local function v7(v1, v2)
    local v3 = v2 / 2;
    local v4 = {};
    for _, v6 in ipairs(v0) do
        table.insert(v4, v1 * CFrame.new(v6 * v3));
    end;
    return v4;
end;
return function(v8)
    if v8 then
        if not v8:IsA("BasePart") then
            if not v8:IsA("Model") then
                return {};
            else
                return (v7(v8:GetBoundingBox()));
            end;
        else
            return (v7(v8.CFrame, v8.Size));
        end;
    else
        return {};
    end;
end;
