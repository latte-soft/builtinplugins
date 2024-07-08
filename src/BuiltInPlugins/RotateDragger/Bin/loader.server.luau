local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v11 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
    plugin = plugin, 
    pluginName = "RotateDragger", 
    translationResourceTable = l_DraggerFramework_0.Resources.LocalizedStrings, 
    fallbackResourceTable = l_DraggerFramework_0.Resources.SourceStrings, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    getToolbarName = function(_, _, _)
        return "Home";
    end, 
    buttonInfo = {
        getName = function(_, _, _)
            return "Rotate";
        end, 
        getDescription = function(_, _, _)
            return "Rotate an Object";
        end, 
        icon = "", 
        text = nil
    }
});
if v11.pluginLoader:waitForUserInteraction() then
    require(script.Parent.main)(plugin, v11);
    return ;
else
    return ;
end;
