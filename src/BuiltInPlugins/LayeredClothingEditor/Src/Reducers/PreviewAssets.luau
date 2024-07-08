local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    prebuiltAssetsInfo = {}
}, {
    SetPrebuiltAssetsInfo = function(v3, v4)
        return v2.Dictionary.join(v3, {
            prebuiltAssetsInfo = v4.prebuiltAssetsInfo
        });
    end
});
