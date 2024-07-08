local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local l_None_0 = require(l_script_FirstAncestor_0.Packages.Dash).None;
local _ = require(l_script_FirstAncestor_0.Src.Util.CircularBuffer);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return l_Action_0(script.Name, function(v5)
    return {
        frameBuffer = v5 or l_None_0
    };
end);
