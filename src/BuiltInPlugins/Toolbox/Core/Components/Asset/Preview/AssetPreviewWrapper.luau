local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local _ = require(l_Util_0.InsertAsset);
local v10 = require(l_Util_0.Analytics.Analytics);
local v11 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v13 = require(l_Util_0.DebugFlags);
local v14 = require(l_Util_0.getUserId);
local l_AssetPreview_0 = require(l_Packages_0.Framework).UI.AssetPreview;
local v16 = require(l_Packages_0.Dash);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v19 = require(l_Parent_0.Core.ContextServices.Settings);
local v20 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v21 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v22 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v23 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v24 = require(l_Parent_0.Core.Actions.ClearPreview);
local _ = require(l_Parent_0.Core.Actions.EnqueueSubsequentDialog);
local v26 = require(l_Parent_0.Core.Actions.PausePreviewSound);
local v27 = require(l_Parent_0.Core.Actions.SetAssetPreview);
local v28 = require(l_Parent_0.Core.Actions.SetPurchaseDialogVisibility);
local v29 = require(l_Parent_0.Core.Actions.SetPurchaseStatus);
local v30 = require(l_Parent_0.Core.Components.Asset.Preview.SuggestionsWrapper);
local _ = require(l_Parent_0.Core.Components.PurchaseFlow.PluginPurchaseFlow);
local _ = require(l_Parent_0.Core.Components.PurchaseFlow.PurchaseSuccessDialog);
local v33 = require(l_Parent_0.Core.Components.Asset.Preview.AssetPreviewFooter);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v35 = require(l_Requests_0.GetPreviewInstanceRequest);
local v36 = require(l_Requests_0.GetCodeSummaryRequest);
local v37 = require(l_Requests_0.GetPluginInfoRequest);
local v38 = require(l_Requests_0.SearchWithOptions);
local v39 = require(l_Requests_0.PostUnvoteRequest);
local v40 = require(l_Requests_0.PostVoteRequest);
local v41 = require(l_Parent_0.Core.Networking.Requests.GetOwnsAssetRequest);
local v42 = require(l_Parent_0.Core.Actions.ClearPurchaseFlow);
local v43 = require(l_Requests_0.GetFavoriteCountsRequest);
local v44 = require(l_Requests_0.GetFavoritedRequest);
local v45 = require(l_Requests_0.ToggleFavoriteStatusRequest);
local v46 = require(l_Parent_0.Core.Thunks.TryCreateContextMenu);
local v47 = require(l_Parent_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v48 = require(l_Requests_0.GetAssetContentAttributionInfoRequest);
local v49 = require(l_Requests_0.GetBuyerStatusRequest);
local v50 = require(l_Parent_0.Core.Components.ResultsFetcher);
local v51 = require(l_Parent_0.Core.Types.AssetSubTypes);
local v52 = require(l_Parent_0.Core.Types.BuyerStatus);
local v53 = require(l_Parent_0.Core.Types.Category);
local v54 = require(l_Parent_0.Core.Types.PurchaseStatus);
local v55 = v4.PureComponent:extend("AssetPreviewWrapper");
local l_ToolboxAssetPreviewProtectAgainstNilAssetData_0 = game:GetFastFlag("ToolboxAssetPreviewProtectAgainstNilAssetData");
local v57 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local v58 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local l_disableRatings_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableRatings;
local v60 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local v61 = require(l_Util_0.SharedFlags.getIsIXPEnabledForCodeUnderstanding);
local v62 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v63 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v64 = require(l_Util_0.FiatUtil);
local v65 = require(l_Util_0.getReportUrl);
local v66 = Color3.fromRGB(0, 0, 0);
v55.createPurchaseFlow = function(v67)
    local l_props_0 = v67.props;
    local l_assetData_0 = l_props_0.assetData;
    local l_Asset_0 = l_assetData_0.Asset;
    local l_Id_0 = l_Asset_0.Id;
    local l_Owned_0 = l_props_0.Owned;
    local v73 = l_assetData_0.Asset.TypeId or Enum.AssetType.Model.Value;
    local v74 = v73 == Enum.AssetType.Plugin.Value;
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    local v78 = v53.shouldShowPrices(l_props_0.categoryName);
    if v78 then
        local l_FiatProduct_0 = l_assetData_0.FiatProduct;
        if not l_FiatProduct_0 or not l_FiatProduct_0.PurchasePrice then
            if not v63() then
                v77 = true;
                local v80 = not not l_assetData_0.Product and l_assetData_0.Product.Price or 0;
                v75 = v80 == 0;
                v76 = if not v75 then v80 else if v74 then l_props_0.Localization:getText("Common", "Install") else l_props_0.Localization:getText("Purchase", "Free");
            elseif v13.shouldDebugWarnings() then
                warn(("Expected fiatProduct for categoryName %s, but found none for assetId %s"):format(l_props_0.categoryName, l_Asset_0.Id));
            end;
        else
            v77 = false;
            v75 = v64.isFree(l_FiatProduct_0.Price);
            v76 = if not v75 then l_props_0.Localization:getText("Purchase", "BuyForPrice", {
                price = v64.displayStringFromMoney(l_FiatProduct_0.PurchasePrice, l_props_0.Localization)
            }) else if v74 then l_props_0.Localization:getText("Common", "Install") else l_props_0.Localization:getText("Purchase", "Free");
        end;
    end;
    local v81 = nil;
    local l_previewPluginData_0 = v67.props.previewPluginData;
    if l_previewPluginData_0 then
        v81 = l_previewPluginData_0.versionId;
    end;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    v83 = v74 and l_StudioService_0:IsPluginInstalled(l_Id_0);
    local v86 = v73 == Enum.AssetType.FontFamily.Value;
    local v87 = v74 or v86;
    local l_v74_0 = v74;
    if l_v74_0 then
        l_v74_0 = false;
        if v81 == nil then
            l_v74_0 = l_Owned_0 == nil;
        end;
    end;
    v84 = l_v74_0;
    v85 = ((v74 and not v84) and v81) and l_StudioService_0:IsPluginUpToDate(l_Id_0, v81);
    l_v74_0 = l_props_0.PurchaseStatus;
    if not (not (not (l_v74_0 ~= v54.Success) or l_v74_0 == v54.Waiting) or v83) then
        v84 = true;
    end;
    local v89 = v87 and v67.state.showInstallationBar;
    v84 = v84 or v89;
    local v90 = true;
    if v73 ~= Enum.AssetType.Model.Value then
        v90 = v74 or v67.state.overrideEnableVoting;
    end;
    local v91 = v74 and not v83;
    local v92;
    if v74 then
        v92 = v84;
        if not v92 then
            v92 = v85;
            if v92 then
                goto label0;
            end;
        else
            goto label0;
        end;
    end;
    if v74 then
        v92 = true;
        if not (v81 ~= nil) then
            goto label0;
        end;
    end;
    v92 = not not v86 and l_Owned_0 or v87 and l_Owned_0 == nil;
    ::label0::;
    v92 = v92 and l_v74_0 ~= v54.Failed;
    local v93 = if v78 or v87 then v67.tryInstall else v67.tryInsert;
    local v94 = nil;
    local v95 = l_props_0.Localization:getText("Common", "Insert");
    if not v74 then
        if not v78 or l_Owned_0 then
            if v84 then
                v95 = if not v75 then l_props_0.Localization:getText("Purchase", "PendingPurchase") else l_props_0.Localization:getText("General", "Installing");
            end;
        else
            v95 = v76 or v95;
        end;
    elseif v81 == nil then
        v95 = l_props_0.Localization:getText("Common", "Loading");
    elseif not v84 then
        if v83 then
            v95 = if v85 then l_props_0.Localization:getText("Common", "Installed") else l_props_0.Localization:getText("Common", "Update");
        elseif l_Owned_0 then
            v95 = l_props_0.Localization:getText("Common", "Install");
        else
            v95 = v76 or v95;
            v94 = v77;
        end;
    else
        v95 = if v75 or l_Owned_0 then l_props_0.Localization:getText("General", "Installing") else l_props_0.Localization:getText("Purchase", "PendingPurchase");
    end;
    if v86 then
        v95 = if not l_Owned_0 then if v78 then v76 or v95 else l_props_0.Localization:getText("Common", "Install") else l_props_0.Localization:getText("Common", "Installed");
    end;
    return {
        InstallDisabled = v92, 
        ActionBarText = v95, 
        ShowInstallationBar = v89, 
        ShowRobuxIcon = v94, 
        HasRating = v90, 
        IsUninstalledPlugin = v91, 
        TryInsert = v93
    };
end;
v55.init = function(v96, v97)
    v96.assetPreviewScrollingRef = v4.createRef();
    v96.state = {
        maxPreviewWidth = 0, 
        maxPreviewHeight = 0, 
        showInstallationBar = false, 
        openAssetPreviewStartTime = nil
    };
    v96.ClickDetectorRef = v4.createRef();
    v96.openAssetPreview = function()
        local l_assetData_1 = v96.props.assetData;
        v96.props.Modal.onAssetPreviewToggled(true);
        v96:setState({
            previewAssetData = l_assetData_1, 
            openAssetPreviewStartTime = tick()
        });
        if v96.props.isPlaying then
            v96.props.pauseASound();
        end;
        v10.onAssetPreviewSelected(l_assetData_1.Asset.Id);
        local v99 = v96.props.getPageInfoAnalyticsContextInfo();
        if not v62() then
            v96.props.AssetAnalytics:get():logPreview(l_assetData_1, v99);
            return ;
        else
            v96.props.getBuyerStatus(v96.props.Network.networkInterface):andThen(function(v100)
                v96.props.AssetAnalytics:get():logPreview(l_assetData_1, v99, v100);
            end);
            return ;
        end;
    end;
    v96.closeAssetPreview = function(v101)
        v96.props.Modal.onAssetPreviewToggled(false);
        v96.props.onPreviewToggled(false);
        v10.onAssetPreviewEnded(v101.Asset.Id, (tick() - (v96.state.openAssetPreviewStartTime or 0)) * 1000);
        v96.props.setPurchaseStatus(v54.None);
        v96:setState({
            previewAssetData = v4.None, 
            openAssetPreviewStartTime = v4.None
        });
    end;
    v96.onCloseButtonClicked = function()
        v96.closeAssetPreview(v96.props.assetData);
        v96.props.clearPreview();
    end;
    v96.onDetectorABSSizeChange = function()
        local l_current_0 = v96.ClickDetectorRef.current;
        if l_current_0 then
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            v96:setState({
                maxPreviewWidth = l_AbsoluteSize_0.x - 64, 
                maxPreviewHeight = l_AbsoluteSize_0.y - 64
            });
            return ;
        else
            return ;
        end;
    end;
    v96.tryCreateContextMenu = function(v104)
        local l_props_1 = v96.props;
        v96.props.tryCreateContextMenu(l_props_1.assetData, v104, l_props_1.Plugin:get(), l_props_1.tryOpenAssetConfig, (v96.props.getPageInfoAnalyticsContextInfo()));
    end;
    v96.tryInsert = function()
        return v96.props.tryInsert(v96.props.assetData, false, "PreviewClickInsertButton", v96.props.previewSwimlaneName, v96.props.previewPluginData and v96.props.previewPluginData.versionId);
    end;
    v96.takePlugin = function(_)
        v96.props.Network.networkInterface:postTakePlugin();
    end;
    if not v58() then
        v96.searchByCreator = function(v107, v108)
            v96.props.searchWithOptions(v96.props.Network.networkInterface, v96.props.Settings:get("Plugin"), (v16.join({
                Creator = v107
            }, v108)));
            v96.closeAssetPreview(v96.props.assetData);
        end;
    else
        v96.searchByCreator = function(v109, v110)
            local l_props_2 = v96.props;
            if l_props_2.onSearchByCreator then
                l_props_2.onSearchByCreator(v109, v110);
            end;
            v96.closeAssetPreview(l_props_2.assetData);
        end;
    end;
    local l_onVoteRequested_0 = v96.props.onVoteRequested;
    local l_onUnvoteRequested_0 = v96.props.onUnvoteRequested;
    v96.onVoteUpButtonActivated = function(v114, v115)
        local l_networkInterface_0 = v96.props.Network.networkInterface;
        if not v115.HasVoted or not v115.UserVote then
            l_onVoteRequested_0(l_networkInterface_0, v114, true);
            return ;
        else
            l_onUnvoteRequested_0(l_networkInterface_0, v114);
            return ;
        end;
    end;
    v96.onVoteDownButtonActivated = function(v117, v118)
        local l_networkInterface_1 = v96.props.Network.networkInterface;
        if not v118.HasVoted or v118.UserVote then
            l_onVoteRequested_0(l_networkInterface_1, v117, false);
            return ;
        else
            l_onUnvoteRequested_0(l_networkInterface_1, v117);
            return ;
        end;
    end;
    v96.tryInstall = function()
        local l_assetData_2 = v96.props.assetData;
        local l_Asset_1 = l_assetData_2.Asset;
        local _ = l_Asset_1.Id;
        local _ = l_Asset_1.Name;
        local l_TypeId_0 = l_Asset_1.TypeId;
        local l_Owned_1 = v96.props.Owned;
        local v126 = nil;
        v126 = l_TypeId_0 == Enum.AssetType.Plugin.Value or l_TypeId_0 == Enum.AssetType.FontFamily.Value;
        if v126 then
            v96:setState({
                showInstallationBar = true
            });
        end;
        local _ = v96.props.Network.networkInterface;
        local l_previewPluginData_1 = v96.props.previewPluginData;
        local _ = if not l_previewPluginData_1 then nil else l_previewPluginData_1.versionId;
        local l_categoryName_0 = v96.props.categoryName;
        local _ = v96.props.layoutMode;
        local v132 = nil;
        local v133 = nil;
        v133 = v96.props.previewSwimlaneName;
        local v134 = v53.shouldShowPrices(l_categoryName_0);
        local v135 = v53.getTabForCategoryName(l_categoryName_0);
        local v136 = not l_Owned_1;
        if v136 then
            if not v134 then
                v136 = v126;
                if not v136 then
                    goto label1;
                end;
            end;
            v136 = false;
            if v135 ~= v53.CREATIONS then
                v136 = v135 ~= v53.INVENTORY;
            end;
        end;
        ::label1::;
        v132 = v136;
        v136 = l_assetData_2.FiatProduct;
        if v136 then
            v132 = v132 and v136.Purchasable;
        end;
        if not v132 then
            v96.props.setPurchaseDialogVisibility(false);
            local _ = v96.props.getPageInfoAnalyticsContextInfo();
            local v138 = v96.tryInsert();
            if v138 then
                v96:setState({
                    overrideEnableVoting = true
                });
                if l_TypeId_0 == Enum.AssetType.Plugin.Value then
                    l_StudioService_0:UpdatePluginManagement();
                end;
            end;
            v96:setState({
                showInstallationBar = false
            });
            return v138;
        else
            v96.props.setPurchaseDialogVisibility(true);
            v96:setState({
                showInstallationBar = false
            });
            return false;
        end;
    end;
    v96.tryInstallWithProgress = function()
        return v96.showInstallationBarUntilCompleted(v96.tryInstall);
    end;
    v96.toggleShowInstallationBar = function(v139)
        v96:setState({
            showInstallationBar = v139
        });
    end;
    v96.showInstallationBarUntilCompleted = function(v140)
        local v141 = tick();
        v96.toggleShowInstallationBar(true);
        local v142 = v140();
        local v143 = tick() - v141;
        if v143 < 1 then
            wait(1 - v143);
        end;
        v96.toggleShowInstallationBar(false);
        return v142;
    end;
    v96.requestFavoriteCounts = function()
        v96.props.getFavoriteCounts(v96.props.Network.networkInterface, v96.props.assetId);
    end;
    v96.checkFavorited = function()
        v96.props.getFavorited(v96.props.Network.networkInterface, v14(), v96.props.assetId);
    end;
    v96.onFavoritedActivated = function(_)
        v96.props.toggleFavoriteStatus(v96.props.Network.networkInterface, v14(), v96.props.assetId, v96.props.favorited);
    end;
    v96.requestAssetContentAttributionInfo = function()
        local l_networkInterface_3 = v96.props.Network.networkInterface;
        local l_assetData_3 = v96.props.assetData;
        v96.props.getAssetContentAttributionInfo(l_networkInterface_3, if not not l_assetData_3 and l_assetData_3.Asset then l_assetData_3.Asset.CreatingUniverseId else nil);
    end;
    if not l_ToolboxAssetPreviewProtectAgainstNilAssetData_0 then
        v96.props.clearPurchaseFlow(v97.assetData.Asset.Id);
    elseif v96.props.assetData then
        v96.props.clearPurchaseFlow(v97.assetData.Asset.Id);
    end;
    v96.onClickReport = function()
        local l_assetData_4 = v96.props.assetData;
        local l_assetId_0 = v96.props.assetId;
        local l_TypeId_1 = l_assetData_4.Asset.TypeId;
        local v150 = v65(l_assetId_0, l_TypeId_1);
        v10.reportAssetClicked(l_assetId_0, l_TypeId_1);
        l_GuiService_0:OpenBrowserWindow(v150);
    end;
    v96.renderFooter = function(v151)
        return v4.createElement(v33, v6.Dictionary.join(v151, {
            AssetData = v96.props.assetData
        }));
    end;
    v96.renderAndGetSuggestions = function(v152)
        local l_props_3 = v96.props;
        local l_networkInterface_4 = l_props_3.Network.networkInterface;
        local l_Creator_0 = l_props_3.assetData.Creator;
        local l_IsVerifiedCreator_0 = l_props_3.assetData.Creator.IsVerifiedCreator;
        local v157 = v53.ASSET_PREVIEW_SUGGESTIONS_ENABLED_FOR_ASSET_TYPE[l_props_3.categoryName];
        if l_IsVerifiedCreator_0 and v157 then
            local function v160(v158, v159)
                if v152 then
                    v152();
                end;
                l_props_3.clearPurchaseFlow(l_props_3.assetData.Asset.Id);
                l_props_3.onAssetPreviewButtonClicked(v158, v159);
                v96.initialize(v158);
            end;
            local l_current_1 = v96.assetPreviewScrollingRef.current;
            return v50.Generator({
                categoryName = l_props_3.categoryName, 
                initialPageSize = 30, 
                networkInterface = l_networkInterface_4, 
                queryParams = {
                    creatorTargetId = l_Creator_0.Id
                }, 
                render = function(v162)
                    return v4.createElement(v30, {
                        Assets = v162.assets, 
                        CategoryName = l_props_3.categoryName, 
                        CanInsertAsset = l_props_3.canInsertAsset, 
                        CreatorName = l_Creator_0.Name, 
                        IsLoading = v162.loading, 
                        LogAssetImpression = l_props_3.logAssetImpression, 
                        OnAssetPreviewButtonClicked = v160, 
                        OnClickSeeAll = function()
                            v96.searchByCreator(if not v58() then l_Creator_0.Name else l_Creator_0, {
                                includeUnverifiedCreators = false, 
                                searchTerm = ""
                            });
                        end, 
                        OriginalAssetId = l_props_3.assetData.Asset.Id, 
                        ParentAbsoluteSize = if not l_current_1 then nil else l_current_1.AbsoluteSize, 
                        ParentAbsolutePosition = if not l_current_1 then nil else l_current_1.AbsolutePosition, 
                        TryOpenAssetConfig = l_props_3.tryOpenAssetConfig
                    });
                end
            });
        else
            return ;
        end;
    end;
    if v60() then
        v96.getCodeUnderstandingSummary = function(v163)
            local l_props_4 = v96.props;
            if not l_props_4.assetData.Asset.HasScripts then
                return ;
            else
                return l_props_4.getCodeUnderstandingSummary(l_props_4.Network.networkInterface, v163);
            end;
        end;
    end;
    v96.initialize = function(v165)
        v96.openAssetPreview(v165);
        if v165.Asset then
            if v165.Asset.TypeId == Enum.AssetType.Plugin.Value then
                v96.props.getPluginInfo(v96.props.Network.networkInterface, v165.Asset.Id);
            elseif not (v165.Asset.TypeId == Enum.AssetType.FontFamily.Value) then
                v96.props.getPreviewInstance(v165.Asset.Id, v165.Asset.TypeId);
            end;
            v96.props.getOwnsAsset(v96.props.Network.networkInterface, v165.Asset.Id);
            if v61(v96.props.IXP) then
                v96.getCodeUnderstandingSummary(v165.Asset.Id);
            end;
        end;
        v96.requestFavoriteCounts();
        v96.checkFavorited();
        v96.requestAssetContentAttributionInfo();
    end;
    if v97.assetData.Asset.AssetMediaIds then
        v96.carouselImageIds = v6.List.join({
            v97.assetData.Asset.Id
        }, v97.assetData.Asset.AssetMediaIds);
        v96.assetMediaLogged = {};
        v96.LogAssetMediaImpression = function(v166, v167)
            local v168 = if not v167 then v8.ASSET_MEDIA_IMPRESSION_SOURCE.IMAGE_PREVIEW_ACTIVE else v8.ASSET_MEDIA_IMPRESSION_SOURCE.IMAGE_PREVIEW_PASSIVE;
            if v168 ~= v8.ASSET_MEDIA_IMPRESSION_SOURCE.IMAGE_PREVIEW_ACTIVE then
                if not v96.assetMediaLogged[v166] then
                    v96.assetMediaLogged[v166] = true;
                else
                    return ;
                end;
            end;
            v96.props.AssetAnalytics:get():logAssetMediaImpression(v96.props.assetData, v96.carouselImageIds[v166], v166, v96.props.searchId, v168, nil);
        end;
        v96.OnImageCarouselChange = function(v169, v170)
            v96.LogAssetMediaImpression(v169, v170);
        end;
        v96.OnSetImageCarouselImages = function(v171)
            v96.LogAssetMediaImpression(v171, true);
        end;
    end;
    v96.onClickDescriptionLink = function(v172)
        local l_props_5 = v96.props;
        v96.props.AssetAnalytics:get():onAssetDescriptionLinkClicked(l_props_5.assetData, l_props_5.getPageInfoAnalyticsContextInfo(), l_props_5.searchId, v172);
    end;
end;
v55.didMount = function(v174)
    v174.initialize(v174.props.assetData);
end;
v55.render = function(v175)
    local v176 = v175:createPurchaseFlow();
    local l_props_6 = v175.props;
    local l_state_0 = v175.state;
    local l_Localization_0 = l_props_6.Localization;
    local l_modalTarget_0 = l_props_6.Modal.modalTarget;
    local l_assetData_5 = l_props_6.assetData;
    local l_Owned_2 = l_props_6.Owned;
    local v183 = math.min(l_state_0.maxPreviewWidth, v8.ASSET_PREVIEW_MAX_WIDTH);
    local l_maxPreviewHeight_0 = l_state_0.maxPreviewHeight;
    local l_previewModel_0 = l_props_6.previewModel;
    local v186 = not v176.InstallDisabled and not v175.state.showInstallationBar;
    local function v187()
        v175.tryCreateContextMenu(v175.props.Localization);
    end;
    local v188 = nil;
    local v189 = nil;
    local v190 = nil;
    if not l_disableRatings_0() then
        v188 = {
            OnClick = v175.onFavoritedActivated, 
            Count = tonumber(v175.props.favoriteCounts), 
            IsFavorited = v175.props.favorited
        };
        if v175.props.voting then
            v190 = v176.IsUninstalledPlugin;
        end;
        v189 = v176.HasRating and v175.props.voting;
    else
        v188 = nil;
        v189 = nil;
    end;
    local v191 = nil;
    if l_assetData_5.Asset.AssetSubTypes then
        v191 = v51.contains(l_assetData_5.Asset.AssetSubTypes, v51.Package);
    end;
    local v192 = nil;
    local l_FiatProduct_1 = l_assetData_5.FiatProduct;
    if not (((not l_FiatProduct_1 or not l_FiatProduct_1.PurchasePrice) or v64.isFree(l_FiatProduct_1.PurchasePrice)) or l_Owned_2) then
        if l_props_6.buyerStatus == v52.CountryRestricted then
            v186 = false;
            v192 = l_Localization_0:getText("AssetPreview", "CountryRestrictedPurchase");
        elseif l_props_6.isExcessiveTransaction then
            v186 = false;
            v192 = l_props_6.Localization:getText("AssetPreview", "ExcessiveTransactionsSubText");
        end;
    end;
    local v194 = false;
    if type(l_assetData_5.Asset.AssetMediaIds) == "table" then
        v194 = next(l_assetData_5.Asset.AssetMediaIds) ~= nil;
    end;
    local l_createElement_0 = v4.createElement;
    local l_l_AssetPreview_0_0 = l_AssetPreview_0;
    local v198 = {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v183, l_maxPreviewHeight_0), 
        ZIndex = 2, 
        AssetData = l_assetData_5, 
        AssetInstance = l_previewModel_0, 
        OnClickContext = v187, 
        ActionEnabled = v186, 
        ShowRobuxIcon = v176.ShowRobuxIcon, 
        ActionSubText = v192, 
        ActionText = tostring(v176.ActionBarText), 
        OnClickAction = v176.TryInsert, 
        Favorites = v188, 
        Voting = v189, 
        IsUninstalledPlugin = v190, 
        OnVoteUp = v175.onVoteUpButtonActivated, 
        OnVoteDown = v175.onVoteDownButtonActivated, 
        OnClickCreator = if not v58() then v175.searchByCreator else function(_)
            return v175.searchByCreator(l_assetData_5.Creator, nil);
        end, 
        OnClickReport = v175.onClickReport, 
        OnClickDescriptionLink = v175.onClickDescriptionLink, 
        RenderSuggestions = v175.renderAndGetSuggestions, 
        RenderFooter = v175.renderFooter
    };
    local l_Creator_1 = l_assetData_5.Creator;
    if l_Creator_1 then
        l_Creator_1 = false;
        if l_assetData_5.Creator.Id ~= 1 then
            l_Creator_1 = l_assetData_5.Creator.Id ~= v14();
        end;
    end;
    v198.CanFlagAsset = l_Creator_1;
    v198.IsPackage = v191;
    v198.ImageCarouselAutoAdvanceTimer = if not v194 then nil else v8.ASSET_PREVIEW_IMAGE_CAROUSEL_AUTO_ADVANCE_TIMER;
    v198.OnImageCarouselImageChanged = v175.OnImageCarouselChange;
    v198.ImageCarouselTransparencyThreshold = v8.IMAGE_CAROUSEL_ON_IMAGE_CHANGE_TRANSPARENCY_THRESHOLD;
    v198.OnSetImageCarouselImages = v175.OnSetImageCarouselImages;
    v198.UseImageCarousel = v194;
    v198.UsageContext = Enum.UsageContext.Preview;
    v198.ShouldMuteModelSounds = true;
    v198.ScrollingRef = v175.assetPreviewScrollingRef;
    v198.CreatingUniverseId = l_props_6.creatingUniverseId;
    v198.CreatingUniverseName = l_props_6.creatingUniverseName;
    v198.CreatingUniverseRootPlaceId = l_props_6.creatingUniverseRootPlaceId;
    v198.CodeSummary = if not v61(l_props_6.IXP) then nil else l_props_6.codeSummary;
    return l_modalTarget_0 and v4.createElement(v4.Portal, {
        target = l_modalTarget_0
    }, {
        ScreenClickDetector = v4.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 0.25, 
            BackgroundColor3 = v66, 
            ZIndex = 1, 
            AutoButtonColor = false, 
            [v4.Event.Activated] = v175.onCloseButtonClicked, 
            [v4.Ref] = v175.ClickDetectorRef, 
            [v4.Change.AbsoluteSize] = v175.onDetectorABSSizeChange
        }), 
        AssetPreview = l_createElement_0(l_l_AssetPreview_0_0, v198)
    });
end;
return v5.UNSTABLE_connect2(function(v200, v201)
    v200 = v200 or {};
    local v202 = v200.assets or {};
    local l_previewModel_1 = v202.previewModel;
    local v204 = v200.pageInfo or {};
    local l_previewAssetId_0 = v202.previewAssetId;
    local v206 = v200.purchase or {};
    local l_status_0 = v206.status;
    local v208 = v206.cachedOwnedAssets[tostring(l_previewAssetId_0)];
    local l_robuxBalance_0 = v206.robuxBalance;
    local v210 = if not v62() then nil else v206.buyerStatus;
    local v211 = v200.favorite or {};
    local v212 = v211.assetIdToCountsMap or {};
    local v213 = v211.assetIdToFavoritedMap or {};
    local v214 = v200.voting or {};
    local l_assetData_6 = v201.assetData;
    local v216 = v206.excessiveTransactionUserIds or {};
    local v217 = if not not l_assetData_6 and l_assetData_6.Creator then l_assetData_6.Creator.Id else nil;
    return {
        assetData = l_assetData_6, 
        buyerStatus = v210, 
        categories = nil, 
        categoryName = v204.categoryName or v53.DEFAULT.name, 
        codeSummary = if not v60() then nil else v202.codeSummaryMap[tostring(l_previewAssetId_0)], 
        isExcessiveTransaction = v217 and v216[v217], 
        layoutMode = if not v57() then nil else v204.layoutMode, 
        previewModel = l_previewModel_1 or nil, 
        previewPluginData = v202.previewPluginData, 
        previewSwimlaneName = v202.previewSwimlaneName, 
        assetId = l_previewAssetId_0, 
        favoriteCounts = v212[l_previewAssetId_0] or 0, 
        favorited = v213[l_previewAssetId_0] or false, 
        voting = v214[l_previewAssetId_0], 
        Owned = v208, 
        PurchaseStatus = l_status_0, 
        searchId = v204.searchId, 
        Balance = l_robuxBalance_0, 
        creatingUniverseName = if not not v202.creatingUniverseName and v202.creatingUniverseName ~= v6.None then v202.creatingUniverseName else nil, 
        creatingUniverseRootPlaceId = if not not v202.creatingUniverseRootPlaceId and v202.creatingUniverseRootPlaceId ~= v6.None then v202.creatingUniverseRootPlaceId else nil
    };
end, function(v218)
    return {
        getPreviewInstance = function(v219, v220)
            v218(v35(v219, v220));
        end, 
        clearPreview = function()
            v218(v24());
        end, 
        getCodeUnderstandingSummary = if not v60() then nil else function(v221, v222)
            v218(v36(v221, v222));
        end, 
        getPluginInfo = function(v223, v224)
            v218(v37(v223, v224));
        end, 
        searchWithOptions = function(v225, v226, v227)
            v218(v38(v225, v226, v227));
        end, 
        onVoteRequested = function(v228, v229, v230)
            v218(v40(v228, v229, v230));
        end, 
        onUnvoteRequested = function(v231, v232)
            v218(v39(v231, v232));
        end, 
        onPreviewToggled = function(v233)
            v218(v27(v233));
        end, 
        pauseASound = function()
            v218(v26());
        end, 
        tryCreateContextMenu = function(v234, v235, v236, v237, v238)
            v218(v46(v234, v235, v236, v237, v238));
        end, 
        getOwnsAsset = function(v239, v240)
            v218(v41(v239, v240));
        end, 
        clearPurchaseFlow = function(v241)
            v218(v42(v241));
        end, 
        getFavorited = function(v242, v243, v244)
            v218(v44(v242, v243, v244));
        end, 
        getFavoriteCounts = function(v245, v246)
            v218(v43(v245, v246));
        end, 
        toggleFavoriteStatus = function(v247, v248, v249, v250)
            v218(v45(v247, v248, v249, v250));
        end, 
        getPageInfoAnalyticsContextInfo = function()
            return v218(v47());
        end, 
        getBuyerStatus = if not v62() then nil else function(v251)
            return v218(v49(v251));
        end, 
        getAssetContentAttributionInfo = function(v252, v253)
            return v218(v48(v252, v253));
        end, 
        setPurchaseStatus = function(v254)
            return v218(v29(v254));
        end, 
        setPurchaseDialogVisibility = function(v255)
            return v218(v28(v255));
        end
    };
end)((l_withContext_0({
    Settings = v19, 
    AssetAnalytics = v11, 
    IXP = if not v60() then nil else v20, 
    NavigationContext = v21, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v22, 
    Network = v23, 
    Localization = l_ContextServices_0.Localization
})(v55)));
