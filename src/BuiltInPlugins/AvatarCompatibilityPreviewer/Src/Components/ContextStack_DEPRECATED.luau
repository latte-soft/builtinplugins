local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
return function(v3)
    local l_children_0 = v3.children;
    for v5 = #v3.providers, 1, -1 do
        local v6 = v3.providers[v5];
        l_children_0 = v2.createElement(v6.provider, v1.omit(v6, {
            "provider"
        }), l_children_0);
    end;
    return l_children_0;
end;
