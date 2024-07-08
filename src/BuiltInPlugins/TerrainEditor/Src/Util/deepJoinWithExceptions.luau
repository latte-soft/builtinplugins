local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Types);
local l_BuildSettings_0 = v0.BuildSettings;
local l_HeightmapSettings_0 = v0.HeightmapSettings;
local v3 = {
    [l_BuildSettings_0.Material] = true, 
    [l_HeightmapSettings_0.Heightmap] = true, 
    [l_HeightmapSettings_0.Colormap] = true
};
local function v4(v5, v6)
    local v7 = {};
    for v8, v9 in pairs(v5) do
        if typeof(v9) == "table" then
            if v6[v8] and typeof(v6[v8]) == "table" then
                if not v3[v8] then
                    v7[v8] = v4(v9, v6[v8]);
                else
                    v7[v8] = v4(v6[v8], {});
                end;
            else
                v7[v8] = v4(v9, {});
            end;
        else
            v7[v8] = v9;
        end;
    end;
    for v10, v11 in pairs(v6) do
        if typeof(v11) == "table" then
            if not v5[v10] then
                v7[v10] = v4(v11, {});
            end;
        else
            v7[v10] = v11;
        end;
    end;
    return v7;
end;
return v4;
