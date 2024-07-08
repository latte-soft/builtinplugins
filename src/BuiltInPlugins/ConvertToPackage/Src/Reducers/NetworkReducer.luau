local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
return require(l_Packages_0.Rodux).createReducer({
    networkError = nil, 
    networkErrorAction = nil
}, {
    [require(l_Parent_0.Src.Actions.NetworkError).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            networkError = v4.response, 
            networkErrorAction = v4.networkErrorAction
        });
    end
});
