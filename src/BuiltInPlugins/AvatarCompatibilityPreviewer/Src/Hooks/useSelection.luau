local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v3 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
return function()
    local v4 = v3:use():get();
    local v5, v6 = v1.useState(function()
        return v4:Get();
    end);
    v2(v4.SelectionChanged, function()
        v6(v4:Get());
    end, {});
    return v5;
end;
