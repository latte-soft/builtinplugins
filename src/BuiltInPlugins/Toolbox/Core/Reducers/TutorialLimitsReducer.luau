local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = require(l_Packages_0.Cryo);
return require(l_Packages_0.Rodux).createReducer({
    assetIds = nil, 
    positionOverride = nil, 
    scriptWarningOverride = false
}, {
    [require(l_script_FirstAncestor_0.Core.Actions.SetTutorialLimits).name] = function(_, v4)
        return {
            assetIds = v4.assetIds, 
            positionOverride = v4.positionOverride, 
            scriptWarningOverride = v4.scriptWarningOverride
        };
    end
});
