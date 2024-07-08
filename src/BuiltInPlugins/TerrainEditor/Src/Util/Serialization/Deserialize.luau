local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Flags.getFFlagTerrainEditorGenerationFeature);
local function v10(v1)
    local v2 = {};
    local function v3(v4)
        local v5 = {};
        for v6, v7 in v4, nil, nil do
            if typeof(v7) == "table" and v7.serializedType then
                if v7.serializedType == "CFrame" then
                    v5[v6] = CFrame.fromMatrix(Vector3.new(v7.x, v7.y, v7.z), Vector3.new(v7.r00, v7.r10, v7.r20), Vector3.new(v7.r01, v7.r11, v7.r21), (Vector3.new(v7.r02, v7.r12, v7.r22)));
                elseif v7.serializedType == "Vector3" then
                    v5[v6] = Vector3.new(v7.x, v7.y, v7.z);
                elseif v7.serializedType == "Vector2" then
                    v5[v6] = Vector2.new(v7.x, v7.y);
                elseif v7.serializedType == "Material" then
                    v5[v6] = Enum.Material[v7.name];
                elseif v7.serializedType == "table" then
                    v5[v6] = v3(v7.value);
                elseif v7.serializedType then
                    error((("Undefined serialized type %*"):format(v7.serializedType)));
                end;
            else
                v5[v6] = v7;
            end;
        end;
        return v5;
    end;
    for v8, v9 in v1, nil, nil do
        v2[v8] = v3(v9);
    end;
    return v2;
end;
local function v17(v11)
    local v12 = {};
    for v13, v14 in v11, nil, nil do
        v12[v13] = {};
        for v15, v16 in v14, nil, nil do
            if typeof(v16) == "table" and v16.serializedType then
                if v16.serializedType == "CFrame" then
                    v12[v13][v15] = CFrame.fromMatrix(Vector3.new(v16.x, v16.y, v16.z), Vector3.new(v16.r00, v16.r10, v16.r20), Vector3.new(v16.r01, v16.r11, v16.r21), (Vector3.new(v16.r02, v16.r12, v16.r22)));
                elseif v16.serializedType == "Vector3" then
                    v12[v13][v15] = Vector3.new(v16.x, v16.y, v16.z);
                elseif v16.serializedType == "Material" then
                    v12[v13][v15] = Enum.Material[v16.name];
                elseif v16.serializedType then
                end;
            else
                v12[v13][v15] = v16;
            end;
        end;
    end;
    return v12;
end;
if not v0() then
    return v17;
else
    return v10;
end;
