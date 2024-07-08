local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v1.getDebugFlags("CompositorDebugger"));
