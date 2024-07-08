local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_SimpleTab_0 = v2.UI.SimpleTab;
return v2.Wrappers.withForwardRef(function(v5)
    return v3.createElement(l_SimpleTab_0, v1.Dictionary.join(v5, {
        Style = "CategoryTab"
    }));
end);
