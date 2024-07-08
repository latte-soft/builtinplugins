return function(v0, v1)
    if v0 then
        local l_Parent_0 = script.Parent.Parent;
        local l_Util_0 = l_Parent_0.Core.Util;
        local l_DebugToolboxEnableRoactChecks_0 = game:GetFastFlag("DebugToolboxEnableRoactChecks");
        local l_DebugToolboxGetRolesRequest_0 = game:GetFastFlag("DebugToolboxGetRolesRequest");
        local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
        local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
        local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
        local l_ShowSaveToRobloxOnStudioAssetService_0 = game:GetFastFlag("ShowSaveToRobloxOnStudioAssetService");
        local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
        if not require(l_Util_0.isCli)() then
            local l_StudioService_0 = game:GetService("StudioService");
            local v12 = l_StudioService_0:HasInternalPermission();
            local l_Packages_0 = l_Parent_0.Packages;
            local v14 = require(l_Packages_0.Roact);
            local v15 = require(l_Packages_0.Framework);
            local v16 = require(l_Packages_0.Dev.DeveloperTools);
            if l_DebugToolboxEnableRoactChecks_0 then
                v14.setGlobalConfig({
                    elementTracing = true, 
                    propValidation = true, 
                    typeChecks = true
                });
            end;
            local v17 = require(l_Packages_0.Rodux);
            local v18 = require(l_Util_0.InsertAsset);
            local v19 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
            local v20 = require(l_Util_0.DebugFlags);
            local v21 = require(l_Util_0.Settings);
            local v22 = require(l_Util_0.ToolboxTheme);
            local v23 = require(l_Util_0.AssetConfigTheme);
            local v24 = require(l_Util_0.AssetConfigConstants);
            local v25 = require(l_Util_0.AssetConfigUtil);
            local v26 = require(l_Util_0.Analytics.makeToolboxAnalyticsContext);
            local v27 = require(l_Parent_0.Core.ContextServices.IXPContext);
            if v20.shouldDebugWarnings() then
                require(l_Packages_0.Framework).Util.Promise.onUnhandledRejection = warn;
            end;
            local v28 = require(l_Parent_0.Core.Types.Background);
            local v29 = require(l_Parent_0.Core.Types.Suggestion);
            local v30 = require(l_Parent_0.Core.Types.ConfigTypes);
            local v31 = require(l_Parent_0.Core.Components.ToolboxPlugin);
            local l_getToolboxEnabled_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).getToolboxEnabled;
            local v33 = require(l_Parent_0.Core.Util.ToolboxCommunication);
            local v34 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
            local v35 = require(l_Parent_0.Core.Reducers.AssetConfigReducer);
            local v36 = require(l_Parent_0.Core.Networking.NetworkInterface);
            local v37 = require(l_Parent_0.Core.Components.AssetConfiguration.AssetConfigWrapper);
            local v38 = require(l_Parent_0.Core.Components.ToolboxServiceWrapper);
            local v39 = require(l_Parent_0.Core.Networking.Requests.GetRolesRequest);
            local v40 = require(l_Parent_0.Core.Networking.Requests.GetRolesDebugRequest);
            local v41 = require(l_Parent_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
            local l_ContextServices_0 = v15.ContextServices;
            local l_ThunkWithArgsMiddleware_0 = v15.Util.ThunkWithArgsMiddleware;
            local l_find_0 = require(l_Packages_0.Dash).find;
            local l_SourceStrings_0 = l_Parent_0.LocalizationSource.SourceStrings;
            local l_LocalizedStrings_0 = l_Parent_0.LocalizationSource.LocalizedStrings;
            local l_HttpService_0 = game:GetService("HttpService");
            local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
            local l_StudioAssetService_0 = game:GetService("StudioAssetService");
            if l_getToolboxEnabled_0() then
                local v50 = l_ContextServices_0.Localization.new({
                    stringResourceTable = l_SourceStrings_0, 
                    translationResourceTable = l_LocalizedStrings_0, 
                    pluginName = "Toolbox", 
                    libraries = {
                        [v15.Resources.LOCALIZATION_PROJECT_NAME] = {
                            stringResourceTable = v15.Resources.SourceStrings, 
                            translationResourceTable = v15.Resources.LocalizedStrings
                        }
                    }
                });
                local function v53()
                    return v22.new({
                        getTheme = function()
                            return settings().Studio.Theme;
                        end, 
                        isDarkerTheme = function(v51)
                            local l_v51_Color_0 = v51:GetColor(Enum.StudioStyleGuideColor.MainBackground);
                            return ((l_v51_Color_0.r + l_v51_Color_0.g) + l_v51_Color_0.b) / 3 < 0.5;
                        end, 
                        themeChanged = settings().Studio.ThemeChanged
                    });
                end;
                local function v54()
                    return v23.new({
                        getTheme = function()
                            return settings().Studio.Theme;
                        end, 
                        themeChanged = settings().Studio.ThemeChanged
                    });
                end;
                local v55 = nil;
                local v56 = nil;
                local function v85(v57, v58, v59, v60, v61, v62)
                    if not v56 then
                        local v63 = {};
                        local v64 = {};
                        local v65 = {};
                        local v66 = {};
                        local v67 = {};
                        local v68 = false;
                        local v69 = {};
                        local v70 = 0;
                        if v55 then
                            v63 = v55:getState().roles.allowedAssetTypesForRelease;
                            v64 = v55:getState().roles.allowedAssetTypesForUpload;
                            v65 = v55:getState().roles.allowedAssetTypesForFree;
                            v66 = v55:getState().roles.allowedBundleTypeSettings;
                            v67 = v55:getState().packages.permissionsTable;
                            v68 = v55:getState().itemTags.isItemTagsFeatureEnabled;
                            v69 = v55:getState().itemTags.enabledAssetTypesForItemTags;
                            v70 = v55:getState().itemTags.maximumItemTagsPerItem;
                        end;
                        local v71 = nil;
                        local v72 = if not not v55:getState() and v55:getState().assets then v55:getState().assets.idToAssetMap else nil;
                        if v72 then
                            local v75 = l_find_0(v72, function(_, v74)
                                return v57 == v74;
                            end);
                            v71 = if not not v75 and v75.Asset then v75.Asset.AssetMediaIds else nil;
                        end;
                        local v76 = v25.getFlowStartScreen(v58, v63);
                        local v77 = v30:getDefualtTab();
                        if v58 == v24.FLOW_TYPE.DOWNLOAD_FLOW then
                            v77 = v30:getOverrideTab();
                        end;
                        local v78 = v17.Store.new(v35, {
                            assetId = v57, 
                            assetMediaIds = v71, 
                            screenFlowType = v58, 
                            currentScreen = v76, 
                            instances = v59, 
                            sourceInstances = ((l_UnifyModelPackagePublish3_0 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0) or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0) and v61 or nil, 
                            allowedAssetTypesForRelease = v63, 
                            allowedAssetTypesForUpload = v64, 
                            allowedAssetTypesForFree = v65, 
                            allowedBundleTypeSettings = v66, 
                            idToFiatProductMap = {}, 
                            isItemTagsFeatureEnabled = v68, 
                            enabledAssetTypesForItemTags = v69, 
                            maximumItemTagsPerItem = v70, 
                            rollingAssetPermissionRequests = if not v41() then nil else {
                                inProgress = {}, 
                                queued = {}
                            }, 
                            assetTypeEnum = v60, 
                            currentTab = v77, 
                            packagePermissions = v67, 
                            overrideCursor = {}, 
                            deleteLocal = false, 
                            hasSubsequent = v62, 
                            sellerStatusData = if not v10() then nil else {}
                        }, {
                            l_ThunkWithArgsMiddleware_0({
                                StudioAssetService = l_StudioAssetService_0
                            })
                        });
                        local v79 = v54();
                        v56 = v14.mount((v14.createElement(v38, {
                            ixp = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v27.new(), 
                            localization = v50, 
                            plugin = v0, 
                            theme = v79, 
                            store = v78, 
                            settings = settings
                        }, {
                            (v14.createElement(v37, {
                                assetId = v57, 
                                assetTypeEnum = v60, 
                                plugin = v0, 
                                store = v78, 
                                theme = v79, 
                                networkInterface = v36.new(), 
                                onAssetConfigDestroy = function()
                                    if v56 then
                                        local function _()
                                            local l_Toolbox_0 = l_RobloxPluginGuiService_0:FindFirstChild("Toolbox");
                                            local v81 = l_Toolbox_0 and l_Toolbox_0:FindFirstChild("tabRefresh");
                                            if v81 then
                                                v81:Fire();
                                            end;
                                        end;
                                        local l_Toolbox_1 = l_RobloxPluginGuiService_0:FindFirstChild("Toolbox");
                                        local v84 = l_Toolbox_1 and l_Toolbox_1:FindFirstChild("tabRefresh");
                                        if v84 then
                                            v84:Fire();
                                        end;
                                        v14.unmount(v56);
                                        v56 = nil;
                                        l_StudioService_0:AnimationIdSelected(0);
                                    end;
                                end
                            }))
                        })));
                        return ;
                    else
                        return ;
                    end;
                end;
                (function()
                    v55 = v17.Store.new(v34, nil, {
                        v17.thunkMiddleware
                    });
                    local v86 = v19.new();
                    local v87 = v26();
                    local v88 = v21.new(v0);
                    local v89 = v53();
                    local v90 = v36.new();
                    local l_BACKGROUNDS_0 = v28.BACKGROUNDS;
                    local l_SUGGESTIONS_0 = v29.SUGGESTIONS;
                    local v93 = nil;
                    local v94 = nil;
                    if v12 then
                        v94 = v16.forPlugin("Toolbox", v0);
                    end;
                    local function v95()
                        if v93 then
                            v14.unmount(v93);
                        end;
                        if v94 then
                            v94:destroy();
                        end;
                    end;
                    v33:setup(v55);
                    local v101 = v14.createElement(v31, {
                        plugin = v0, 
                        store = v55, 
                        settings = v88, 
                        theme = v89, 
                        networkInterface = v90, 
                        pluginLoaderContext = v1, 
                        backgrounds = l_BACKGROUNDS_0, 
                        suggestions = l_SUGGESTIONS_0, 
                        onPluginWillDestroy = v95, 
                        tryOpenAssetConfig = function(v96, v97, v98, v99)
                            local function v100()
                                v85(v96, v97, v98, v99);
                            end;
                            if not l_DebugToolboxGetRolesRequest_0 then
                                v55:dispatch(v39(v90)):andThen(v100, v100);
                                return ;
                            else
                                v55:dispatch(v40(v90)):andThen(v100, v100);
                                return ;
                            end;
                        end
                    });
                    local v102 = v27.new();
                    local _ = nil;
                    v93 = v14.mount((v14.createElement(v38, {
                        localization = v50, 
                        plugin = v0, 
                        theme = v89, 
                        store = v55, 
                        settings = v88, 
                        assetAnalytics = v86, 
                        analytics = v87, 
                        ixp = v102
                    }, {
                        v101
                    })));
                    if v94 then
                        v94:addRoactTree("Roact tree", v93, v14);
                    end;
                    if not l_UnifyModelPackagePublish3_0 and not l_ShowSaveToRobloxOnStudioAssetService_0 then
                        v1.signals["StudioService.OnSaveToRoblox"]:Connect(function(v104)
                            local function v106()
                                local v105 = v25.getClonedInstances(v104);
                                if not (#v105 == 1) or not v105[1]:IsA("AnimationClip") then
                                    v85(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v105, nil, v104);
                                    return ;
                                else
                                    v85(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v105, Enum.AssetType.Animation);
                                    return ;
                                end;
                            end;
                            if not l_DebugToolboxGetRolesRequest_0 then
                                v55:dispatch(v39(v90)):andThen(v106, v106);
                                return ;
                            else
                                v55:dispatch(v40(v90)):andThen(v106, v106);
                                return ;
                            end;
                        end);
                    else
                        v1.signals["StudioAssetService.OnSaveToRoblox"]:Connect(function(v107, v108, v109)
                            local function v111()
                                local v110 = v25.getClonedInstances(v107);
                                assert(v109 ~= nil);
                                if v108 ~= nil then
                                    v85(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v110, if typeof(v108) == "EnumItem" then v108 else if typeof(v108) == "string" then v24.UGCBundleTypes[v108] else nil, v107, v109);
                                    return ;
                                elseif not (#v110 == 1) or not v110[1]:IsA("AnimationClip") then
                                    v85(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v110, nil, v107, v109);
                                    return ;
                                else
                                    v85(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v110, Enum.AssetType.Animation, nil, v109);
                                    return ;
                                end;
                            end;
                            if not l_DebugToolboxGetRolesRequest_0 then
                                v55:dispatch(v39(v90)):andThen(v111, v111);
                                return ;
                            else
                                v55:dispatch(v40(v90)):andThen(v111, v111);
                                return ;
                            end;
                        end);
                    end;
                    v1.signals["StudioService.OnImportFromRoblox"]:Connect(function(_)
                        v85(nil, v24.FLOW_TYPE.DOWNLOAD_FLOW, nil, Enum.AssetType.Animation);
                    end);
                    v1.signals["StudioService.OnOpenManagePackagePlugin"]:Connect(function(_, v114)
                        v85(v114, v24.FLOW_TYPE.EDIT_FLOW, nil, Enum.AssetType.Model);
                    end);
                    v1.signals["StudioService.OnPublishAsPlugin"]:Connect(function(v115)
                        local function v116()
                            v85(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v25.getClonedInstances(v115), Enum.AssetType.Plugin);
                        end;
                        if not l_DebugToolboxGetRolesRequest_0 then
                            v55:dispatch(v39(v90)):andThen(v116, v116);
                            return ;
                        else
                            v55:dispatch(v40(v90)):andThen(v116, v116);
                            return ;
                        end;
                    end);
                    v1.signals["MemStorageService.OpenAssetConfiguration"]:Connect(function(v117)
                        local v118 = l_HttpService_0:JSONDecode(v117);
                        if v118.assetType == Enum.AssetType.Image then
                            v85(v118.id, v24.FLOW_TYPE.EDIT_FLOW, nil, Enum.AssetType.Image);
                            return ;
                        else
                            v85(v118.id, v24.FLOW_TYPE.EDIT_FLOW, nil, Enum.AssetType.MeshPart);
                            return ;
                        end;
                    end);
                    v18.registerLocalization(v50);
                    v18.registerProcessDragHandler(v0);
                end)();
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
end;
