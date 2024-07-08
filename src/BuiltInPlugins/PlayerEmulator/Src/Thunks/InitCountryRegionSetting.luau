local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.Constants);
local v3 = require(l_Parent_0.Src.Networking.Requests.GetUserCountryRegionCode);
return function(v4, v5)
    return function(v6)
        local l_countryRegionTable_0 = v6:getState().CountryRegion.countryRegionTable;
        local l_v5_Setting_0 = v5:GetSetting(v2.COUNTRY_REGION_SETTING_KEY);
        if not l_v5_Setting_0 or not l_countryRegionTable_0[l_v5_Setting_0] then
            v6:dispatch(v3(v4));
            return ;
        else
            l_PlayerEmulatorService_0.EmulatedCountryCode = l_v5_Setting_0;
            return ;
        end;
    end;
end;
