local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v2 = require(l_Parent_0.Packages.Http);
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local v4 = v1.BuildUrl("users", "v1/users/authenticated/country-code");
return function(v5)
    return function(_)
        v5.parseJson((v5:handleRetry((v5:get(v4))))):andThen(function(v7)
            if v7.responseCode == v2.StatusCodes.OK then
                l_PlayerEmulatorService_0.EmulatedCountryCode = v7.responseBody.countryCode;
                return ;
            else
                warn("Player Emulator can't get country region list: HTTP error " .. tostring(v7.responseCode));
                return ;
            end;
        end, function(v8)
            warn("Player Emulator can't get country region list: " .. v8);
        end);
    end;
end;
