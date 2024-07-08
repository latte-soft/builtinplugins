local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3)
    return v1.flat(v1.map(v3, function(v4)
        return v4.materialVariants;
    end));
end;
