if game:GetFastFlag("ImprovePluginSpeed_TagEditor") then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Src.Util.shouldPluginRun);
    require(script.Parent.defineLuaFlags);
    if v1() then
        local v8 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder).build({
            plugin = plugin, 
            pluginName = "TagEditor", 
            translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings, 
            fallbackResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function()
                return "tagEditorToolbar";
            end, 
            buttonInfo = {
                getName = function()
                    return "TagEditor";
                end, 
                getDescription = function(_, _, _)
                    return "";
                end, 
                icon = "", 
                text = nil, 
                ClickableWhenViewportHidden = true
            }, 
            dockWidgetInfo = {
                id = if not game:GetFastFlag("StudioFixPluginWidgetLocalizedIds") then nil else "TagEditor", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, false, 300, 200, 200, 250), 
                getDockTitle = function(v5, v6, v7)
                    return v5(v6, v7, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        });
        if v8.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v8);
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
