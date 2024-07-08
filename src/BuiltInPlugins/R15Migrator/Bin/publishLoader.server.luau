local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
if require(l_script_FirstAncestor_0.Src.Util.shouldPluginRun)() then
    if not v1.RunTests() and not v1.RunningUnderCLI() then
        local v2 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
        local l_StudioPublishService_0 = game:GetService("StudioPublishService");
        local v6 = v2.build({
            plugin = plugin, 
            pluginName = "PublishBlocked", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            noToolbar = true, 
            extraTriggers = {
                ["StudioPublishService.OnPublishAttempt"] = function()
                    return l_StudioPublishService_0.OnPublishAttempt;
                end
            }
        });
        if v6.pluginLoader:waitForUserInteraction() then
            require(script.Parent.publishMain)(plugin, v6);
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
