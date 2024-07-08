return function(v0, v1)
    if v0 then
        local l_Parent_0 = script.Parent.Parent;
        local _ = game:GetFastFlag("TerrainToolsImportUploadAssets");
        local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
        local l_Shorelines_Tooling_0 = game:GetFastFlag("Shorelines_Tooling");
        local l_SmoothVoxels_Tooling_0 = game:GetFastFlag("SmoothVoxels_Tooling");
        local v7 = require(l_Parent_0.Packages.Framework);
        local v8 = require(l_Parent_0.Packages.Roact);
        local v9 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = v7.ContextServices;
        local l_Analytics_0 = l_ContextServices_0.Analytics;
        local l_Mouse_0 = l_ContextServices_0.Mouse;
        local l_Store_0 = l_ContextServices_0.Store;
        local l_Localization_0 = l_ContextServices_0.Localization;
        local v15 = require(l_Parent_0.Src.ContextItems);
        local v16 = require(l_Parent_0.Src.Util.createAnalyticsHandlers);
        local _ = v7.Http;
        local v18 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v19 = require(l_Parent_0.Src.Resources.PluginTheme);
        local v20 = require(l_Parent_0.Src.Resources.makeTheme);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local v23 = require(l_Parent_0.Src.Util.PluginActionsController);
        local v24 = require(l_Parent_0.Src.Util.PluginActivationController);
        local v25 = require(l_Parent_0.Src.TerrainInterfaces.TerrainImporterInstance);
        local v26 = require(l_Parent_0.Src.TerrainInterfaces.TerrainGenerationInstance);
        local v27 = require(l_Parent_0.Src.TerrainInterfaces.TerrainSeaLevel);
        local v28 = require(l_Parent_0.Src.Util.ImageLoader);
        local v29 = require(l_Parent_0.Src.Components.TerrainTools);
        local function v49()
            local v30 = l_ContextServices_0.Plugin.new(v0);
            local v31 = l_Mouse_0.new(v0:getMouse());
            local v32 = v9.Store.new(v18, nil, {});
            local v33 = l_Store_0.new(v32);
            local v34 = v15.DEPRECATED_Theme.new(v19.new());
            local v35 = l_Localization_0.new({
                pluginName = "TerrainToolsV2", 
                stringResourceTable = l_SourceStrings_0, 
                translationResourceTable = l_LocalizedStrings_0
            });
            local v36 = v23.new(v0, {
                EditPlane = {
                    allowBinding = false, 
                    defaultShortcut = "ctrl+shift+space", 
                    id = "EditPlane", 
                    statusTip = v35:getText("EditPlaneAction", "StatusTip"), 
                    text = v35:getText("EditPlaneAction", "Text")
                }, 
                CopySelected = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "ctrl+c", 
                    id = "CopySelected", 
                    statusTip = v35:getText("SelectionAction", "CopyStatusTip"), 
                    text = v35:getText("SelectionAction", "CopyText")
                }, 
                CutSelected = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "ctrl+x", 
                    id = "CutSelected", 
                    statusTip = v35:getText("SelectionAction", "CutStatusTip"), 
                    text = v35:getText("SelectionAction", "CutText")
                }, 
                DeleteSelected = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "delete", 
                    id = "DeleteSelected", 
                    statusTip = v35:getText("SelectionAction", "DeleteStatusTip"), 
                    text = v35:getText("SelectionAction", "DeleteText")
                }, 
                PasteSelected = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "ctrl+v", 
                    id = "PasteSelected", 
                    statusTip = v35:getText("SelectionAction", "PasteStatusTip"), 
                    text = v35:getText("SelectionAction", "PasteText")
                }, 
                DuplicateSelected = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "ctrl+d", 
                    id = "DuplicateSelected", 
                    statusTip = v35:getText("SelectionAction", "DuplicateStatusTip"), 
                    text = v35:getText("SelectionAction", "DuplicateText")
                }, 
                Apply = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "return", 
                    id = "Apply", 
                    statusTip = v35:getText("TransformAction", "ApplyStatusTip"), 
                    text = v35:getText("TransformAction", "ApplyText")
                }, 
                Cancel = if not l_TerrainEditorOverhaul_0 then nil else {
                    allowBinding = false, 
                    defaultShortcut = "escape", 
                    id = "Quit", 
                    statusTip = v35:getText("TransformAction", "CancelStatusTip"), 
                    text = v35:getText("TransformAction", "CancelText")
                }
            });
            local v37 = l_Analytics_0.new(v16);
            local v38 = require(l_Parent_0.Src.Util.getTerrain)();
            local v39 = v15.Terrain.new(v38);
            local v40 = v24.new(v0);
            local v41 = v25.new({
                localization = v35, 
                analytics = v37
            });
            local v42 = v26.new({
                terrain = v38, 
                localization = v35, 
                analytics = v37
            });
            local v43 = v27.new({
                terrain = v38, 
                localization = v35
            });
            local v44 = v20();
            local v45 = v28.new();
            local v46 = v15.CalloutController.new();
            v46:defineCallout("TerrainToolsColormapCallout", v35:getText("ColormapCallout", "Title"), v35:getText("ColormapCallout", "Description"), "https://developer.roblox.com/en-us/articles/importing-terrain-data");
            v46:defineCallout("TerrainToolsLiveEditCallout", v35:getText("LiveEditCallout", "Title"), v35:getText("LiveEditCallout", "Description"), "https://devforum.roblox.com/t/improvements-to-the-terrain-editor/2344311");
            v46:defineCallout("TerrainToolsFillCallout", v35:getText("FillCallout", "Title"), v35:getText("FillCallout", "Description"), "https://devforum.roblox.com/t/improvements-to-the-terrain-editor/2344311");
            local v47 = nil;
            if l_Shorelines_Tooling_0 then
                v47 = v15.ShorelineController.new(v37, v0, v32, v39);
            end;
            local v48 = nil;
            if l_SmoothVoxels_Tooling_0 then
                v48 = v15.SmoothVoxelsController.new(v37, v0, v32, v39);
            end;
            return {
                plugin = v30, 
                mouse = v31, 
                store = v33, 
                theme = v34, 
                devFrameworkThemeItem = v44, 
                localization = v35, 
                analytics = v37, 
                imageLoader = v45, 
                terrain = v39, 
                pluginActivationController = v40, 
                pluginActionsController = v36, 
                terrainImporter = v41, 
                terrainGeneration = v42, 
                seaLevel = v43, 
                calloutController = v46, 
                shorelineController = v47, 
                smoothVoxelsController = v48
            };
        end;
        local function v53(v50)
            for _, v52 in pairs(v50) do
                pcall(function()
                    v52:destroy();
                end);
            end;
        end;
        (function()
            local v54 = v49();
            v54.pluginLoaderContext = v1;
            local v55 = v8.mount(v8.createElement(v29, v54));
            local v56 = nil;
            local l_status_0, l_result_0 = pcall(function()
                return game:GetService("StudioService"):HasInternalPermission();
            end);
            if not (not l_status_0 or not l_result_0) then
                v7.DeveloperTools.forPlugin("Terrain Editor", v0):addRoactTree("Roact tree", v55, v8);
            end;
            v0.Unloading:Connect(function()
                if v55 then
                    v8.unmount(v55);
                    v55 = nil;
                end;
                if v56 then
                    v56:destroy();
                    v56 = nil;
                end;
                v53(v54);
            end);
        end)();
        return ;
    else
        return ;
    end;
end;
