local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.Status.StatusIsRelevant);
return function(v3, v4)
    local v5 = {};
    for v6, v7 in v4, nil, nil do
        if v2(v6, v3) then
            table.insert(v5, v7);
        end;
    end;
    return v5;
end;
