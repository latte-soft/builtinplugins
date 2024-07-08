local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
local l_StudioService_0 = game:GetService("StudioService");
return function(v2)
    local function v4(v3)
        if game:GetFastFlag("COLLAB5863Telemetry") then
            v2:SendEventDeferred("studio", "SocialPresence", "StudioSocialPresenceAction", (v0.Dictionary.join({
                studioSid = v2:GetSessionId(), 
                clientId = v2:GetClientId(), 
                placeId = game.PlaceId, 
                userId = l_StudioService_0:GetUserId()
            }, v3 or {})));
        end;
    end;
    return {
        panelToggled = function(_, v6)
            v4({
                actionName = not v6 and "panelDisabled" or "panelEnabled"
            });
        end, 
        highlightsToggled = function(_, v8)
            v4({
                actionName = not v8 and "highlightsDisabled" or "highlightsEnabled"
            });
        end, 
        jumpToCollaboratorPressed = function(v9)
            v4({
                actionName = v9
            });
        end, 
        manageCollaboratorsPressed = function(v10)
            v4({
                actionName = v10
            });
        end
    };
end;
