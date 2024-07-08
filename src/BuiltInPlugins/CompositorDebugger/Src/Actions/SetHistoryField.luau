local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Action_0 = v1.Util.Action;
local _ = v1.Dash.None;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return l_Action_0(script.Name, function(v5, v6, v7)
    return {
        id = v5, 
        section = v6, 
        field = v7
    };
end);
