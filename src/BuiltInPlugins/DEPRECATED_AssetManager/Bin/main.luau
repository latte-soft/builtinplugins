return function(v0, v1)
    if v0 then
        require(script.Parent.commonInit)();
        local l_ImprovePluginSpeed_AssetManager_0 = game:GetFastFlag("ImprovePluginSpeed_AssetManager");
        if not l_ImprovePluginSpeed_AssetManager_0 then
            require(script.Parent.defineLuaFlags);
        end;
        local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
        local l_AssetManagerToggleWidgetFix_0 = game:GetFastFlag("AssetManagerToggleWidgetFix");
        local l_AssetManagerService_0 = game:GetService("AssetManagerService");
        local l_BulkImportService_0 = game:GetService("BulkImportService");
        local l_StudioPublishService_0 = game:GetService("StudioPublishService");
        local l_Parent_0 = script.Parent.Parent;
        local v9 = require(l_Parent_0.Packages.Roact);
        local v10 = require(l_Parent_0.Packages.Rodux);
        local v11 = require(l_Parent_0.Packages.Cryo);
        local v12 = require(l_Parent_0.Packages.Framework);
        local v13 = require(l_Parent_0.Packages.InsertAsset);
        local l_ContextServices_0 = v12.ContextServices;
        local v15 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local l_InsertAssetContext_0 = v13.Context.InsertAssetContext;
        local v17 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v18 = require(l_Parent_0.Src.Middleware.MainMiddleware);
        local v19 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local v22 = require(l_Parent_0.Src.Components.MainView);
        local v23 = require(l_Parent_0.Src.Util.AssetManagerUtilities);
        local l_enableAudioImport_0 = v23.enableAudioImport;
        local l_enableVideoImport_0 = v23.enableVideoImport;
        local l_enableBadgesCallout_0 = v23.enableBadgesCallout;
        local v27 = require(l_Parent_0.Src.Actions.SetBulkImporterRunning);
        local v28 = require(l_Parent_0.Src.Actions.SetRecentAssets);
        local v29 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
        local v30 = require(l_Parent_0.Src.Actions.SetUniverseName);
        local v31 = v10.Store.new(v17, {}, v18);
        local v32 = require(l_Parent_0.Src.Resources.Theme)();
        local v33 = l_ContextServices_0.Analytics.new(v19);
        local v34 = l_ContextServices_0.Localization.new({
            pluginName = "AssetManager", 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            libraries = {
                [v12.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v12.Resources.SourceStrings, 
                    translationResourceTable = v12.Resources.LocalizedStrings
                }
            }
        });
        local v35 = nil;
        if l_enableBadgesCallout_0() then
            v35 = require(l_Parent_0.Src.Util.CalloutController).new();
            v35:defineCallout("AssetManagerBadgesDevProductCallout", "", v34:getText("Callout", "BadgesDevProductsDescription"), "");
        end;
        local v36 = nil;
        local v37 = nil;
        local v38 = 1;
        local v39 = {};
        local function v40()
            if not v36 then
                v36 = v9.mount(v9.createElement(v15, {
                    plugin = v0, 
                    analytics = v33, 
                    focusGui = v37, 
                    localization = v34, 
                    theme = v32, 
                    store = v31, 
                    mouse = v0:getMouse(), 
                    calloutController = v35, 
                    insertAsset = l_InsertAssetContext_0.new(v0, v37)
                }, {
                    MainView = v9.createElement(v22, {})
                }), v37);
                return ;
            else
                warn("Plugin handle already exists");
                return ;
            end;
        end;
        local function _()
            if v36 then
                v9.unmount(v36);
                v36 = nil;
            end;
        end;
        local function v42()
            v37.Enabled = not v37.Enabled;
        end;
        local function v45()
            if not l_ImprovePluginSpeed_AssetManager_0 then
                for _, v44 in ipairs(v39) do
                    v44:disconnect();
                end;
            end;
            if v36 then
                v9.unmount(v36);
                v36 = nil;
            end;
        end;
        local function v46()
            if l_StudioAssetManagerAddRecentlyImportedView_0 then
                v31:dispatch(v28({}));
            end;
            v38 = 1;
        end;
        local function v47()
            if next(v31:getState().AssetManagerReducer.recentAssets) ~= nil then
                v31:dispatch(v29(true));
            end;
        end;
        local v48 = {
            [Enum.AssetType.Image] = "Images/", 
            [Enum.AssetType.MeshPart] = "Meshes/", 
            [Enum.AssetType.Audio] = "Audio/", 
            [Enum.AssetType.Video] = "Video/", 
            [Enum.AssetType.Model] = "Models/"
        };
        local function _(v49, v50)
            return not not v48[v49] and string.gsub(v50, v48[v49], "") or v50;
        end;
        local function v56(v52, v53, v54)
            local v55 = v11.Dictionary.join(v31:getState().AssetManagerReducer.recentAssets, {
                [tostring(v54)] = {
                    key = v38, 
                    assetType = v52, 
                    name = not not v48[v52] and string.gsub(v53, v48[v52], "") or v53, 
                    id = v54
                }
            });
            v38 = v38 + 1;
            v31:dispatch(v28(v55));
        end;
        local function v67()
            local function v57()
                v31:dispatch(v27(true));
                if l_StudioAssetManagerAddRecentlyImportedView_0 then
                    v31:dispatch(v28({}));
                end;
                v38 = 1;
            end;
            if not l_ImprovePluginSpeed_AssetManager_0 then
                l_BulkImportService_0.BulkImportStarted:connect(v57);
            else
                v1.signals["BulkImportService.BulkImportStarted"]:Connect(v57);
            end;
            local function v59(_)
                v31:dispatch(v27(false));
                if l_StudioAssetManagerAddRecentlyImportedView_0 and next(v31:getState().AssetManagerReducer.recentAssets) ~= nil then
                    v31:dispatch(v29(true));
                end;
            end;
            if not l_ImprovePluginSpeed_AssetManager_0 then
                l_BulkImportService_0.BulkImportFinished:connect(v59);
            else
                v1.signals["BulkImportService.BulkImportFinished"]:Connect(v59);
            end;
            if l_StudioAssetManagerAddRecentlyImportedView_0 then
                local function v66(v60, v61, v62)
                    local v63 = v31:getState();
                    local v64 = nil;
                    if not (v60 == Enum.AssetType.Image) or not string.find(v61, "Images/") then
                        if not (v60 == Enum.AssetType.MeshPart) or not string.find(v61, "Meshes/") then
                            if not (l_enableAudioImport_0() and v60 == Enum.AssetType.Audio) or not string.find(v61, "Audio/") then
                                if not (l_enableVideoImport_0() and v60 == Enum.AssetType.Video) or not string.find(v61, "Video/") then
                                    if not (not (v60 == Enum.AssetType.Model) or not string.find(v61, "Models/")) then
                                        v64 = string.gsub(v61, "Models/", "");
                                    end;
                                else
                                    v64 = string.gsub(v61, "Video/", "");
                                end;
                            else
                                v64 = string.gsub(v61, "Audio/", "");
                            end;
                        else
                            v64 = string.gsub(v61, "Meshes/", "");
                        end;
                    else
                        v64 = string.gsub(v61, "Images/", "");
                    end;
                    local v65 = v11.Dictionary.join(v63.AssetManagerReducer.recentAssets, {
                        [tostring(v62)] = {
                            key = v38, 
                            assetType = v60, 
                            name = v64, 
                            id = v62
                        }
                    });
                    v38 = v38 + 1;
                    v31:dispatch(v28(v65));
                end;
                if not l_ImprovePluginSpeed_AssetManager_0 then
                    l_BulkImportService_0.AssetImported:connect(v66);
                else
                    v1.signals["BulkImportService.AssetImported"]:Connect(v66);
                    return ;
                end;
            end;
        end;
        (function()
            v0.Name = "AssetManager";
            local v68 = nil;
            v68 = if not l_ImprovePluginSpeed_AssetManager_0 then v0:CreateToolbar("assetManagerToolbar"):CreateButton("assetManagerToolButton", v34:getText("Main", "Tooltip"), "rbxlocaltheme://AssetManager", v34:getText("Main", "ToolbarButton")) else v1.mainButton;
            if not l_AssetManagerToggleWidgetFix_0 then
                if not l_ImprovePluginSpeed_AssetManager_0 then
                    v68.Click:connect(v42);
                    v68.ClickableWhenViewportHidden = true;
                else
                    v1.mainButtonClickedSignal:Connect(v42);
                end;
            end;
            local function v69()
                if not v37.Enabled then
                    if v36 then
                        v9.unmount(v36);
                        v36 = nil;
                    end;
                else
                    v40();
                end;
                v68:SetActive(v37.Enabled);
            end;
            if not l_ImprovePluginSpeed_AssetManager_0 then
                local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
                v37 = v0:CreateDockWidgetPluginGui("AssetManager_PluginGui", (DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, not l_EnableAssetManagerSortButton_0 and 300 or 350, 600, not l_EnableAssetManagerSortButton_0 and 270 or 350, 256)));
                v37.Name = v34:getText("Meta", "PluginName");
                v37.Title = v34:getText("Main", "Title");
                v37.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            else
                v37 = v1.mainDockWidget;
            end;
            if l_AssetManagerToggleWidgetFix_0 then
                if not l_ImprovePluginSpeed_AssetManager_0 then
                    v68.Click:connect(v42);
                    v68.ClickableWhenViewportHidden = true;
                else
                    v1.mainButtonClickedSignal:Connect(v42);
                end;
            end;
            v37:GetPropertyChangedSignal("Enabled"):connect(v69);
            if not v37.Enabled then
                if v36 then
                    v9.unmount(v36);
                    v36 = nil;
                end;
            else
                v40();
            end;
            v68:SetActive(v37.Enabled);
            v0.Unloading:Connect(v45);
            v67();
            local function v72(v71)
                v31:dispatch(v30(v71));
            end;
            if not l_ImprovePluginSpeed_AssetManager_0 then
                l_StudioPublishService_0.GameNameUpdated:connect(v72);
            else
                v1.signals["StudioPublishService.GameNameUpdated"]:Connect(v72);
            end;
            if not l_ImprovePluginSpeed_AssetManager_0 then
                local v73 = l_AssetManagerService_0.AssetImportedSignal:Connect(v56);
                local v74 = l_AssetManagerService_0.ImportSessionStarted:Connect(v46);
                local v75 = l_AssetManagerService_0.ImportSessionFinished:Connect(v47);
                table.insert(v39, v73);
                table.insert(v39, v74);
                table.insert(v39, v75);
            else
                v1.signals["AssetManagerService.AssetImportedSignal"]:Connect(v56);
                v1.signals["AssetManagerService.ImportSessionStarted"]:Connect(v46);
                v1.signals["AssetManagerService.ImportSessionFinished"]:Connect(v47);
            end;
        end)();
        return ;
    else
        return ;
    end;
end;
