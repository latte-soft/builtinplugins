local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local l_DisableSalesPageForAvatarCreations2_0 = game:GetFastFlag("DisableSalesPageForAvatarCreations2");
local v3 = game:getFastFlag("ToolboxRemoveApiProxy");
local l_UpdateAssetUploadResultBundleConfigureLink2_0 = game:GetFastFlag("UpdateAssetUploadResultBundleConfigureLink2");
local l_ChangeAvatarAssetCreatorDashboardLink_0 = game:GetFastFlag("ChangeAvatarAssetCreatorDashboardLink");
local v6 = require(l_Util_0.SharedFlags.getFFlagToolboxVotingUrlToHaveAssetIdInURL);
local v7 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local v8 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v9 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local l_ToolboxVideoTestUseLocalAudioFile_0 = game:GetFastFlag("ToolboxVideoTestUseLocalAudioFile");
local v11 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local v12 = require(l_Util_0.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v13 = require(l_Util_0.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v14 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxAnimationAPIMigration);
local v15 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v16 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = require(l_Packages_0.Framework);
local v20 = require(l_Packages_0.Dash);
local v21 = require(l_Packages_0.LuauPolyfill);
local l_Set_0 = v21.Set;
local l_Object_0 = v21.Object;
local l_Array_0 = v21.Array;
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetQuotaTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetSubTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v28 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v29 = require(l_script_FirstAncestor_0.Libs.Http.Url);
local v30 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities);
local v31 = require(l_Util_0.FiatUtil);
local v32 = require(l_Util_0.getPlaceId);
local v33 = require(l_Util_0.wrapStrictTable);
local v34 = {};
local v35 = v29.BASE_URL .. "IDE/Toolbox/Items?";
local v36 = v29.DEVELOP_URL .. "v1/toolbox/items?";
local v37 = v29.ITEM_CONFIGURATION_URL .. "v1/creations/get-assets?";
local v38 = v29.ITEM_CONFIGURATION_URL .. "v1/creations/get-asset-details";
local v39 = if not v3 then v29.API_URL .. "users/%d" else v29.USERS_URL .. "/v1/users/%d";
local v40 = v29.GROUP_URL .. "v0/groups/%d";
local v41 = v29.ITEM_CONFIGURATION_URL .. "v1/metadata";
local v42 = v29.PUBLISH_URL .. "v1/assets/upload";
local v43 = v29.PUBLISH_URL .. "v1/assets/%d/thumbnail";
local v44 = v29.DEVELOP_URL .. "v1/assets/%d";
local v45 = v29.ITEM_CONFIGURATION_URL .. "v1/assets/%d/release";
local v46 = v29.ITEM_CONFIGURATION_URL .. "v1/assets/%d/update-price";
local v47 = v29.THUMBNAIL_URL .. "v1/assets?";
local v48 = if not v7() then nil else v29.ITEM_CONFIGURATION_URL .. "v1/collectibles/check-item-upload-access?";
local v49 = v29.ITEM_CONFIGURATION_URL .. "v1/bundles/metadata";
local v50 = v29.ITEM_CONFIGURATION_URL .. "v1/bundles/creation-fee";
local v51 = v29.ITEM_CONFIGURATION_URL .. "v1/bundles/create-context";
local v52 = v29.ITEM_CONFIGURATION_URL .. "v1/bundles";
local v53 = v29.ITEM_CONFIGURATION_URL .. "v1/bundles/status";
local v54 = if not v11() then nil else v29.APIS_URL .. "resource-settings/v1/preferences:batchGet?preferenceTypes=AvatarBundles";
local v55 = if not v11() then nil else v29.APIS_URL .. "resource-settings/v1/bundles";
local v56 = if not v6() then v29.BASE_URL .. "voting/vote" else v29.BASE_URL .. "voting/vote?assetId=%s&vote=%s";
local _ = v29.BASE_URL .. "IDE/Toolbox/InsertAsset?";
local v58 = v29.DEVELOP_URL .. "v1/user/groups/canmanage";
local v59 = v29.APIS_URL .. "studio-plugin-api/v1/plugins?";
local v60 = v29.BASE_URL .. "asset/?";
local v61 = v29.GAME_ASSET_URL .. "asset/?";
local _ = v29.GAME_ASSET_URL .. "asset-thumbnail/image?";
local v63 = v29.BASE_URL .. "search/users/results?";
local v64 = v29.BASE_URL .. "headshot-thumbnail/image?";
local v65 = v29.CATALOG_URL .. "v1%s";
local v66 = v29.DEVELOP_URL .. "v1/assets/%s/saved-versions";
local v67 = v29.DEVELOP_URL .. "v1/assets/%s/saved-versions?limit=%s";
local _ = v29.DEVELOP_URL .. "v1/assets/%s/saved-versions?cursor=%s";
local v69 = v29.DEVELOP_URL .. "v1/assets/%s/revert-version?";
local v70 = v29.DEVELOP_URL .. "v1/assets?";
local v71 = v29.APIS_URL .. "packages-api/v1/packages/assets/versions/notes/get";
local v72 = v29.APIS_URL .. "packages-api/v1/packages/version-note/%s/versions/%s";
local v73 = v29.APIS_URL .. "assets/user-auth/v1/operations/%s";
local v74 = if not v14() then v29.BASE_URL .. "ide/publish/uploadnewanimation?" else v29.APIS_URL .. "assets/user-auth/v1/assets";
local v75 = if not v14() then v29.BASE_URL .. "ide/publish/uploadexistinganimation?" else v29.APIS_URL .. "assets/user-auth/v1/assets/%s";
local v76 = if not v14() then v29.BASE_URL .. "/studio/animations/validateId?" else v29.APIS_URL .. "assets/user-auth/v1/assets/%s";
local v77 = v29.DEVELOP_URL .. "v1/assets/%s?";
local v78 = v29.DATA_URL .. "Data/Upload.ashx?";
local v79 = v29.GROUP_URL .. "v2/users/%%20%%20%s/groups/roles";
local v80 = v29.DEVELOP_URL .. "v1/user/is-verified-creator";
local v81 = v29.GROUP_URL .. "v1/groups/%s/roles";
local v82 = v29.FRIENDS_URL .. "v1/users/%d/friends";
local v83 = v29.BASE_URL .. "upgrades/robux";
local v84 = v29.ECONOMY_URL .. "v1/users/%d/currency";
local _ = v29.DEVELOP_URL .. "v1/user/%d/canmanage/%d";
local v86 = v29.ECONOMY_URL .. "/v1/purchases/products/%d";
local v87 = v29.APIS_URL .. "creator-marketplace-purchasing-service/v1/products/%d/purchase";
local v88 = v29.APIS_URL .. "marketplace-fiat-service/v1/product/purchase";
local v89 = if not v12() then nil else v29.APIS_URL .. "marketplace-fiat-service/v1/purchaser/status";
local v90 = if not v15() then nil else v29.APIS_URL .. "marketplace-fiat-service/v1/seller/status";
local v91 = not l_ChangeAvatarAssetCreatorDashboardLink_0 and "/creations?activeTab=TShirt" or "/creations/catalog/%d/configure";
local v92 = if not l_UpdateAssetUploadResultBundleConfigureLink2_0 then nil else "/creations/bundle/%d/configure";
local v93 = if not v16() then nil else "/creations";
local v94 = v29.APIS_URL .. "packages-api/v1/packages/assets/versions/metadata/get";
local v95 = v29.APIS_URL .. "asset-permissions-api/v1/assets/%s/permissions";
local v96 = v29.APIS_URL .. "asset-permissions-api/v1/assets/check-actions";
local v97 = v29.APIS_URL .. "asset-permissions-api/v1/assets/check-permissions";
local v98 = v29.ITEM_CONFIGURATION_URL .. "v1/tags/prefix-search?";
local v99 = v29.ITEM_CONFIGURATION_URL .. "v1/item-tags/metadata";
local v100 = v29.ITEM_CONFIGURATION_URL .. "v1/item-tags?";
local v101 = v29.ITEM_CONFIGURATION_URL .. "v1/item-tags";
local v102 = v29.ITEM_CONFIGURATION_URL .. "v1/item-tags/%s";
local v103 = v29.APIS_URL .. "toolbox-service/v1";
local _ = v29.APIS_URL .. "toolbox-service/v1/%s?";
local v105 = v29.APIS_URL .. "toolbox-service/v1/items/details?";
local v106 = v29.APIS_URL .. "toolbox-service/v1/creations/group/%d/%s?";
local v107 = v29.APIS_URL .. "toolbox-service/v1/creations/user/%d/%s?";
local v108 = v103 .. "/voting/vote?";
local v109 = v29.ITEM_CONFIGURATION_URL .. "v1/avatar-assets/%s/get-upload-fee";
local v110 = v29.ITEM_CONFIGURATION_URL .. "v1/avatar-assets/%s/upload";
local v111 = v29.ITEM_CONFIGURATION_URL .. "v1/asset-types/%s/agents?";
local v112 = v29.APIS_URL .. "autocomplete-studio/v2/suggest?";
local v113 = v29.APIS_URL .. "marketplace-publishing-requirements-api/v1/requirements?";
local v114 = if not v9 then nil else v29.APIS_URL .. "asset-content-properties-service/v1/metadata/%d/%s/code-understanding-summaries";
local v115 = v29.APIS_URL .. "user/cloud/v2/creator-store-products/" .. "PRODUCT_NAMESPACE_CREATOR_MARKETPLACE_ASSET-%s-%d";
local v116 = v29.PUBLISH_URL .. "v1/assets/%d/media";
local v117 = v29.PUBLISH_URL .. "v1/assets/%d/media/%d";
local v118 = v29.PUBLISH_URL .. "v1/assets/%d/media/order";
local v119 = v29.PUBLISH_URL .. "v1/assets/%d/media";
local _ = v29.DEVELOP_URL .. "v1/assets/%d/latest-saved-version";
local v121 = v29.DEVELOP_URL .. "v1/universes/%d";
local v122 = if not l_game_EngineFeature_0 then nil else v29.INVENTORY_URL .. "v1/users/%d/items/%s/%d/is-owned";
local v123 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
v34.constructGetItemDetails = function(v124)
    return v105 .. v29.makeQueryString({
        assetIds = table.concat(v124, ",")
    });
end;
v34.constructGetAssetsUrl = function(v125, v126, v127, v128, v129, v130, v131)
    return v35 .. v29.makeQueryString({
        category = v125, 
        keyword = v126, 
        num = v127, 
        page = v128, 
        sort = v129, 
        groupId = v130, 
        creatorId = v131
    });
end;
local v132 = l_Set_0.new({
    v28.MUSIC.name, 
    v28.SOUND_EFFECTS.name, 
    v28.UNKNOWN_AUDIO.name, 
    v28.FREE_FONTS.name
});
v34.usesMarketplaceRoute = function(v133)
    return v132:has(v133);
end;
v34.constructGetToolboxItemsUrl = function(v134)
    local l_categoryName_0 = v134.categoryName;
    local l_ownerId_0 = v134.ownerId;
    local v137 = l_Object_0.assign({}, v20.omit(v134, {
        "categoryName", 
        "sectionName", 
        "ownerId", 
        "tags", 
        "qualityFilterData"
    }), {
        tags = if not v134.tags then nil else l_Array_0.join(v134.tags, ",")
    }, {
        placeId = if not v134.sectionName then nil else v32()
    }, {
        assetsInCameraViewport = if not v134.assetsInCameraViewport then nil else table.concat(v134.assetsInCameraViewport, ",")
    }, {
        assetsInCameraVicinity = if not v134.assetsInCameraVicinity then nil else table.concat(v134.assetsInCameraVicinity, ",")
    });
    local v138 = v28.getCategoryByName(l_categoryName_0);
    if not v138 then
        error(string.format("Could not find categoryData for %s", l_categoryName_0));
    end;
    local v139 = nil;
    if not v134.sectionName then
        if not v34.usesMarketplaceRoute(v138.name) then
            local v140 = v28.API_NAMES[l_categoryName_0];
            local v141 = v28.getTabForCategoryName(v138.name) == v28.CREATIONS;
            if not v140 then
                error(string.format("Could not find API_NAME for %s", l_categoryName_0));
            end;
            v139 = if v138.ownershipType == v28.OwnershipType.MY then string.format("%s/inventory/user/%d/%s", v103, l_ownerId_0, v140) else if v138.ownershipType == v28.OwnershipType.GROUP then if v141 then string.format("%s/creations/group/%d/%s", v103, l_ownerId_0, v140) else string.format("%s/inventory/group/%d/%s", v103, l_ownerId_0, v140) else if v138.ownershipType == v28.OwnershipType.RECENT then string.format("%s/recent/user/%d/%s", v103, l_ownerId_0, v140) else string.format("%s/%s", v103, v140);
        else
            v139 = string.format("%s/marketplace/%d", v103, v138.assetType);
        end;
    else
        v139 = string.format("%s/home/%s/section/%s/assets", v103, v28.ToolboxAssetTypeToEngine[v138.assetType].Value, v134.sectionName);
    end;
    if v137.queryParams ~= nil then
        for v142, v143 in pairs(v137.queryParams) do
            v137[v142] = v143;
        end;
    end;
    local v144 = v29.makeQueryString(v137, false, not v8() and true or false);
    if #v144 > 0 then
        v139 = v139 .. "?" .. v144;
    end;
    return v139;
end;
v34.getDevelopAssetUrl = function(v145, v146, v147, v148, v149, v150, v151, v152)
    return v36 .. v29.makeQueryString({
        category = v145, 
        keyword = v146, 
        num = v149, 
        page = v150, 
        sort = v147, 
        groupId = v151, 
        creatorType = v152, 
        creatorId = v148
    });
end;
v34.constructGetAssetGroupCreationsUrl = function(v153, v154, v155, _, v157)
    return string.format(v106, v157, v153) .. v29.makeQueryString({
        limit = v154, 
        cursor = v155
    });
end;
v34.constructGetAssetCreationsUrl = function(v158, v159, v160, _, v162)
    return v37 .. v29.makeQueryString({
        assetType = v158, 
        isArchived = false, 
        limit = v159, 
        cursor = v160, 
        groupId = v162
    });
end;
v34.constructGetAssetCreationsUrlToolboxService = function(v163, v164, v165, v166, v167)
    return string.format(v107, v167, v163) .. v29.makeQueryString({
        limit = v164, 
        cursor = v165, 
        separateModelsAndPackages = v166
    });
end;
v34.constructGetAssetCreationDetailsUrl = function()
    return v38;
end;
v34.constructGetCreatorInfoUrl = function(v168, v169)
    assert(type(v168) == "number");
    if v169 == Enum.CreatorType.Group.Value then
        return v40:format(v168);
    elseif v169 == Enum.CreatorType.User.Value then
        return v39:format(v168);
    else
        error(("Unknown creatorType '%s'"):format(v169));
        return ;
    end;
end;
v34.constructGetMetaDataUrl = function()
    return v41;
end;
v34.constructGetBundleMetadataUrl = function()
    return v49;
end;
v34.constructPostBundleCreationFeeUrl = function()
    return v50;
end;
v34.constructPostBundleCreationContextUrl = function()
    return v51;
end;
v34.constructPostCreateBundleUrl = function()
    return v52;
end;
v34.constructGetBundleCreationStatusUrl = function(v170)
    return ("%s/%s"):format(v53, v170);
end;
if v11() then
    v34.constructGetDefaultCreateBundleDataSharingUrl = function()
        return v54;
    end;
    v34.constructPostCreateBundleDataSharingUrl = function()
        return v55;
    end;
end;
if v7() then
    v34.constructUploadPermissionStatusUrl = function(v171, v172)
        if v171 == nil then
            return v48 .. v29.makeQueryString({
                targetType = tostring(v172)
            });
        else
            return v48 .. v29.makeQueryString({
                groupId = tostring(v171), 
                targetType = tostring(v172)
            });
        end;
    end;
end;
v34.constructUploadCatalogItemUrl = function()
    return v42;
end;
v34.constructUploadAssetThumbnailUrl = function(v173)
    return v43:format(v173);
end;
v34.contuctGetThumbnailStatusUrl = function(v174)
    return v47 .. v29.makeQueryString({
        assetIds = v174, 
        format = "Png", 
        size = "150x150"
    });
end;
v34.constructConfigureSalesUrl = function(v175)
    return v45:format(v175);
end;
v34.constructUpdateSalesUrl = function(v176)
    return v46:format(v176);
end;
v34.constructConfigureCatalogItemUrl = function(v177)
    return v44:format(v177);
end;
v34.constructGetVoteUrl = function(v178, v179)
    return v108 .. v29.makeQueryString({
        assetId = v178, 
        assetType = v179
    });
end;
v34.constructPostVoteUrl = function(v180, v181)
    if not v6() then
        return v56;
    else
        return (string.format(v56, v180, not v181 and "false" or "true"));
    end;
end;
v34.constructInsertAssetUrl = function(v182)
    return string.format("%s/insert/asset/%d", v103, v182);
end;
v34.constructGetPluginInfoUrl = function(v183)
    return v59 .. v29.makeQueryString({
        pluginIds = v183
    });
end;
v34.constructGetManageableGroupsUrl = function()
    return v58;
end;
v34.constructAssetIdString = function(v184)
    if not l_ToolboxVideoTestUseLocalAudioFile_0 then
        return ("rbxassetid://%d"):format(v184);
    else
        local v185 = tonumber(v184);
        if not v185 then
            return (tostring(v184));
        else
            return ("rbxassetid://%d"):format(v185);
        end;
    end;
end;
v34.constructAssetIdUrl = function(v186)
    return v60 .. v29.makeQueryString({
        id = v186
    });
end;
v34.constructAssetSavedVersionString = function(v187, v188)
    if not v123() then
        return v66:format(v187);
    else
        return v67:format(v187, v188);
    end;
end;
v34.constructGetPackageVersionDescriptionString = function()
    return v71;
end;
v34.constructSetPackageVersionDescriptionString = function(v189, v190)
    return v72:format(v189, v190);
end;
v34.constructRevertAssetVersionString = function(v191, v192)
    return v69:format(v191) .. v29.makeQueryString({
        assetVersionNumber = v192
    });
end;
v34.constructGetDevelopAssetMetadata = function(v193)
    return v70 .. v29.makeQueryString({
        assetIds = v193
    });
end;
v34.constructAssetGameAssetIdUrl = function(v194, v195, v196, v197)
    return v61 .. v29.makeQueryString({
        id = v194, 
        assetName = v197
    }) .. "#" .. v29.makeQueryString({
        assetTypeId = v195, 
        isPackage = v196
    });
end;
v34.constructAssetThumbnailUrl = function(v198, v199, v200, v201)
    return ("rbxthumb://type=%s&id=%d&w=%d&h=%d"):format(v201 or "Asset", tonumber(v198) or 0, v199, v200);
end;
v34.constructRBXThumbUrl = function(v202, v203, v204)
    return ("rbxthumb://type=%s&id=%d&w=%d&h=%d"):format(v202, tonumber(v203) or 0, v204, v204);
end;
v34.constructUserSearchUrl = function(v205, v206)
    return v63 .. v29.makeQueryString({
        keyword = v205, 
        maxRows = v206 or 3
    });
end;
v34.constructUserThumbnailUrl = function(v207, v208)
    v208 = v208 or 100;
    return v64 .. v29.makeQueryString({
        userId = v207, 
        width = v208, 
        height = v208, 
        format = "png"
    });
end;
v34.constructFavoriteCountsUrl = function(v209)
    return v65:format(("/favorites/assets/%d/count"):format(v209));
end;
v34.constructGetFavoritedUrl = function(v210, v211)
    return v65:format(("/favorites/users/%d/assets/%d/favorite"):format(v210, v211));
end;
v34.constructPostFavoriteUrl = function(v212, v213)
    return v65:format(("/favorites/users/%d/assets/%d/favorite"):format(v212, v213));
end;
v34.constructDeleteFavoriteUrl = function(v214, v215)
    return v65:format(("/favorites/users/%d/assets/%d/favorite"):format(v214, v215));
end;
v34.constructPatchAssetUrl = function(v216)
    return v77:format(v216);
end;
v34.constructPostUploadAssetUrl = function(v217, v218, v219, v220, v221, v222, v223, v224)
    return v78 .. v29.makeQueryString({
        assetid = v217, 
        type = tostring(v218), 
        name = tostring(v219), 
        description = tostring(v220), 
        genreTypeId = v221, 
        ispublic = not v222 and "False" or "True", 
        allowComments = not v223 and "False" or "True", 
        groupId = v224 or ""
    });
end;
v34.constructOperationUrl = function(v225)
    return v73:format(v225);
end;
v34.constructPostUploadAnimationUrl = function()
    return v74;
end;
v34.constructPostUploadAnimationUrlDeprecated = function(v226, v227, v228, v229)
    return v74 .. v29.makeQueryString({
        assetTypeName = tostring(v226), 
        name = tostring(v227), 
        description = tostring(v228), 
        AllID = tostring(1), 
        ispublic = "False", 
        allowComments = "True", 
        isGamesAsset = "False", 
        groupId = v229 or ""
    });
end;
v34.constructValidateAnimationUrl = function(v230)
    if not v14() then
        return v76 .. v29.makeQueryString({
            animationId = v230
        });
    else
        return v76:format(v230);
    end;
end;
v34.constructPostOverwriteAnimationUrl = function(v231)
    if not v14() then
        return v75 .. v29.makeQueryString({
            assetID = v231
        });
    else
        return v75:format(v231);
    end;
end;
v34.constructOverrideAssetsUrl = function(v232, v233)
    return v78 .. v29.makeQueryString({
        assetid = v232, 
        type = v233
    });
end;
v34.constructGetMyGroupUrl = function(v234)
    return v79:format((tostring(v234)));
end;
v34.constructIsVerifiedCreatorUrl = function()
    return v80;
end;
v34.constructGetUserFriendsUrl = function(v235)
    return v82:format(v235);
end;
v34.constructAssetPermissionsUrl = function(v236)
    return v95:format(v236);
end;
v34.constructAssetCheckPermissionsUrl = function()
    return v96;
end;
v34.getRobuxPurchaseUrl = function()
    return v83;
end;
v34.constructPostPackageMetadata = function()
    return v94;
end;
v34.constructGetRobuxBalanceUrl = function(v237)
    return v84:format(v237);
end;
v34.constructGetGroupRoleInfoUrl = function(v238)
    return v81:format(v238);
end;
v34.constructAssetCheckPermissionsBatchUrl = function()
    return v97;
end;
v34.constructAssetPurchaseUrl = function(v239, v240)
    if v239 ~= nil and not v13() then
        if v240 == Enum.AssetType.Plugin.Value then
            return v87:format(v239);
        else
            return v86:format(v239);
        end;
    else
        return v88;
    end;
end;
if v12() then
    v34.constructPurchaserStatusUrl = function()
        return v89;
    end;
end;
if v15() then
    v34.constructSellerStatusUrl = function()
        return v90;
    end;
end;
v34.constructGetTagsPrefixSearchUrl = function(v241, v242)
    return v98 .. v29.makeQueryString({
        prefix = v241, 
        numberOfResults = v242
    });
end;
v34.constructGetTagsMetadataUrl = function()
    return v99;
end;
v34.constructGetAssetItemTagsUrl = function(v243)
    return v100 .. v29.makeQueryString({
        itemIds = string.format("AssetId:%d", v243)
    });
end;
v34.constructAddAssetTagUrl = function()
    return v101;
end;
v34.constructDeleteAssetItemTagUrl = function(v244)
    return v102:format(v244);
end;
v34.constructUploadCatalogItemFormatUrl = function(v245, v246, v247, v248, v249, v250)
    return v78 .. v29.makeQueryString({
        assetid = v245, 
        type = tostring(v246), 
        name = tostring(v247), 
        description = tostring(v248), 
        isPublic = not v249 and "False" or "True", 
        format = v250
    });
end;
v34.constructAvatarAssetsGetUploadFeeUrl = function(v251)
    return v109:format(v251.Name);
end;
v34.constructAvatarAssetsUploadUrl = function(v252)
    return v110:format(v252.Name);
end;
v34.constructAssetTypeAgentsUrl = function(v253)
    return v111:format(v253.Name) .. v29.makeQueryString({
        ["requestModel.actionType"] = "Upload", 
        ["requestModel.agentType"] = "Group"
    });
end;
v34.constructToolboxAutocompleteUrl = function(v254, v255, v256)
    return v112 .. v29.makeQueryString({
        cat = v254, 
        limit = v256, 
        prefix = v255
    });
end;
v34.constructGetHomeConfigurationUrl = function(v257, v258)
    return string.format("%s/home/%s/configuration?", v103, v257.Name) .. v29.makeQueryString({
        locale = v258, 
        placeId = v32()
    });
end;
v34.constructPublishingRequirementsUrl = function(v259, v260, v261, v262)
    return v113 .. v29.makeQueryString({
        assetId = v259, 
        assetType = if not v260 then nil else v260.Name, 
        assetSubTypes = v261, 
        marketplaceType = v262
    });
end;
v34.getCreatorMarketplaceQuotas = function(v263, v264)
    return string.format("%s/v1/asset-quotas?%s", v29.PUBLISH_URL, v29.makeQueryString({
        assetType = v263.Name, 
        resourceType = v264
    }));
end;
v34.constructGetAssetMediaIdsUrl = function(v265)
    return v116:format(v265);
end;
v34.constructDeleteAssetMediaUrl = function(v266, v267)
    return v117:format(v266, v267);
end;
v34.constructPostSetAssetMediaOrder = function(v268)
    return v118:format(v268);
end;
v34.constructPostUploadAssetMedia = function(v269)
    return v119:format(v269);
end;
if l_DisableSalesPageForAvatarCreations2_0 then
    v34.constructCreatorDashboardAssetConfigUrl = function(v270)
        if v30 then
            local v271 = v30.getCreatorDashboardBaseUrl();
            local v272 = v30.getCreatorDashboardCatalogConfigUrlExtension(v270);
            if not (not v271 or not v272) then
                return v271 .. v272 or "";
            end;
        end;
        return "";
    end;
end;
if not l_ChangeAvatarAssetCreatorDashboardLink_0 then
    v34.constructCreatorDashboardAvatarAssetUrl = function()
        local v273 = if not v30 then nil else v30.getCreatorDashboardBaseUrl();
        local v274 = if not v91 then nil else v91;
        if not v273 or not v274 then
            return "";
        else
            return v273 .. v274 or "";
        end;
    end;
else
    v34.constructCreatorDashboardConfigAvatarAssetUrl = function(v275)
        local v276 = if not v30 then nil else v30.getCreatorDashboardBaseUrl();
        local v277 = if not v91 then nil else v91:format(v275);
        if not v276 or not v277 then
            return "";
        else
            return v276 .. v277 or "";
        end;
    end;
end;
if v16() then
    v34.constructCreatorDashboardCreationsPageUrl = function()
        local v278 = v30.getCreatorDashboardBaseUrl();
        local l_v93_0 = v93;
        if not v278 or not l_v93_0 then
            return "";
        else
            return v278 .. l_v93_0 or "";
        end;
    end;
end;
if l_UpdateAssetUploadResultBundleConfigureLink2_0 then
    v34.constructCreatorDashboardBundleConfigureUrl = function(v280)
        if v30 then
            local v281 = v30.getCreatorDashboardBaseUrl();
            local v282 = if not v92 then nil else v92:format(v280);
            if not (not v281 or not v282) then
                return v281 .. v282 or "";
            end;
        end;
        return "";
    end;
end;
v34.constructCreatorStoreConfigurationUrl = function(v283)
    if v30 then
        local v284 = v30.getCreatorDashboardBaseUrl();
        if not (not v284 or not v283) then
            return v284 .. ("/creations/store/%d/configure"):format(v283) or "";
        end;
    end;
    return "";
end;
v34.constructGetUniverseInfo = function(v285)
    return v121:format(v285);
end;
if v9() then
    v34.constructCodeUnderstandingSummaryUrl = function(v286)
        return v114:format(v286, "AssetInfo");
    end;
end;
v34.constructGetFiatProductUrl = function(v287, v288)
    return v115:format(v31.convertAssetTypeToProductType(v288.Value), v287);
end;
if l_game_EngineFeature_0 then
    v34.constructAssetIsOwnedUrl = function(v289, v290, v291)
        return v122:format(v289, v290, v291);
    end;
end;
return (v33(v34));
