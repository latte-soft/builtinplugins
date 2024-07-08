local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.Constants);
local v3 = require(l_Parent_0.Src.Actions.UpdatePolicySettingStatus);
return function(v4, v5, v6)
    return function(v7)
        local v8 = v7:getState();
        local l_allPolicies_0 = v8.Policies.allPolicies;
        local l_policySettingStatus_0 = v8.Policies.policySettingStatus;
        if l_allPolicies_0[v4] ~= nil then
            l_policySettingStatus_0[v4] = v5;
            v6:SetSetting(v2.POLICY_SETTING_KEY, l_policySettingStatus_0);
            l_PlayerEmulatorService_0:SetEmulatedPolicyInfo(l_policySettingStatus_0);
            v7:dispatch(v3(l_policySettingStatus_0));
        end;
    end;
end;
