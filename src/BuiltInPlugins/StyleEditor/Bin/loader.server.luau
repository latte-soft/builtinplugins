require(script.Parent.defineLuaFlags);
require(script.Parent.runTests)();
if game:GetFastFlag("EnableStyleEditor") then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = game:DefineFastFlag("StyleEditorUITab", false);
    plugin.Name = l_Parent_0.Name;
    local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v11 = {
        getName = function(v5, v6, v7)
            if not v1 then
                return (v5(v6, v7, "Plugin", "Button"));
            else
                return "StyleEditorToolbarButton";
            end;
        end, 
        getDescription = function(v8, v9, v10)
            return v8(v9, v10, "Plugin", "Description");
        end, 
        icon = "rbxlocaltheme://StyleEditor", 
        enabled = false
    };
    local v15 = {
        plugin = plugin, 
        pluginName = "StyleEditor", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        getToolbarName = function(v12, v13, v14)
            if not v1 then
                return (v12(v13, v14, "Plugin", "Toolbar"));
            else
                return "StyleEditor";
            end;
        end, 
        buttonInfo = v11
    };
    if not game:GetService("RunService"):IsEdit() then
        v2.build(v15);
        return ;
    else
        v11.enabled = true;
        v15.dockWidgetInfo = {
            id = "StyleEditor", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, false, 580, 500, 250, 200), 
            getDockTitle = function(v16, v17, v18)
                return v16(v17, v18, "Plugin", "Name");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        };
        local v19 = v2.build(v15);
        if v19.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v19);
            return ;
        else
            return ;
        end;
    end;
else
    return ;
end;
