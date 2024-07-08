if game:GetFastFlag("ImprovePluginSpeed_RigGenerator") then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("RigGenerator", l_Parent_0.Src);
    if not v1.isCli() then
        local v11 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
            plugin = plugin, 
            pluginName = "RigGenerator", 
            translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
            fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function(_, _, _)
                return "Rig Generator";
            end, 
            buttonInfo = {
                getName = function(_, _, _)
                    return "Generate Rig";
                end, 
                getDescription = function(v8, v9, v10)
                    return v8(v9, v10, "Plugin", "Description");
                end, 
                icon = "rbxlocaltheme://BuildRig", 
                text = nil
            }
        });
        if v11.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v11);
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
