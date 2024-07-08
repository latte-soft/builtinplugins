local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    local v13 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
        plugin = plugin, 
        pluginName = "LocalizationTools", 
        translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(v1, v2, v3)
            return v1(v2, v3, "Plugin", "ToolbarLabel");
        end, 
        buttonInfo = {
            getName = function(v4, v5, v6)
                return v4(v5, v6, "Plugin", "RibbonBarButton");
            end, 
            getDescription = function(v7, v8, v9)
                return v7(v8, v9, "Plugin", "ToolTipMessage");
            end, 
            icon = "rbxlocaltheme://LocalizationTools", 
            text = nil, 
            enabled = game:GetService("RunService"):IsEdit()
        }, 
        dockWidgetInfo = {
            id = "LocalizationTools", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 300, 250, 0, 0), 
            getDockTitle = function(v10, v11, v12)
                return v10(v11, v12, "Plugin", "WindowTitle");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    });
    if v13.pluginLoader:waitForUserInteraction() then
        require(script.Parent.main)(plugin, v13);
        return ;
    else
        return ;
    end;
else
    return ;
end;
