local _ = require(script:FindFirstAncestor("AssetImporter").Src.Types);
return function(v1, v2, v3)
    return {
        Level = v1, 
        Type = v2, 
        Context = v3
    };
end;
