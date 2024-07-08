local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Action_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Action;
local v2 = require(l_script_FirstAncestor_0.Core.Types.AutocorrectTypes);
return l_Action_0(script.Name, function(v3)
    return {
        correctionState = v3.correctionState or v2.AutocorrectResponseState.NoCorrection, 
        correctedQuery = v3.correctedQuery or "", 
        userQuery = v3.userQuery or ""
    };
end);
