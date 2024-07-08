if game:GetFastFlag("ImprovePluginSpeed_AssetManager") then
    require(script.Parent.defineLuaFlags);
    local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
    local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_AssetManagerService_0 = game:GetService("AssetManagerService");
    local l_BulkImportService_0 = game:GetService("BulkImportService");
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local v19 = v3.build({
        plugin = plugin, 
        pluginName = "AssetManager", 
        translationResourceTable = l_Parent_0.Src.Resources.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.Src.Resources.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function()
            return "assetManagerToolbar";
        end, 
        buttonInfo = {
            getName = function()
                return "assetManagerToolButton";
            end, 
            getDescription = function(v7, v8, v9)
                return v7(v8, v9, "Main", "Tooltip");
            end, 
            icon = "rbxlocaltheme://AssetManager", 
            text = function(v10, v11, v12)
                return v10(v11, v12, "Main", "ToolbarButton");
            end, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "AssetManager_PluginGui", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, not l_EnableAssetManagerSortButton_0 and 300 or 350, 600, not l_EnableAssetManagerSortButton_0 and 270 or 350, 256), 
            getDockTitle = function(v13, v14, v15)
                return v13(v14, v15, "Main", "Title");
            end, 
            name = function(v16, v17, v18)
                return v16(v17, v18, "Meta", "PluginName");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, 
        extraTriggers = {
            ["BulkImportService.BulkImportStarted"] = function()
                return l_BulkImportService_0.BulkImportStarted;
            end, 
            ["BulkImportService.BulkImportFinished"] = function()
                return l_BulkImportService_0.BulkImportFinished;
            end, 
            ["BulkImportService.AssetImported"] = if not l_StudioAssetManagerAddRecentlyImportedView_0 then nil else function()
                return l_BulkImportService_0.AssetImported;
            end, 
            ["StudioPublishService.GameNameUpdated"] = function()
                return l_StudioPublishService_0.GameNameUpdated;
            end, 
            ["AssetManagerService.AssetImportedSignal"] = function()
                return l_AssetManagerService_0.AssetImportedSignal;
            end, 
            ["AssetManagerService.ImportSessionStarted"] = function()
                return l_AssetManagerService_0.ImportSessionStarted;
            end, 
            ["AssetManagerService.ImportSessionFinished"] = function()
                return l_AssetManagerService_0.ImportSessionFinished;
            end
        }
    });
    if v19.pluginLoader:waitForUserInteraction() then
        require(script.Parent.main)(plugin, v19);
        return ;
    else
        return ;
    end;
else
    return ;
end;
