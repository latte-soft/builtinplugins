require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local v2 = require(l_Parent_0.Src.Util.Constants);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
    if not game:GetFastFlag("EnableTerrainEditor2") then
        local v11 = v1.build({
            plugin = plugin, 
            pluginName = "TerrainToolsV2", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function()
                return "TerrainToolsLuaToolbarName";
            end, 
            buttonInfo = {
                getName = function()
                    return "Editor";
                end, 
                getDescription = function(v5, v6, v7)
                    return v5(v6, v7, "Main", "PluginButtonEditorTooltip");
                end, 
                icon = "rbxlocaltheme://TerrainEditor", 
                text = nil, 
                clickableWhenViewportHidden = true
            }, 
            dockWidgetInfo = {
                id = "TerrainTools", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, true, false, 300, 600, v2.MIN_WIDGET_SIZE.X, v2.MIN_WIDGET_SIZE.Y), 
                getDockTitle = function(v8, v9, v10)
                    return v8(v9, v10, "Main", "Title");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, 
            shouldImmediatelyOpen = (game:GetFastFlag("Shorelines_Tooling") or game:GetFastFlag("SmoothVoxels_Tooling")) and function()
                return true;
            end or nil
        });
        if v11.pluginLoader:waitForUserInteraction() then
            require(script.Parent.main)(plugin, v11);
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
