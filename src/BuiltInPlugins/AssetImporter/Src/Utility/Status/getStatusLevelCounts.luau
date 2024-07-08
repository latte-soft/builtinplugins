local _ = require(script:FindFirstAncestor("AssetImporter").Src.Types);
return function(v1)
    local v2 = 0;
    local v3 = 0;
    for _, v5 in v1, nil, nil do
        if v5.Level == "Warning" then
            v3 = v3 + 1;
        elseif v5.Level == "Error" then
            v2 = v2 + 1;
        end;
    end;
    return {
        errors = v2, 
        warnings = v3
    };
end;
