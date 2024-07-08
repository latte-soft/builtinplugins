local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedEffect);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4, v5, v6, v7)
    local v8, v9 = v1.useState(v6);
    v2(v4, v5, v8, v9, v7);
    return v8, v9;
end;
