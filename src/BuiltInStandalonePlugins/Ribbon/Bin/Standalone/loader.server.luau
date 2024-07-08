local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
v1.launch("Ribbon", l_script_FirstAncestor_0.Src);
if not v1.isCli() then
    if game:GetFastFlag("EnableRibbonPlugin") then
        plugin.Name = l_script_FirstAncestor_0.Name;
        local v14 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder).build({
            plugin = plugin, 
            pluginName = "Ribbon", 
            getToolbarName = function(v2, v3, v4)
                return v2(v3, v4, "Plugin", "Toolbar");
            end, 
            translationResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings, 
            fallbackResourceTable = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings, 
            buttonInfo = {
                getName = function(v5, v6, v7)
                    return v5(v6, v7, "Plugin", "Button");
                end, 
                getDescription = function(v8, v9, v10)
                    return v8(v9, v10, "Plugin", "Description");
                end, 
                icon = "rbxlocaltheme://GameSettings", 
                enabled = true
            }, 
            dockWidgetInfo = {
                id = "Ribbon", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
                getDockTitle = function(v11, v12, v13)
                    return v11(v12, v13, "Plugin", "Name");
                end, 
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
