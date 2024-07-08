local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
return require(l_Packages_0.Rodux).createReducer({
    triedInStudio = {}
}, {
    [require(l_Parent_0.Core.Actions.MarkTryInStudioDone).name] = function(v3, v4)
        return {
            triedInStudio = v2.Dictionary.join(v3.triedInStudio, {
                [v4.assetId] = true
            })
        };
    end
});
