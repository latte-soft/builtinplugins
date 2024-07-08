local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local v2 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
return l_Action_0(script.Name, function(v3)
    assert(v2());
    return {
        id = v3
    };
end);
