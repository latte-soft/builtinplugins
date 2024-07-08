local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
return function(v1)
    local function v4(v2, v3)
        v1:SendEventDeferred("studio", "RigGenerator", v2, (v0.Dictionary.join({
            studioSid = v1:GetSessionId(), 
            clientId = v1:GetClientId(), 
            placeId = game.PlaceId
        }, v3 or {})));
    end;
    local function _(v5, v6)
        v1:ReportCounter(v5, v6 or 1);
    end;
    return {
        rigInsert = function(v8, v9, v10)
            v1:ReportCounter("AvatarGeneratorRigInsert", nil or 1);
            v4("Rig Generated", {
                rigName = v8, 
                rigType = v9.Name, 
                bodyShape = v10
            });
        end, 
        menuOpen = function()
            v1:ReportCounter("AvatarGeneratorMenuOpen", nil or 1);
        end, 
        menuClose = function()
            v1:ReportCounter("AvatarGeneratorMenuClose", nil or 1);
        end, 
        menuCloseManual = function()
            v1:ReportCounter("AvatarGeneratorMenuCloseManual", nil or 1);
        end
    };
end;
