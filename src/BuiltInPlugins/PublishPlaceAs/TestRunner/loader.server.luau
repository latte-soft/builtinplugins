require(script.Parent.Parent.TestRunner.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local v5 = v1.build({
    plugin = plugin, 
    pluginName = "PublishPlaceAs", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    noToolbar = true, 
    extraTriggers = {
        ["StudioPublishService.GamePublishFinished"] = function()
            return l_StudioPublishService_0.GamePublishFinished;
        end, 
        ["StudioPublishService.GamePublishCancelled"] = function()
            return l_StudioPublishService_0.GamePublishCancelled;
        end, 
        ["StudioPublishService.OnSaveOrPublishPlaceToRoblox"] = function()
            return l_StudioPublishService_0.OnSaveOrPublishPlaceToRoblox;
        end
    }
});
if v5.pluginLoader:waitForUserInteraction() then
    require(script.Parent.Parent.Src.main)(plugin, v5);
    return ;
else
    return ;
end;
