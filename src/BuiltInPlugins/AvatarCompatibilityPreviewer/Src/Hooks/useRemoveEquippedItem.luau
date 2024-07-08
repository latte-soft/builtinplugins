local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.equippedItemDataEquals);
return function(v4)
    return v1.useCallback(function(v5)
        v4(function(v6)
            for v7, v8 in v6, nil, nil do
                if v3(v8, v5) then
                    local v9 = table.clone(v6);
                    table.remove(v9, v7);
                    return v9;
                end;
            end;
            return v6;
        end);
    end, {
        v4
    });
end;
