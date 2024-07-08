local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require(l_script_FirstAncestor_0.Src.Constants);
local function _(v3, v4)
    if type(v4) == "string" then
        local v5 = string.match(v4, "(%d+)$");
        if v5 ~= nil then
            v3[v5] = true;
            return ;
        end;
    elseif type(v4) == "number" then
        v3[v4] = true;
        return ;
    else
        assert(false, "Unexpected asset ID value type '" .. type(v4) .. "'");
    end;
end;
local function v22(v7, v8)
    if not v8:IsA("MeshPart") then
        if not v8:IsA("SpecialMesh") then
            if not v8:IsA("Animation") then
                if v8:IsA("SurfaceAppearance") then
                    local l_ColorMap_0 = v8.ColorMap;
                    if type(l_ColorMap_0) == "string" then
                        local v10 = string.match(l_ColorMap_0, "(%d+)$");
                        if v10 ~= nil then
                            v7[v10] = true;
                        end;
                    elseif type(l_ColorMap_0) == "number" then
                        v7[l_ColorMap_0] = true;
                    else
                        assert(false, "Unexpected asset ID value type '" .. type(l_ColorMap_0) .. "'");
                    end;
                    l_ColorMap_0 = v8.MetalnessMap;
                    if type(l_ColorMap_0) == "string" then
                        local v11 = string.match(l_ColorMap_0, "(%d+)$");
                        if v11 ~= nil then
                            v7[v11] = true;
                        end;
                    elseif type(l_ColorMap_0) == "number" then
                        v7[l_ColorMap_0] = true;
                    else
                        assert(false, "Unexpected asset ID value type '" .. type(l_ColorMap_0) .. "'");
                    end;
                    l_ColorMap_0 = v8.NormalMap;
                    if type(l_ColorMap_0) == "string" then
                        local v12 = string.match(l_ColorMap_0, "(%d+)$");
                        if v12 ~= nil then
                            v7[v12] = true;
                        end;
                    elseif type(l_ColorMap_0) == "number" then
                        v7[l_ColorMap_0] = true;
                    else
                        assert(false, "Unexpected asset ID value type '" .. type(l_ColorMap_0) .. "'");
                    end;
                    l_ColorMap_0 = v8.RoughnessMap;
                    if type(l_ColorMap_0) == "string" then
                        local v13 = string.match(l_ColorMap_0, "(%d+)$");
                        if v13 ~= nil then
                            v7[v13] = true;
                            return ;
                        end;
                    elseif type(l_ColorMap_0) == "number" then
                        v7[l_ColorMap_0] = true;
                        return ;
                    else
                        assert(false, "Unexpected asset ID value type '" .. type(l_ColorMap_0) .. "'");
                    end;
                end;
            else
                local l_AnimationId_0 = v8.AnimationId;
                if type(l_AnimationId_0) == "string" then
                    local v15 = string.match(l_AnimationId_0, "(%d+)$");
                    if v15 ~= nil then
                        v7[v15] = true;
                        return ;
                    end;
                elseif type(l_AnimationId_0) == "number" then
                    v7[l_AnimationId_0] = true;
                    return ;
                else
                    assert(false, "Unexpected asset ID value type '" .. type(l_AnimationId_0) .. "'");
                    return ;
                end;
            end;
        else
            local l_MeshId_0 = v8.MeshId;
            if type(l_MeshId_0) == "string" then
                local v17 = string.match(l_MeshId_0, "(%d+)$");
                if v17 ~= nil then
                    v7[v17] = true;
                end;
            elseif type(l_MeshId_0) == "number" then
                v7[l_MeshId_0] = true;
            else
                assert(false, "Unexpected asset ID value type '" .. type(l_MeshId_0) .. "'");
            end;
            l_MeshId_0 = v8.TextureId;
            if type(l_MeshId_0) == "string" then
                local v18 = string.match(l_MeshId_0, "(%d+)$");
                if v18 ~= nil then
                    v7[v18] = true;
                    return ;
                end;
            elseif type(l_MeshId_0) == "number" then
                v7[l_MeshId_0] = true;
                return ;
            else
                assert(false, "Unexpected asset ID value type '" .. type(l_MeshId_0) .. "'");
                return ;
            end;
        end;
    else
        local l_MeshId_1 = v8.MeshId;
        if type(l_MeshId_1) == "string" then
            local v20 = string.match(l_MeshId_1, "(%d+)$");
            if v20 ~= nil then
                v7[v20] = true;
            end;
        elseif type(l_MeshId_1) == "number" then
            v7[l_MeshId_1] = true;
        else
            assert(false, "Unexpected asset ID value type '" .. type(l_MeshId_1) .. "'");
        end;
        l_MeshId_1 = v8.TextureID;
        if type(l_MeshId_1) == "string" then
            local v21 = string.match(l_MeshId_1, "(%d+)$");
            if v21 ~= nil then
                v7[v21] = true;
                return ;
            end;
        elseif type(l_MeshId_1) == "number" then
            v7[l_MeshId_1] = true;
            return ;
        else
            assert(false, "Unexpected asset ID value type '" .. type(l_MeshId_1) .. "'");
            return ;
        end;
    end;
end;
local _ = function(v23, v24)
    v22(v23, v24);
    for _, v26 in v24:GetDescendants() do
        v22(v23, v26);
    end;
end;
return function()
    local v28 = {};
    for _, v30 in l_CollectionService_0:GetTagged(v2.Tag) do
        v22(v28, v30);
        for _, v32 in v30:GetDescendants() do
            v22(v28, v32);
        end;
    end;
    local v33 = {};
    for v34 in v28, nil, nil do
        table.insert(v33, v34);
    end;
    return v33;
end;
