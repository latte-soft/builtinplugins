local l_ContentProvider_0 = game:GetService("ContentProvider");
local v6, v7, v8 = (function()
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end)();
return {
    DOMAIN = v8, 
    PREFIX = v7, 
    BASE_URL = v6, 
    API_URL = string.format("https://api.%s", v8), 
    AUTH_URL = string.format("https://auth.%s", v8), 
    GAME_URL = string.format("https://games.%s", v8), 
    GAME_ASSET_URL = string.format("https://assetgame.%s", v8), 
    CHAT_URL = string.format("https://chat.%sv2", v8), 
    NOTIFICATION_URL = string.format("https://notifications.%s", v8), 
    REALTIME_URL = string.format("https://realtime.%s", v8), 
    WEB_URL = string.format("https://web.%s", v8), 
    CATALOG_URL = string.format("https://catalog.%s", v8), 
    DEVELOP_URL = string.format("https://develop.%s", v8), 
    ITEM_CONFIGURATION_URL = string.format("https://itemconfiguration.%s", v8), 
    PUBLISH_URL = string.format("https://publish.%s", v8), 
    DATA_URL = string.format("https://data.%s", v8), 
    GROUP_URL = string.format("https://groups.%s", v8), 
    isVanitySite = function(v9)
        return v9.PREFIX ~= "www";
    end, 
    makeQueryString = function(v10)
        local v11 = {};
        for v12, v13 in pairs(v10) do
            if v13 ~= nil then
                if type(v13) == "table" then
                    for v14 = 1, #v13 do
                        table.insert(v11, v12 .. "=" .. v13[v14]);
                    end;
                else
                    table.insert(v11, v12 .. "=" .. tostring(v13));
                end;
            end;
        end;
        return table.concat(v11, "&");
    end
};
