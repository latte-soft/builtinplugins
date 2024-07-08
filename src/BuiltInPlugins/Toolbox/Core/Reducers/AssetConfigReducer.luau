local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.PagedRequestCursor);
local l_LoadingInProgress_0 = require(l_Util_0.Keys).LoadingInProgress;
local v7 = require(l_Util_0.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v9 = require(l_Actions_0.SetAssetId);
local v10 = require(l_Actions_0.SetUploadAssetType);
local v11 = require(l_Actions_0.SetUploadAssetValidationStatus);
local v12 = require(l_Actions_0.SetVersionHistoryData);
local v13 = require(l_Actions_0.SetPackageDescriptions);
local v14 = require(l_Actions_0.SetAssetConfigData);
local v15 = require(l_Actions_0.SetCurrentScreen);
local v16 = require(l_Actions_0.SetScreenConfig);
local v17 = require(l_Actions_0.AddChange);
local v18 = require(l_Actions_0.ClearChange);
local v19 = require(l_Actions_0.SetAssetGroupData);
local v20 = require(l_Actions_0.UploadResult);
local v21 = require(l_Actions_0.ValidateAnimationResult);
local v22 = require(l_Actions_0.NetworkError);
local v23 = require(l_Actions_0.SetAssetConfigTab);
local v24 = require(l_Actions_0.SetOverrideAssets);
local v25 = require(l_Actions_0.SetAssetConfigManageableGroups);
local v26 = require(l_Actions_0.SetIsVerifiedCreator);
local v27 = require(l_Actions_0.SetLoadingPage);
local v28 = require(l_Actions_0.UpdateOverrideAssetData);
local v29 = require(l_Actions_0.SetCurrentPage);
local v30 = require(l_Actions_0.SetOverrideCursor);
local v31 = require(l_Actions_0.SetAssetConfigThumbnailStatus);
local v32 = require(l_Actions_0.SetGroupMetadata);
local v33 = require(l_Actions_0.SetOwnerUsername);
local v34 = require(l_Actions_0.CollaboratorSearchActions);
local v35 = require(l_Actions_0.SetCollaborators);
local v36 = require(l_Actions_0.SetIsPackage);
local v37 = require(l_Actions_0.UpdateAssetConfigData);
local v38 = require(l_Actions_0.UpdateAssetConfigStore);
local v39 = require(l_Actions_0.SetGroupRoleInfo);
local v40 = require(l_Actions_0.SetPackagePermission);
local v41 = require(l_Actions_0.SetTagSuggestions);
local v42 = require(l_Actions_0.SetFieldError);
local v43 = require(l_Actions_0.SetUploadFee);
local v44 = require(l_Actions_0.SetAssetConfigAssetTypeAgents);
local v45 = require(l_Actions_0.SetDescendantPermissions);
local v46 = require(l_Actions_0.ResolveAssetPermissionsRollingRequest);
local v47 = require(l_Actions_0.StartInProgressAssetPermissionsRollingRequest);
local v48 = require(l_Actions_0.QueueAssetPermissionsRollingRequest);
local v49 = require(l_Actions_0.SetPublishingRequirements);
local v50 = require(l_Actions_0.SetAssetMediaIds);
local v51 = require(l_Actions_0.SetAssetMediaMetadataArray);
local v52 = require(l_Actions_0.SetProgressBarInfo);
local v53 = require(l_Actions_0.SetFiatProduct);
local v54 = require(l_Parent_0.Core.Actions.SetSellerStatus);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local v56 = require(l_Parent_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
local v57 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
return v3.createReducer({
    assetConfigData = {}, 
    assetGroupData = {}, 
    idToFiatProductMap = {}, 
    versionHistory = nil, 
    packageDescriptions = {}, 
    changed = {}, 
    assetId = nil, 
    thumbnailStatus = nil, 
    instances = nil, 
    sourceInstances = nil, 
    screenFlowType = v7.FLOW_TYPE.UPLOAD_FLOW, 
    assetTypeEnum = nil, 
    assetTypeValidationSucceeded = nil, 
    currentScreen = nil, 
    screenConfigs = {}, 
    allowedAssetTypesForRelease = {}, 
    allowedAssetTypesForUpload = {}, 
    allowedBundleTypeSettings = {}, 
    canAffordUploadFee = true, 
    uploadFee = 0, 
    currentTab = nil, 
    resultsArray = {}, 
    manageableGroups = {}, 
    assetTypeAgents = {}, 
    isVerifiedCreator = true, 
    networkError = nil, 
    networkErrorAction = nil, 
    progressPercentage = 0, 
    progressTitle = nil, 
    progressText = nil, 
    networkTable = {}, 
    fetchedAll = false, 
    loadingPage = 0, 
    currentPage = 1, 
    overrideCursor = v5.createDefaultCursor(), 
    groupMetadata = {}, 
    localUserFriends = nil, 
    cachedSearchResults = {}, 
    searchText = "", 
    success = false, 
    collaborators = {}, 
    isPackageAsset = false, 
    packagePermissions = {}, 
    descendantPermissions = {}, 
    iconFile = nil, 
    deleteLocal = nil, 
    tagSuggestions = {}, 
    latestTagSuggestionTime = 0, 
    latestTagSearchQuery = "", 
    publishingRequirements = {}, 
    sellerStatusData = if not v57() then nil else {}
}, {
    [v38.name] = function(v58, v59)
        return v2.Dictionary.join(v58, v59.storeData);
    end, 
    [v9.name] = function(v60, v61)
        return v2.Dictionary.join(v60, {
            assetId = v61.assetId
        });
    end, 
    [v10.name] = function(v62, v63)
        return v2.Dictionary.join(v62, {
            assetTypeEnum = v63.assetTypeEnum
        });
    end, 
    [v11.name] = function(v64, v65)
        return v2.Dictionary.join(v64, {
            assetTypeValidationSucceeded = v65.assetTypeValidationSucceeded
        });
    end, 
    [v15.name] = function(v66, v67)
        return v2.Dictionary.join(v66, {
            currentScreen = v67.currentScreen
        });
    end, 
    [v16.name] = function(v68, v69)
        return v2.Dictionary.join(v68, {
            screenConfigs = v2.Dictionary.join(v68.screenConfigs, {
                [v69.screen] = v2.Dictionary.join(v68.screenConfigs[v69.screen], {
                    [v69.variable] = v69.value
                })
            })
        });
    end, 
    [v12.name] = function(v70, v71)
        return v2.Dictionary.join(v70, {
            versionHistory = v71.versionHistory
        });
    end, 
    [v13.name] = function(v72, v73)
        return v2.Dictionary.join(v72, {
            packageDescriptions = v73.packageDescriptions
        });
    end, 
    [v14.name] = function(v74, v75)
        return v2.Dictionary.join(v74, {
            assetConfigData = v75.assetConfigData
        });
    end, 
    [v37.name] = function(v76, v77)
        return v2.Dictionary.join(v76, {
            assetConfigData = v2.Dictionary.join(v76.assetConfigData or {}, v77.assetConfigData)
        });
    end, 
    [v17.name] = function(v78, v79)
        return v2.Dictionary.join(v78, {
            changed = v2.Dictionary.join(v78.changed or {}, {
                [v79.setting] = v79.value
            })
        });
    end, 
    [v18.name] = function(v80, v81)
        return v2.Dictionary.join(v80, {
            changed = v2.Dictionary.join(v80.changed or {}, {
                [v81.setting] = v2.None
            })
        });
    end, 
    [v19.name] = function(v82, v83)
        return v2.Dictionary.join(v82, {
            assetGroupData = v83.assetGroupData
        });
    end, 
    [v22.name] = function(v84, v85)
        return v2.Dictionary.join(v84, {
            networkError = v85.response, 
            networkErrorAction = v85.networkErrorAction
        });
    end, 
    [v52.name] = function(v86, v87)
        return v2.Dictionary.join(v86, {
            progressPercentage = v87.progressPercentage, 
            progressTitle = v87.progressTitle, 
            progressText = v87.progressText
        });
    end, 
    [v20.name] = function(v88, v89)
        return v2.Dictionary.join(v88, {
            uploadSucceeded = v89.uploadSucceeded
        });
    end, 
    [v21.name] = function(v90, v91)
        return v2.Dictionary.join(v90, {
            validateAnimationSucceeded = v91.validateAnimationSucceeded
        });
    end, 
    [v23.name] = function(v92, v93)
        return v2.Dictionary.join(v92, {
            currentTab = v93.tabItem
        });
    end, 
    [v24.name] = function(v94, v95)
        return v2.Dictionary.join(v94, {
            resultsArray = v95.resultsArray, 
            fetchedAll = v2.None
        });
    end, 
    [v28.name] = function(v96, v97)
        return v2.Dictionary.join(v96, {
            resultsArray = v2.List.join(v96.resultsArray or {}, v97.resultsArray), 
            fetchedAll = v97.fetchedAll
        });
    end, 
    [v25.name] = function(v98, v99)
        return v2.Dictionary.join(v98, {
            manageableGroups = v99.manageableGroups
        });
    end, 
    [v26.name] = function(v100, v101)
        return v2.Dictionary.join(v100, {
            isVerifiedCreator = v101.isVerifiedCreator
        });
    end, 
    [v27.name] = function(v102, v103)
        return v2.Dictionary.join(v102, {
            loadingPage = v103.loadingPage
        });
    end, 
    [v29.name] = function(v104, v105)
        return v2.Dictionary.join(v104, {
            currentPage = v105.currentPage
        });
    end, 
    [v30.name] = function(v106, v107)
        return v2.Dictionary.join(v106, {
            overrideCursor = v107.overrideCursor
        });
    end, 
    [v31.name] = function(v108, v109)
        return v2.Dictionary.join(v108, {
            thumbnailStatus = v109.thumbnailStatus
        });
    end, 
    [v32.name] = function(v110, v111)
        return v2.Dictionary.join(v110, {
            [v111.groupMetadata.Id] = {
                name = v111.groupMetadata.Name, 
                groupMetadata = v111.groupMetadata
            }
        });
    end, 
    [v33.name] = function(v112, v113)
        if Enum.CreatorType[v112.assetConfigData.Creator.type] ~= Enum.CreatorType.User then
            return v112;
        else
            return v2.Dictionary.join(v112, {
                assetConfigData = v2.Dictionary.join(v112.assetConfigData, {
                    Creator = v2.Dictionary.join(v112.assetConfigData.Creator, {
                        username = v113.ownerUsername
                    })
                })
            });
        end;
    end, 
    [v34.LoadedLocalUserFriends.name] = function(v114, v115)
        return v2.Dictionary.join(v114, {
            localUserFriends = not not v115.success and v115.friends or {}
        });
    end, 
    [v34.LoadedLocalUserGroups.name] = function(v116, v117)
        return v2.Dictionary.join(v116, {
            localUserGroups = not not v117.success and v117.groups or {}
        });
    end, 
    [v34.LoadedWebResults.name] = function(v118, v119)
        if not v118.cachedSearchResults then
            v118 = v2.Dictionary.join(v118, {
                cachedSearchResults = {}
            });
        end;
        return v2.Dictionary.join(v118, {
            cachedSearchResults = v2.Dictionary.join(v118.cachedSearchResults, {
                [v119.key] = not not v119.success and v119.results or {}
            })
        });
    end, 
    [v34.LoadingWebResults.name] = function(v120, v121)
        if not v120.cachedSearchResults then
            v120 = v2.Dictionary.join(v120, {
                cachedSearchResults = {}
            });
        end;
        return v2.Dictionary.join(v120, {
            cachedSearchResults = v2.Dictionary.join(v120.cachedSearchResults, {
                [v121.searchTerm] = l_LoadingInProgress_0
            })
        });
    end, 
    [v34.LoadingLocalUserFriends.name] = function(v122, _)
        return v2.Dictionary.join(v122, {
            localUserFriends = l_LoadingInProgress_0
        });
    end, 
    [v34.LoadingLocalUserGroups.name] = function(v124, _)
        return v2.Dictionary.join(v124, {
            localUserGroups = l_LoadingInProgress_0
        });
    end, 
    [v34.SearchTextChanged.name] = function(v126, v127)
        return v2.Dictionary.join(v126, {
            searchText = v127.text
        });
    end, 
    [v35.name] = function(v128, v129)
        if not v128.originalCollaborators then
            return v2.Dictionary.join(v128, {
                originalCollaborators = v129.collaborators, 
                collaborators = v129.collaborators
            });
        else
            return v2.Dictionary.join(v128, {
                collaborators = v129.collaborators
            });
        end;
    end, 
    [v36.name] = function(v130, v131)
        return v2.Dictionary.join(v130, {
            isPackageAsset = v131.isPackageAsset
        });
    end, 
    [v39.name] = function(v132, v133)
        if Enum.CreatorType[v132.assetConfigData.Creator.type] ~= Enum.CreatorType.Group then
            return v132;
        else
            local l_targetId_0 = v132.assetConfigData.Creator.targetId;
            for _, v136 in pairs(v133.groupRoleInfo) do
                for v137, v138 in pairs(v132[l_targetId_0].groupMetadata.Roles) do
                    if v136.name == v138.Name then
                        v132[l_targetId_0].groupMetadata.Roles[v137] = v2.Dictionary.join(v138, {
                            Id = v136.id
                        });
                    end;
                end;
            end;
            return v132;
        end;
    end, 
    [v40.name] = function(v139, v140)
        if not v139.packagePermissions then
            v139.packagePermissions = {};
        end;
        v139.packagePermissions = v2.Dictionary.join(v139.packagePermissions, v140.packagePermissions);
        return v139;
    end, 
    [v41.name] = function(v141, v142)
        if v142.sentTime < (v141.latestTagSuggestionTime or 0) then
            return v141;
        else
            return v2.Dictionary.join(v141, {
                tagSuggestions = v142.suggestions, 
                latestTagSuggestionTime = v142.sentTime, 
                latestTagSearchQuery = v142.prefix
            });
        end;
    end, 
    [v42.name] = function(v143, v144)
        return v2.Dictionary.join(v143, {
            tabErrors = v2.Dictionary.join(v143.tabErrors or {}, {
                [v144.tabName] = v2.Dictionary.join(not not v143.tabErrors and v143.tabErrors[v144.tabName] or {}, {
                    [v144.fieldName] = v144.hasError
                })
            })
        });
    end, 
    [v43.name] = function(v145, v146)
        return v2.Dictionary.join(v145, {
            isUploadFeeEnabled = v146.isUploadFeeEnabled, 
            uploadFee = v146.uploadFee, 
            canAffordUploadFee = v146.canAffordUploadFee
        });
    end, 
    [v44.name] = function(v147, v148)
        return v2.Dictionary.join(v147, {
            assetTypeAgents = v148.assetTypeAgents
        });
    end, 
    [v45.name] = function(v149, v150)
        return v2.Dictionary.join(v149, {
            descendantPermissions = v150.permission
        });
    end, 
    [v46.name] = function(v151, v152)
        assert(v56());
        return v2.Dictionary.join(v151, {
            rollingAssetPermissionRequests = v2.Dictionary.join(v151.rollingAssetPermissionRequests, {
                inProgress = v2.List.removeValue(v151.rollingAssetPermissionRequests.inProgress, v152.id)
            })
        });
    end, 
    [v47.name] = function(v153, v154)
        assert(v56());
        return v2.Dictionary.join(v153, {
            rollingAssetPermissionRequests = v2.Dictionary.join(v153.rollingAssetPermissionRequests, {
                inProgress = v2.List.join(v153.rollingAssetPermissionRequests.inProgress, {
                    v154.id
                }), 
                queued = v2.List.removeValue(v153.rollingAssetPermissionRequests.queued, v154.id)
            })
        });
    end, 
    [v48.name] = function(v155, v156)
        assert(v56());
        return v2.Dictionary.join(v155, {
            rollingAssetPermissionRequests = v2.Dictionary.join(v155.rollingAssetPermissionRequests, {
                queued = v2.List.join(v155.rollingAssetPermissionRequests.queued, {
                    v156.id
                })
            })
        });
    end, 
    [v49.name] = function(v157, v158)
        return v2.Dictionary.join(v157, {
            publishingRequirements = v158.publishingRequirements
        });
    end, 
    [v50.name] = function(v159, v160)
        return v2.Dictionary.join(v159, {
            assetMediaIds = v160.assetMediaIds
        });
    end, 
    [v51.name] = function(v161, v162)
        return v2.Dictionary.join(v161, {
            assetMediaMetadataArray = v162.assetMediaMetadataArray
        });
    end, 
    [v53.name] = function(v163, v164)
        return v2.Dictionary.join(v163, {
            idToFiatProductMap = v2.Dictionary.join(v163.idToFiatProductMap, {
                [v164.assetId] = v164.fiatProduct
            })
        });
    end, 
    [v54.name] = if not v57() then nil else function(v165, v166)
        return v2.Dictionary.join(v165, {
            sellerStatusData = v166.sellerStatusData
        });
    end
});
