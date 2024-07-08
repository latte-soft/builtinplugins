local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Src.Networking.Http);
local v5 = require(l_Parent_0.Src.Util.Analytics);
local v8 = {
    BuildWatchUrl = function(v6)
        return "https://" .. "www.youtube.com" .. string.format("/watch?v=%s", v6);
    end, 
    BuildPlaceSettingsUrl = function(v7)
        return v4.BuildRobloxUrl("www", "places/%d/update#", v7);
    end
};
v8.OpenVideo = function(v9)
    l_GuiService_0:OpenBrowserWindow((v8.BuildWatchUrl(v9)));
end;
v8.OpenPlaceSettings = function(v10)
    l_GuiService_0:OpenBrowserWindow((v8.BuildPlaceSettingsUrl(v10)));
end;
v8.OpenLocalizationSettings = function(v11)
    return function()
        l_GuiService_0:OpenBrowserWindow((v4.BuildRobloxUrl("www", "localization/games/%d/configure", v11)));
    end;
end;
getAdditionalArgs = function()
    return {
        userId = l_StudioService_0:GetUserId(), 
        machineTimeStamp = os.time()
    };
end;
v8.OpenExperienceGuidelines = function()
    assert(l_GameSettingsExperienceGuidelines_0);
    return function()
        v5.sendEventDeferred("click_learn_more", getAdditionalArgs());
        l_GuiService_0:OpenBrowserWindow((v4.BuildRobloxUrl("create", "docs/production/promotion/experience-guidelines")));
    end;
end;
v8.OpenExperienceQuestionnaire = function(v12)
    assert(l_GameSettingsExperienceGuidelines_0);
    return function()
        v5.sendEventDeferred("click_experience_questionnaire", getAdditionalArgs());
        l_GuiService_0:OpenBrowserWindow((v4.BuildRobloxUrl("create", "dashboard/creations/experiences/%d/experience-questionnaire", v12)));
    end;
end;
return v8;
