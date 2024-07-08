local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.parseAssetURL);
return function(v1)
    local _, _, _, v5 = v0(v1);
    return v5;
end;
