local l_game_FastString_0 = game:GetFastString("DevPublishChinaRequirementsLink");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local v3 = game:GetService("PluginPolicyService"):getPluginPolicy("GameSettings");
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Packages.Cryo);
local v6 = require(l_Parent_0.Src.Util.KeyProvider);
local v7 = v6.getContextKeyName();
local v8 = v6.getPluginKeyName();
local v9 = v6.getGameSettingsKeyName();
local v12 = {
    getAutoTranslationAllowed = function()
        return v3.AutoTranslationAllowed;
    end, 
    getAutoTranslatedLanguages = function()
        return v3.AutoTranslationTargetLanguages;
    end, 
    getSocialMediaReferencesAllowed = function()
        return v3.SocialMediaReferencesAllowed;
    end, 
    shouldDisablePrivateServersAndPaidAccess = function()
        return v3.DisablePrivateServersAndPaidAccess;
    end, 
    shouldAllowBadges = function()
        return v3.ShowBadges;
    end, 
    shouldShowDevPublishLocations = function()
        return v3.ShowOptInLocations;
    end, 
    getPlayerAppDownloadLink = function(v10)
        return v3.PlayerAppDownloadLink[v10];
    end, 
    getOptInLocationsRequirementsLink = function(_)
        return l_game_FastString_0;
    end
};
local function _(v13, v14)
    return {
        [v8] = v13, 
        [v7] = v14
    };
end;
v12.sendAnalyticsToKibana = function(v16, v17, v18, v19)
    l_RbxAnalyticsService_0:reportInfluxSeries(v16, v5.Dictionary.join({
        [v8] = v9, 
        [v7] = v18
    }, v19), v17);
end;
v12.isTeamCreateEnabled = function()
    return l_RunService_0:IsEdit() and not l_RunService_0:IsServer();
end;
v12.calculateTextSize = function(v20, v21, v22)
    return game:GetService("TextService"):GetTextSize(v20, v21, v22, (Vector2.new(5000, 5000)));
end;
return v12;
