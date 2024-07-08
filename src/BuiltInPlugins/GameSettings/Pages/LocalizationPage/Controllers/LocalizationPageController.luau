local l_Promise_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Promise;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        __networking = v2
    }, v1));
end;
v1.localeSupportedLocalesGET = function(v3)
    return v3.__networking:get("locale", "/v1/locales/supported-locales");
end;
v1.localeLocalesGET = function(v4, v5)
    return v4.__networking:get("locale", "/v1/locales", {
        Params = {
            displayValueLocale = v5
        }
    });
end;
v1.gameinternationalizationSourceLanguageGamesGET = function(v6, v7)
    return v6.__networking:get("gameinternationalization", "/v1/source-language/games/" .. v7);
end;
v1.gameinternationalizationSourceLanguageGamesPATCH = function(v8, v9, v10)
    return v8.__networking:patch("gameinternationalization", "/v1/source-language/games/" .. v9, {
        Params = {
            languageCode = v10
        }
    });
end;
v1.gameinternationalizationAutoLocalizationGamesAutoLocalizationTablePOST = function(v11, v12)
    return v11.__networking:post("gameinternationalization", "/v1/autolocalization/games/" .. v12 .. "/autolocalizationtable", {
        Body = {}
    });
end;
v1.gameinternationalizationAutoLocalizationGamesSettingsPATCH = function(v13, v14, v15, v16)
    return v13.__networking:patch("gameinternationalization", "/v1/autolocalization/games/" .. v14 .. "/settings", {
        Body = {
            isAutolocalizationEnabled = v15, 
            shouldUseLocalizationTable = v16
        }
    });
end;
v1.gameinternationalizationAutomaticTranslationGamesFeatureStatusGET = function(v17, v18)
    return v17.__networking:get("gameinternationalization", "/v1/automatic-translation/games/" .. v18 .. "/feature-status");
end;
v1.gameinternationalizationAutomaticTranslationLanguagesTargetLanguagesGET = function(v19, v20)
    return v19.__networking:get("gameinternationalization", "/v1/automatic-translation/languages/" .. v20 .. "/target-languages");
end;
v1.gameinternationalizationSupportedLanguagesGamesAutomaticTranslationStatusGET = function(v21, v22)
    return v21.__networking:get("gameinternationalization", "/v1/supported-languages/games/" .. v22 .. "/automatic-translation-status");
end;
v1.gameinternationalizationSupportedLanguagesGamesPATCH = function(v23, v24, v25)
    return v23.__networking:patch("gameinternationalization", "/v1/supported-languages/games/" .. v24, {
        Body = v25
    });
end;
v1.gameinternationalizationSupportedLanguagesGamesLanguagesAutomaticTranslationStatusPATCH = function(v26, v27, v28)
    local l___networking_0 = v26.__networking;
    local v30 = {};
    for v31, v32 in pairs(v28) do
        table.insert(v30, (l___networking_0:patch("gameinternationalization", "/v1/supported-languages/games/" .. v27 .. "/languages/" .. v31 .. "/automatic-translation-status", {
            Body = v32
        })));
    end;
    return v30;
end;
v1.getSupportedLanguages = function(v33)
    local v34 = v33:localeSupportedLocalesGET():await();
    local v35 = {};
    for _, v37 in pairs(v34.responseBody.supportedLocales) do
        v35[v37.language.languageCode] = v37.language.nativeName;
    end;
    return v35;
end;
v1.getLanguageCodeToNames = function(v38, v39)
    local v40 = v38:localeLocalesGET(v39):await();
    local v41 = {};
    for _, v43 in pairs(v40.responseBody.data) do
        local l_languageCode_0 = v43.locale.language.languageCode;
        if v41[l_languageCode_0] == nil then
            v41[l_languageCode_0] = v43.locale.language.name;
        end;
    end;
    return v41;
end;
v1.getSourceLanguage = function(v45, v46)
    return v45:gameinternationalizationSourceLanguageGamesGET(v46):await().responseBody.languageCode;
end;
v1.setSourceLanguage = function(v47, v48, v49)
    v47:gameinternationalizationSourceLanguageGamesPATCH(v48, v49):await();
end;
v1.getAutoLocalizationSettings = function(v50, v51)
    local l_responseBody_0 = v50:gameinternationalizationAutoLocalizationGamesAutoLocalizationTablePOST(v51):await().responseBody;
    return l_responseBody_0.isAutolocalizationEnabled, l_responseBody_0.shouldUseLocalizationTable;
end;
v1.setAutoLocalizationSettings = function(v53, v54, v55, v56)
    v53:gameinternationalizationAutoLocalizationGamesSettingsPATCH(v54, v55, v56):await();
end;
v1.getAutoTranslationFeatureStatus = function(v57, v58)
    return v57:gameinternationalizationAutomaticTranslationGamesFeatureStatusGET(v58):await().responseBody.isAutomaticTranslationAllowed;
end;
v1.getAutoTranslationTargetLanguages = function(v59, v60)
    if v60 then
        local v61 = v59:gameinternationalizationAutomaticTranslationLanguagesTargetLanguagesGET(v60):await();
        local v62 = {};
        for _, v64 in pairs(v61.responseBody.targetLanguages) do
            v62[v64.languageCode] = v64.isAutomaticTranslationAllowed;
        end;
        return v62;
    else
        return {};
    end;
end;
v1.getAutoTranslationSetings = function(v65, v66)
    local v67 = v65:gameinternationalizationSupportedLanguagesGamesAutomaticTranslationStatusGET(v66):await();
    local v68 = {};
    for _, v70 in pairs(v67.responseBody.data) do
        v68[v70.languageCode] = v70.isAutomaticTranslationEnabled;
    end;
    return v68;
end;
v1.setAutoTranslationSetings = function(v71, v72, v73)
    local v74 = {};
    for v75, v76 in pairs(v73) do
        if v76 then
            table.insert(v74, {
                languageCodeType = "Language", 
                languageCode = v75, 
                delete = false
            });
        end;
    end;
    v71:gameinternationalizationSupportedLanguagesGamesPATCH(v72, v74):await();
    l_Promise_0.all((v71:gameinternationalizationSupportedLanguagesGamesLanguagesAutomaticTranslationStatusPATCH(v72, v73))):await();
end;
return v1;
