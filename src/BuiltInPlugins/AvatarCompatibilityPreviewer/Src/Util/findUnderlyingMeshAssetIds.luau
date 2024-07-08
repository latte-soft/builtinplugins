local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Util.assetUriToId);
local function _(v1, v2)
    if v2 ~= nil then
        v1[v2] = true;
    end;
end;
return function(v4)
    local v5 = {};
    local l_v4_Descendants_0 = v4:GetDescendants();
    table.insert(l_v4_Descendants_0, v4);
    for _, v8 in l_v4_Descendants_0, nil, nil do
        if not v8:IsA("MeshPart") then
            if v8:IsA("WrapTarget") then
                local v9 = v0(v8.CageMeshId);
                if v9 ~= nil then
                    v5[v9] = true;
                end;
            end;
        else
            local v10 = v0(v8.MeshId);
            if v10 ~= nil then
                v5[v10] = true;
            end;
        end;
    end;
    local v11 = {};
    for v12 in v5, nil, nil do
        table.insert(v11, v12);
    end;
    return v11;
end;
