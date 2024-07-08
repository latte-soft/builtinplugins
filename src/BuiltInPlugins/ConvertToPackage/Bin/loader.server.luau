require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v4 = game:GetService("PackageUIService") or nil;
local v5 = v1.build({
    plugin = plugin, 
    pluginName = "ConvertToPackage", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    noToolbar = true, 
    extraTriggers = {
        ["PackageUIService.OnOpenConvertToPackagePlugin"] = function()
            return v4.OnOpenConvertToPackagePlugin;
        end or nil
    }
});
if v5.pluginLoader:waitForUserInteraction() then
    require(script.Parent.main)(plugin, v5);
    return ;
else
    return ;
end;
