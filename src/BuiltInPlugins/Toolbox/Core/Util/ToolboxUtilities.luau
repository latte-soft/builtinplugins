local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.isCli);
local l_DisableSalesPageForAvatarCreations2_0 = game:GetFastFlag("DisableSalesPageForAvatarCreations2");
local l_game_FastString_0 = game:GetFastString("ToolboxAssetConfigDisabledVideoSharingLearnMoreLink");
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnablePluginHomeview);
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local v8 = nil;
v8 = if not v1() then game:GetService("PluginPolicyService"):getPluginPolicy("Toolbox") else {
    ShowRobloxCreatedAssets = false, 
    DisableMarketplaceAndRecents = false, 
    DisableRatings = false, 
    HideNonRelevanceSorts = false, 
    HomeViewEnabledAssetTypes = "Model;Audio;Plugin", 
    MarketplaceAssetConfigUrl = "https://create.roblox.com/dashboard/creations/store/%s/configure", 
    MarketplaceDisabledCategories = "FreePlugins;PaidPlugins;Plugins;FreeVideo", 
    MarketplaceOnboardingUrl = if not v5() then nil else "https://create.roblox.com/settings/eligibility/priced-assets", 
    MarketplaceShouldUsePluginCreatorWhitelist = true, 
    DisableAutocomplete = false, 
    Enabled = true, 
    VerificationDocumentationUrl = "https://create.roblox.com/docs/production/publishing/creator-marketplace#verifying-your-account", 
    AudioPrivacyLearnMoreUrl = "https://devforum.roblox.com/t/action-needed-upcoming-changes-to-asset-privacy-for-audio/1701697", 
    VideoPrivacyLearnMoreUrl = l_game_FastString_0, 
    SafetyLearnMoreUrl = "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use", 
    CreatorDashboardBaseUrl = "https://create.roblox.com/dashboard", 
    CreatorDashboardCatalogConfigUrlExtension = if not l_DisableSalesPageForAvatarCreations2_0 then nil else "/creations/catalog/%d/configure", 
    AnnouncementConfiguration = {
        ButtonKey = "Button_Default", 
        Date = "2022-08-08 19:45:23", 
        DescriptionKey = "Description_08092022", 
        HeaderKey = "Header_Default", 
        Image = "rbxasset://textures/StudioToolbox/announcementConstruction.png", 
        LinkKey = "LinkText_Default", 
        LinkLocation = "https://roblox.com"
    }, 
    AppealsPortalUrl = if not v4() then nil else "https://www.roblox.com/report-appeals#/", 
    OwnershipPollingWaitTimeInSec = 3, 
    OwnershipPollingMaxRetries = 5
};
local v9 = {
    showRobloxCreatedAssets = function()
        return v8.ShowRobloxCreatedAssets;
    end, 
    disableMarketplaceAndRecents = function()
        return v8.DisableMarketplaceAndRecents;
    end, 
    getMaxAudioLength = function()
        return v8.MaxAudioLength;
    end, 
    getToolboxEnabled = function()
        return v8.Enabled;
    end, 
    getMarketplaceDisabledCategories = function()
        return v8.MarketplaceDisabledCategories;
    end
};
if v6() then
    v9.getHomeViewEnabledAssetTypes = function()
        return v8.HomeViewEnabledAssetTypes;
    end;
end;
v9.getShouldUsePluginCreatorWhitelist = function()
    local l_MarketplaceShouldUsePluginCreatorWhitelist_0 = v8.MarketplaceShouldUsePluginCreatorWhitelist;
    if l_MarketplaceShouldUsePluginCreatorWhitelist_0 == nil then
        return true;
    else
        return l_MarketplaceShouldUsePluginCreatorWhitelist_0;
    end;
end;
v9.disableRatings = function()
    return v8.DisableRatings;
end;
v9.getShouldHideNonRelevanceSorts = function()
    return v8.HideNonRelevanceSorts;
end;
v9.getShouldHideVerifiedCreatorBadges = function()
    return v8.HideVerifiedCreatorBadges;
end;
v9.getShouldDisableAutocomplete = function()
    return v8.DisableAutocomplete;
end;
v9.getAssetConfigMessaging = function()
    return v8.AssetConfigMessaging or {};
end;
v9.getCreatorMarketplaceWebBaseUrl = function()
    return v8.CreatorMarketplaceWebUrl;
end;
local v11 = {};
for _, v13 in pairs(Enum.AssetType:GetEnumItems()) do
    v11[v13.Name] = v13;
end;
v9.getAssetConfigDistributionQuotas = function()
    local l_AssetConfigDistributionQuotas_0 = v8.AssetConfigDistributionQuotas;
    if l_AssetConfigDistributionQuotas_0 == nil then
        return {};
    elseif type(l_AssetConfigDistributionQuotas_0) ~= "table" then
        warn("AssetConfigDistributionQuotas" .. " is expected to be a table if defined");
        return {};
    else
        local v15 = {};
        for v16, v17 in pairs(l_AssetConfigDistributionQuotas_0) do
            if v11[v16] ~= nil then
                v15[v16] = v17;
            else
                warn("Invalid assetType name in getAssetConfigDistributionQuotasEnabledAssetTypes:", v16);
            end;
        end;
        return v15;
    end;
end;
v9.getAnnouncementConfiguration = function()
    local l_AnnouncementConfiguration_0 = v8.AnnouncementConfiguration;
    if l_AnnouncementConfiguration_0 == nil then
        return {};
    elseif type(l_AnnouncementConfiguration_0) ~= "table" then
        warn("AnnouncementConfiguration" .. " is expected to be a table if defined");
        return {};
    else
        return l_AnnouncementConfiguration_0;
    end;
end;
v9.getVerificationDocumentationUrl = function()
    return v8.VerificationDocumentationUrl;
end;
v9.getAudioPrivacyLearnMoreUrl = function()
    return v8.AudioPrivacyLearnMoreUrl;
end;
v9.getVideoPrivacyLearnMoreUrl = function()
    return v8.VideoPrivacyLearnMoreUrl;
end;
v9.getSafetyLearnMoreUrl = function()
    return v8.SafetyLearnMoreUrl;
end;
if v4() then
    v9.getAppealsPortalUrl = function()
        return v8.AppealsPortalUrl;
    end;
end;
v9.getCreatorDashboardBaseUrl = function()
    return v8.CreatorDashboardBaseUrl;
end;
if l_DisableSalesPageForAvatarCreations2_0 then
    v9.getCreatorDashboardCatalogConfigUrlExtension = function(v19)
        return v8.CreatorDashboardCatalogConfigUrlExtension:format(v19);
    end;
end;
v9.hideAssetConfigDistributeLearnMoreLink = function()
    return v8.HideAssetConfigDistributeLearnMoreLink;
end;
v9.getMarketplaceAssetConfigUrl = function(v20)
    return v8.MarketplaceAssetConfigUrl:format(v20);
end;
if v5() then
    v9.getMarketplaceOnboardingUrl = function()
        return v8.MarketplaceOnboardingUrl;
    end;
end;
v9.getOwnershipPollingWaitTimeInSec = function()
    return v8.OwnershipPollingWaitTimeInSec or 1;
end;
v9.getOwnershipPollingMaxRetries = function()
    return v8.OwnershipPollingMaxRetries or 1;
end;
return v9;
