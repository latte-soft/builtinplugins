local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
if require(l_script_FirstAncestor_0.Src.Util.shouldPluginRun)() then
    if not v1.RunTests() and not v1.RunningUnderCLI() then
        local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
        local v4 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder);
        local v5 = require(l_script_FirstAncestor_0.Src.Util.checkPublishLock);
        local v6 = require(l_script_FirstAncestor_0.Src.Util.PluginSettings);
        local l_StudioPublishService_0 = game:GetService("StudioPublishService");
        v5();
        local v20 = {
            plugin = plugin, 
            pluginName = "R15Migrator", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function(_, _, _)
                return "AvatarUnification";
            end, 
            buttonInfo = {
                getName = function(_, _, _)
                    return "r15_migration_button";
                end, 
                getDescription = function(v14, v15, v16)
                    return v14(v15, v16, "Plugin", "Description");
                end, 
                icon = "http://www.roblox.com/asset/?id=12399871436", 
                text = nil
            }, 
            dockWidgetInfo = {
                id = "R15Migrator", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, v6.InitiallyEnabled:getBooleanSetting(plugin, game.GameId), true, 508, 640, 508, 640), 
                getDockTitle = function(v17, v18, v19)
                    return v17(v18, v19, "Plugin", "Name");
                end, 
                name = "R15Migrator", 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, 
            extraTriggers = {
                ["StudioPublishService.OnPublishAttempt"] = function()
                    return l_StudioPublishService_0.OnPublishAttempt;
                end
            }
        };
        v6.InitiallyEnabled:setSetting(plugin, game.GameId, nil);
        local v21 = v4.build(v20);
        if v21.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v21);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
