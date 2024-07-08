local l_Parent_0 = script.Parent.Parent.Parent;
local l_Http_0 = require(l_Parent_0.Packages.Framework).Http;
local v2 = require(l_Parent_0.Src.Actions.LoadLanguagesAndLocalesInfo);
local v3 = require(l_Parent_0.Src.Actions.LoadManageTranslationPermission);
local v4 = require(l_Parent_0.Src.Actions.SetCloudTableId);
local v5 = {
    owner = true, 
    collaborator = true, 
    translator = true
};
local _ = function(v6, v7)
    return function(v8)
        v6.Locale.V1.locales():makeRequest():andThen(function(v9)
            local v10 = {};
            local v11 = {};
            for _, v13 in ipairs(v9.responseBody.data) do
                if v13.isEnabledForInGameUgc then
                    v10[v13.locale.language.languageCode] = true;
                end;
            end;
            v11["zh-cjv"] = "zh-hans";
            v8:dispatch(v2(v10, v11));
        end, function()
            warn(v7:getText("PluginMetadata", "GetAllLocalesFailed"));
        end);
    end;
end;
local function v22(v15, v16)
    return function(v17)
        local v18 = v15.TranslationRoles.V1.GameLocalizationRoles.Games.CurrentUser.roles(game.GameId);
        v17:dispatch(v3(false));
        return v18:makeRequest():andThen(function(v19)
            for _, v21 in ipairs(v19.responseBody.data) do
                if v5[v21] then
                    v17:dispatch(v3(true));
                    return true;
                end;
            end;
            return false;
        end, function()
            warn(v16:getText("PluginMetadata", "GetPermissionFailedMessage"));
            return false;
        end):await();
    end;
end;
local function _(v23, v24)
    return function(v25)
        v23.GameInternationalization.V1.AutoLocalization.games(game.GameId):makeRequest():andThen(function(v26)
            if v26 and v26.responseCode == l_Http_0.StatusCodes.OK then
                v25:dispatch(v4(v26.responseBody.autoLocalizationTableId));
                return ;
            else
                warn(v24:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                return ;
            end;
        end, function()
            warn(v24:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
        end);
    end;
end;
return {
    GetAll = function(v28, v29)
        return function(v30)
            local l_v28_0 = v28;
            local l_v29_0 = v29;
            local l_l_v28_0_0 = l_v28_0 --[[ copy: 4 -> 6 ]];
            local l_l_v29_0_0 = l_v29_0 --[[ copy: 5 -> 7 ]];
            v30:dispatch(function(v35)
                l_l_v28_0_0.Locale.V1.locales():makeRequest():andThen(function(v36)
                    local v37 = {};
                    local v38 = {};
                    for _, v40 in ipairs(v36.responseBody.data) do
                        if v40.isEnabledForInGameUgc then
                            v37[v40.locale.language.languageCode] = true;
                        end;
                    end;
                    v38["zh-cjv"] = "zh-hans";
                    v35:dispatch(v2(v37, v38));
                end, function()
                    warn(l_l_v29_0_0:getText("PluginMetadata", "GetAllLocalesFailed"));
                end);
            end);
            if game.GameId ~= 0 then
                l_v28_0 = v28;
                l_v29_0 = v29;
                local l_l_v28_0_1 = l_v28_0 --[[ copy: 4 -> 8 ]];
                local l_l_v29_0_1 = l_v29_0 --[[ copy: 5 -> 9 ]];
                v30:dispatch(function(v43)
                    local v44 = l_l_v28_0_1.TranslationRoles.V1.GameLocalizationRoles.Games.CurrentUser.roles(game.GameId);
                    v43:dispatch(v3(false));
                    return v44:makeRequest():andThen(function(v45)
                        for _, v47 in ipairs(v45.responseBody.data) do
                            if v5[v47] then
                                v43:dispatch(v3(true));
                                return true;
                            end;
                        end;
                        return false;
                    end, function()
                        warn(l_l_v29_0_1:getText("PluginMetadata", "GetPermissionFailedMessage"));
                        return false;
                    end):await();
                end);
                l_v28_0 = v28;
                l_v29_0 = v29;
                v30:dispatch(function(v48)
                    l_v28_0.GameInternationalization.V1.AutoLocalization.games(game.GameId):makeRequest():andThen(function(v49)
                        if v49 and v49.responseCode == l_Http_0.StatusCodes.OK then
                            v48:dispatch(v4(v49.responseBody.autoLocalizationTableId));
                            return ;
                        else
                            warn(l_v29_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                            return ;
                        end;
                    end, function()
                        warn(l_v29_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                    end);
                end);
            end;
        end;
    end, 
    OnGameIdChanged = function(v50, v51)
        return function(v52)
            if game.GameId == 0 then
                v52:dispatch(v3(false));
                v52:dispatch(v4(""));
                return ;
            else
                local l_v50_0 = v50;
                local l_v51_0 = v51;
                local l_l_v50_0_0 = l_v50_0 --[[ copy: 4 -> 6 ]];
                local l_l_v51_0_0 = l_v51_0 --[[ copy: 5 -> 7 ]];
                v52:dispatch(function(v57)
                    local v58 = l_l_v50_0_0.TranslationRoles.V1.GameLocalizationRoles.Games.CurrentUser.roles(game.GameId);
                    v57:dispatch(v3(false));
                    return v58:makeRequest():andThen(function(v59)
                        for _, v61 in ipairs(v59.responseBody.data) do
                            if v5[v61] then
                                v57:dispatch(v3(true));
                                return true;
                            end;
                        end;
                        return false;
                    end, function()
                        warn(l_l_v51_0_0:getText("PluginMetadata", "GetPermissionFailedMessage"));
                        return false;
                    end):await();
                end);
                l_v50_0 = v50;
                l_v51_0 = v51;
                v52:dispatch(function(v62)
                    l_v50_0.GameInternationalization.V1.AutoLocalization.games(game.GameId):makeRequest():andThen(function(v63)
                        if v63 and v63.responseCode == l_Http_0.StatusCodes.OK then
                            v62:dispatch(v4(v63.responseBody.autoLocalizationTableId));
                            return ;
                        else
                            warn(l_v51_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                            return ;
                        end;
                    end, function()
                        warn(l_v51_0:getText("PluginMetadata", "GetOrCreateCloudTableFailedMessage"));
                    end);
                end);
                return ;
            end;
        end;
    end, 
    GetManageTranslationPermission = v22
};
