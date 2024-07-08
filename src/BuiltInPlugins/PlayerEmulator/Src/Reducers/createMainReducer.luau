local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Src.Reducers.MainSwitchReducer);
local v3 = require(l_Parent_0.Src.Reducers.CustomPolicySwitchReducer);
local v4 = require(l_Parent_0.Src.Reducers.LanguagesReducer);
local v5 = require(l_Parent_0.Src.Reducers.CountryRegionReducer);
local v6 = require(l_Parent_0.Src.Reducers.PoliciesReducer);
return function()
    return v1.combineReducers({
        MainSwitch = v2, 
        Languages = v4, 
        CountryRegion = v5, 
        CustomPolicySwitch = v3, 
        Policies = v6
    });
end;
