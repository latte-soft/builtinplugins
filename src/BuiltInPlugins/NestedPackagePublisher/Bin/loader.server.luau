require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Src.Util.shouldPluginRun)() then
    local v13 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
        plugin = plugin, 
        pluginName = "NestedPackagePublisher", 
        translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(v1, v2, v3)
            return v1(v2, v3, "Plugin", "Toolbar");
        end, 
        buttonInfo = {
            getName = function(v4, v5, v6)
                return v4(v5, v6, "Plugin", "Button");
            end, 
            getDescription = function(v7, v8, v9)
                return v7(v8, v9, "Plugin", "Description");
            end, 
            icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            text = nil, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "NestedPackagePublisher", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
            getDockTitle = function(v10, v11, v12)
                return v10(v11, v12, "Plugin", "Name");
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
