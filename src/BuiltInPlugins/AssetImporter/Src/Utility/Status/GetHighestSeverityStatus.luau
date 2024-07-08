local _ = require(script:FindFirstAncestor("AssetImporter").Src.Types);
return function(v1)
    for _, v3 in v1, nil, nil do
        if v3.Level == "Error" then
            return v3;
        end;
    end;
    return v1[1];
end;
