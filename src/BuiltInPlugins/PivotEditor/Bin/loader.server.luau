require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor)() then
    if not require(l_Parent_0.Src.Utility.DebugFlags).RunningUnderCLI() then
        local v10 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
            plugin = plugin, 
            pluginName = "EditPivotPlugin", 
            translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
            fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function(_, _, _)
                return "Pivot";
            end, 
            buttonInfo = {
                getName = function(_, _, _)
                    return "EditPivot";
                end, 
                getDescription = function(_, _, _)
                    return "";
                end, 
                icon = "", 
                text = nil
            }
        });
        if v10.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v10);
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
