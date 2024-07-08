local v0 = require(script:FindFirstAncestor("AssetImporter").Src.Resources.StatusPropertyMap);
return function(v1, v2)
    if not v0[v2] then
        return false;
    else
        return v0[v2][v1] ~= nil;
    end;
end;
