local l_HttpService_0 = game:GetService("HttpService");
local l_ToolboxEnableAudioGrantDialog_0 = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Cryo);
local v8 = require(l_Packages_0.Roact);
local v9 = require(l_Packages_0.RoactRodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.DebugFlags);
local v13 = require(l_Util_0.Images);
local v14 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v15 = require(l_Util_0.InsertToolPromise);
local v16 = require(l_Util_0.InsertAsset);
local v17 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v17 = require(l_Util_0.getIsIXPVariableEnabled);
end;
local v18 = require(l_Util_0.getIsWithinBounds);
local v19 = require(l_Parent_0.Core.Types.Category);
local v20 = require(l_Parent_0.Core.Components.Asset.Preview.AssetPreviewWrapper);
local v21 = require(l_Parent_0.Core.Components.MessageBox.MessageBox);
local v22 = require(l_Parent_0.Core.Components.ScriptConfirmationDialog);
local v23 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v24 = require(l_Parent_0.Core.Components.PurchaseFlow.PurchaseFlowWrapper);
local v25 = require(l_Parent_0.Core.Components.PurchaseFlow.SubsequentDialogController);
local v26 = require(l_Parent_0.Core.Networking.Requests.PostInsertAssetRequest);
local v27 = require(l_Parent_0.Core.Actions.SetMostRecentAssetInsertTime);
local v28 = require(l_Parent_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v29 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v30 = require(l_Parent_0.Core.Actions.SetAssetPreview);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v33 = require(l_Parent_0.Core.ContextServices.Settings);
local v34 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v36 = require(l_Parent_0.Core.Types.ConfigTypes);
local _ = require(l_Parent_0.Core.Types.CreatorTypes);
local _ = require(l_Parent_0.Core.Types.AssetLogicTypes);
local _ = require(l_Packages_0.Framework).Util.deepEqual;
local v40 = require(l_Packages_0.Dash);
local v41 = require(l_Parent_0.Core.ContextServices.NavigationContext);
return function(v42)
    local v43 = v8.PureComponent:extend("AssetLogicWrapper");
    v43.defaultProps = {
        Size = UDim2.new(1, 0, 1, 0)
    };
    v43.init = function(v44)
        v44.ref = v8.createRef();
        v44.state = {
            hoveredAssetId = 0, 
            isShowingToolMessageBox = false, 
            isShowingScriptWarningMessageBox = false, 
            previewAssetData = v8.None, 
            isShowingGrantPermissionsMessageBox = false, 
            scriptWarningInfo = nil, 
            grantPermissionsInfo = nil
        };
        v44.lastInsertAttemptTime = 0;
        v44.canInsertAsset = function()
            local v45 = false;
            if v11.TIME_BETWEEN_ASSET_INSERTION < tick() - v44.lastInsertAttemptTime then
                v45 = not v44.insertToolPromise:isWaiting();
            end;
            return v45;
        end;
        v44.onMessageBoxClosed = function()
            v44:setState({
                isShowingToolMessageBox = false
            });
            v44.insertToolPromise:insertToWorkspace();
        end;
        v44.onMessageBoxButtonClicked = function(_, v47)
            v44:setState({
                isShowingToolMessageBox = false
            });
            if v47 == "yes" then
                v44.insertToolPromise:insertToStarterPack();
                return ;
            else
                if v47 == "no" then
                    v44.insertToolPromise:insertToWorkspace();
                end;
                return ;
            end;
        end;
        v44.onInsertToolPrompt = function()
            v44:setState({
                isShowingToolMessageBox = true
            });
        end;
        v44.onScriptWarningBoxConfirmed = function()
            v44:setState({
                isShowingScriptWarningMessageBox = false
            });
            v44.insertToolPromise:dismissWarningPrompt();
            v44.state.scriptWarningInfo.insert();
        end;
        v44.onScriptWarningBoxCanceled = function()
            v44:setState({
                isShowingScriptWarningMessageBox = false
            });
            v44.state.scriptWarningInfo.cancel();
            v44.insertToolPromise:cancel();
            v44.insertToolPromise:dismissWarningPrompt();
        end;
        v44.onInsertScriptWarningPrompt = function(v48)
            if not v44.props._tutorialLimits or not v44.props._tutorialLimits.scriptWarningOverride then
                if not v44.props._Settings:get("Plugin"):getShowScriptWarning() then
                    return false;
                else
                    v44:setState({
                        isShowingScriptWarningMessageBox = true, 
                        scriptWarningInfo = v48
                    });
                    return true;
                end;
            else
                return false;
            end;
        end;
        v44.onScriptWarningBoxToggleShow = function(v49)
            v44.props._Settings:get("Plugin"):setShowScriptWarning(v49);
        end;
        v44.onPermissionsGrantClosed = function()
            if l_ToolboxEnableAudioGrantDialog_0 then
                v44:setState({
                    isShowingGrantPermissionsMessageBox = false
                });
                v44.insertToolPromise:returnResult(false);
                return ;
            else
                return ;
            end;
        end;
        v44.onPermissionsGranted = function(_, v51)
            if l_ToolboxEnableAudioGrantDialog_0 then
                v44:setState({
                    isShowingGrantPermissionsMessageBox = false
                });
                v44.insertToolPromise:returnResult(v51 == "yes");
                return ;
            else
                return ;
            end;
        end;
        v44.onPermissionsGrantCallback = function(v52)
            if l_ToolboxEnableAudioGrantDialog_0 then
                v44:setState({
                    isShowingGrantPermissionsMessageBox = true, 
                    grantPermissionsInfo = v52
                });
                return ;
            else
                return ;
            end;
        end;
        v44.insertToolPromise = v15.new(v44.onInsertToolPrompt, v44.onInsertScriptWarningPrompt, v44.onPermissionsGrantCallback);
        if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
            v44.getIsIXPVariableEnabled = function(v53, v54)
                return v17(v44.props._IXP, v53, v54);
            end;
        end;
        v44.tryInsert = function(v55, v56, v57, v58, v59)
            v44.lastInsertAttemptTime = tick();
            local l_Asset_0 = v55.Asset;
            local l_Id_0 = l_Asset_0.Id;
            local l_Name_0 = l_Asset_0.Name;
            local l_TypeId_0 = l_Asset_0.TypeId;
            local l_AssetSubTypes_0 = l_Asset_0.AssetSubTypes;
            local l_props_0 = v44.props;
            local l__categoryName_0 = l_props_0._categoryName;
            local v67 = l_props_0._searchTerm or "";
            local l_assetIndex_0 = l_props_0.assetIndex;
            local l__layoutMode_0 = l_props_0._layoutMode;
            local l__tutorialLimits_0 = l_props_0._tutorialLimits;
            local v71 = v44.props._Plugin:get();
            local l_networkInterface_0 = v44.props._Network.networkInterface;
            local v76, v77 = v16.tryInsert({
                plugin = v71, 
                assetId = l_Id_0, 
                assetName = l_Name_0, 
                assetSubTypes = l_AssetSubTypes_0, 
                assetTypeId = l_TypeId_0, 
                assetVersionId = v59, 
                tutorialLimits = l__tutorialLimits_0, 
                onSuccess = function(v73, v74)
                    if v19.ToolboxMarketplaceAssetTypes[v19.EngineAssetTypeIdToToolboxAssetType[l_TypeId_0]] then
                        v44.props._postInsertAssetRequest(l_networkInterface_0, v73);
                    end;
                    v44.props._setMostRecentAssetInsertTime();
                    v57 = v57 or (v56 and "DragInsert" or "ClickInsert");
                    local v75 = v44.props._getPageInfoAnalyticsContextInfo();
                    if not (not (typeof(v74) ~= "Instance" and typeof(v74) ~= "userdata") or typeof(v74) == "table") then
                        v74 = nil;
                    end;
                    v44.props._AssetAnalytics:get():logInsert(v55, v57, v74, v75, v58, if not v4() then nil else l__layoutMode_0);
                end, 
                currentCategoryName = l__categoryName_0, 
                categoryName = l__categoryName_0, 
                layoutMode = if not v4() then nil else l__layoutMode_0, 
                searchTerm = v67, 
                assetIndex = l_assetIndex_0, 
                getIsIXPVariableEnabled = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v44.getIsIXPVariableEnabled
            }, v44.insertToolPromise, v56, l_networkInterface_0);
            return v76, v77;
        end;
        v44.openAssetPreview = function(v78, v79)
            v44:setState(function()
                return {
                    previewAssetData = v78
                };
            end);
            v44.props._onPreviewToggled(true, v78.Asset.Id, v79);
        end;
        v44.closeAssetPreview = function(_)
            v44:setState(function()
                return {
                    previewAssetData = v8.None
                };
            end);
            v44.props._onPreviewToggled(false, v8.None, nil);
        end;
        v44.logAssetImpression = function(v81, v82, v83, v84, v85, v86, v87)
            local v88 = v44.props._getPageInfoAnalyticsContextInfo();
            local l__layoutMode_1 = v44.props._layoutMode;
            if not ((v83 ~= nil and v84 ~= nil) and v85 ~= nil) or v86 == nil then
                if v12.shouldDebugWarnings() then
                    local v90 = {};
                    if v83 == nil then
                        table.insert(v90, "instanceAbsoluteSize");
                    end;
                    if v84 == nil then
                        table.insert(v90, "instanceAbsolutePosition");
                    end;
                    if v85 == nil then
                        table.insert(v90, "parentAbsoluteSize");
                    end;
                    if v86 == nil then
                        table.insert(v90, "parentAbsolutePosition");
                    end;
                    warn("Unable to log asset impression. LogAssetImpression was called with nil parameters: ", table.concat(v90, ", "));
                end;
                return false;
            else
                local v91 = true;
                if v83.X ~= 0 then
                    v91 = v83.Y == 0;
                end;
                local v92 = v18(v84, v85, v86) or v18(Vector2.new(v84.X + v83.X, v84.Y + v83.Y), v85, v86);
                if not (((not v81 or not v92) or v82) or v91) then
                    v44.props._AssetAnalytics:get():logImpression(v81, v88, v87, if not v4() then nil else l__layoutMode_1);
                end;
                return v92 and not v91;
            end;
        end;
        if v5() then
            v44.onSearchByCreator = function(v93, v94)
                local l_props_1 = v44.props;
                local l_networkInterface_1 = l_props_1._Network.networkInterface;
                local v97 = l_props_1._Settings:get("Plugin");
                local v98 = v19.getTabForCategoryName(l_props_1._categoryName) == v19.INVENTORY;
                local v99 = nil;
                if not v98 then
                    v99 = v40.join({
                        Creator = v93.Name
                    }, v94);
                else
                    local v100 = if not v93 then nil else {
                        [tostring(v93.Id)] = {
                            Name = v93.Name, 
                            Id = v93.Id, 
                            Type = if v93.Type == v36.OWNER_TYPES.Group then Enum.CreatorType.Group else Enum.CreatorType.User
                        }
                    };
                    v99 = v40.join({
                        creatorTargetIds = if v93.Type == v36.OWNER_TYPES.User then v100 else nil, 
                        groupTargetIds = if v93.Type == v36.OWNER_TYPES.Group then v100 else nil
                    }, v94);
                end;
                l_props_1._searchWithOptions(l_networkInterface_1, v97, v99);
            end;
        end;
    end;
    v43.willUnmount = function(v101)
        v101.insertToolPromise:destroy();
    end;
    v43.didUpdate = function(v102, _, _)
        local l__previewAssetData_0 = v102.props._previewAssetData;
        local l_previewAssetData_0 = v102.state.previewAssetData;
        if (not (((not (l_previewAssetData_0 and l_previewAssetData_0 ~= v8.None) or not l_previewAssetData_0.Asset) or not l__previewAssetData_0) or not l__previewAssetData_0.Asset) and l_previewAssetData_0.Asset.Id == l__previewAssetData_0.Asset.Id) and l_previewAssetData_0 ~= l__previewAssetData_0 then
            v102:setState({
                previewAssetData = l__previewAssetData_0
            });
        end;
    end;
    v43.render = function(v107)
        local l_props_2 = v107.props;
        local l_state_0 = v107.state;
        local l__isPreviewing_0 = l_props_2._isPreviewing;
        local l_TryOpenAssetConfig_0 = l_props_2.TryOpenAssetConfig;
        local l_isShowingToolMessageBox_0 = l_state_0.isShowingToolMessageBox;
        local l_isShowingScriptWarningMessageBox_0 = l_state_0.isShowingScriptWarningMessageBox;
        local l_isShowingGrantPermissionsMessageBox_0 = l_state_0.isShowingGrantPermissionsMessageBox;
        local l_scriptWarningInfo_0 = l_state_0.scriptWarningInfo;
        local l_grantPermissionsInfo_0 = l_state_0.grantPermissionsInfo;
        local v117 = l_state_0.previewAssetData or l_props_2._previewAssetData;
        local l__Localization_0 = v107.props._Localization;
        return v8.createFragment({
            ToolScriptWarningMessageBox = l_isShowingScriptWarningMessageBox_0 and v8.createElement(v22, {
                Name = string.format("ToolboxToolScriptWarningMessageBox-%s", l_HttpService_0:GenerateGUID()), 
                Info = l_scriptWarningInfo_0, 
                Icon = v13.INFO_ICON, 
                onClose = v107.onScriptWarningBoxCanceled, 
                onCancel = v107.onScriptWarningBoxCanceled, 
                onOkButtonClicked = v107.onScriptWarningBoxConfirmed, 
                onChangeShowDialog = v107.onScriptWarningBoxToggleShow
            }), 
            GrantPermissionsMessageBox = l_isShowingGrantPermissionsMessageBox_0 and v8.createElement(v21, {
                Name = string.format("ToolboxPermissionsMessageBox-%s", l_HttpService_0:GenerateGUID()), 
                Title = l__Localization_0:getText("General", "RobloxStudio"), 
                Text = l__Localization_0:getText("GrantAssetPermission", "DialogText"), 
                InformativeText = l__Localization_0:getText("GrantAssetPermission", "Information", {
                    assetName = l_grantPermissionsInfo_0.assetName, 
                    assetId = l_grantPermissionsInfo_0.assetId, 
                    assetType = l_grantPermissionsInfo_0.assetType
                }), 
                Icon = v13.WARNING_ICON, 
                IconColor = Color3.fromHex("#FFAA21"), 
                onClose = v107.onPermissionsGrantClosed, 
                onButtonClicked = v107.onPermissionsGranted, 
                buttons = {
                    {
                        Text = l__Localization_0:getText("GrantAssetPermission", "CancelButton"), 
                        action = "no"
                    }, 
                    {
                        Text = l__Localization_0:getText("GrantAssetPermission", "GrantButton"), 
                        action = "yes"
                    }
                }
            }), 
            ToolMessageBox = l_isShowingToolMessageBox_0 and v8.createElement(v21, {
                Name = string.format("ToolboxToolMessageBox-%s", l_HttpService_0:GenerateGUID()), 
                Title = l__Localization_0:getText("InsertTool", "DialogTitle"), 
                Text = l__Localization_0:getText("InsertTool", "DialogText"), 
                Icon = v13.INFO_ICON, 
                onClose = v107.onMessageBoxClosed, 
                onButtonClicked = v107.onMessageBoxButtonClicked, 
                buttons = {
                    {
                        Text = l__Localization_0:getText("Common", "Yes"), 
                        action = "yes"
                    }, 
                    {
                        Text = l__Localization_0:getText("Common", "No"), 
                        action = "no"
                    }
                }
            }), 
            AssetPreview = (l__isPreviewing_0 and v117 ~= v8.None) and v8.createElement(v20, {
                assetData = v117, 
                canInsertAsset = v107.canInsertAsset, 
                logAssetImpression = v107.logAssetImpression, 
                onAssetPreviewButtonClicked = v107.openAssetPreview, 
                onClose = v107.closeAssetPreview, 
                onSearchByCreator = if not v5() then nil else v107.onSearchByCreator, 
                tryInsert = v107.tryInsert, 
                tryOpenAssetConfig = l_TryOpenAssetConfig_0
            }), 
            SubsequentDialogController = v8.createElement(v25), 
            PurchaseFlowWrapper = v8.createElement(v24, {
                AssetData = v117, 
                TryInsert = v107.tryInsert
            }), 
            Contents = v8.createElement(v42, (v40.omit(v7.Dictionary.join(l_props_2, {
                CanInsertAsset = v107.canInsertAsset, 
                ClearHoveredAsset = v107.clearHoveredAsset, 
                LogAssetImpression = v107.logAssetImpression, 
                TryInsert = v107.tryInsert, 
                TryOpenAssetConfig = l_TryOpenAssetConfig_0, 
                OnAssetPreviewButtonClicked = v107.openAssetPreview, 
                OnSearchByCreator = if not v5() then nil else v107.onSearchByCreator
            }), {
                "_categoryName", 
                "_isPreviewing", 
                "_previewAssetId", 
                "_previewAssetData", 
                "_searchTerm", 
                "_searchTerm", 
                "_onPreviewToggled", 
                "_postInsertAssetRequest", 
                "_searchWithOptions", 
                "_setMostRecentAssetInsertTime", 
                "_AssetAnalytics", 
                "_Localization", 
                "_Plugin", 
                "_Settings", 
                "_Network"
            })))
        });
    end;
    return v9.connect(function(v119, _)
        v119 = v119 or {};
        local v121 = v119.assets or {};
        local v122 = v119.pageInfo or {};
        return {
            _categoryName = v122.categoryName or v19.DEFAULT.name, 
            _isPreviewing = v121.isPreviewing or false, 
            _layoutMode = if not v4() then nil else v122.layoutMode, 
            _previewAssetData = (v121.idToAssetMap or {})[v121.previewAssetId], 
            _searchTerm = v122.searchTerm or "", 
            _tutorialLimits = v119.tutorialLimits
        };
    end, function(v123)
        return {
            _onPreviewToggled = function(v124, v125, v126)
                v123(v30(v124, v125, v126));
            end, 
            _postInsertAssetRequest = function(v127, v128)
                v123(v26(v127, v128));
            end, 
            _setMostRecentAssetInsertTime = function()
                v123(v27());
            end, 
            _getPageInfoAnalyticsContextInfo = function()
                return v123(v28());
            end, 
            _searchWithOptions = function(v129, v130, v131)
                v123(v29(v129, v130, v131));
            end
        };
    end)((l_withContext_0({
        _AssetAnalytics = v14, 
        _Localization = l_ContextServices_0.Localization, 
        _Plugin = l_ContextServices_0.Plugin, 
        _Settings = v33, 
        _IXP = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v23, 
        _Network = v34, 
        _NavigationContext = v41
    })(v43)));
end;
