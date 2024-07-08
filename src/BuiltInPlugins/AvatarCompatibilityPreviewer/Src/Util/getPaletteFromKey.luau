local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3)
    for v4, v5 in v1, nil, nil do
        for _, v7 in v5, nil, nil do
            if v7.Key == v3 then
                return v7, v4;
            end;
        end;
    end;
    return nil, nil;
end;
