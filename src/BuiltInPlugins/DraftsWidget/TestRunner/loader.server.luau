local v0 = require(script.Parent.main);
if not game:GetService("RunService"):IsEdit() then
    local l_Parent_0 = script.Parent.Parent;
    require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
        plugin = plugin, 
        pluginName = "Drafts", 
        translationResourceTable = l_Parent_0.Src.Resources.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.Src.Resources.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function()
            return "draftsToolbar";
        end, 
        buttonInfo = {
            getName = function()
                return "draftsButton";
            end, 
            getDescription = function(v2, v3, v4)
                return v2(v3, v4, "Meta", "PluginButtonTooltip");
            end, 
            icon = "", 
            text = nil, 
            enabled = false
        }, 
        dockWidgetInfo = nil
    });
    return ;
else
    v0(plugin);
    return ;
end;
