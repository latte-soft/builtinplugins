local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4)
    local function v7(v5, v6)
        v4:SendEventDeferred("studio", "VisualizationModes", v5, (v2.join({
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v6)));
    end;
    return {
        openPlugin = function()
            v7("PluginOpen");
        end, 
        visualizationModeToggled = function(_, v9)
            v7("VisualizationModeToggled", {
                actionSource = v9.actionSource, 
                visualizationMode = v9.visualizationMode, 
                visualizationModeCategory = v9.visualizationModeCategory, 
                visualizationModeEnabled = v9.isEnabled
            });
        end, 
        visualizationModeEnabledDuration = function(_, v11)
            v7("VisualizationModeEnabledDuration", {
                visualizationMode = v11.visualizationMode, 
                visualizationModeCategory = v11.visualizationModeCategory, 
                durationSeconds = v11.durationSeconds
            });
        end
    };
end;
