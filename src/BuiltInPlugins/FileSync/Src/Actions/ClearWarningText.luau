local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
return l_Action_0(script.Name, function()
    return {
        warningText = v2.None
    };
end);
