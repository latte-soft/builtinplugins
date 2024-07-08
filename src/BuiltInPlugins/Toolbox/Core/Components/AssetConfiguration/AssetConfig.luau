local _ = game:GetService("StarterPack");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_ToolboxEditDialogUseMPRS2_0 = game:GetFastFlag("ToolboxEditDialogUseMPRS2");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local l_ToolboxFixMarketplacePublish_0 = game:GetFastFlag("ToolboxFixMarketplacePublish");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCToolboxFixAccessories);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local l_ToolboxUGCAccessoryUploadRequest2_0 = game:GetFastFlag("ToolboxUGCAccessoryUploadRequest2");
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCAgreedCreationFeeConnection);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableGroupStateChangeCheck);
local v16 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v17 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local l_ToolboxSendPackageVersionNoteTelemetry_0 = game:GetFastFlag("ToolboxSendPackageVersionNoteTelemetry");
local l_StudioService_0 = game:GetService("StudioService");
local v20 = require(l_Parent_0.Core.Util.getUserId);
local l_Packages_0 = l_Parent_0.Packages;
local v22 = require(l_Packages_0.Roact);
local v23 = require(l_Packages_0.RoactRodux);
local v24 = require(l_Packages_0.Cryo);
local v25 = require(l_Util_0.Analytics.Analytics);
local l_Components_0 = l_Parent_0.Core.Components;
local l_AssetConfiguration_0 = l_Components_0.AssetConfiguration;
local v28 = require(l_AssetConfiguration_0.PreviewArea);
local v29 = require(l_AssetConfiguration_0.PublishAsset);
local v30 = require(l_AssetConfiguration_0.AssetConfigFooter);
local v31 = require(l_AssetConfiguration_0.Versions);
local v32 = require(l_AssetConfiguration_0.SalesPage);
local v33 = require(l_AssetConfiguration_0.Permissions.Permissions);
local v34 = require(l_AssetConfiguration_0.WarningDialog);
local v35 = require(l_AssetConfiguration_0.StyledConfirmDialog);
local v36 = require(l_AssetConfiguration_0.OverrideAsset);
local v37 = require(l_Components_0.MessageBox.MessageBox);
local v38 = require(l_Util_0.AssetPermissionUtil);
local v39 = require(l_Util_0.Images);
local v40 = require(l_Util_0.AssetConfigConstants);
local v41 = require(l_Util_0.Constants);
local v42 = require(l_Util_0.ScreenSetup);
local v43 = require(l_Util_0.AssetConfigUtil);
local v44 = require(l_Util_0.fixUpPreValidation);
local v45 = require(l_Util_0.PublishUtil);
local v46 = require(l_Util_0.TagsUtil);
local _ = require(l_Util_0.getAllowedAssetTypeEnums);
local v48 = require(l_Util_0.FiatUtil);
local v49 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v49 = require(l_Util_0.getIsIXPVariableEnabled);
end;
local v50 = require(l_Packages_0.Framework);
local l_deepCopy_0 = v50.Util.deepCopy;
local l_deepEqual_0 = v50.Util.deepEqual;
local l_slice_0 = v50.Dash.slice;
local v54 = require(l_Parent_0.Core.Networking.Requests.MakeChangeRequest);
local l_Types_0 = l_Parent_0.Core.Types;
local _ = require(l_Types_0.AssetMediaTypes);
local v57 = require(l_Types_0.AssetSubTypes);
local v58 = require(l_Types_0.ConfigTypes);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v60 = require(l_Requests_0.GetUploadPermissionStatusRequest);
local v61 = require(l_Requests_0.UploadCatalogItemRequest);
local v62 = require(l_Requests_0.ConfigureCatalogItemRequest);
local v63 = require(l_Requests_0.GetAssetDetailsRequest);
local v64 = require(l_Requests_0.GetAssetItemTagsRequest);
local v65 = require(l_Requests_0.PostRevertVersionRequest);
local v66 = require(l_Requests_0.PostVersionDescriptionRequest);
local v67 = require(l_Requests_0.PatchAssetRequest);
local v68 = require(l_Requests_0.PostUploadAssetRequest);
local v69 = require(l_Requests_0.PostOverrideAssetRequest);
local v70 = require(l_Requests_0.PostUploadAnimationRequest);
local v71 = require(l_Requests_0.PostOverrideAnimationRequest);
local v72 = require(l_Requests_0.GetIsVerifiedCreatorRequest);
local v73 = require(l_Requests_0.PostPackageMetadataRequest);
local v74 = require(l_Requests_0.GetPackageCollaboratorsRequest);
local v75 = require(l_Requests_0.PutPackagePermissionsRequest);
local v76 = require(l_Requests_0.PostAssetCheckPermissions);
local v77 = require(l_Requests_0.GetMarketplaceInfoRequest);
local v78 = require(l_Requests_0.AvatarAssetsGetUploadFeeRequest);
local v79 = require(l_Requests_0.UGCBundleTypeGetUploadFeeRequest);
local v80 = require(l_Requests_0.AvatarAssetsUploadRequest);
local v81 = require(l_Requests_0.UGCBundleUploadRequest);
local v82 = require(l_Requests_0.PatchMakeAssetPublicRequest);
local v83 = require(l_Requests_0.GetAssetPermissionsRequest);
local v84 = require(l_Requests_0.GetPublishingRequirementsRequest);
local v85 = require(l_Requests_0.GetAssetMediaMetadataArrayRequest);
local v86 = require(l_Requests_0.UGCAccessoryUploadRequest);
local v87 = require(l_Requests_0.GetVersionsHistoryRequest);
local v88 = require(l_Requests_0.GetFiatProductRequest);
local v89 = require(l_Requests_0.GetSellerStatusRequest);
local v90 = require(l_Requests_0.GetDefaultBundleDataSharingRequest);
local v91 = require(l_Parent_0.Core.Actions.ClearChange);
local v92 = require(l_Parent_0.Core.Actions.SetAssetConfigTab);
local v93 = require(l_Parent_0.Core.Actions.UpdateAssetConfigStore);
local v94 = require(l_Parent_0.Core.Actions.SetDescendantPermissions);
local v95 = require(l_Parent_0.Core.Actions.UploadResult);
local v96 = require(l_Parent_0.Core.Thunks.GetGroupMetadata);
local v97 = require(l_Parent_0.Core.Thunks.GetGroupRoleInfo);
local v98 = require(l_Parent_0.Core.Thunks.GetUsername);
local v99 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v100 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v101 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v101.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LoadingIndicator_0 = v101.UI.LoadingIndicator;
local l_Container_0 = v101.UI.Container;
local v106 = v22.PureComponent:extend("AssetConfig");
local v107 = utf8.char(57346);
local v108 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
local v109 = require(l_Parent_0.Core.Flags.getFFlagToolboxAnimationAPIMigration);
local v110 = require(l_Parent_0.Core.Flags.getFFlagFixCreatorGroupIdNotChanging);
v106.init = function(v111, v112)
    v111.state = {
        assetId = nil, 
        name = nil, 
        description = nil, 
        tags = nil, 
        owner = nil, 
        genres = {
            "All"
        }, 
        categoryType = nil, 
        canUploadWithUgcRestrictions = nil, 
        canUploadWithUgcRestrictionsDenyReason = nil, 
        allowCopy = true, 
        copyOn = false, 
        copyChanged = false, 
        allowComment = true, 
        commentOn = nil, 
        allowPackage = l_UnifyModelPackagePublish3_0, 
        packageOn = nil, 
        canBePackage = nil, 
        packageWarningText = nil, 
        isPackageAsset = nil, 
        price = nil, 
        status = nil, 
        isAssetPublic = false, 
        assetMediaUpdateData = nil, 
        isShowChangeDiscardMessageBox = false, 
        isPublishAssetsDialogEnabled = false, 
        isAssetTypeSelectionAllowed = false, 
        isShowRobuxSpendMessageBox = false, 
        descendantIds = {}, 
        overrideAssetId = nil, 
        groupId = nil, 
        iconFile = nil, 
        dispatchGetFunction = false, 
        isConfirmationDialogEnabled = false, 
        confirmationDialogKey = false, 
        versionsCurrentItem = if not v108() then nil else {}, 
        versionsRootItems = if not v108() then nil else {}, 
        versionsOpenInputKey = if not v108() then nil else -1, 
        versionsPreviousInput = if not v108() then nil else "", 
        versionsPageIndex = if not v108() then nil else 1, 
        versionsPageRootItems = if not v108() then nil else v111:versionsGetPageRootItems(1, v41.VERSIONS_ROWS_PER_PAGE), 
        versionDescriptionErrors = if not v108() then nil else {}, 
        dataSharingEnabled = false, 
        dataSharingToggled = false
    };
    v111.state.isAssetTypeSelectionAllowed = v43.hasAllowedAssetTypesForRelease(v111.props.allowedAssetTypesForRelease) and not v43.isBuyableMarketplaceAsset(v111.props.assetTypeEnum);
    if v43.isMarketplaceAsset(v112.assetTypeEnum) then
        v111.state.status = v40.ASSET_STATUS.OffSale;
    end;
    if v43.isCatalogAsset(v112.assetTypeEnum) then
        v111.state.price = v43.getMinPrice(v112.allowedAssetTypesForRelease, v112.assetTypeEnum);
    end;
    v111.nameString = nil;
    v111.descriptionString = nil;
    v111.init = false;
    v111.onDialogAccepted = function()
        local l_state_0 = v111.state;
        v111:setState(function()
            v111.tryPublish(l_state_0.confirmationDialogKey);
            return {
                confirmationDialogKey = "", 
                isConfirmationDialogEnabled = false
            };
        end);
    end;
    v111.onDialogCanceled = function()
        v111:setState(function()
            return {
                confirmationDialogKey = "", 
                isConfirmationDialogEnabled = false
            };
        end);
    end;
    v111.onAssetPublishDialogAccepted = function()
        v111:setState(function()
            return {
                isPublishAssetsDialogEnabled = false
            };
        end);
        v111.tryMakeAssetsPublic();
    end;
    v111.onAssetPublishDialogCanceled = function()
        v111:setState(function()
            return {
                isPublishAssetsDialogEnabled = false
            };
        end);
    end;
    v111.onAssetPublishPayAndConfirmAccepted = function()
        v111:setState(function()
            return {
                isShowRobuxSpendMessageBox = false
            };
        end);
        v111.tryPublish(nil);
    end;
    v111.onAssetPublishPayAndConfirmCanceled = function()
        v111:setState(function()
            return {
                isShowRobuxSpendMessageBox = false
            };
        end);
    end;
    v111.tryMakeAssetsPublic = function()
        local l_props_0 = v111.props;
        for _, v116 in pairs(v111.state.descendantIds) do
            l_props_0.dispatchPatchMakeAssetPublicRequest(l_props_0.Network.networkInterface, v116);
        end;
        v111.tryPublish(nil);
    end;
    v111.tryPublishWithConfirmDialog = function(v117)
        v111:setState(function(v118)
            local l_props_1 = v111.props;
            local v120 = l_props_1.assetTypeEnum == Enum.AssetType.Audio;
            local v121 = l_props_1.assetTypeEnum == Enum.AssetType.Video;
            local v122 = l_props_1.assetTypeEnum == Enum.AssetType.Model;
            local v123 = v43.isCatalogAsset(l_props_1.assetTypeEnum);
            local v124 = v43.isUGCBundleType(l_props_1.assetTypeEnum);
            local v125 = l_props_1.uploadFee or 0;
            if (not (not v120 and (not l_ToolboxVideoConfigSharing2_0 or not v121)) and v118.isAssetPublicOriginalValue ~= true) and v118.isAssetPublic == v40.SHARING_KEYS.Public then
                return {
                    confirmationDialogKey = v117 or "", 
                    isConfirmationDialogEnabled = true
                };
            elseif (v122 and v118.isAssetPublic == v40.SHARING_KEYS.Public) and v40.FLOW_TYPE.UPLOAD_FLOW == l_props_1.screenFlowType then
                local v126 = false;
                for _, v128 in pairs(l_props_1.descendantPermissions) do
                    if not v38.isAssetPublic(v128) then
                        v126 = true;
                        break;
                    end;
                end;
                if not v126 then
                    v111.tryPublish(nil);
                    return ;
                else
                    v111:setState(function()
                        return {
                            isPublishAssetsDialogEnabled = true
                        };
                    end);
                    return ;
                end;
            elseif (not (not v123 and not v124) and v125 ~= nil) and v125 > 0 then
                v111:setState(function()
                    return {
                        isShowRobuxSpendMessageBox = true
                    };
                end);
                return ;
            else
                v111.tryPublish(v117);
                return ;
            end;
        end);
    end;
    v111.tryPublish = function(v129)
        local function v158()
            local function _(v130, v131)
                local v132 = (v130 and v131) and v130[v131.Name];
                local v133 = v132 and v132.allowedFileExtensions;
                local l_v133_0 = v133;
                if l_v133_0 then
                    l_v133_0 = false;
                    if #v133 > 0 then
                        l_v133_0 = v133[1];
                    end;
                end;
                return not not l_v133_0 and string.gsub(l_v133_0, "^%.", "") or "rbxm";
            end;
            local l_props_2 = v111.props;
            local l_state_1 = v111.state;
            local l_groupId_0 = l_state_1.groupId;
            if v110 then
                l_groupId_0 = if not not l_state_1.groupId and l_state_1.groupId ~= v24.None then l_state_1.groupId else nil;
            end;
            local v139 = l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v49(l_props_2.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
            if v40.FLOW_TYPE.DOWNLOAD_FLOW == l_props_2.screenFlowType then
                l_StudioService_0:AnimationIdSelected(v129 ~= "" and v129 or l_state_1.overrideAssetId);
                l_props_2.onClose();
                return ;
            else
                if v40.FLOW_TYPE.EDIT_FLOW == l_props_2.screenFlowType then
                    if not v43.isCatalogAsset(l_props_2.assetTypeEnum) then
                        if v43.isMarketplaceAsset(l_props_2.assetTypeEnum) then
                            local l_copyOn_0 = l_state_1.copyOn;
                            if not l_state_1.copyChanged then
                                l_copyOn_0 = nil;
                            end;
                            l_props_2.configureMarketplaceItem({
                                networkInterface = l_props_2.Network.networkInterface, 
                                assetId = l_state_1.assetId, 
                                assetMediaUpdateData = l_state_1.assetMediaUpdateData, 
                                assetTypeEnum = l_props_2.assetTypeEnum, 
                                name = l_state_1.name, 
                                description = l_state_1.description or "", 
                                genres = l_state_1.genres, 
                                commentOn = l_state_1.commentOn, 
                                copyOn = l_copyOn_0, 
                                saleStatus = l_state_1.status, 
                                fromPrice = l_props_2.assetConfigData.Price, 
                                price = l_state_1.price, 
                                iconFile = l_state_1.iconFile, 
                                isAssetPublic = l_state_1.isAssetPublic, 
                                isConvertMarketplaceModelsToPackageEnabled = v139, 
                                basePrice = if not l_props_2.fiatProduct then nil else l_props_2.fiatProduct.basePrice
                            });
                            return ;
                        end;
                    elseif not l_props_2.assetConfigData or not l_props_2.assetConfigData.Status then
                        warn("Could not configure sales, missing Asset Status");
                        return ;
                    else
                        l_props_2.configureCatalogItem(l_props_2.Network.networkInterface, l_props_2.assetId, l_state_1.name, l_state_1.description or "", l_props_2.assetConfigData.Status, l_state_1.status, l_props_2.assetConfigData.Price, l_state_1.price, l_props_2.assetConfigData.ItemTags or {}, l_state_1.tags);
                        return ;
                    end;
                elseif v40.FLOW_TYPE.UPLOAD_FLOW == l_props_2.screenFlowType then
                    if l_props_2.assetTypeEnum == Enum.AssetType.Animation then
                        if not v58:isOverride(l_props_2.currentTab) then
                            l_props_2.uploadAnimationAsset({
                                networkInterface = l_props_2.Network.networkInterface, 
                                assetId = 0, 
                                name = l_state_1.name, 
                                description = l_state_1.description or "", 
                                userId = if not v109() then nil else v20(), 
                                groupId = l_groupId_0, 
                                instance = l_props_2.instances
                            });
                            return ;
                        else
                            l_props_2.overrideAnimationAsset(l_props_2.Network.networkInterface, l_state_1.overrideAssetId, l_props_2.instances);
                            return ;
                        end;
                    elseif not v43.isCatalogAsset(l_props_2.assetTypeEnum) then
                        if not v43.isUGCBundleType(l_props_2.assetTypeEnum) then
                            if not v43.isMarketplaceAsset(l_props_2.assetTypeEnum) or not v58:isOverride(l_props_2.currentTab) then
                                l_props_2.uploadMarketplaceItem({
                                    networkInterface = l_props_2.Network.networkInterface, 
                                    assetId = 0, 
                                    assetTypeEnum = l_props_2.assetTypeEnum, 
                                    name = l_state_1.name, 
                                    description = l_state_1.description or "", 
                                    genreTypeId = Enum.Genre[(l_state_1.genres or {})[1]].Value + 1, 
                                    copyOn = l_state_1.copyOn, 
                                    commentOn = l_state_1.commentOn, 
                                    packageOn = (not not l_UnifyModelPackagePublish3_0 and not l_state_1.isPackageAsset) and l_state_1.packageOn, 
                                    groupId = l_groupId_0, 
                                    instances = l_props_2.instances, 
                                    isMarketplaceModelsAsPackagesEnabled = not not v139 or nil, 
                                    sourceInstances = if l_UnifyModelPackagePublish3_0 or v139 then l_props_2.sourceInstances else nil, 
                                    saleStatus = l_state_1.status, 
                                    price = l_state_1.price, 
                                    iconFile = l_state_1.iconFile, 
                                    assetMediaUpdateData = l_state_1.assetMediaUpdateData, 
                                    basePrice = if not l_props_2.fiatProduct then nil else l_props_2.fiatProduct.basePrice
                                });
                            else
                                l_props_2.overrideAsset(l_props_2.Network.networkInterface, l_state_1.overrideAssetId, l_props_2.assetTypeEnum.Name, l_props_2.instances);
                                return ;
                            end;
                        else
                            local v141 = nil;
                            if not (not v14() or not l_state_1.dataSharingEnabled) then
                                v141 = if not l_state_1.dataSharingToggled then {} else {
                                    v41.DataSharingLicenseTypes.RobloxGlobal
                                };
                            end;
                            l_props_2.uploadUGCBundleWithFee(l_props_2.Network.networkInterface, l_props_2.instances[1], l_props_2.assetTypeEnum, l_state_1.name, l_state_1.description or "", l_props_2.allowedBundleTypeSettings, l_props_2.Localization, if not v13() then nil else l_props_2.uploadFee, if not v14() then nil else v141);
                            return ;
                        end;
                    elseif not l_props_2.isUploadFeeEnabled then
                        local l_uploadCatalogItem_0 = l_props_2.uploadCatalogItem;
                        local l_networkInterface_0 = l_props_2.Network.networkInterface;
                        local l_name_0 = v111.state.name;
                        local l_allowedAssetTypesForUpload_0 = l_props_2.allowedAssetTypesForUpload;
                        local l_assetTypeEnum_0 = l_props_2.assetTypeEnum;
                        local v147 = (l_allowedAssetTypesForUpload_0 and l_assetTypeEnum_0) and l_allowedAssetTypesForUpload_0[l_assetTypeEnum_0.Name];
                        local v148 = v147 and v147.allowedFileExtensions;
                        local l_v148_0 = v148;
                        if l_v148_0 then
                            l_v148_0 = false;
                            if #v148 > 0 then
                                l_v148_0 = v148[1];
                            end;
                        end;
                        l_uploadCatalogItem_0(l_networkInterface_0, l_name_0, not not l_v148_0 and string.gsub(l_v148_0, "^%.", "") or "rbxm", v111.state.description or "", l_props_2.assetTypeEnum, l_props_2.instances, v111.state.tags);
                        return ;
                    else
                        local l_uploadCatalogItemWithFee_0 = l_props_2.uploadCatalogItemWithFee;
                        local l_networkInterface_1 = l_props_2.Network.networkInterface;
                        local l_name_1 = v111.state.name;
                        local l_allowedAssetTypesForUpload_1 = l_props_2.allowedAssetTypesForUpload;
                        local l_assetTypeEnum_1 = l_props_2.assetTypeEnum;
                        local v155 = (l_allowedAssetTypesForUpload_1 and l_assetTypeEnum_1) and l_allowedAssetTypesForUpload_1[l_assetTypeEnum_1.Name];
                        local v156 = v155 and v155.allowedFileExtensions;
                        local l_v156_0 = v156;
                        if l_v156_0 then
                            l_v156_0 = false;
                            if #v156 > 0 then
                                l_v156_0 = v156[1];
                            end;
                        end;
                        l_uploadCatalogItemWithFee_0(l_networkInterface_1, l_name_1, not not l_v156_0 and string.gsub(l_v156_0, "^%.", "") or "rbxm", v111.state.description or "", l_props_2.assetTypeEnum, l_props_2.instances, v111.state.tags, l_groupId_0, if not l_ToolboxUGCAccessoryUploadRequest2_0 then nil else l_props_2.uploadFee);
                        return ;
                    end;
                end;
                return ;
            end;
        end;
        local function v166(v159)
            local l_Id_0 = v111.props.assetConfigData.Id;
            local v161 = nil;
            v161 = if not v108() then v159.VersionItemSelect else v159.VersionItemSelect and v159.VersionItemSelect[1];
            local v162 = if not v159.VersionDescriptionSave then {} else v159.VersionDescriptionSave;
            local l_networkInterface_2 = v111.props.Network.networkInterface;
            if not (not l_Id_0 or not v161) then
                v111.props.postRevertVersion(l_networkInterface_2, l_Id_0, v161);
                if v108() then
                    v162[v159.VersionItemSelect[2] + 1] = v112.Localization:getText("AssetConfig", "RestoredFromVersion", {
                        versionNumber = tostring(v161)
                    });
                end;
            end;
            if v108() then
                for v164, v165 in pairs(v162) do
                    if v165 then
                        v111.props.postVersionDescription(l_networkInterface_2, l_Id_0, v164, v165);
                    end;
                end;
            end;
        end;
        local function _(v167)
            local l_Id_1 = v111.props.assetConfigData.Id;
            local v169 = nil;
            v169 = if not v108() then v167.VersionItemSelect else v167.VersionItemSelect and v167.VersionItemSelect[1];
            if l_Id_1 then
                v111.props.dispatchPutPackagePermissionsRequest(v111.props.Network.networkInterface, l_Id_1, v169);
            end;
        end;
        local l_changeTable_0 = v111.props.changeTable;
        local v172 = l_changeTable_0 and next(l_changeTable_0) ~= nil;
        v111.props.resetUploadResult();
        v158();
        if v172 then
            v166(l_changeTable_0);
            if v111.props.isPackageAsset then
                local l_Id_2 = v111.props.assetConfigData.Id;
                local v174 = nil;
                v174 = if not v108() then l_changeTable_0.VersionItemSelect else l_changeTable_0.VersionItemSelect and l_changeTable_0.VersionItemSelect[1];
                if l_Id_2 then
                    v111.props.dispatchPutPackagePermissionsRequest(v111.props.Network.networkInterface, l_Id_2, v174);
                end;
            end;
        end;
    end;
    v111.tryCancel = function(v175)
        if not (next(v111.props.changeTable or {}) ~= nil) then
            v111.props.onClose();
            game:GetService("StudioAssetService"):FireOnUGCSubmitCompleted(false);
            return ;
        else
            local function v176()
                v111:setState({
                    isShowChangeDiscardMessageBox = true
                });
            end;
            if not v175 then
                spawn(v176);
                return ;
            else
                v111:setState({
                    isShowChangeDiscardMessageBox = true
                });
                return ;
            end;
        end;
    end;
    v111.tryCancelNoYield = function()
        v111.tryCancel(false);
    end;
    v111.tryCancelWithYield = function()
        v111.tryCancel(true);
    end;
    v111.onMessageBoxClosed = function()
        v111:setState({
            isShowChangeDiscardMessageBox = false
        });
    end;
    v111.tryCloseAssetConfig = function(_, v178)
        if v178 == "yes" then
            if not ((not l_ToolboxSendPackageVersionNoteTelemetry_0 or not v111.props.changeTable) or not v111.props.changeTable.VersionDescriptionSave) then
                v25.onPackageNoteCanceled(v111.props.assetId);
            end;
            v111.props.Focus:get().Enabled = false;
            game:GetService("StudioAssetService"):FireOnUGCSubmitCompleted(true);
            return ;
        else
            v111:setState({
                isShowChangeDiscardMessageBox = false
            });
            return ;
        end;
    end;
    local function _(v179, v180)
        return not not v111.props.assetConfigData and v111.props.assetConfigData[v179] or v180;
    end;
    v111.onNameChange = function(v182)
        v111.props.makeChangeRequest("AssetConfigName", not not v111.props.assetConfigData and v111.props.assetConfigData.Name or "", v182);
        v111:setState({
            name = v182
        });
    end;
    v111.onDescChange = function(v183)
        v111.props.makeChangeRequest("AssetConfigDesc", not not v111.props.assetConfigData and v111.props.assetConfigData.Description or "", v183);
        v111:setState({
            description = v183
        });
    end;
    v111.onTagsChange = function(v184)
        v111.props.makeChangeRequest("AssetItemTags", not not v111.props.assetConfigData and v111.props.assetConfigData.ItemTags or {}, v184, v46.areSetsDifferent);
        v111:setState({
            tags = v184
        });
    end;
    v111.onStatusChange = function(v185)
        v111.props.makeChangeRequest("AssetConfigStatus", not not v111.props.assetConfigData and v111.props.assetConfigData.Status or nil, v185);
        v111:setState({
            status = v185
        });
    end;
    v111.onPriceChange = function(v186)
        v111.props.makeChangeRequest("AssetConfigPrice", not not v111.props.assetConfigData and v111.props.assetConfigData.Price or nil, v186);
        v111:setState({
            price = v186
        });
    end;
    if v9() then
        v111.onCategoryChange = function(v187)
            v111.props.makeChangeRequest("AssetConfigCategoryType", v187);
            v111:setState({
                categoryType = v187
            });
        end;
        v111.getUploadPermissionStatus = function()
            v60(v111.props.Network.networkInterface, v111.state.groupId, not v43.isUGCBundleType(v111.props.assetTypeEnum) and 0 or 1):andThen(function(v188)
                v111:setState(function()
                    return {
                        canUploadWithUgcRestrictions = v188.type == "allowed", 
                        canUploadWithUgcRestrictionsDenyReason = if v188.type == "error" then v188.message else tostring(v188.denyReason)
                    };
                end);
            end);
        end;
    end;
    v111.onAccessChange = function(v189, v190)
        v111.props.makeChangeRequest("AssetConfigOwner", (v111.props.assetConfigData.Creator or {}).type or 1, v189);
        local v191 = if not v110 then nil else v24.None;
        local v192 = false;
        if v190.creatorType == "Group" then
            v191 = v190.creatorId;
            v192 = true;
        end;
        if v9() then
            v111.getUploadPermissionStatus();
        end;
        v111:setState({
            owner = v24.Dictionary.join(v111.state.owner or {}, {
                typeId = v189
            }), 
            groupId = v191, 
            isGroup = if not v15() then nil else v192
        });
    end;
    v111.onGenreChange = function(v193, v194)
        v111.props.makeChangeRequest("AssetConfigGenre", (v111.props.assetConfigData.Genres or {})[1] or "All", v194.name);
        v111:setState({
            genres = v24.Dictionary.join(v111.state.genres or {}, {
                [1] = v43.getGenreName(v193)
            })
        });
    end;
    if v14() then
        v111.onDataConsentToggleClick = function()
            v111:setState(function(v195)
                return {
                    dataSharingToggled = not v195.dataSharingToggled
                };
            end);
        end;
    end;
    v111.toggleCopy = function(v196, v197)
        if v197 == nil then
            v197 = true;
        end;
        local l_status_0 = v111.state.status;
        if l_ToolboxFixMarketplacePublish_0 then
            l_status_0 = if v196 then if v43.isBuyableMarketplaceAsset(v111.props.assetTypeEnum) then v40.ASSET_STATUS.OnSale else v40.ASSET_STATUS.Free else v40.ASSET_STATUS.OffSale;
        end;
        v111:setState({
            copyChanged = v197, 
            copyOn = v196, 
            allowPackage = if not l_UnifyModelPackagePublish3_0 or v111.props.isPackageMarketplacePublishAllowed then v111.state.allowPackage else not v196, 
            status = l_status_0
        });
        local v199 = v111.props.assetConfigData.IsCopyingAllowed or false;
        if v111.props.fiatProduct then
            v199 = v111.props.fiatProduct.purchasable;
        end;
        v111.props.makeChangeRequest("AssetConfigCopy", v199, v196);
    end;
    v111.toggleComment = function(v200)
        v111:setState({
            commentOn = v200
        });
        v111.props.makeChangeRequest("AssetConfigComment", v111.props.assetConfigData.EnableComments or false, v200);
    end;
    v111.togglePackage = if not l_UnifyModelPackagePublish3_0 then nil else function(v201)
        v111:setState({
            packageOn = v201
        });
    end;
    v111.toggleDeleteLocal = function(v202)
        v111.props.updateStore({
            deleteLocal = v202
        });
    end;
    v111.versionsOnDescClicked = if not v108() then nil else function(v203, v204, v205)
        local l_versionsOpenInputKey_0 = v111.state.versionsOpenInputKey;
        local v207 = nil;
        if not (not (v203 ~= nil) or l_versionsOpenInputKey_0 == v203) or l_versionsOpenInputKey_0 == nil then
            v207 = v203;
        end;
        if not ((((not l_ToolboxSendPackageVersionNoteTelemetry_0 or not v205) or not v111.state.versionsRootItems) or not v111.state.versionsRootItems[l_versionsOpenInputKey_0]) or not v111.state.versionsRootItems[l_versionsOpenInputKey_0].descriptionColumn) and v204 ~= v111.state.versionsRootItems[l_versionsOpenInputKey_0].descriptionColumn.versionDescription then
            v25.onPackageNoteDiscarded(v111.props.assetId, l_versionsOpenInputKey_0, v204);
        end;
        if not (v205 or not v111.state.versionsRootItems[l_versionsOpenInputKey_0]) and v204 ~= v111.state.versionsRootItems[l_versionsOpenInputKey_0].descriptionColumn.versionDescription then
            v111.versionsSaveInput(v204, l_versionsOpenInputKey_0, v207);
            return ;
        else
            if v207 then
                v111:setState({
                    versionsOpenInputKey = v207
                });
            end;
            return ;
        end;
    end;
    v111.versionsSaveInput = if not v108() then nil else function(v208, v209, v210, v211, v212)
        local l_versionsRootItems_0 = v111.state.versionsRootItems;
        if l_versionsRootItems_0[v209] then
            local v214 = if not v111.props.changeTable.VersionDescriptionSave then {} else v111.props.changeTable.VersionDescriptionSave;
            local v215 = l_deepCopy_0(v214);
            v215[v209] = v208;
            v111.props.makeChangeRequest("VersionDescriptionSave", v214, v215, l_deepEqual_0);
            l_versionsRootItems_0[v209].descriptionColumn.versionDescription = v208;
        end;
        v111.versionsSetStates(l_versionsRootItems_0, v210, v211, v212);
    end;
    v111.versionsSetStates = if not v108() then nil else function(v216, v217, v218, v219)
        local v220 = {
            versionsPageRootItems = v111:versionsGetPageRootItems(v218 or v111.state.versionsPageIndex, v219 or v41.VERSIONS_ROWS_PER_PAGE), 
            versionsRootItems = v216
        };
        if v217 then
            v220.versionsOpenInputKey = v217;
        end;
        if v218 then
            v220.versionsPageIndex = v218;
        end;
        v111:setState(v220);
    end;
    v111.versionsCloseInput = if not v108() then nil else function(v221)
        if v111.state.versionsOpenInputKey ~= -1 then
            v111.versionsOnDescClicked(-1, v111.state.versionsPreviousInput, v221);
        end;
    end;
    v111.setVersionError = if not v108() then nil else function(v222, v223)
        local l_versionDescriptionErrors_0 = v111.state.versionDescriptionErrors;
        l_versionDescriptionErrors_0[v222] = v223;
        v111:setState({
            versionDescriptionErrors = l_versionDescriptionErrors_0
        });
    end;
    v111.versionsSetPreviousInput = if not v108() then nil else function(v225)
        v111:setState({
            versionsPreviousInput = v225
        });
    end;
    v111.versionsOnPageChange = if not v108() then nil else function(v226, v227)
        v111.versionsSaveInput(v111.state.versionsPreviousInput, v111.state.versionsOpenInputKey, -1, v226, v227);
    end;
    v111.onTabSelect = function(_, v229)
        if v108() and v111.state.versionsOpenInputKey ~= 1 then
            v111.versionsOnDescClicked(-1, v111.state.versionsPreviousInput, false);
        end;
        v112.setTab(v229);
    end;
    v111.onOverrideAssetSelected = function(v230)
        v111:setState({
            overrideAssetId = v230
        });
    end;
    v111.chooseThumbnail = function()
        local v231 = nil;
        local l_status_1, _ = pcall(function()
            v231 = v43.promptImagePicker();
        end);
        if not (not l_status_1 or not v231) then
            v111:setState({
                iconFile = v231
            });
            v111.props.makeChangeRequest("AssetConfigIconSelect", "", v231.Name);
            v111.props.updateStore({
                iconFile = v231
            });
        end;
    end;
    v111.onSharingChanged = function(v234)
        v111:setState({
            isAssetPublic = v234
        });
        v111.props.makeChangeRequest("SharingEnabled", v111.props.assetConfigData.SharingEnabled or false, v234);
        if not v234 then
            local l_state_2 = v111.state;
            v111.toggleCopy(false, l_state_2.copyOnOriginalValue ~= l_state_2.copyOn);
        end;
    end;
    v111.getPublishingRequirementsAndAssetMediaMetadataArray = function()
        v111.getPublishingRequirements():andThen(function(v236)
            local l_props_3 = v111.props;
            if ((v236 and v236.verification) and v236.verification.isVerified) and l_props_3.assetTypeEnum == Enum.AssetType.Plugin then
                l_props_3.dispatchGetAssetMediaMetadataArray(l_props_3.Network.networkInterface, l_props_3.assetId);
            end;
        end);
    end;
    v111.getPublishingRequirements = function()
        local l_props_4 = v111.props;
        local l_networkInterface_3 = l_props_4.Network.networkInterface;
        local l_assetId_0 = l_props_4.assetId;
        local l_assetTypeEnum_2 = l_props_4.assetTypeEnum;
        local l_isPackageAsset_0 = l_props_4.isPackageAsset;
        local v243 = nil;
        if l_isPackageAsset_0 then
            v243 = {
                v57.Package
            };
        end;
        return l_props_4.dispatchGetPublishingRequirements(l_networkInterface_3, l_assetId_0, l_assetTypeEnum_2, v243);
    end;
    v111.onAdditionalImagesChanged = function(v244)
        v111.props.makeChangeRequest("assetMediaUpdateData", nil, v244);
        v111:setState({
            assetMediaUpdateData = v244
        });
    end;
    v111.isValidCatalogAsset = function()
        return (v43.isCatalogAsset(v111.props.assetTypeEnum) or v43.isUGCBundleType(v111.props.assetTypeEnum)) and v111.props.assetTypeValidationSucceeded;
    end;
    if v108() then
        v111.validVersionDescriptions = function()
            for _, v246 in pairs(v111.state.versionDescriptionErrors) do
                if v246 then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    v111.getMessageBoxProps = function(v247)
        local l_props_5 = v111.props;
        local v249 = {
            TextSize = v41.FONT_SIZE_MEDIUM, 
            Font = v41.FONT, 
            Icon = v39.INFO_ICON, 
            onButtonClicked = v111.tryCloseAssetConfig, 
            onClose = v111.onMessageBoxClosed
        };
        if not v247 then
            v249.Title = l_props_5.Localization:getText("General", "Discard");
            v249.Text = l_props_5.Localization:getText("General", "DiscardMessage");
            v249.buttons = {
                {
                    Text = l_props_5.Localization:getText("General", "SearchOptionsCancel"), 
                    Font = v41.FONT, 
                    TextSize = v41.FONT_SIZE_MEDIUM, 
                    action = "no"
                }, 
                {
                    Text = l_props_5.Localization:getText("General", "Discard"), 
                    Font = v41.FONT, 
                    TextSize = v41.FONT_SIZE_MEDIUM, 
                    action = "yes"
                }
            };
            return v249;
        else
            v249.Title = l_props_5.Localization:getText("AssetConfig", "Error");
            v249.Text = l_props_5.Localization:getText("AssetConfig", "GetAssetFailed");
            v249.buttons = {
                {
                    Text = l_props_5.Localization:getText("Common", "Close"), 
                    Font = v41.FONT, 
                    TextSize = v41.FONT_SIZE_MEDIUM, 
                    action = "yes"
                }
            };
            return v249;
        end;
    end;
end;
v106.attachXButtonCallback = function(v250)
    if v250.props.pluginGui then
        v250.props.pluginGui:BindToClose(v250.tryCancelNoYield);
    end;
end;
v106.detachXButtonCallback = function(v251)
    if v251.props.pluginGui then
        v251.props.pluginGui:BindToClose(nil);
    end;
end;
v106.isLoading = function(v252)
    local v253 = false;
    if v252.props.screenFlowType == v40.FLOW_TYPE.EDIT_FLOW then
        v253 = not v252.state.assetId;
    end;
    return v253;
end;
local function v255(v254)
    return v24.Dictionary.join({}, v254[1] or {});
end;
v106.didUpdate = function(v256, v257, v258)
    if v257.isPackageAsset ~= nil and v257.isPackageAsset ~= v256.props.isPackageAsset then
        v256.getPublishingRequirements();
    end;
    if v256.props.screenFlowType == v40.FLOW_TYPE.EDIT_FLOW then
        local l_assetConfigData_0 = v256.props.assetConfigData;
        if next(l_assetConfigData_0) then
            if not v256.state.dispatchGetFunction then
                local v260 = l_assetConfigData_0.Creator or {};
                local v261 = not v256.state.groupMetadata or next(v256.state.groupMetadata) == nil;
                if not (v260.typeId == v58.OWNER_TYPES.User) or v260.username then
                    if not (not (v260.typeId == v58.OWNER_TYPES.Group) or not v261) then
                        v256.props.dispatchGetGroupMetadata(v260.targetId);
                        v256.props.dispatchGetGroupRoleInfo(v256.props.Network.networkInterface, v260.targetId);
                        v256:setState({
                            dispatchGetFunction = true
                        });
                    end;
                else
                    v256.props.dispatchGetUsername(v260.targetId);
                    v256:setState({
                        dispatchGetFunction = true
                    });
                end;
            end;
            if not v256.init then
                local v262 = nil;
                if l_assetConfigData_0.AssetPermissions then
                    v262 = v38.isAssetPublic(l_assetConfigData_0.AssetPermissions);
                end;
                local l_Status_0 = l_assetConfigData_0.Status;
                local v264 = l_assetConfigData_0.IsCopyingAllowed or v43.isOnSale(l_Status_0);
                if v256.props.fiatProduct then
                    v264 = v256.props.fiatProduct.purchasable;
                end;
                local v265 = nil;
                if l_ToolboxEditDialogUseMPRS2_0 then
                    v265 = v256.props.isPublishingAllowed;
                    if v256.props.isPackageAsset then
                        v265 = v256.props.isPackageMarketplacePublishAllowed or false;
                    end;
                end;
                v256:setState({
                    assetId = not not v43.isMarketplaceAsset(v256.props.assetTypeEnum) and l_assetConfigData_0.Id or l_assetConfigData_0.AssetId, 
                    name = l_assetConfigData_0.Name, 
                    description = l_assetConfigData_0.Description, 
                    owner = l_assetConfigData_0.Creator, 
                    genres = l_assetConfigData_0.Genres, 
                    allowCopy = if not l_ToolboxEditDialogUseMPRS2_0 then l_assetConfigData_0.IsPublicDomainEnabled else v264 or v265, 
                    copyOn = v264, 
                    copyOnOriginalValue = v264, 
                    commentOn = l_assetConfigData_0.EnableComments, 
                    price = l_assetConfigData_0.Price or v43.getMinPrice(v256.props.allowedAssetTypesForRelease, v256.props.assetTypeEnum), 
                    status = l_Status_0, 
                    isAssetPublic = v262, 
                    isAssetPublicOriginalValue = v262, 
                    publishingRestriction = if not v16() then nil else v45.getRestrictionThatAppliesToAsset(v256.props.publishingRestrictions)
                });
                v256.init = true;
            end;
            if l_assetConfigData_0.ItemTags and v256.state.tags == nil then
                v256:setState({
                    tags = v46.getTagsFromItemTags(l_assetConfigData_0.ItemTags)
                });
            end;
        else
            return ;
        end;
    else
        if (l_UnifyModelPackagePublish3_0 and v256.props.isPublishingAllowed ~= nil) and v256.state.allowCopy ~= v256.props.isPublishingAllowed then
            v256:setState(function(_)
                if v256.props.isPublishingAllowed ~= v257.isPublishingAllowed then
                    return {
                        allowCopy = v256.props.isPublishingAllowed
                    };
                else
                    return nil;
                end;
            end);
        elseif v256.props.isVerifiedCreator ~= nil and v256.state.allowCopy ~= v256.props.isVerifiedCreator then
            v256:setState({
                allowCopy = v256.props.isVerifiedCreator
            });
        end;
        if v256.props.screenFlowType == v40.FLOW_TYPE.UPLOAD_FLOW and v257.assetTypeEnum ~= v256.props.assetTypeEnum then
            v256:getAssetInformation();
        end;
    end;
    if v108() then
        local l_versionsCurrentItem_0 = v258.versionsCurrentItem;
        local l_versionHistory_0 = v256.props.versionHistory;
        if not (next(l_versionsCurrentItem_0) or not l_versionHistory_0) then
            local v269 = {};
            for _, v271 in ipairs(l_versionHistory_0) do
                v269[v271.assetVersionNumber] = {
                    versionColumn = v271.assetVersionNumber, 
                    descriptionColumn = {
                        versionDescription = v271.versionDescription, 
                        created = v271.created, 
                        assetVersionNumber = v271.assetVersionNumber, 
                        creatorId = v271.creatorTargetId, 
                        creatorType = v271.creatorType
                    }, 
                    restoreColumn = v271.assetVersionNumber
                };
            end;
            v256:setState({
                versionsCurrentItem = v255(l_versionHistory_0), 
                versionsRootItems = v269, 
                versionsPageRootItems = v256:versionsGetPageRootItems(1, v41.VERSIONS_ROWS_PER_PAGE)
            });
        end;
    end;
end;
if v108() then
    v106.versionsGetPageRootItems = function(v272, v273, v274)
        local v275 = nil;
        local v276 = nil;
        local v277 = {};
        if v272.state.versionsRootItems then
            v275 = (v273 - 1) * v274 + 1;
            v276 = (v275 + v274) - 1;
            for v278 = #v272.state.versionsRootItems, 1, -1 do
                table.insert(v277, v272.state.versionsRootItems[v278]);
            end;
        end;
        local v279 = v272.state.versionsRootItems and l_slice_0(v277, v275, v276);
        if not v272.state.versionsRootItems then
            return {};
        else
            return v279;
        end;
    end;
end;
if v14() then
    v106.getDefaultBundleDataSharing = function(v280)
        v90(v280.props.Network.networkInterface):andThen(function(_, v282)
            v280:setState(function()
                return {
                    dataSharingEnabled = v282.isEligible, 
                    dataSharingToggled = v282.isEligible and not v282.configurations[1].isOptOut
                };
            end);
        end);
    end;
end;
v106.getAssetInformation = function(v283)
    local l_assetId_1 = v283.props.assetId;
    local l_instances_0 = v283.props.instances;
    local l_state_3 = v283.state;
    local l_changeTable_1 = v283.props.changeTable;
    local v288 = l_changeTable_1 and next(l_changeTable_1) ~= nil;
    if v40.FLOW_TYPE.EDIT_FLOW == v283.props.screenFlowType then
        if l_assetId_1 then
            if not v43.isCatalogAsset(v283.props.assetTypeEnum) then
                v283.getPublishingRequirementsAndAssetMediaMetadataArray();
                v283.props.dispatchGetMarketplaceInfo(v283.props.Network.networkInterface, l_assetId_1);
                if v283.props.isPackageAsset == nil then
                    v283.props.dispatchPostPackageMetadataRequest(v283.props.Network.networkInterface, l_assetId_1);
                end;
                v283.props.dispatchGetPackageCollaboratorsRequest(v283.props.Network.networkInterface, l_assetId_1);
                if not v283.props.hasPackagePermission then
                    v283.props.dispatchPostAssetCheckPermissions(v283.props.Network.networkInterface, {
                        l_assetId_1
                    });
                    return ;
                end;
            else
                v283.props.getAssetDetails(v283.props.Network.networkInterface, l_assetId_1, false);
                if v46.areTagsEnabled(v283.props.isItemTagsFeatureEnabled, v283.props.enabledAssetTypesForItemTags, v283.props.assetTypeEnum) then
                    v283.props.getAssetTags(v283.props.Network.networkInterface, l_assetId_1);
                    return ;
                end;
            end;
        end;
    else
        if v283.props.screenFlowType == v40.FLOW_TYPE.UPLOAD_FLOW then
            if not v43.isMarketplaceAsset(v283.props.assetTypeEnum) then
                v283:setState(function()
                    return {
                        status = nil
                    };
                end);
            else
                v283:setState(function()
                    return {
                        status = v40.ASSET_STATUS.OffSale
                    };
                end);
            end;
            if not v43.isCatalogAsset(v283.props.assetTypeEnum) then
                v283:setState(function()
                    return {
                        price = nil
                    };
                end);
            else
                v283:setState(function()
                    return {
                        price = v43.getMinPrice(v283.props.allowedAssetTypesForRelease, v283.props.assetTypeEnum)
                    };
                end);
            end;
        end;
        if not (not (not (l_state_3.name ~= nil) or l_state_3.name == "") or not l_instances_0) and #l_instances_0 > 0 then
            if not v288 then
                v283:setState(function()
                    return {
                        name = l_instances_0[1].Name
                    };
                end);
            elseif l_changeTable_1.AssetConfigName then
                v283:setState(function()
                    return {
                        name = l_changeTable_1.AssetConfigName
                    };
                end);
            end;
        end;
        if not ((not (not (l_state_3.description ~= nil) or l_state_3.description == "") or not v288) or not l_changeTable_1.AssetConfigDesc) then
            v283:setState(function()
                return {
                    description = l_changeTable_1.AssetConfigDesc
                };
            end);
        end;
        v283.props.getIsVerifiedCreator(v283.props.Network.networkInterface);
        if not v43.isCatalogAsset(v283.props.assetTypeEnum) then
            if not v43.isUGCBundleType(v283.props.assetTypeEnum) then
                if not (v283.props.assetTypeEnum == nil) or v283.props.assetId ~= nil then
                    v283.getPublishingRequirements();
                end;
            else
                local v289 = v43.getUGCBodyBundleAssetQuantities(v283.props.instances[1], v283.props.allowedBundleTypeSettings, v283.props.assetTypeEnum);
                if v289 ~= nil then
                    v283.props.getUGCBundleUploadFee(v283.props.Network.networkInterface, v283.props.assetTypeEnum, v289);
                end;
            end;
        else
            v283.props.getCatalogItemUploadFee(v283.props.Network.networkInterface, v283.props.assetTypeEnum, v283.props.instances);
        end;
        v283.props.dispatchSetDescendantPermissions({});
        v283:setState({
            descendantIds = {}
        });
        local v290 = {};
        if l_instances_0 and v283.props.assetTypeEnum == Enum.AssetType.Model then
            for _, v292 in pairs(l_instances_0) do
                for _, v294 in pairs((v292:GetDescendants())) do
                    if v294:IsA("Sound") then
                        local v295 = string.gsub(v294.SoundId, "rbxassetid://", "");
                        v283.props.dispatchGetAssetPermissionsRequest(v283.props.Network.networkInterface, v295);
                        table.insert(v290, v295);
                    end;
                end;
            end;
            if not l_UnifyModelPackagePublish3_0 then
                v283:setState({
                    descendantIds = v290
                });
            else
                local v296, v297 = v43.isPackagePublishAllowed(l_instances_0, v283.props.Localization);
                v283:setState({
                    descendantIds = v290, 
                    canBePackage = v296, 
                    packageWarningText = v297, 
                    isPackageAsset = if #l_instances_0 == 1 then v43.isPackage(l_instances_0[1]) else nil
                });
                return ;
            end;
        end;
    end;
end;
v106.didMount = function(v298)
    v298:attachXButtonCallback();
    local v299 = v43.hasAllowedAssetTypesForRelease(v298.props.allowedAssetTypesForRelease) and not v43.isBuyableMarketplaceAsset(v298.props.assetTypeEnum);
    v298:setState(function()
        return {
            isAssetTypeSelectionAllowed = v299
        };
    end);
    v298:getAssetInformation();
    if v9() then
        v298.getUploadPermissionStatus();
    end;
    if v108() then
        local v300 = v298.state.assetId or v298.props.assetId;
        if v300 then
            v298.props.getVersionsHistory(v298.props.Network.networkInterface, v300);
        end;
    end;
    if v14() then
        v298:getDefaultBundleDataSharing();
    end;
    local l_assetId_2 = v298.props.assetId;
    local l_assetTypeEnum_3 = v298.props.assetTypeEnum;
    if not ((not l_assetId_2 or not l_assetTypeEnum_3) or not v43.isMarketplaceAsset(l_assetTypeEnum_3)) and l_assetTypeEnum_3 ~= Enum.AssetType.Animation then
        v298.props.dispatchGetFiatProduct(v298.props.Network.networkInterface, l_assetId_2, l_assetTypeEnum_3);
        if not (not v17() or not (not not l_assetTypeEnum_3 and v48.MONETIZABLE_ASSET_TYPES[l_assetTypeEnum_3.Name])) then
            v298.props.dispatchGetSellerStatus(v298.props.Network.networkInterface);
        end;
    end;
end;
v106.willUnmount = function(v303)
    v303:detachXButtonCallback();
end;
local function _(v304, v305, v306, v307)
    local v308 = true;
    local v309 = false;
    if v40.ASSET_STATUS.OnSale == v307 then
        v309 = v304 ~= nil;
    end;
    if v309 then
        v308 = false;
        v304 = tostring(v304);
        if v304 and v304:match("%d+") == v304 then
            local v310 = tonumber(v304);
            if v310 then
                local v311 = true;
                if v310 ~= 0 then
                    v311 = false;
                    if v305 <= v310 then
                        v311 = v310 <= v306;
                    end;
                end;
                v308 = v311;
            end;
        end;
    end;
    return v308;
end;
v106.render = function(v313)
    local l_props_6 = v313.props;
    local l_state_4 = v313.state;
    local l_Stylizer_0 = l_props_6.Stylizer;
    local l_Size_0 = l_props_6.Size;
    local l_isAssetPublicOriginalValue_0 = l_state_4.isAssetPublicOriginalValue;
    local l_currentTab_0 = l_props_6.currentTab;
    local v320 = l_state_4.assetId or l_props_6.assetId;
    local v321 = l_state_4.name or "";
    local v322 = l_state_4.description or "";
    local v323 = l_state_4.tags or {};
    local l_owner_0 = l_state_4.owner;
    local l_groupId_1 = l_state_4.groupId;
    if v110 then
        l_groupId_1 = if not not l_state_4.groupId and l_state_4.groupId ~= v24.None then l_state_4.groupId else nil;
    end;
    local l_genres_0 = l_state_4.genres;
    local l_allowCopy_0 = l_state_4.allowCopy;
    local l_copyOn_1 = l_state_4.copyOn;
    local l_allowComment_0 = l_state_4.allowComment;
    local l_commentOn_0 = l_state_4.commentOn;
    local l_deleteLocal_0 = l_props_6.deleteLocal;
    local v332 = if not l_UnifyModelPackagePublish3_0 then nil else l_state_4.canBePackage and l_state_4.allowPackage;
    local v333 = if not l_UnifyModelPackagePublish3_0 then nil else l_state_4.packageOn or l_state_4.isPackageAsset;
    local v334 = if not l_UnifyModelPackagePublish3_0 then nil else l_state_4.packageWarningText;
    local l_status_2 = l_state_4.status;
    local l_isAssetPublic_0 = l_state_4.isAssetPublic;
    local v337 = if not v16() then nil else l_state_4.publishingRestriction;
    local v338 = l_props_6.networkErrorAction == v58.GET_ASSET_DETAIL_FAILURE_ACTION;
    local v339 = l_state_4.isShowChangeDiscardMessageBox or v338;
    local l_isShowRobuxSpendMessageBox_0 = l_state_4.isShowRobuxSpendMessageBox;
    local l_iconFile_0 = l_state_4.iconFile;
    local l_assetMediaUpdateData_0 = l_state_4.assetMediaUpdateData;
    local l_assetTypeEnum_4 = l_props_6.assetTypeEnum;
    local l_screenFlowType_0 = l_props_6.screenFlowType;
    local v345 = l_props_6.changeTable or {};
    local l_allowedAssetTypesForRelease_0 = l_props_6.allowedAssetTypesForRelease;
    local l_allowedAssetTypesForFree_0 = l_props_6.allowedAssetTypesForFree;
    local l_allowedBundleTypeSettings_0 = l_props_6.allowedBundleTypeSettings;
    local v349 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_6.isPackageMarketplacePublishAllowed;
    local v350 = l_status_2 or v40.ASSET_STATUS.Unknown;
    local v351 = nil;
    local v352 = nil;
    local v353 = nil;
    if not v43.isUGCBundleType(l_assetTypeEnum_4) then
        local v354, v355, v356 = v43.getPriceInfo(l_allowedAssetTypesForRelease_0, l_assetTypeEnum_4);
        v351 = v354;
        v352 = v355;
        v353 = v356;
    else
        local v357, v358, v359 = v43.getPriceInfo(l_allowedBundleTypeSettings_0, l_assetTypeEnum_4);
        v351 = v357;
        v352 = v358;
        v353 = v359;
    end;
    local l_price_0 = l_state_4.price;
    local v361 = v42.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v42.keys.SHOW_OWNERSHIP);
    local v362 = v42.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v42.keys.SHOW_GENRE);
    local v363 = v42.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v42.keys.SHOW_COPY);
    if not (l_UnifyModelPackagePublish3_0 or not l_props_6.isPackageAsset) then
        v363 = false;
    end;
    local v364 = v313.state.isAssetTypeSelectionAllowed and v313.props.screenFlowType == v40.FLOW_TYPE.UPLOAD_FLOW;
    local v365 = if not l_UnifyModelPackagePublish3_0 then nil else v42.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v42.keys.SHOW_PACKAGE);
    local v366 = v42.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v42.keys.SHOW_COMMENT);
    local v367 = v42.queryParam(l_screenFlowType_0, l_assetTypeEnum_4, v42.keys.SHOW_ASSET_TYPE);
    local v368 = v43.getPreviewType(l_assetTypeEnum_4, l_props_6.instances);
    local v369 = nil;
    v369 = l_assetTypeEnum_4 ~= nil and if v43.isCatalogAsset(l_assetTypeEnum_4) then v46.areTagsEnabled(l_props_6.isItemTagsFeatureEnabled, l_props_6.enabledAssetTypesForItemTags, l_assetTypeEnum_4) else false;
    local l_l_price_0_0 = l_price_0;
    local l_v351_0 = v351;
    local l_v352_0 = v352;
    local v373 = true;
    local v374 = false;
    if v40.ASSET_STATUS.OnSale == l_status_2 then
        v374 = l_l_price_0_0 ~= nil;
    end;
    if v374 then
        v373 = false;
        l_l_price_0_0 = tostring(l_l_price_0_0);
        if l_l_price_0_0 and l_l_price_0_0:match("%d+") == l_l_price_0_0 then
            local v375 = tonumber(l_l_price_0_0);
            if v375 then
                local v376 = true;
                if v375 ~= 0 then
                    v376 = false;
                    if l_v351_0 <= v375 then
                        v376 = v375 <= l_v352_0;
                    end;
                end;
                v373 = v376;
            end;
        end;
    end;
    local l_v373_0 = v373;
    l_l_price_0_0 = v58:getAssetconfigContent(l_screenFlowType_0, l_assetTypeEnum_4, v313.props.isPackageAsset, l_owner_0);
    l_v351_0 = v313:isLoading();
    l_v352_0 = v45.checkCanSave(v345, v321, v322, l_v373_0, l_currentTab_0, l_screenFlowType_0, l_assetTypeEnum_4, l_assetMediaUpdateData_0, v313.isValidCatalogAsset(), not v108() and true or v313.validVersionDescriptions()) and not l_v351_0;
    v373 = if not v9() then nil else l_state_4.canUploadWithUgcRestrictions;
    v374 = if not v9() then nil else l_state_4.canUploadWithUgcRestrictionsDenyReason;
    if (v9() and l_state_4.categoryType == "AvatarItem") and v373 ~= nil then
        l_v352_0 = l_v352_0 and v373;
    end;
    local v378 = -240 - v41.SCROLLBAR_PADDING;
    local v379 = l_props_6.assetTypeEnum == Enum.AssetType.Audio;
    local v380 = l_props_6.assetTypeEnum == Enum.AssetType.Video;
    local v381 = l_props_6.assetTypeEnum == Enum.AssetType.Model;
    local v382 = l_props_6.assetTypeEnum == Enum.AssetType.Plugin;
    local v383 = if not l_UnifyModelPackagePublish3_0 then nil else l_state_4.isPackageAsset;
    local v384 = nil;
    local v385 = false;
    local l_Localization_0 = l_props_6.Localization;
    local v387 = l_Localization_0:getText("General", "Proceed");
    local v388 = l_Localization_0:getText("General", "GoBack");
    local v389 = l_Localization_0:getText("AssetConfigSharing", "PublicConfirmationHeading");
    local v390 = l_Localization_0:getText("AssetConfigSharing", "PublicConfirmationMessage");
    local v391 = l_Localization_0:getText("AssetConfigSharing", "PublicConfirmationTitle");
    local l_isConfirmationDialogEnabled_0 = l_state_4.isConfirmationDialogEnabled;
    local l_confirmationDialogKey_0 = l_state_4.confirmationDialogKey;
    local v394 = l_Localization_0:getText("AssetConfig", "PublishAssetDialogPublish");
    local v395 = l_Localization_0:getText("General", "Cancel");
    local v396 = l_Localization_0:getText("AssetConfig", "PublishAssetDialogDescription");
    local v397 = l_Localization_0:getText("AssetConfig", "PublishAssetDialogHeading");
    local v398 = l_Localization_0:getText("General", "RobloxStudio");
    local v399 = l_Localization_0:getText("General", "RobloxStudio");
    local v400 = l_Localization_0:getText("AssetConfig", "PayAndConfirmHeading", {
        name = v321
    });
    local v401 = l_Localization_0:getText("AssetConfig", "PayAndConfirmDescription", {
        amount = v107 .. (not l_props_6.uploadFee and "" or l_props_6.uploadFee)
    });
    local v402 = l_Localization_0:getText("General", "PayAndSubmit");
    local l_isPublishAssetsDialogEnabled_0 = l_state_4.isPublishAssetsDialogEnabled;
    if not v379 and (not l_ToolboxVideoConfigSharing2_0 or not v380) then
        if v381 then
            v384 = true;
        end;
    else
        v384 = not l_isAssetPublicOriginalValue_0;
    end;
    if not (not v379 and (not l_ToolboxVideoConfigSharing2_0 or not v380)) then
        v385 = true;
    end;
    if not v379 and (not l_ToolboxVideoConfigSharing2_0 or not v380) then
        if not ((not l_UnifyModelPackagePublish3_0 or not v333) or v383) then
            l_allowCopy_0 = v349;
        end;
    else
        l_allowCopy_0 = l_isAssetPublic_0;
    end;
    local _ = if not v14() then nil else l_state_4.dataSharingToggled;
    return v22.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.backgroundColor, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v22.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        AssetConfigMessageBox = v339 and v22.createElement(v37, v313.getMessageBoxProps(v338)), 
        RobuxSpendConfirmationMessageBox = l_isShowRobuxSpendMessageBox_0 and v22.createElement(v35, {
            AcceptText = v402, 
            CancelText = v395, 
            Description = v401, 
            Enabled = l_isShowRobuxSpendMessageBox_0, 
            Heading = v400, 
            OnAccepted = v313.onAssetPublishPayAndConfirmAccepted, 
            OnCanceled = v313.onAssetPublishPayAndConfirmCanceled, 
            Title = v399
        }), 
        AssetConfigMakeAssetPublicMessageBox = if not l_isPublishAssetsDialogEnabled_0 then nil else v22.createElement(v34, {
            AcceptText = v394, 
            CancelText = v395, 
            ConfirmationKey = nil, 
            Description = v396, 
            Enabled = l_isPublishAssetsDialogEnabled_0, 
            Heading = v397, 
            OnAccepted = v313.onAssetPublishDialogAccepted, 
            OnCanceled = v313.onAssetPublishDialogCanceled, 
            Title = v398
        }), 
        MainPage = v22.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -62), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v22.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            SharingConfirmationDialog = v22.createElement(v34, {
                AcceptText = v387, 
                CancelText = v388, 
                ConfirmationKey = l_confirmationDialogKey_0, 
                Description = v390, 
                Enabled = l_isConfirmationDialogEnabled_0, 
                Heading = v389, 
                OnAccepted = v313.onDialogAccepted, 
                OnCanceled = v313.onDialogCanceled, 
                Title = v391
            }), 
            Preview = v22.createElement(v28, {
                TotalWidth = 240, 
                TabItems = l_l_price_0_0, 
                CurrentTab = l_currentTab_0, 
                PreviewType = v368, 
                ScreenFlowType = l_screenFlowType_0, 
                AssetStatus = l_status_2, 
                AssetId = v320, 
                IconFile = l_iconFile_0, 
                AssetTypeEnum = l_assetTypeEnum_4, 
                AllowedBundleTypeSettings = if not l_EnableUGCBundleUnknownMeshPartFiltering_0 then nil else l_allowedBundleTypeSettings_0, 
                OnTabSelect = v313.onTabSelect, 
                ChooseThumbnail = v313.chooseThumbnail, 
                LayoutOrder = 1
            }), 
            VerticalLine = v22.createElement("Frame", {
                Size = UDim2.new(0, 2, 1, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Stylizer_0.divider.verticalLineColor, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            LoadingIndicatorWrapper = l_v351_0 and v22.createElement(l_Container_0, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, -240, 1, 0)
            }, {
                LoadingIndicator = v22.createElement(l_LoadingIndicator_0, {
                    Size = UDim2.new(0, 100, 0, 100), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }), 
            PublishAsset = (not l_v351_0 and v58:isGeneral(l_currentTab_0)) and v22.createElement(v29, {
                Size = UDim2.new(1, -240, 1, 0), 
                allowSelectPrivate = v384, 
                assetId = v320, 
                name = v321, 
                description = v322, 
                tags = v323, 
                owner = l_owner_0, 
                canUploadWithUgcRestrictions = if not v9() then nil else v373, 
                canUploadWithUgcRestrictionsDenyReason = if not v9() then nil else v374, 
                genres = l_genres_0, 
                allowCopy = l_allowCopy_0, 
                copyOn = l_copyOn_1, 
                allowComment = l_allowComment_0, 
                commentOn = l_commentOn_0, 
                deleteLocal = l_deleteLocal_0, 
                packageWarningText = v334, 
                allowPackage = if not l_UnifyModelPackagePublish3_0 then nil else v332, 
                packageOn = if not l_UnifyModelPackagePublish3_0 then nil else v333, 
                isPackageAsset = v383, 
                isAssetPublic = l_isAssetPublic_0, 
                publishingRestriction = if not v16() then nil else v337, 
                assetTypeEnum = l_assetTypeEnum_4, 
                onNameChange = v313.onNameChange, 
                onDescChange = v313.onDescChange, 
                onTagsChange = v313.onTagsChange, 
                onCategoryChange = if not v9() then nil else v313.onCategoryChange, 
                onOwnerSelected = v313.onAccessChange, 
                onGenreSelected = v313.onGenreChange, 
                onSharingChanged = v313.onSharingChanged, 
                onAdditionalImagesChanged = v313.onAdditionalImagesChanged, 
                toggleCopy = v313.toggleCopy, 
                toggleComment = v313.toggleComment, 
                togglePackage = if not l_UnifyModelPackagePublish3_0 then nil else v313.togglePackage, 
                toggleDeleteLocal = v313.toggleDeleteLocal, 
                dataSharingEnabled = l_state_4.dataSharingEnabled, 
                dataSharingToggled = l_state_4.dataSharingToggled, 
                onDataConsentToggleClick = if not v14() then nil else v313.onDataConsentToggleClick, 
                displayOwnership = v361, 
                displayGenre = v362, 
                displayCopy = v363, 
                displayPackage = if not l_UnifyModelPackagePublish3_0 then nil else v365, 
                displayComment = v366, 
                displayAssetType = v367, 
                displayTags = v369, 
                displaySharing = v385, 
                displayAssetTypeSelection = v364, 
                maximumItemTagsPerItem = l_props_6.maximumItemTagsPerItem, 
                allowedAssetTypesForRelease = if not v382 then nil else l_allowedAssetTypesForRelease_0, 
                allowedAssetTypesForFree = l_allowedAssetTypesForFree_0, 
                newAssetStatus = if not v382 then nil else l_status_2, 
                currentAssetStatus = if not v382 then nil else v350, 
                onStatusChange = if not v382 then nil else v313.onStatusChange, 
                onPriceChange = if not v382 then nil else v313.onPriceChange, 
                price = if not v382 then nil else l_price_0, 
                minPrice = if not v382 then nil else v351, 
                maxPrice = if not v382 then nil else v352, 
                feeRate = if not v382 then nil else v353, 
                isPriceValid = if not v382 then nil else l_v373_0, 
                LayoutOrder = 3
            }), 
            Versions = if not v108() then v58:isVersions(l_currentTab_0) and v22.createElement(v31, {
                Size = UDim2.new(1, -240, 1, 0), 
                assetId = v320, 
                LayoutOrder = 3
            }) else v58:isVersions(l_currentTab_0) and v22.createElement(v31, {
                Size = UDim2.new(1, -240, 1, -20), 
                assetId = v320, 
                LayoutOrder = 3, 
                currentItem = l_state_4.versionsCurrentItem, 
                rootItems = l_state_4.versionsRootItems, 
                openInputKey = l_state_4.versionsOpenInputKey, 
                previousInput = l_state_4.versionsPreviousInput, 
                pageIndex = l_state_4.versionsPageIndex, 
                pageRootItems = l_state_4.versionsPageRootItems, 
                versionHistory = l_props_6.versionHistory, 
                onDescClicked = v313.versionsOnDescClicked, 
                closeInput = v313.versionsCloseInput, 
                setVersionError = v313.setVersionError, 
                setPreviousInput = v313.versionsSetPreviousInput, 
                onPageChange = v313.versionsOnPageChange, 
                setStates = v313.versionsSetStates
            }), 
            Sales = v58:isSales(l_currentTab_0) and v22.createElement(v32, {
                size = UDim2.new(1, -240, 1, 0), 
                assetTypeEnum = l_props_6.assetTypeEnum, 
                allowedAssetTypesForRelease = l_allowedAssetTypesForRelease_0, 
                newAssetStatus = l_status_2, 
                currentAssetStatus = v350, 
                price = l_price_0, 
                minPrice = v351, 
                maxPrice = v352, 
                feeRate = v353, 
                isPriceValid = l_v373_0, 
                onStatusChange = v313.onStatusChange, 
                onPriceChange = v313.onPriceChange, 
                layoutOrder = 3
            }), 
            OverrideAsset = v58:isOverride(l_currentTab_0) and v22.createElement(v36, {
                Size = UDim2.new(1, -240, 1, 0), 
                assetTypeEnum = l_assetTypeEnum_4, 
                instances = l_props_6.instances, 
                onOverrideAssetSelected = v313.onOverrideAssetSelected, 
                LayoutOrder = 3
            }), 
            PackagePermissions = v58:isPermissions(l_currentTab_0) and v22.createElement(v33, {
                Size = UDim2.new(1, v378, 1, 0), 
                Owner = l_owner_0, 
                AssetId = v320, 
                LayoutOrder = 3
            })
        }), 
        Footer = v22.createElement(v30, {
            AssetId = l_state_4.overrideAssetId, 
            CanSave = l_v352_0, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 62), 
            TryCancel = v313.tryCancelWithYield, 
            TryPublish = v313.tryPublishWithConfirmDialog
        })
    });
end;
return v23.connect(function(v405, v406)
    v405 = v405 or {};
    local v407 = v405.idToFiatProductMap or {};
    local v408 = v405.assetConfigData or {};
    local l_changed_0 = v405.changed;
    local v410 = v405.publishingRequirements or {};
    if not v410.verification then
        local _ = {};
    end;
    local v412 = v410.publishing or {};
    return {
        assetConfigData = v408, 
        assetTypeEnum = v405.assetTypeEnum, 
        assetTypeValidationSucceeded = v405.assetTypeValidationSucceeded, 
        categoryType = v405.categoryType, 
        currentScreen = v405.currentScreen, 
        changeTable = l_changed_0, 
        screenFlowType = v405.screenFlowType, 
        instances = v405.instances, 
        sourceInstances = if (l_UnifyModelPackagePublish3_0 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0) or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v405.sourceInstances else nil, 
        allowedAssetTypesForRelease = v405.allowedAssetTypesForRelease, 
        allowedAssetTypesForUpload = v405.allowedAssetTypesForUpload, 
        allowedAssetTypesForFree = v405.allowedAssetTypesForFree, 
        allowedBundleTypeSettings = v405.allowedBundleTypeSettings, 
        currentTab = v405.currentTab, 
        isVerifiedCreator = v405.isVerifiedCreator, 
        isPublishingAllowed = if l_UnifyModelPackagePublish3_0 or l_ToolboxEditDialogUseMPRS2_0 then v412.isAllowed or false else false, 
        isPackageMarketplacePublishAllowed = v57.contains(if not l_UnifyModelPackagePublish3_0 then {} else v412.allowedSubTypes or {}, v57.Package), 
        networkError = v405.networkError, 
        networkErrorAction = v405.networkErrorAction or {}, 
        isPackageAsset = v405.isPackageAsset, 
        hasPackagePermission = v406.assetId and v405.packagePermissions[v406.assetId] ~= nil, 
        isItemTagsFeatureEnabled = v405.isItemTagsFeatureEnabled, 
        enabledAssetTypesForItemTags = v405.enabledAssetTypesForItemTags, 
        maximumItemTagsPerItem = v405.maximumItemTagsPerItem, 
        isUploadFeeEnabled = v405.isUploadFeeEnabled, 
        descendantPermissions = v405.descendantPermissions, 
        uploadFee = if not l_ToolboxUGCAccessoryUploadRequest2_0 then nil else v405.uploadFee, 
        deleteLocal = v405.deleteLocal, 
        versionHistory = if not v108() then nil else v405.versionHistory, 
        permissions = if not v108() then nil else v405.collaborators or {}, 
        publishingRestrictions = if not v16() then nil else if not v16() then nil else v412.restrictions or {}, 
        fiatProduct = if not v407[v406.assetId] then v48.getDefaultFiatProduct() else v407[v406.assetId]
    };
end, function(v413)
    return {
        getAssetDetails = function(v414, v415, v416)
            v413(v63(v414, v415, v416));
        end, 
        dispatchGetMarketplaceInfo = function(v417, v418)
            v413(v77(v417, v418));
        end, 
        getAssetTags = function(v419, v420)
            v413(v64(v419, v420));
        end, 
        getVersionsHistory = function(v421, v422)
            if v108() then
                v413(v87(v421, v422));
            end;
        end, 
        makeChangeRequest = function(v423, v424, v425, v426)
            v413(v54(v423, v424, v425, v426));
        end, 
        resetUploadResult = function()
            v413(v95(v24.None));
        end, 
        uploadCatalogItem = function(v427, v428, v429, v430, v431, v432, v433)
            v413(v61(v427, v428, v429, v430, v431, v432, v433));
        end, 
        configureCatalogItem = function(v434, v435, v436, v437, v438, v439, v440, v441, v442, v443)
            v413(v62(v434, v435, v436, v437, v438, v439, v440, v441, v442, v443));
        end, 
        configureMarketplaceItem = function(v444)
            v413(v67(v444));
        end, 
        uploadMarketplaceItem = function(v445)
            v413(v68(v445));
        end, 
        postRevertVersion = function(v446, v447, v448)
            v413(v65(v446, v447, v448));
        end, 
        postVersionDescription = function(v449, v450, v451, v452)
            v413(v66(v449, v450, v451, v452));
        end, 
        setTab = function(v453)
            v413(v92(v453));
            v413(v91(v40.OVERRIDE_ASSET_ID));
        end, 
        overrideAsset = function(v454, v455, v456, v457)
            v413(v69(v454, v455, v456, v457));
        end, 
        getIsVerifiedCreator = function(v458)
            v413(v72(v458));
        end, 
        getCatalogItemUploadFee = function(v459, v460, v461)
            v413(v78(v459, v460, v461));
        end, 
        getUGCBundleUploadFee = function(v462, v463, v464)
            v413(v79(v462, v463, v464));
        end, 
        uploadCatalogItemWithFee = function(v465, v466, v467, v468, v469, v470, v471, v472, v473)
            local v474 = {};
            if v10() then
                local v475 = v470 or {};
                for v476, v477 in v475, nil, nil do
                    local v478 = v477:Clone();
                    v44(v478);
                    v474[v476] = v478;
                end;
            end;
            if not l_ToolboxUGCAccessoryUploadRequest2_0 then
                v413(v80(v465, v466, v467, v468, v469, if not v10() then v470 else v474, v471, v472));
                return ;
            else
                v413(v86(v465, v466, v467, v468, v469, if not v10() then v470 else v474, v471, v472, v473));
                return ;
            end;
        end, 
        uploadUGCBundleWithFee = function(v479, v480, v481, v482, v483, v484, v485, v486, v487)
            v413(v81(v479, v480, v481, v482, v483, v484, v485, v486, v487));
        end, 
        dispatchPostPackageMetadataRequest = function(v488, v489)
            v413(v73(v488, v489));
        end, 
        updateStore = function(v490)
            v413(v93(v490));
        end, 
        dispatchGetPackageCollaboratorsRequest = function(v491, v492)
            v413(v74(v491, v492));
        end, 
        dispatchPutPackagePermissionsRequest = function(v493, v494)
            v413(v75(v493, v494));
        end, 
        dispatchPostAssetCheckPermissions = function(v495, v496)
            v413(v76(v495, v496));
        end, 
        dispatchGetGroupMetadata = function(v497)
            v413(v96(v497));
        end, 
        dispatchGetGroupRoleInfo = function(v498, v499)
            v413(v97(v498, v499));
        end, 
        dispatchGetUsername = function(v500)
            v413(v98(v500));
        end, 
        dispatchPatchMakeAssetPublicRequest = function(v501, v502)
            v413(v82(v501, v502));
        end, 
        dispatchGetAssetPermissionsRequest = function(v503, v504)
            v413(v83(v503, v504));
        end, 
        dispatchSetDescendantPermissions = function(v505)
            v413(v94(v505));
        end, 
        dispatchGetPublishingRequirements = function(v506, v507, v508, v509)
            return v413(v84(v506, v507, v508, v509));
        end, 
        dispatchGetAssetMediaMetadataArray = function(v510, v511)
            v413(v85(v510, v511));
        end, 
        dispatchGetFiatProduct = function(v512, v513, v514)
            v413(v88(v512, v513, v514));
        end, 
        dispatchGetSellerStatus = if not v17() then nil else function(v515)
            v413(v89(v515));
        end, 
        uploadAnimationAsset = function(v516)
            v413(v70(v516));
        end, 
        overrideAnimationAsset = function(v517, v518, v519)
            v413(v71(v517, v518, v519));
        end
    };
end)((l_withContext_0({
    Focus = l_ContextServices_0.Focus, 
    IXP = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v99, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v100
})(v106)));
