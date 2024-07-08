if game:GetFastFlag("ImprovePluginSpeed_RobloxClassic") then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Src.Util.DebugFlags);
    if require(l_Parent_0.Src.Util.shouldPluginRun)() then
        if not v1.RunTests() and not v1.RunningUnderCLI() then
            local v14 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
                plugin = plugin, 
                pluginName = "RobloxClassic", 
                translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
                fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
                overrideLocaleId = nil, 
                localizationNamespace = nil, 
                getToolbarName = function(_, _, _)
                    return "AvatarUnification";
                end, 
                buttonInfo = {
                    getName = function(_, _, _)
                        return "RobloxClassicButton";
                    end, 
                    getDescription = function(v8, v9, v10)
                        return v8(v9, v10, "Plugin", "Description");
                    end, 
                    icon = "rbxasset://textures/AnimationEditor/rigbuilder_blue.png", 
                    text = nil
                }, 
                dockWidgetInfo = {
                    id = "RobloxClassic", 
                    dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, true, 640, 480, 250, 200), 
                    getDockTitle = function(v11, v12, v13)
                        return v11(v12, v13, "Plugin", "Name");
                    end, 
                    name = "RobloxClassic", 
                    zIndexBehavior = Enum.ZIndexBehavior.Sibling
                }
            });
            if v14.pluginLoader:waitForUserInteraction() then
                require(script.Parent.main)(plugin, v14);
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
else
    return ;
end;
