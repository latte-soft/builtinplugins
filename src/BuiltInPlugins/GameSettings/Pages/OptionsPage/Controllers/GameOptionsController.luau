local l_isTeamCreateEnabled_0 = require(script.Parent.Parent.Parent.Parent.Src.Util.GameSettingsUtilities).isTeamCreateEnabled;
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        __networking = v2
    }, v1));
end;
v1.universesShutdownV2POST = function(v3, v4)
    return v3.__networking:post("develop", "/v2/universes/" .. v4 .. "/shutdown", {
        Body = {}
    });
end;
v1.voiceUniverseSettingsPOST = function(v5, v6, v7)
    return v5.__networking:post("voice", "/v1/settings/universe/" .. v6, {
        Body = {
            optIn = v7
        }
    });
end;
v1.voiceUniverseSettingsGET = function(v8, v9)
    return v8.__networking:get("voice", "/v1/settings/universe/" .. v9);
end;
v1.getScriptCollaborationEnabledOnServer = function(_, v11)
    if l_isTeamCreateEnabled_0() then
        return v11:GetService("VersionControlService").ScriptCollabEnabled;
    else
        return false;
    end;
end;
v1.getScriptCollaborationEnabled = function(_, v13)
    return v13:GetService("StudioData").EnableScriptCollabByDefaultOnLoad;
end;
v1.setScriptCollaborationEnabled = function(_, v15, v16)
    v15:GetService("StudioData").EnableScriptCollabByDefaultOnLoad = v16;
end;
v1.shutdownAllServers = function(v17, v18)
    v17:universesShutdownV2POST(v18):await();
end;
v1.getVoiceChatEnabled = function(v19, v20)
    return v19:voiceUniverseSettingsGET(v20):await().responseBody.isUniverseEnabledForVoice;
end;
v1.setVoiceChatEnabled = function(v21, v22, v23)
    v21:voiceUniverseSettingsPOST(v22, v23):await();
end;
v1.getIsTeamCreateEnabled = function(_)
    return l_isTeamCreateEnabled_0();
end;
return v1;
