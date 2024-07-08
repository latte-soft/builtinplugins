local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
v0.voiceUniverseSettingsPOST = function(v2, v3, v4)
    return v2.__networking:post("voice", "/v1/settings/universe/" .. v3, {
        Body = v4
    });
end;
v0.avatarVideoUniverseSettingsPOST = function(v5, v6, v7)
    return v5.__networking:post("voice", "/v1/settings/universe/avatarvideo/" .. v6, {
        Body = v7
    });
end;
v0.voiceUniverseSettingsGET = function(v8, v9)
    return v8.__networking:get("voice", "/v1/settings/universe/" .. v9);
end;
v0.voiceUserSettingsGET = function(v10)
    return v10.__networking:get("voice", "/v1/settings");
end;
v0.getAvatarChatEnabled = function(v11)
    return v11:voiceUserSettingsGET():await().responseBody.isAvatarChatEnabled;
end;
v0.getAvatarChatSettings = function(v12, v13)
    local v14 = v12:voiceUniverseSettingsGET(v13):await();
    return {
        audioEnabled = v14.responseBody.isUniverseEnabledForVoice, 
        videoEnabled = v14.responseBody.isUniverseEnabledForAvatarVideo
    };
end;
v0.setAvatarChatSettings = function(v15, v16, v17, v18)
    local v19 = {};
    if v17 ~= nil then
        v19.optIn = v17;
        v15:voiceUniverseSettingsPOST(v16, v19):await();
    end;
    if v18 ~= nil then
        v19.optIn = v18;
        v15:avatarVideoUniverseSettingsPOST(v16, v19):await();
    end;
end;
return v0;
