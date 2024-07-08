local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v2 = require(l_Parent_0.Packages.Http);
local l_getStudioLocaleId_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getStudioLocaleId;
local v4 = require(l_Parent_0.Src.Actions.LoadLanguages);
local v5 = v1.BuildUrl("locale", "v1/locales?displayValueLocale=" .. l_getStudioLocaleId_0());
return function(v6)
    return function(v7)
        v6.parseJson((v6:handleRetry((v6:get(v5))))):andThen(function(v8)
            if v8.responseCode == v2.StatusCodes.OK then
                v7:dispatch(v4(v8.responseBody.data));
                return ;
            else
                warn("Player Emulator can't get language list: HTTP error " .. tostring(v8.responseCode));
                return ;
            end;
        end, function(v9)
            warn("Player Emulator can't get languages list: " .. v9);
        end);
    end;
end;
