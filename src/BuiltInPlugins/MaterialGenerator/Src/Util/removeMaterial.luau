local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_LUAU_ANALYZE_ERROR_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).LUAU_ANALYZE_ERROR;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v4, v5)
    return v1.find(v5, function(v6)
        return table.find(v6.materialVariants, v4) ~= nil;
    end);
end;
return function(v8, v9)
    local v11 = v1.find(v9, function(v10)
        return table.find(v10.materialVariants, v8) ~= nil;
    end);
    if v11 then
        assert(v11 ~= nil, l_LUAU_ANALYZE_ERROR_0);
        local v13 = v1.join(v11, {
            materialVariants = v1.filter(v11.materialVariants, function(v12)
                return v12 ~= v8;
            end)
        });
        if #v13.materialVariants == 0 then
            local v14 = table.find(v9, v11);
            assert(v14 ~= nil, "Expected promptGroups to contain found group");
            local v15 = v9[v14 - 1];
            local v16 = v9[v14 + 1];
            if not (not v15 or not v16) and v15.promptText == v16.promptText then
                return v1.append(v1.slice(v9, nil, v14 - 2), {
                    (v1.join(v15, {
                        materialVariants = v1.append({}, v15.materialVariants, v16.materialVariants)
                    }))
                }, (v1.slice(v9, v14 + 2, nil)));
            else
                return v1.filter(v9, function(v17)
                    return v17 ~= v11;
                end);
            end;
        else
            return v1.map(v9, function(v18)
                if v18 == v11 then
                    return v13;
                else
                    return v18;
                end;
            end);
        end;
    else
        warn("MaterialVariant doesn't belong to a group");
        return v9;
    end;
end;
