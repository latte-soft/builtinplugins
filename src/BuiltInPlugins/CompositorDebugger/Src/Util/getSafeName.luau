local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Packages.TestLoader);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3)
    return (((v3.name or v3.linkData and v3.linkData.key) or v3.index and string.format("[%d]", v3.index)) or v3.className and string.format("[%s]", v3.className)) or "?";
end;
