local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v12(v5, v6)
    local v7 = 0;
    local v8 = 0;
    for v9, v10 in v5, nil, nil do
        local l_PreferredLayer_0 = v10.palette.PreferredLayer;
        if l_PreferredLayer_0 ~= nil then
            assert(l_PreferredLayer_0 ~= nil, v3.LUAU_ANALYZE_ERROR);
            if l_PreferredLayer_0 <= v6 and v8 <= l_PreferredLayer_0 then
                v7 = v9;
            end;
        end;
    end;
    return v7 + 1;
end;
return function(v13)
    return v2.useCallback(function(v14)
        v13(function(v15)
            local v16 = table.clone(v15);
            local v18 = v1.findIndex(v16, function(v17)
                return (v17.palette.OverrideEquipKey or v17.palette.Key) == (v14.palette.OverrideEquipKey or v14.palette.Key);
            end);
            if v18 ~= nil then
                table.remove(v16, v18);
            end;
            if v14.palette.PreferredLayer == nil then
                table.insert(v16, v14);
                return v16;
            else
                table.insert(v16, v12(v16, v14.palette.PreferredLayer), v14);
                return v16;
            end;
        end);
    end, {
        v13
    });
end;
