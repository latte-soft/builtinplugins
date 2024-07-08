local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v2 = require(l_Parent_0.Packages.Http);
local l_getStudioLocaleId_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getStudioLocaleId;
local v4 = require(l_Parent_0.Src.Actions.LoadCountryRegion);
local v5 = require(l_Parent_0.Src.Thunks.InitCountryRegionSetting);
local v6 = v1.BuildUrl("locale", "v1/country-regions?locale=" .. l_getStudioLocaleId_0());
return function(v7, v8)
    return function(v9)
        v7.parseJson((v7:handleRetry((v7:get(v6))))):andThen(function(v10)
            if v10.responseCode == v2.StatusCodes.OK then
                v9:dispatch(v4(v10.responseBody.countryRegionList));
                v9:dispatch(v5(v7, v8));
                return ;
            else
                warn("Player Emulator can't get country region list: HTTP error " .. tostring(v10.responseCode));
                return ;
            end;
        end, function(v11)
            warn("Player Emulator can't get country region list: " .. v11);
        end);
    end;
end;
