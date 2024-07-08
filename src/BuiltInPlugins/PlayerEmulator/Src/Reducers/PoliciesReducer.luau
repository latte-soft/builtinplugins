local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
return v2.createReducer({
    allPolicies = {}, 
    allPolicySortedKeys = {}, 
    policySettingStatus = {}, 
    policyListItemsModuleExpanded = true
}, {
    LoadAllPolicyValues = function(v4, v5)
        return v1.Dictionary.join(v4, {
            allPolicies = v5.allPolicies, 
            allPolicySortedKeys = v5.allPolicySortedKeys
        });
    end, 
    UpdatePolicySettingStatus = function(v6, v7)
        return l_deepJoin_0(v6, {
            policySettingStatus = v7.policySettingStatus
        });
    end, 
    UpdatePolicySettingListItemsModuleExpanded = function(v8, v9)
        return l_deepJoin_0(v8, {
            policyListItemsModuleExpanded = v9.policyListItemsModuleExpanded
        });
    end
});
