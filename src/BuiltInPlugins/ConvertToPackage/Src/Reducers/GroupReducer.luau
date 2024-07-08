local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
return v3.createReducer({
    assetGroupData = {}, 
    groupsArray = {}
}, {
    [require(l_Actions_0.SetMyGroups).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            groupsArray = v6.groupsArray
        });
    end, 
    [require(l_Actions_0.SetAssetGroupData).name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            assetGroupData = v8.assetGroupData
        });
    end
});
