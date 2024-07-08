local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4, v5)
    return v2.useCallback(function(v6)
        v4(function(v7)
            local v8 = table.clone(v7);
            local v10 = v1.findIndex(v8, function(v9)
                return (v9.palette.OverrideEquipKey or v9.palette.Key) == (v6.palette.OverrideEquipKey or v6.palette.Key);
            end);
            if v10 ~= nil then
                local v11 = table.clone(v8[v10]);
                v11.isHidden = v5;
                v8[v10] = v11;
            end;
            return v8;
        end);
    end, {
        v4, 
        v5
    });
end;
