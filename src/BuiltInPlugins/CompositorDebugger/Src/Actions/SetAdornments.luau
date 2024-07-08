local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return l_Action_0(script.Name, function(v3)
    return {
        adornments = v3 or {}
    };
end);
