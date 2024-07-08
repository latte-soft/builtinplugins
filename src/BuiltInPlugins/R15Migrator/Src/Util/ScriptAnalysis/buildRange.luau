local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Range);
return function(v3, v4, v5)
    return v2.new(v3, v4, v3, v5 + 1);
end;
