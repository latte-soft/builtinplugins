local l_game_FastString_0 = game:GetFastString("DevPublishChinaRequirementsLink");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v2 = game:GetService("PluginPolicyService"):getPluginPolicy("PublishPlaceAs");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Src.Util.KeyProvider);
local v6 = v5.getContextKeyName();
local v7 = v5.getPluginKeyName();
local v8 = v5.getPublishPlaceAsKeyName();
local v9 = v5.getRegionKeyName();
local v10 = v5.getStatusKeyName();
local v18 = {
    shouldShowDevPublishLocations = function()
        return v2.ShowOptInLocations;
    end, 
    getIsOptInChina = function(v11)
        if v11 == nil then
            return false;
        else
            for _, v13 in pairs(v11) do
                local v14 = v13[v9];
                local v15 = v13[v10];
                if v14 == "China" and v15 == "Approved" then
                    return true;
                end;
            end;
            return false;
        end;
    end, 
    getOptInLocationsRequirementsLink = function(_)
        return l_game_FastString_0;
    end, 
    getPlayerAppDownloadLink = function(v17)
        return v2.PlayerAppDownloadLink[v17];
    end
};
local function _(v19, v20)
    return {
        [v7] = v19, 
        [v6] = v20
    };
end;
v18.sendAnalyticsToKibana = function(v22, v23, v24, v25)
    l_RbxAnalyticsService_0:reportInfluxSeries(v22, v4.Dictionary.join({
        [v7] = v8, 
        [v6] = v24
    }, v25), v23);
end;
v18.calculateTextSize = function(v26, v27, v28)
    return game:GetService("TextService"):GetTextSize(v26, v27, v28, (Vector2.new(5000, 5000)));
end;
return v18;
