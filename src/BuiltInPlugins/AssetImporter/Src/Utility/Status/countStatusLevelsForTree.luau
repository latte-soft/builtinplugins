local v0 = require(script:FindFirstAncestor("AssetImporter").Src.Utility.Status.getStatusLevelCounts);
return function(v1)
    local v2 = {};
    local function v3(v4, v5)
        local v6 = 0;
        local v7 = 0;
        for _, v9 in v4:GetChildren() do
            v3(v9, v5);
            local v10 = v5[v9];
            v6 = v6 + (v10.errors + v10.descErrors);
            v7 = v7 + (v10.warnings + v10.descWarnings);
        end;
        local v11 = v0((v4:GetStatuses()));
        v5[v4] = {
            errors = v11.errors, 
            warnings = v11.warnings, 
            descErrors = v6, 
            descWarnings = v7
        };
    end;
    v3(v1, v2);
    return v2;
end;
