require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    local l_RunService_0 = game:GetService("RunService");
    local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
    local l_StudioService_0 = game:GetService("StudioService");
    local v9 = v2.build({
        plugin = plugin, 
        pluginName = "GameSettings", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function()
            return "gameSettingsToolbar";
        end, 
        buttonInfo = {
            getName = function()
                return "gameSettingsButton";
            end, 
            getDescription = function(v6, v7, v8)
                return v6(v7, v8, "General", "PluginDescription");
            end, 
            icon = "rbxlocaltheme://GameSettings", 
            text = nil, 
            clickableWhenViewportHidden = true, 
            enabled = l_RunService_0:IsEdit()
        }, 
        dockWidgetInfo = nil, 
        extraTriggers = {
            ["StudioService.OnOpenGameSettings"] = function()
                return l_StudioService_0.OnOpenGameSettings;
            end
        }
    });
    if v9.pluginLoader:waitForUserInteraction() then
        require(script.Parent.main)(plugin, v9);
        return ;
    else
        return ;
    end;
else
    return ;
end;
