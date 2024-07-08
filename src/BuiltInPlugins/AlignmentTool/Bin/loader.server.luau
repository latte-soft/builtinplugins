require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
    plugin = plugin, 
    pluginName = "AlignmentTool", 
    translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
    fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    getToolbarName = function()
        return "Alignment";
    end, 
    buttonInfo = {
        getName = function()
            return "AlignTool";
        end, 
        getDescription = function()
            return "";
        end, 
        icon = "", 
        text = nil, 
        clickableWhenViewportHidden = true
    }, 
    dockWidgetInfo = {
        id = "AlignmentTool", 
        dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 300, 250, 175, 250), 
        getDockTitle = function(v1, v2, v3)
            return v1(v2, v3, "Plugin", "WindowTitle");
        end, 
        zIndexBehavior = Enum.ZIndexBehavior.Sibling
    }
});
if v4.pluginLoader:waitForUserInteraction() then
    require(script.Parent.main)(plugin, v4);
    return ;
else
    return ;
end;
