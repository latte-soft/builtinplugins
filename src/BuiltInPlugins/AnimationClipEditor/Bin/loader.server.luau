local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
if not v1.RunTests() and not v1.RunRhodiumTests() then
    local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
    local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
    local v16 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder).build({
        plugin = plugin, 
        pluginName = v3.PLUGIN_NAME, 
        translationResourceTable = l_script_FirstAncestor_0.Src.Resources.LocalizedStrings, 
        fallbackResourceTable = l_script_FirstAncestor_0.Src.Resources.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(v4, v5, v6)
            if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                return v4(v5, v6, "Plugin", "Toolbar");
            else
                return "Animations";
            end;
        end, 
        buttonInfo = {
            getName = function(v7, v8, v9)
                if not l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                    return v7(v8, v9, "Plugin", "Button");
                else
                    return "Animation Editor";
                end;
            end, 
            getDescription = function(v10, v11, v12)
                return v10(v11, v12, "Plugin", "Description");
            end, 
            icon = v3.PLUGIN_ICON, 
            text = nil
        }, 
        dockWidgetInfo = {
            id = "AnimationClipEditor", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, true, v3.MAIN_FLOATING_SIZE.X, v3.MAIN_FLOATING_SIZE.Y, v3.MAIN_MINIMUM_SIZE.X, v3.MAIN_MINIMUM_SIZE.Y), 
            getDockTitle = function(v13, v14, v15)
                return v13(v14, v15, "Plugin", "Name");
            end, 
            name = "AnimationClipEditor", 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    });
    if v16.pluginLoader:waitForUserInteraction() then
        require(script.Parent.main)(plugin, v16);
        return ;
    else
        return ;
    end;
else
    return ;
end;
