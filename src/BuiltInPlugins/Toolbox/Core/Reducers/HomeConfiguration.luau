local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Actions.SetHomeConfiguration);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
return v3.createReducer({}, {
    [v4.name] = function(v6, v7)
        return (v2.Dictionary.join(v6, {
            [v7.assetType.Name] = v7.configuration
        }));
    end
});
