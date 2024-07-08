local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
return function(v3)
    local v4 = {};
    for _, v6 in v1.allItems, nil, nil do
        if v6.attachment == v3 then
            table.insert(v4, v6.id);
        end;
    end;
    if #v4 == 0 then
        return nil;
    else
        for _, v8 in v2, nil, nil do
            for _, v10 in v8, nil, nil do
                for _, v12 in v10.Items, nil, nil do
                    if typeof(v12) == "number" and table.find(v4, v12) ~= nil then
                        return v10.Key;
                    end;
                end;
            end;
        end;
        return nil;
    end;
end;
