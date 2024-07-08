local v0 = require(script.Parent.Parent.Parent.Src.Util.DebugFlags);
local l_StudioService_0 = game:GetService("StudioService");
return {
    getSocialMediaReferencesAllowed = function()
        if not v0.RunningUnderCLI() then
            return game:GetService("PluginPolicyService"):getPluginPolicy("PlayerEmulator").SocialMediaReferencesAllowed;
        else
            return true;
        end;
    end, 
    getStudioLocaleId = function()
        if not v0.RunningUnderCLI() then
            return l_StudioService_0.StudioLocaleId;
        else
            return "en";
        end;
    end
};
