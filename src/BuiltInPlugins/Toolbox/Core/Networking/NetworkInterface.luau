local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCAgreedCreationFeeConnection);
local l_ToolboxUseToolboxServiceForGroupAnimations_0 = game:GetFastFlag("ToolboxUseToolboxServiceForGroupAnimations");
local v8 = require(l_Parent_0.Core.Flags.getFFlagToolboxDisableContextualRecommendationRetries);
local v9 = require(l_Util_0.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v10 = require(l_Util_0.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v11 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v12 = require(l_Util_0.SharedFlags.getFFlagToolboxVotingUrlToHaveAssetIdInURL);
local v13 = require(l_Parent_0.Core.Flags.getFFlagToolboxAnimationAPIMigration);
local v14 = require(l_Util_0.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v16 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local v17 = require(l_Parent_0.Libs.Http.Networking);
local l_Packages_0 = l_Parent_0.Packages;
local v19 = require(l_Packages_0.Framework);
local v20 = require(l_Packages_0.Dash);
local l_Promise_0 = v19.Util.Promise;
local v22 = require(l_Util_0.DebugFlags);
local v23 = require(l_Util_0.getUserId);
local _ = require(l_Util_0.FiatUtil);
local v25 = require(l_Util_0.PageInfoHelper);
local v26 = require(l_Util_0.Urls);
local v27 = require(l_Util_0.Constants);
local v28 = require(l_Util_0.AssetQualityUtil);
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local _ = require(l_Parent_0.Core.Types.AssetSubTypes);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v32 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local v34 = require(l_Util_0.ToolboxUtilities);
local l_game_FastInt_0 = game:GetFastInt("ToolboxGrantUniverseAudioPermissionsTimeoutInMS");
local l_HttpService_0 = game:GetService("HttpService");
local v37 = {};
v37.__index = v37;
local _ = require(l_Parent_0.Core.Reducers.PageInfo);
local v39 = "--%s\r\n" .. "Content-Type: image/%s\r\n" .. "Content-Disposition: form-data; filename=\"%s\"; name=\"request.files\"\r\n" .. "\r\n" .. "%s\r\n" .. "--%s--\r\n";
v37.new = function()
    local v40 = {
        _networkImp = v17.new()
    };
    setmetatable(v40, v37);
    return v40;
end;
local function v45(v41, v42, v43, v44)
    if v22.shouldDebugUrls() then
        print(("NetworkInterface:%s()"):format(v41));
        print(("\t%s %s"):format(v42:upper() or "method=nil", v43 or "url=nil"));
        if v44 then
            print(("\t%s"):format((tostring(v44))));
        end;
    end;
end;
local function v46(v47, v48, v49)
    v48 = v48 or {
        attempts = 0, 
        time = 0, 
        maxRetries = 5
    };
    v49 = v49 or false;
    v48.attempts = v48.attempts + 1;
    return v47():catch(function(v50)
        local v51 = if not v49 then v50.responseCode else v50.StatusCode;
        if v51 == nil then
            if v50.HttpError == Enum.HttpError.Aborted then
                return l_Promise_0.reject(v50);
            end;
        else
            local v52 = false;
            if v51 >= 400 then
                v52 = v51 <= 499;
            end;
            if not (v48.maxRetries > v48.attempts and not v52) then
                if v49 then
                    v50.responseBody = ((v50.Body and v50.Body.errors) and v50.Body.errors[1]) and v50.Body.errors[1].userFacingMessage or "Something went wrong";
                end;
                return l_Promise_0.reject(v50);
            end;
        end;
        wait(2 ^ (v48.attempts - 1));
        return v46(v47, v48, v49);
    end);
end;
local function v60(v53, v54)
    local l_v54_BinaryContents_0 = v54:GetBinaryContents();
    local v56 = string.lower(v54.Name);
    local v57 = string.sub(v56, string.find(v56, ".", 1, true) + 1);
    local v58 = l_HttpService_0:GenerateGUID(false);
    local v59 = string.format(v39, v58, v57, v56, l_v54_BinaryContents_0, v58);
    return v59, {
        Url = v53, 
        Method = "POST", 
        Body = v59, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v58
        }
    };
end;
v37.jsonEncode = function(v61, v62)
    return v61._networkImp:jsonEncode(v62);
end;
v37.getAssets = function(v63, v64)
    local v65 = v25.getRequestInfo(v64);
    local v66 = v26.constructGetAssetsUrl(v65.category, v65.searchTerm, v27.GET_ITEMS_PAGE_SIZE, v65.targetPage, v65.sortType, v65.groupId, v65.creatorId);
    return v46(function()
        v45("getAssets", "GET", v66);
        return v63._networkImp:httpGetJson(v66);
    end);
end;
v37.getToolboxItems = function(v67, v68)
    local l_categoryName_0 = v68.categoryName;
    local v70 = nil;
    if l_categoryName_0 == v32.WHITELISTED_PLUGINS.name then
        v70 = v34.getShouldUsePluginCreatorWhitelist();
    end;
    local v71 = v20.join(v68, {
        useCreatorWhitelist = v70
    });
    local v72 = nil;
    if not (not v11() or not v32.categoryIsModel(l_categoryName_0)) then
        v72 = v28.convertQualityFilterDataToQueryStrings(v68.qualityFilterData);
        if v72 and v72 ~= "" then
            v71 = v20.join(v71, v72);
        end;
    end;
    local v73 = v26.constructGetToolboxItemsUrl(v71);
    return v46(function()
        v45("getToolboxItems", "GET", v73);
        return v67._networkImp:httpGetJson(v73);
    end, if not not v8() and v68.sectionName == v27.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then {
        attempts = 0, 
        time = 0, 
        maxRetries = 0
    } else nil);
end;
v37.getItemDetailsAssetIds = function(v74, v75)
    local v76 = v26.constructGetItemDetails(v75);
    return v46(function()
        v45("getItemDetails", "GET", v76);
        return v74._networkImp:httpGetJson(v76);
    end);
end;
v37.getItemDetails = function(v77, v78)
    local v79 = {};
    for _, v81 in ipairs(v78) do
        table.insert(v79, v81.id);
    end;
    return v77:getItemDetailsAssetIds(v79);
end;
v37.getDevelopAsset = function(v82, v83)
    local v84 = v25.getRequestInfo(v83);
    local v85 = v26.getDevelopAssetUrl(v84.category, v84.searchTerm, v84.sortType, v84.creatorId, v27.GET_ITEMS_PAGE_SIZE, v84.targetPage, v84.groupId, v84.creatorType);
    return v46(function()
        v45("getDevelopAsset", "GET", v85);
        return v82._networkImp:httpGetJson(v85);
    end);
end;
v37.getAssetCreations = function(v86, v87, v88, v89)
    local v90 = if not v87 then v89 else v25.getEngineAssetTypeForPageInfoCategory(v87);
    local v91 = v23();
    local v92 = v32.EngineAssetTypeIdToToolboxAssetType[v90.Value];
    local v93 = false;
    if v32.ToolboxMarketplaceAssetTypes[v92] ~= nil then
        v93 = v92 ~= v32.AssetType.ANIMATION;
    end;
    local l_Name_0 = v90.Name;
    local v95 = if not v93 then v26.constructGetAssetCreationsUrl(l_Name_0, v27.GET_ASSET_CREATIONS_PAGE_SIZE_LIMIT, v88, nil, nil) else v26.constructGetAssetCreationsUrlToolboxService(l_Name_0, v27.GET_ITEMS_DETAILS_PAGE_SIZE_LIMIT, v88, true, v91);
    return v46(function()
        v45("getAssetCreations", "GET", v95);
        return v86._networkImp:httpGetJson(v95);
    end);
end;
v37.getAssetGroupCreations = function(v96, v97, v98, v99, v100)
    local l_v99_0 = v99;
    local l_v100_0 = v100;
    if v97 then
        l_v99_0 = v25.getEngineAssetTypeForPageInfoCategory(v97);
        l_v100_0 = not not v32.categoryIsGroupAsset(v97.categoryName) and v25.getGroupIdForPageInfo(v97) or nil;
    end;
    local v103 = v32.EngineAssetTypeIdToToolboxAssetType[l_v99_0.Value];
    local v104;
    if not l_ToolboxUseToolboxServiceForGroupAnimations_0 then
        v104 = false;
        if v32.ToolboxMarketplaceAssetTypes[v103] ~= nil then
            v104 = v103 ~= v32.AssetType.ANIMATION;
        end;
    else
        v104 = v32.ToolboxMarketplaceAssetTypes[v103] ~= nil;
    end;
    local l_Name_1 = l_v99_0.Name;
    local v106 = if not v104 then v26.constructGetAssetCreationsUrl(l_Name_1, v27.GET_ASSET_CREATIONS_PAGE_SIZE_LIMIT, v98, nil, l_v100_0) else v26.constructGetAssetGroupCreationsUrl(l_Name_1, v27.GET_ITEMS_DETAILS_PAGE_SIZE_LIMIT, v98, nil, l_v100_0);
    return v46(function()
        v45("getAssetGroupCreations", "GET", v106);
        return v96._networkImp:httpGetJson(v106);
    end);
end;
v37.getAssetCreationDetails = function(v107, v108)
    if not (not v22.shouldDebugWarnings() or not v108) and v27.GET_ASSET_CREATIONS_DETAILS_LIMIT < #v108 then
        warn(("getAssetCreationDetails() does not support requests for more than %d assets at one time"):format(#v108));
    end;
    local v109 = v26.constructGetAssetCreationDetailsUrl();
    return v46(function()
        v45("getAssetCreationDetails", "POST", v109);
        return v107._networkImp:httpPostJson(v109, (v107._networkImp:jsonEncode({
            assetIds = v108
        })));
    end);
end;
v37.getCreatorInfo = function(v110, v111, v112)
    local v113 = v26.constructGetCreatorInfoUrl(v111, v112);
    return v46(function()
        v45("getCreatorInfo", "GET", v113);
        return v110._networkImp:httpGetJson(v113);
    end);
end;
v37.getMetaData = function(v114)
    local v115 = v26.constructGetMetaDataUrl();
    return v46(function()
        v45("getAccountInfo", "GET", v115);
        return v114._networkImp:httpGetJson(v115);
    end);
end;
if v4() then
    v37.getUploadPermissionStatus = function(v116, v117, v118)
        local v119 = v26.constructUploadPermissionStatusUrl(v117, v118);
        return v46(function()
            v45("getUploadPermissionStatus", "GET", v119);
            return v116._networkImp:httpGetJson(v119);
        end);
    end;
end;
v37.getBundleMetadata = function(v120)
    local v121 = v26.constructGetBundleMetadataUrl();
    return v46(function()
        v45("getBundleMetadata", "GET", v121);
        return v120._networkImp:httpGetJson(v121);
    end);
end;
v37.postBundleCreationFee = function(v122, v123, v124)
    local v125 = v26.constructPostBundleCreationFeeUrl();
    local v126 = v122._networkImp:jsonEncode({
        assetQuantities = v124, 
        bundleType = v123.rawValue()
    });
    return v46(function()
        v45("postBundleCreationFee", "POST", v125, v126);
        return v122._networkImp:httpPostJson(v125, v126);
    end);
end;
v37.postBundleCreationContext = function(v127, v128, v129, v130, v131)
    local v132 = v26.constructPostBundleCreationContextUrl();
    local v133 = v127._networkImp:jsonEncode({
        assetQuantities = v129, 
        bundleDescription = v131, 
        bundleName = v130, 
        bundleType = v128.rawValue()
    });
    local v134 = {
        Url = v132, 
        Method = "POST", 
        Body = v133, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    v45("postBundleCreationContext", "POST", v132, v133);
    return v127._networkImp:requestInternalRaw(v134):andThen(function(v135)
        return v127._networkImp:jsonDecode(v135.Body);
    end):catch(function(v136)
        v136.Body = if not v136.Body then nil else v127._networkImp:jsonDecode(v136.Body);
        return l_Promise_0.reject(v136);
    end);
end;
v37.postCreateBundle = function(v137, v138, v139, v140, v141, v142, v143)
    local v144 = v26.constructPostCreateBundleUrl();
    local v145 = v137._networkImp:jsonEncode({
        bundleType = v138.rawValue(), 
        name = v139, 
        description = v140, 
        assetIds = v141, 
        operationId = v142, 
        agreedCreationFee = if not v6() then nil else v143
    });
    local v146 = {
        Url = v144, 
        Method = "POST", 
        Body = v145, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    v45("postCreateBundle", "POST", v144, v145);
    return v137._networkImp:requestInternalRaw(v146):andThen(function(v147)
        return v137._networkImp:jsonDecode(v147.Body);
    end):catch(function(v148)
        v148.Body = if not v148.Body then nil else v137._networkImp:jsonDecode(v148.Body);
        return l_Promise_0.reject(v148);
    end);
end;
v37.getBundleCreationStatus = function(v149, v150)
    local v151 = v26.constructGetBundleCreationStatusUrl(v150);
    return v46(function()
        v45("getBundleCreationStatus", "GET", v151);
        return v149._networkImp:httpGetJson(v151);
    end);
end;
if v16() then
    v37.getDefaultCreateBundleDataSharing = function(v152)
        local v153 = v26.constructGetDefaultCreateBundleDataSharingUrl();
        return v46(function()
            v45("getDefaultBundleDataSharing", "GET", v153);
            return v152._networkImp:httpGetJson(v153);
        end);
    end;
    v37.postCreateBundleDataSharing = function(v154, v155, v156)
        local v157 = v26.constructPostCreateBundleDataSharingUrl();
        local v158 = v154._networkImp:jsonEncode({
            configurations = {
                {
                    bundleId = v155, 
                    dataSharingLicenseTypes = v156
                }
            }
        });
        return v46(function()
            v45("postBundleDataSharing", "POST", v157, v158);
            return v154._networkImp:httpPostJson(v157, v158);
        end);
    end;
end;
v37.getAssetMediaIds = function(v159, v160)
    local v161 = v26.constructGetAssetMediaIdsUrl(v160);
    return v46(function()
        v45("getAssetMediaIds", "GET", v161);
        return v159._networkImp:httpGetJson(v161);
    end);
end;
v37.getVote = function(v162, v163, v164)
    local v165 = v26.constructGetVoteUrl(v163, v164);
    return v46(function()
        v45("getVote", "GET", v165);
        return v162._networkImp:httpGetJson(v165);
    end);
end;
v37.postVote = function(v166, v167, v168)
    local v169 = if not v12() then v26.constructPostVoteUrl(nil, nil) else v26.constructPostVoteUrl(v167, v168);
    local v170 = v166._networkImp:jsonEncode({
        assetId = v167, 
        vote = v168
    });
    return v46(function()
        v45("postVote", "POST", v169, v170);
        return v166._networkImp:httpPostJson(v169, v170);
    end);
end;
v37.configureSales = function(v171, v172, v173, v174)
    local v175 = v26.constructConfigureSalesUrl(v172);
    local v176 = v171._networkImp:jsonEncode({
        price = v174, 
        saleStatus = v173
    });
    return v46(function()
        v45("configureSales", "POST", v175, v176);
        return v171._networkImp:httpPostJson(v175, v176);
    end);
end;
v37.updateSales = function(v177, v178, v179)
    local v180 = v26.constructUpdateSalesUrl(v178);
    local v181 = v177._networkImp:jsonEncode({
        price = v179
    });
    return v46(function()
        v45("updateSales", "POST", v180, v181);
        return v177._networkImp:httpPostJson(v180, v181);
    end);
end;
v37.postUnvote = function(v182, v183)
    local v184 = if not v12() then v26.constructPostVoteUrl(nil, nil) else v26.constructPostVoteUrl(v183, false);
    local v185 = v182._networkImp:jsonEncode({
        assetId = v183
    });
    return v46(function()
        v45("postUnvote", "POST", v184, v185);
        return v182._networkImp:httpPostJson(v184, v185);
    end);
end;
v37.postInsertAsset = function(v186, v187)
    local v188 = v26.constructInsertAssetUrl(v187);
    local v189 = {};
    return v46(function()
        v45("postInsertAsset", "POST", v188, v189);
        return v186._networkImp:httpPost(v188, v189);
    end);
end;
v37.getManageableGroups = function(v190)
    local v191 = v26.constructGetManageableGroupsUrl();
    return v46(function()
        v45("getManageableGroups", "GET", v191);
        return v190._networkImp:httpGetJson(v191);
    end);
end;
v37.getUsers = function(v192, v193, v194)
    local v195 = v26.constructUserSearchUrl(v193, v194);
    v45("getUsers", "GET", v195);
    return v192._networkImp:httpGetJson(v195);
end;
v37.getFavoriteCounts = function(v196, v197)
    local v198 = v26.constructFavoriteCountsUrl(v197);
    v45("getFavorites", "GET", v198);
    return v196._networkImp:httpGet(v198);
end;
v37.getFavorited = function(v199, v200, v201)
    local v202 = v26.constructGetFavoritedUrl(v200, v201);
    v45("getFavorited", "GET", v202);
    return v199._networkImp:httpGet(v202);
end;
v37.getDevelopAssetMetadata = function(v203, v204)
    local v205 = v26.constructGetDevelopAssetMetadata(v204);
    v45("getDevelopAssetMetadata", "GET", v205);
    return v203._networkImp:httpGet(v205);
end;
v37.getVersionsHistory = function(v206, v207, v208)
    local v209 = v26.constructAssetSavedVersionString(v207, v208);
    v45("getVersionsHistory", "GET", v209);
    return v206._networkImp:httpGet(v209);
end;
v37.postRevertVersion = function(v210, v211, v212)
    local v213 = v26.constructRevertAssetVersionString(v211, v212);
    v45("postRevertVersion", "POST", v213);
    return v210._networkImp:httpPostJson(v213, {});
end;
v37.getVersionDescriptions = function(v214, v215)
    local v216 = v26.constructGetPackageVersionDescriptionString();
    v45("getVersionDescriptions", "POST", v216);
    return v214._networkImp:httpPostJson(v216, (v214._networkImp:jsonEncode(v215)));
end;
v37.postVersionDescription = function(v217, v218, v219, v220)
    local v221 = v26.constructSetPackageVersionDescriptionString(v218, v219);
    local v222 = v217._networkImp:jsonEncode({
        message = v220
    });
    return v46(function()
        v45("postVersionDescription", "POST", v221, v222);
        return v217._networkImp:httpPostJson(v221, v222);
    end);
end;
v37.postFavorite = function(v223, v224, v225)
    local v226 = v26.constructPostFavoriteUrl(v224, v225);
    local v227 = v223._networkImp:jsonEncode({
        userId = v224, 
        assetId = v225
    });
    v45("postFavorite", "POST", v226, v227);
    return v223._networkImp:httpPostJson(v226, v227);
end;
v37.deleteFavorite = function(v228, v229, v230)
    local v231 = v26.constructDeleteFavoriteUrl(v229, v230);
    v45("deleteFavorite", "DELETE", v231);
    return v228._networkImp:httpDelete(v231);
end;
v37.uploadCatalogItem = function(v232, v233, v234)
    local v235 = v26.constructUploadCatalogItemUrl();
    local v236 = {
        Url = v235, 
        Method = "POST", 
        Body = v233, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v234
        }
    };
    v45("uploadCatalogItem", "POST FORM-DATA", v235, v233);
    return v232._networkImp:requestInternal(v236):catch(function(v237)
        return l_Promise_0.reject(v237);
    end);
end;
v37.uploadCatalogItemFormat = function(v238, v239, v240, v241, v242, v243, v244, v245)
    local v246 = v26.constructUploadCatalogItemFormatUrl(v239, v240, v241, v242, v243, v244);
    return v46(function()
        v45("uploadCatalogItemFormat", "POST", v246, v245);
        return v238._networkImp:httpPost(v246, v245);
    end);
end;
v37.uploadAssetThumbnail = function(v247, v248, v249)
    local v250 = v26.constructUploadAssetThumbnailUrl(v248);
    local v251, v252 = v60(v250, v249);
    v45("uploadAssetThumbnail", "POST FORM-DATA", v250, v251);
    return v247._networkImp:requestInternal(v252):catch(function(v253)
        return l_Promise_0.reject(v253);
    end);
end;
v37.getThumbnailStatus = function(v254, v255)
    local v256 = v26.contuctGetThumbnailStatusUrl({
        v255
    });
    v45("getThumbnailStatus", "GET", v256);
    return v254._networkImp:httpGetJson(v256);
end;
v37.configureCatalogItem = function(v257, v258, v259)
    local v260 = v26.constructConfigureCatalogItemUrl(v258);
    local v261 = v257._networkImp:jsonEncode(v259);
    local v262 = {
        Url = v260, 
        Method = "PATCH", 
        Body = v261, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    v45("configureCatalogItem", "PATCH", v260, v261);
    return v257._networkImp:requestInternal(v262):catch(function(v263)
        return l_Promise_0.reject(v263);
    end);
end;
v37.patchAsset = function(v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274)
    local v275 = v26.constructPatchAssetUrl(v265);
    local v276 = v264._networkImp:jsonEncode({
        name = v266, 
        description = v267, 
        genres = v268, 
        enableComments = v269, 
        isCopyingAllowed = v270, 
        locale = v271, 
        localName = v272, 
        localDescription = v273, 
        isConvertMarketplaceModelsToPackageEnabled = if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v274 else nil
    });
    v45("patchAsset", "PATCH", v275, v276);
    return v264._networkImp:httpPatch(v275, v276);
end;
v37.postUploadAsset = function(v277, v278, v279, v280, v281, v282, v283, v284, v285, v286)
    local v287 = v26.constructPostUploadAssetUrl(v278, v279, v280, v281, v282, v283, v284, v285);
    v45("postUploadAsset", "POST", v287, v286);
    return v277._networkImp:httpPost(v287, v286);
end;
v37.postOverrideAsset = function(v288, v289, v290, v291)
    local v292 = v26.constructOverrideAssetsUrl(v289, v290);
    v45("postOverrideAsset", "POST", v292);
    return v288._networkImp:httpPost(v292, v291);
end;
v37.validateAnimation = function(v293, v294)
    local v295 = v26.constructValidateAnimationUrl(v294);
    if not v13() then
        local v296 = {
            Url = v295, 
            Method = "GET", 
            CachePolicy = Enum.HttpCachePolicy.None, 
            Headers = {
                ["Content-Type"] = "application/json"
            }
        };
        v45("validateAnimation", "GET", v295);
        return v293._networkImp:requestInternal(v296):catch(function(v297)
            return l_Promise_0.reject(v297);
        end);
    else
        v45("validateAnimation", "GET", v295);
        return v293._networkImp:httpGetJson(v295);
    end;
end;
local function v303(v298)
    local v299 = "";
    local v300 = l_HttpService_0:GenerateGUID(false);
    for v301, v302 in v298, nil, nil do
        v299 = v299 .. "--" .. v300 .. "\r\n" .. "Content-Type: " .. v302.contentType .. "\r\n" .. "Content-Disposition: form-data; name=\"" .. v301 .. "\"";
        if v302.filename then
            v299 = v299 .. "; filename=\"" .. v302.filename .. "\"";
        end;
        v299 = v299 .. "\r\n" .. "\r\n" .. v302.body .. "\r\n";
    end;
    return v299 .. "--" .. v300 .. "--", v300;
end;
v37.waitForOperation = function(v304, v305, v306, v307)
    v306 = v306 or 5;
    v307 = v307 or 0;
    local v308 = v26.constructOperationUrl(v305);
    v45("waitForOperation", "GET", v308);
    return v304._networkImp:httpGetJson(v308):andThen(function(v309)
        if (not (v309.responseCode == 200) or not v309.responseBody) or not v309.responseBody.done then
            if v307 > 5 then
                return l_Promise_0.reject("Timeout");
            else
                wait(2 ^ (v307 - 1));
                return v304:waitForOperation(v305, v306, v307 + 1);
            end;
        else
            return v309.responseBody.response;
        end;
    end):catch(function(v310)
        return l_Promise_0.reject(v310);
    end);
end;
v37.postUploadAnimation = function(v311, _, v313, v314, v315, v316, v317)
    if not v13() then
        local v318 = v26.constructPostUploadAnimationUrlDeprecated("Animation", v313, v314, v316);
        local v319 = {
            Url = v318, 
            Method = "POST", 
            Body = v317, 
            CachePolicy = Enum.HttpCachePolicy.None, 
            Headers = {
                ["Content-Type"] = "application/octet-stream"
            }
        };
        v45("uploadAnimation", "POST", v318, v317);
        return v311._networkImp:requestInternal(v319):catch(function(v320)
            return l_Promise_0.reject(v320);
        end);
    else
        local v321 = v26.constructPostUploadAnimationUrl();
        local v322, v323 = v303({
            request = {
                contentType = "application/json", 
                body = v311._networkImp:jsonEncode({
                    assetType = Enum.AssetType.Animation.Name, 
                    displayName = v313, 
                    description = v314, 
                    creationContext = {
                        creator = {
                            userId = if v316 then nil else v315, 
                            groupId = v316
                        }
                    }
                })
            }, 
            fileContent = {
                contentType = "model/x-rbxm", 
                filename = "asset.rbxm", 
                body = v317
            }
        });
        local v324 = {
            Url = v321, 
            Method = "POST", 
            Body = v322, 
            CachePolicy = Enum.HttpCachePolicy.None, 
            Headers = {
                ["Content-Type"] = "multipart/form-data; boundary=" .. v323
            }
        };
        v45("uploadAnimation", "POST", v321, v324);
        return v311._networkImp:requestInternal(v324):andThen(function(v325)
            body = v311._networkImp:jsonDecode(v325);
            return v311:waitForOperation(body.operationId);
        end):catch(function(v326)
            return l_Promise_0.reject(v326);
        end);
    end;
end;
v37.postOverrideAnimation = function(v327, v328, v329)
    local v330 = v26.constructPostOverwriteAnimationUrl(v328);
    if not v13() then
        local v331 = {
            Url = v330, 
            Method = "POST", 
            Body = v329, 
            CachePolicy = Enum.HttpCachePolicy.None, 
            Headers = {
                ["Content-Type"] = "application/octet-stream"
            }
        };
        v45("uploadAnimation", "POST", v330, v329);
        return v327._networkImp:requestInternal(v331):catch(function(v332)
            return l_Promise_0.reject(v332);
        end);
    else
        local v333, v334 = v303({
            request = {
                contentType = "application/json", 
                body = v327._networkImp:jsonEncode({
                    assetId = tostring(v328)
                })
            }, 
            fileContent = {
                contentType = "model/x-rbxm", 
                filename = "asset.rbxm", 
                body = v329
            }
        });
        local v335 = {
            Url = v330, 
            Method = "PATCH", 
            Body = v333, 
            CachePolicy = Enum.HttpCachePolicy.None, 
            Headers = {
                ["Content-Type"] = "multipart/form-data; boundary=" .. v334
            }
        };
        v45("overrideAnimation", "PATCH", v330, v335);
        return v327._networkImp:requestInternal(v335):andThen(function(v336)
            body = v327._networkImp:jsonDecode(v336);
            return v327:waitForOperation(body.operationId);
        end):catch(function(v337)
            return l_Promise_0.reject(v337);
        end);
    end;
end;
v37.getIsVerifiedCreator = function(v338)
    local v339 = v26.constructIsVerifiedCreatorUrl();
    v45("getIsVerifiedCreator", "GET", v339);
    return v338._networkImp:httpGetJson(v339);
end;
v37.getPluginInfo = function(v340, v341)
    local v342 = v26.constructGetPluginInfoUrl(v341);
    v45("getPluginInfo", "GET", v342);
    return v340._networkImp:httpGetJson(v342);
end;
v37.getLocalUserFriends = function(v343, v344)
    local v345 = v26.constructGetUserFriendsUrl(v344);
    v45("getUserFriends", "GET", v344);
    return v343._networkImp:httpGet(v345);
end;
v37.postForPackageMetadata = function(v346, v347)
    return v346._networkImp:httpPostJson(v26.constructPostPackageMetadata(), "[{ \"assetId\" : " .. v347 .. ", \"assetVersionNumber\" : 1 }]");
end;
v37.getRobuxBalance = function(v348, v349)
    local v350 = v26.constructGetRobuxBalanceUrl(v349);
    v45("getRobuxBalance", "GET", v350);
    return v348._networkImp:httpGetJson(v350);
end;
v37.getHasEditPermissionForAsset = function(v351, v352, v353)
    local v354 = v26.constructAssetCheckPermissionsBatchUrl();
    local v355 = v351._networkImp:jsonEncode({
        requests = {
            {
                subject = {
                    subjectType = "User", 
                    subjectId = v353
                }, 
                action = "Edit", 
                assetId = v352
            }
        }
    });
    v45("getHasEditPermissionForAsset", "POST", v354, v355);
    return v351._networkImp:httpPostJson(v354, v355):andThen(function(v356)
        if #v356.responseBody.results < 1 then
            error(string.format("No results for getHasEditPermissionForAsset. assetId = %s", (tostring(v352))));
        end;
        local v357 = v356.responseBody.results[1];
        if v357.error then
            error(v357.error);
        end;
        return v357.value.status == "HasPermission";
    end);
end;
v37.purchaseAsset = function(v358, v359, v360, v361)
    local v362 = v358:jsonEncode(v360);
    local v363 = if not (v359 ~= nil) or v10() then v26.constructAssetPurchaseUrl(nil, v361) else v26.constructAssetPurchaseUrl(v359, v361);
    v45("purchaseAsset", "POST", v363);
    return v358._networkImp:httpPostJson(v363, v362);
end;
if v9() then
    v37.getPurchaserStatus = function(v364)
        local v365 = v26.constructPurchaserStatusUrl();
        v45("getPurchaserStatus", "GET", v365);
        return v364._networkImp:httpGetJson(v365);
    end;
end;
if v14() then
    v37.getSellerStatus = function(v366)
        local v367 = v26.constructSellerStatusUrl();
        v45("getSellerStatus", "GET", v367);
        return v366._networkImp:httpGetJson(v367);
    end;
end;
v37.getGroupRoleInfo = function(v368, v369)
    local v370 = v26.constructGetGroupRoleInfoUrl(v369);
    v45("getGroupRoleInfo", "GET", v369);
    return v368._networkImp:httpGet(v370);
end;
v37.grantAssetPermissions = function(v371, v372, v373)
    local v374 = v26.constructAssetPermissionsUrl(v372);
    local v375 = v371._networkImp:jsonEncode(v373);
    v45("grantAssetPermissions", "PATCH", v374, v375);
    return v371._networkImp:httpPatch(v374, v375);
end;
v37.grantAssetPermissionWithTimeout = function(v376, v377, v378)
    return v376._networkImp:requestInternalRaw({
        Url = v26.constructAssetPermissionsUrl(v377), 
        Method = "PATCH", 
        Body = v376._networkImp:jsonEncode(v378), 
        Headers = {
            ["Content-Type"] = "application/json"
        }, 
        Timeout = l_game_FastInt_0
    });
end;
v37.revokeAssetPermissions = function(v379, v380, v381)
    local v382 = v26.constructAssetPermissionsUrl(v380);
    local v383 = v379._networkImp:jsonEncode(v381);
    v45("revokeAssetPermissions", "DELETE", v382, v383);
    return v379._networkImp:httpDeleteWithPayload(v382, v383);
end;
v37.getAssetPermissions = function(v384, v385)
    local v386 = v26.constructAssetPermissionsUrl(v385);
    v45("getAssetPermissions", "GET", v386);
    return v384._networkImp:httpGetJson(v386);
end;
v37.postAssetCheckPermissions = function(v387, v388, v389)
    local v390 = v26.constructAssetCheckPermissionsUrl();
    return v46(function()
        local v391 = v387._networkImp:jsonEncode({
            actions = v388, 
            assetIds = v389
        });
        v45("postAssetCheckPermissions", "POST", v390);
        return v387._networkImp:httpPostJson(v390, v391);
    end);
end;
v37.tagsPrefixSearch = function(v392, v393, v394)
    local v395 = v26.constructGetTagsPrefixSearchUrl(v393, v394);
    return v46(function()
        v45("tagsPrefixSearch", "GET", v395);
        return v392._networkImp:httpGetJson(v395);
    end);
end;
v37.getTagsMetadata = function(v396)
    local v397 = v26.constructGetTagsMetadataUrl();
    return v46(function()
        v45("getTagsMetadata", "GET", v397);
        return v396._networkImp:httpGetJson(v397);
    end);
end;
v37.getAssetItemTags = function(v398, v399)
    local v400 = v26.constructGetAssetItemTagsUrl(v399);
    return v46(function()
        v45("getAssetItemTags", "GET", v400);
        return v398._networkImp:httpGetJson(v400);
    end);
end;
v37.addAssetTag = function(v401, v402, v403)
    local v404 = v26.constructAddAssetTagUrl();
    local v405 = v401._networkImp:jsonEncode({
        itemId = string.format("AssetId:%d", v402), 
        tagId = v403
    });
    return v46(function()
        v45("addAssetTag", "POST", v404, v405);
        return v401._networkImp:httpPost(v404, v405);
    end);
end;
v37.deleteAssetItemTag = function(v406, v407)
    local v408 = v26.constructDeleteAssetItemTagUrl(v407);
    return v46(function()
        v45("deleteAssetItemTag", "DELETE", v408);
        return v406._networkImp:httpDelete(v408);
    end);
end;
v37.avatarAssetsGetUploadFee = function(v409, v410, v411, v412)
    local v413 = v26.constructAvatarAssetsGetUploadFeeUrl(v410);
    local v414 = {
        Url = v413, 
        Method = "POST", 
        Body = v411, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v412
        }
    };
    v45("avatarAssetsGetUploadFee", "POST FORM-DATA", v413, v411);
    return v409._networkImp:requestInternalRaw(v414):catch(function(v415)
        return l_Promise_0.reject(v415);
    end);
end;
v37.avatarAssetsUpload = function(v416, v417, v418, v419)
    local v420 = v26.constructAvatarAssetsUploadUrl(v417);
    local v421 = {
        Url = v420, 
        Method = "POST", 
        Body = v418, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v419
        }
    };
    v45("avatarAssetsUpload", "POST FORM-DATA", v420, v418);
    return v416._networkImp:requestInternalRaw(v421):catch(function(v422)
        return l_Promise_0.reject(v422);
    end);
end;
v37.getAssetTypeAgents = function(v423, v424)
    local v425 = v26.constructAssetTypeAgentsUrl(v424);
    return v46(function()
        v45("getAssetTypeAgents", "GET", v425);
        return v423._networkImp:httpGetJson(v425);
    end);
end;
v37.getAutocompleteResults = function(v426, v427, v428, v429)
    local v430 = v26.constructToolboxAutocompleteUrl(v427, v428, v429);
    v45("getAutocompleteResults", "GET", v430);
    return v426._networkImp:httpGetJson(v430);
end;
v37.getHomeConfiguration = function(v431, v432, v433)
    local v434 = v26.constructGetHomeConfigurationUrl(v432, v433);
    v45("getHomeConfiguration", "GET", v434);
    return v431._networkImp:httpGetJson(v434);
end;
v37.getCreatorMarketplaceQuotas = function(v435, v436, v437)
    local v438 = v26.getCreatorMarketplaceQuotas(v436, v437);
    v45("getCreatorMarketplaceQuotas", "GET", v438);
    return v435._networkImp:httpGetJson(v438);
end;
v37.getPublishingRequirements = function(v439, v440, v441, v442)
    local v443 = v26.constructPublishingRequirementsUrl(v440, v441, v442, "Creator");
    v45("getPublishingRequirements", "GET", v443);
    return v439._networkImp:httpGetJson(v443);
end;
v37.deleteAssetMedia = function(v444, v445, v446)
    local v447 = v26.constructDeleteAssetMediaUrl(v445, v446);
    return v46(function()
        v45("deleteAssetMedia", "DELETE", v447);
        return v444._networkImp:httpDelete(v447);
    end);
end;
v37.postSetAssetMediaOrder = function(v448, v449, v450)
    local v451 = v26.constructPostSetAssetMediaOrder(v449);
    local v452 = v448._networkImp:jsonEncode(v450);
    return v46(function()
        v45("postSetAssetMediaOrder", "POST", v451, v452);
        return v448._networkImp:httpPostJson(v451, v452);
    end);
end;
v37.postUploadAssetMedia = function(v453, v454, v455)
    local v456 = v26.constructPostUploadAssetMedia(v454);
    local v457, v458 = v60(v456, v455);
    return v46(function()
        v45("postUploadAssetMedia", "POST FORM-DATA", v456, v457);
        return v453._networkImp:requestInternalRaw(v458):andThen(function(v459)
            return v453._networkImp:jsonDecode(v459.Body);
        end):catch(function(v460)
            v460.Body = if not v460.Body then nil else v453._networkImp:jsonDecode(v460.Body);
            return l_Promise_0.reject(v460);
        end);
    end, nil, true);
end;
v37.getUniverseInfo = function(v461, v462)
    local v463 = v26.constructGetUniverseInfo(v462);
    v45("getUniverseInfo", "GET", v463);
    return v461._networkImp:httpGet(v463);
end;
if v5() then
    v37.getCodeSummary = function(v464, v465)
        local v466 = v26.constructCodeUnderstandingSummaryUrl(v465);
        v45("getCodeSummary", "GET", v466);
        return v464._networkImp:httpGetJson(v466);
    end;
end;
v37.getFiatProduct = function(v467, v468, v469)
    local v470 = v26.constructGetFiatProductUrl(v468, v469);
    v45("getFiatProduct", "GET", v470);
    return v467._networkImp:httpGetJson(v470);
end;
if l_game_EngineFeature_0 then
    v37.getIsOwnedByUser = function(v471, v472, v473)
        local v474 = v26.constructAssetIsOwnedUrl(v23(), v473.Name, v472);
        v45("getIsOwnedByUser", "GET", v474);
        return v471._networkImp:httpGetJson(v474);
    end;
    v37.getIsAssetOpenForUse = function(v475, v476)
        local v477 = v26.constructAssetCheckPermissionsBatchUrl();
        local v478 = v475._networkImp:jsonEncode({
            requests = {
                {
                    subject = {
                        subjectType = "All", 
                        subjectId = ""
                    }, 
                    action = "Use", 
                    assetId = v476
                }
            }
        });
        v45("getIsAssetOpenForUse", "POST", v477, v478);
        return v475._networkImp:httpPostJson(v477, v478):andThen(function(v479)
            if not v479 or not v479.responseBody then
                return false;
            else
                if not (not (#v479.responseBody.results < 1) or not v22.shouldDebugWarnings()) then
                    error(string.format("No results for getIsAssetOpenForUse. assetId = %s", (tostring(v476))));
                end;
                local v480 = v479.responseBody.results[1];
                if not (not v480.error or not v22.shouldDebugWarnings()) then
                    error(v480.error);
                end;
                return v480.value.status == "HasPermission";
            end;
        end);
    end;
end;
return v37;
