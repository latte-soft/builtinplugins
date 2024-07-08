local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    local l_RunService_0 = game:GetService("RunService");
    require(script.Parent.defineLuaFlags);
    local v2 = require(l_Parent_0.Src.Util.Constants);
    local v3 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
        plugin = plugin, 
        pluginName = "PlayerEmulator", 
        translationResourceTable = l_Parent_0.Src.Resources.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.Src.Resources.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function()
            return "luaPlayerEmulatorToolbar";
        end, 
        buttonInfo = {
            getName = function()
                return "luaPlayerEmulatorButton";
            end, 
            getDescription = function()
                return "";
            end, 
            icon = "rbxlocaltheme://Player", 
            text = nil, 
            enabled = l_RunService_0:IsEdit()
        }, 
        dockWidgetInfo = nil, 
        shouldImmediatelyOpen = function()
            return plugin:GetSetting(v2.PLUGIN_WIDGET_STATE);
        end
    });
    if v3.pluginLoader:waitForUserInteraction() then
        require(script.Parent.main)(plugin, v3);
        return ;
    else
        return ;
    end;
else
    return ;
end;
