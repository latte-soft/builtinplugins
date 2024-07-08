local v0 = game:getFastFlag("ToolboxRemoveApiProxy");
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v9, v10, v11 = (function()
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v6 = l_BaseUrl_0:find("://");
    local v7, v8 = l_BaseUrl_0:find("%.", v6 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v6 + 1, v7 - 1), (l_BaseUrl_0:sub(v8 + 1));
end)();
local v13 = {
    DOMAIN = v11, 
    PREFIX = v10, 
    BASE_URL = v9, 
    API_URL = if not v0 then if not v0 then string.format("https://api.%s", v11) else nil else nil, 
    APIS_URL = string.format("https://apis.%s", v11), 
    AUTH_URL = string.format("https://auth.%s", v11), 
    CREATE_URL = string.format("https://create.%s", v11), 
    GAME_URL = string.format("https://games.%s", v11), 
    GAME_ASSET_URL = string.format("https://assetgame.%s", v11), 
    CHAT_URL = string.format("https://chat.%sv2", v11), 
    NOTIFICATION_URL = string.format("https://notifications.%s", v11), 
    REALTIME_URL = string.format("https://realtime.%s", v11), 
    WEB_URL = string.format("https://web.%s", v11), 
    CATALOG_URL = string.format("https://catalog.%s", v11), 
    DEVELOP_URL = string.format("https://develop.%s", v11), 
    ITEM_CONFIGURATION_URL = string.format("https://itemconfiguration.%s", v11), 
    PUBLISH_URL = string.format("https://publish.%s", v11), 
    DATA_URL = string.format("https://data.%s", v11), 
    GROUP_URL = string.format("https://groups.%s", v11), 
    THUMBNAIL_URL = string.format("https://thumbnails.%s", v11), 
    ECONOMY_URL = string.format("https://economy.%s", v11), 
    FRIENDS_URL = string.format("https://friends.%s", v11), 
    USERS_URL = if not v0 then nil else if not v0 then nil else string.format("https://users.%s", v11), 
    INVENTORY_URL = if not l_game_EngineFeature_0 then nil else if not l_game_EngineFeature_0 then nil else string.format("https://inventory.%s", v11), 
    isVanitySite = function(v12)
        return v12.PREFIX ~= "www";
    end
};
isMap = function(v14)
    local v15 = false;
    if typeof(v14) == "table" then
        v15 = #v14 == 0;
    end;
    return v15;
end;
addArrayToParams = function(v16, v17, v18, v19)
    if v18 ~= nil and #v18 > 0 then
        if not v19 then
            local v20 = l_HttpService_0:UrlEncode(v18[1]);
            for v21 = 2, #v18 do
                v20 = v20 .. "&" .. l_HttpService_0:UrlEncode(v17) .. "=" .. l_HttpService_0:UrlEncode(v18[v21]);
            end;
            v16[l_HttpService_0:UrlEncode(v17)] = v20;
        else
            v16[l_HttpService_0:UrlEncode(v17)] = l_HttpService_0:UrlEncode(table.concat(v18, ","));
            return ;
        end;
    end;
end;
addNonMapValueToParams = function(v22, v23, v24, v25)
    if not (not (v24 ~= nil) or isMap(v24)) then
        if type(v24) == "table" then
            addArrayToParams(v22, v23, v24, v25);
            return ;
        else
            v22[l_HttpService_0:UrlEncode(v23)] = l_HttpService_0:UrlEncode((tostring(v24)));
        end;
    end;
end;
v13.makeQueryString = function(v26, v27, v28)
    local v29 = {};
    for v30, v31 in pairs(v26) do
        local v32 = isMap(v31);
        if v32 then
            if not (not v32 or not v27) then
                for v33, v34 in pairs(v31) do
                    assert(not isMap(v34), "Nested maps are not currently supported");
                    addNonMapValueToParams(v29, v33, v34, v28);
                end;
            end;
        else
            addNonMapValueToParams(v29, v30, v31, v28);
        end;
    end;
    local v35 = {};
    for v36, v37 in pairs(v29) do
        table.insert(v35, v36 .. "=" .. v37);
    end;
    return table.concat(v35, "&");
end;
return v13;
