local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v2 = require(l_Parent_0.Packages.TestLoader);
local v3 = require(l_Parent_0.SharedPluginConstants);
v2.launch("MaterialGenerator", l_Parent_0.Src);
if not v2.isCli() then
    if game:GetFastFlag("EnableMaterialGenerator") then
        local v17 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
            plugin = plugin, 
            pluginName = "MaterialGenerator", 
            translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
            fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            extraTriggers = if not require(l_Parent_0.Src.Flags.getFFlagShowMaterialGeneratorFromElsewhere)() then nil else {
                ["MemStorageService." .. v3.LOAD_MATERIAL_GENERATOR] = function()
                    local l_BindableEvent_0 = Instance.new("BindableEvent");
                    l_MemStorageService_0:Bind(v3.LOAD_MATERIAL_GENERATOR, function(...)
                        l_BindableEvent_0:Fire(...);
                    end);
                    return l_BindableEvent_0.Event;
                end
            }, 
            getToolbarName = function(_, _, _)
                return "MaterialGenerator";
            end, 
            buttonInfo = {
                getName = function(_, _, _)
                    return "MaterialGenerator";
                end, 
                getDescription = function(v11, v12, v13)
                    return v11(v12, v13, "Plugin", "Description");
                end, 
                icon = "", 
                text = nil
            }, 
            dockWidgetInfo = {
                id = "MaterialGenerator", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 640, 480, 250, 200), 
                getDockTitle = function(v14, v15, v16)
                    return v14(v15, v16, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        });
        if v17.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v17);
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
