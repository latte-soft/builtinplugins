local v0 = require(script:FindFirstAncestor("Toolbox").Core.Localization.getLocalizedCategoryMap);
return function(v1, v2)
    local v3 = {};
    local v4 = v0(v1);
    for _, v6 in v2, nil, nil do
        local v7 = table.clone(v6);
        v7.name = v4[v6.name];
        table.insert(v3, v7);
    end;
    return v3;
end;
