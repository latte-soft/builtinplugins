require(script.Parent.defineLuaFlags);
if game:GetFastFlag("AudioDiscoveryLoader") then
    if not game:GetFastFlag("RetireAudioDiscoveryPlugin") then
        local l_Parent_0 = script.Parent.Parent;
        if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
            local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
            local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
            local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
            local v10 = {
                getName = function(v4, v5, v6)
                    return v4(v5, v6, "Plugin", "Button");
                end, 
                getDescription = function(v7, v8, v9)
                    return v7(v8, v9, "Plugin", "Description");
                end, 
                icon = "rbxlocaltheme://ViewSounds", 
                enabled = false
            };
            local v14 = {
                plugin = plugin, 
                pluginName = "AudioDiscovery", 
                translationResourceTable = l_LocalizedStrings_0, 
                fallbackResourceTable = l_SourceStrings_0, 
                getToolbarName = function(v11, v12, v13)
                    return v11(v12, v13, "Plugin", "Toolbar");
                end, 
                buttonInfo = v10
            };
            if not game:GetService("RunService"):IsEdit() then
                v1.build(v14);
                return ;
            else
                v10.enabled = true;
                v14.dockWidgetInfo = {
                    id = "AudioDiscovery", 
                    dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
                    getDockTitle = function(v15, v16, v17)
                        return v15(v16, v17, "Plugin", "Name");
                    end, 
                    zIndexBehavior = Enum.ZIndexBehavior.Sibling
                };
                local v18 = v1.build(v14);
                if v18.pluginLoader:waitForUserInteraction() then
                    require(script.Parent.main)(plugin, v18);
                    return ;
                else
                    return ;
                end;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
