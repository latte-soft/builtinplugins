local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Flags.getFFlagTerrainEditorGenerationFeature);
local function v14(v1)
    local v2 = {};
    local function v3(v4)
        local v5 = {};
        for v6, v7 in v4, nil, nil do
            if typeof(v7) == "CFrame" then
                local l_Position_0 = v7.Position;
                local l_XVector_0 = v7.XVector;
                local l_YVector_0 = v7.YVector;
                local l_ZVector_0 = v7.ZVector;
                v5[v6] = {
                    x = l_Position_0.X, 
                    y = l_Position_0.Y, 
                    z = l_Position_0.Z, 
                    r00 = l_XVector_0.X, 
                    r10 = l_XVector_0.Y, 
                    r20 = l_XVector_0.Z, 
                    r01 = l_YVector_0.X, 
                    r11 = l_YVector_0.Y, 
                    r21 = l_YVector_0.Z, 
                    r02 = l_ZVector_0.X, 
                    r12 = l_ZVector_0.Y, 
                    r22 = l_ZVector_0.Z, 
                    serializedType = "CFrame"
                };
            elseif typeof(v7) == "Vector3" then
                v5[v6] = {
                    x = v7.X, 
                    y = v7.Y, 
                    z = v7.Z, 
                    serializedType = "Vector3"
                };
            elseif typeof(v7) == "Vector2" then
                v5[v6] = {
                    x = v7.X, 
                    y = v7.Y, 
                    serializedType = "Vector2"
                };
            elseif typeof(v7) == "EnumItem" then
                v5[v6] = {
                    name = v7.Name, 
                    serializedType = tostring(v7.EnumType)
                };
            elseif typeof(v7) == "table" then
                v5[v6] = {
                    value = v3(v7), 
                    serializedType = "table"
                };
            elseif not (typeof(v7) == "Instance") then
                v5[v6] = v7;
            end;
        end;
        return v5;
    end;
    for v12, v13 in v1, nil, nil do
        v2[v12] = v3(v13);
    end;
    return v2;
end;
local function v25(v15)
    local v16 = {};
    for v17, v18 in v15, nil, nil do
        v16[v17] = {};
        for v19, v20 in v18, nil, nil do
            if typeof(v20) == "CFrame" then
                local l_Position_1 = v20.Position;
                local l_XVector_1 = v20.XVector;
                local l_YVector_1 = v20.YVector;
                local l_ZVector_1 = v20.ZVector;
                v16[v17][v19] = {
                    x = l_Position_1.X, 
                    y = l_Position_1.Y, 
                    z = l_Position_1.Z, 
                    r00 = l_XVector_1.X, 
                    r10 = l_XVector_1.Y, 
                    r20 = l_XVector_1.Z, 
                    r01 = l_YVector_1.X, 
                    r11 = l_YVector_1.Y, 
                    r21 = l_YVector_1.Z, 
                    r02 = l_ZVector_1.X, 
                    r12 = l_ZVector_1.Y, 
                    r22 = l_ZVector_1.Z, 
                    serializedType = "CFrame"
                };
            elseif typeof(v20) == "Vector3" then
                v16[v17][v19] = {
                    x = v20.X, 
                    y = v20.Y, 
                    z = v20.Z, 
                    serializedType = "Vector3"
                };
            elseif typeof(v20) == "EnumItem" then
                v16[v17][v19] = {
                    name = v20.Name, 
                    serializedType = tostring(v20.EnumType)
                };
            else
                v16[v17][v19] = v20;
            end;
        end;
    end;
    return v16;
end;
if not v0() then
    return v25;
else
    return v14;
end;
