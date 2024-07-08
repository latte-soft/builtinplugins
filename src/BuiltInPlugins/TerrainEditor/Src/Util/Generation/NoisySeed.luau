local v0 = require(script:FindFirstAncestor("TerrainEditor").Src.Flags.getFFlagTerrainEditorIndexingBugFix);
return function(v1)
    local v2 = nil;
    math.randomseed(6180339);
    v2 = {};
    for _ = 1, 999 do
        table.insert(v2, math.random());
    end;
    local _ = nil;
    return not v0() and function(v5)
        local l_X_0 = v5.X;
        local l_Y_0 = v5.Y;
        local l_Z_0 = v5.Z;
        return v2[math.floor(((((((l_X_0 + l_Y_0) + l_Z_0) + 7) + v1) + (v1 - l_X_0) * (7 + l_Z_0)) + (7 - l_Y_0) * (v1 + l_Z_0)) % #v2) + 1];
    end or function(v9)
        local l_X_1 = v9.X;
        local l_Y_1 = v9.Y;
        local l_Z_1 = v9.Z;
        local v13 = (((((l_X_1 + l_Y_1) + l_Z_1) + 7) + v1) + (v1 - l_X_1) * (7 + l_Z_1)) + (7 - l_Y_1) * (v1 + l_Z_1);
        local v14 = math.floor((math.fmod(v13, #v2)));
        if v13 < 0 then
            v14 = (v14 + #v2) - 1;
        end;
        return v2[v14 + 1];
    end;
end;
