local v0 = {};
local l_Stats_0 = game:GetService("Stats");
local function v7(v2, v3)
    local _, v5 = string.find(v3.TextureId, "?id=");
    if not v5 then
        v2[v3.TextureId] = not not v2[v3.TextureId] and math.max(v2[v3.TextureId], v3.MemoryInBytes) or v3.MemoryInBytes;
        return ;
    else
        local v6 = v3.TextureId:match("%d+[^%d]*$");
        v2[v6] = not not v2[v6] and math.max(v2[v6], v3.MemoryInBytes) or v3.MemoryInBytes;
        return ;
    end;
end;
v0.fetchTextureSizes = function()
    local v8 = {};
    local l_l_Stats_0_PaginatedMemoryByTexture_0 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 10000);
    local l_l_Stats_0_PaginatedMemoryByTexture_1 = l_Stats_0:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 10000);
    for _, v12 in ipairs(l_l_Stats_0_PaginatedMemoryByTexture_0.Results) do
        v7(v8, v12);
    end;
    for _, v14 in ipairs(l_l_Stats_0_PaginatedMemoryByTexture_1.Results) do
        v7(v8, v14);
    end;
    return v8;
end;
v0.calculateAggregateStats = function(v15)
    local v16 = #v15;
    local v17 = 0;
    for _, v19 in ipairs(v15) do
        v17 = v17 + v19.Size;
    end;
    return v16, v17;
end;
return v0;
