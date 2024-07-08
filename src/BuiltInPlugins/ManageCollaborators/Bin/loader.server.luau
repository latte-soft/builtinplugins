if game:getFastFlag("ImprovePluginSpeed_ManageCollaborators") then
    require(script.Parent.defineLuaFlags);
    local l_Parent_0 = script.Parent.Parent;
    if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
        local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local l_TeamCreateService_0 = game:GetService("TeamCreateService");
        local v5 = v1.build({
            plugin = plugin, 
            pluginName = "ManageCollaborators", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            noToolbar = true, 
            getToolbarName = nil, 
            buttonInfo = nil, 
            dockWidgetInfo = nil, 
            extraTriggers = {
                ["TeamCreateService.ToggleManageCollaborators"] = function()
                    return l_TeamCreateService_0.ToggleManageCollaborators;
                end
            }
        });
        v5.pluginLoader:waitForUserInteraction();
        require(script.Parent.main)(plugin, v5);
        return ;
    else
        return ;
    end;
else
    return ;
end;
