local v0 = game:GetService("PluginPolicyService"):getPluginPolicy("AssetManager");
local v1 = require(script.Parent.hasInternalPermission);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableCustomVideoUploadLua");
local v3 = {
    shouldEnableAudioImport = function()
        return v0.EnableAudioImport;
    end
};
v3.enableAudioImport = function()
    return v3.shouldEnableAudioImport();
end;
v3.shouldEnableVideoImport = function()
    return l_game_EngineFeature_0 or v1();
end;
v3.enableVideoImport = function()
    return v3.shouldEnableVideoImport();
end;
v3.enableBadgesCallout = function()
    return v0.ShowBadges;
end;
return v3;
