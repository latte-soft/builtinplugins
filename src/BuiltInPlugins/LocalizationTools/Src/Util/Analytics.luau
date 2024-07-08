local l_HttpService_0 = game:GetService("HttpService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Src.Util.RbxEntriesToWebEntries);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8)
    local v9 = {
        sender = v7 or l_RbxAnalyticsService_0, 
        context = "localizationPlugin", 
        target = "studio", 
        userId = l_StudioService_0:GetUserId(), 
        logEvents = v8
    };
    setmetatable(v9, v6);
    return v9;
end;
v6.logEvent = function(v10, v11, v12)
    if v10.logEvents then
        print(string.format("Analytics: sendEventDeferred: \"%s\", %s", v11, (l_HttpService_0:JSONEncode(v12))));
    end;
end;
v6.sendEventDeferred = function(v13, v14, v15)
    local v16 = v4.Dictionary.join(v15, {
        uid = v13.userId, 
        gameId = game.GameId, 
        placeId = game.PlaceId
    });
    v13.sender:SendEventDeferred(v13.target, v13.context, v14, v16);
    v13:logEvent(v14, v16);
end;
v6.reportButtonPress = function(v17, v18, v19)
    v17:sendEventDeferred("buttonPressed", {
        btnName = v18, 
        status = v19
    });
end;
v6.reportToolOpened = function(v20, v21)
    v20:sendEventDeferred("toolOpened", {
        method = v21
    });
end;
v6.reportUploadPatch = function(v22, v23, v24)
    v22:sendEventDeferred("logLocalizationPerfStats", {
        btnName = v24, 
        totalRows = v23.totalRows, 
        totalTranslations = v23.totalTranslations, 
        supportedLocales = v23.supportedLocales, 
        unsupportedLocales = v23.unsupportedLocales, 
        numChangedTranslations = v23.numChangedTranslations, 
        numRemovedTranslations = v23.numRemovedTranslations, 
        numAddedTranslations = v23.numAddedTranslations, 
        addedSupportedLanguages = v23.newLanguages
    });
end;
v6.reportDownloadTable = function(v25, v26, v27, v28, v29)
    local v30 = v5(v26:GetEntries(), v28, v29);
    v25:sendEventDeferred("logLocalizationPerfStats", {
        btnName = v27, 
        totalRows = v30.totalRows, 
        totalTranslations = v30.totalTranslations, 
        supportedLocales = v30.supportedLocales, 
        unsupportedLocales = v30.unsupportedLocales
    });
end;
v6.reportUploadTable = function(v31, v32, v33)
    v31:sendEventDeferred("logLocalizationPerfStats", {
        btnName = v33, 
        totalRows = v32.totalRows, 
        totalTranslations = v32.totalTranslations, 
        supportedLocales = v32.supportedLocales, 
        unsupportedLocales = v32.unsupportedLocales, 
        numChangedTranslations = v32.numChangedTranslations, 
        numRemovedTranslations = v32.numRemovedTranslations, 
        numAddedTranslations = v32.numAddedTranslations, 
        addedSupportedLanguages = v32.newLanguages
    });
end;
v6.mock = function()
    return v6.new({
        SendEventDeferred = function()
        end
    });
end;
return v6;
