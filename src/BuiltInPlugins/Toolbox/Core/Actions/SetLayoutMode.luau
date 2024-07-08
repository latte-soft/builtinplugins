local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local _ = require(l_script_FirstAncestor_0.Core.Types.LayoutMode);
return l_Action_0(script.Name, function(v3)
    return {
        layoutMode = v3
    };
end);
