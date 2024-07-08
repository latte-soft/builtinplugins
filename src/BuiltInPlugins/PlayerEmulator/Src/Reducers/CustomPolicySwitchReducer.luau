local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
return v2.createReducer({
    customPolicySwitchEnabled = false, 
    customPolicySwitchActive = false, 
    customPoliciesEnabled = false
}, {
    OnCustomPolicySwitchEnabledChanged = function(v4, v5)
        return v1.Dictionary.join(v4, {
            customPolicySwitchEnabled = v5.enabled
        });
    end, 
    OnCustomPolicyEnabledChanged = function(v6, v7)
        return v1.Dictionary.join(v6, {
            customPoliciesEnabled = v7.enabled
        });
    end, 
    OnEmulatedCountryRegionChanged = function(v8, v9)
        return v1.Dictionary.join(v8, {
            customPolicySwitchActive = l_PlayerEmulatorService_0:regionCodeWillHaveAutomaticNonCustomPolicies(v9.countryRegionCode)
        });
    end
});
