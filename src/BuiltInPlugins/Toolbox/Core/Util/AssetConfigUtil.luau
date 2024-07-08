local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.AssetConfigConstants);
local v3 = require(l_Util_0.fixUpPreValidation);
local v4 = require(l_Util_0.getUserId);
local v5 = require(l_Util_0.Urls);
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Cryo);
local _ = require(l_Packages_0.Framework);
local v9 = require(l_Packages_0.Dash);
local v10 = require(l_Util_0.getAllowedAssetTypeEnums);
local v11 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local l_UseDefaultThumbnailForAnimation_0 = game:GetFastFlag("UseDefaultThumbnailForAnimation");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local _ = require(l_Util_0.DebugFlags);
local v16 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCFixUploadInstances);
local v17 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCToolboxFixAccessories);
local v18 = require(l_Util_0.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local _ = require(l_Parent_0.Core.Localization.getLocalizedAssetTextMap);
local _ = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local l_StudioService_0 = game:GetService("StudioService");
local function _(v23, v24)
    local v25 = 10 ^ (v24 or 0);
    return math.floor(v23 * v25 + 0.5) / v25;
end;
local v36 = {
    isUGCBundleType = function(v27)
        local v28 = true;
        if v27 ~= v2.UGCBundleTypes.Body then
            v28 = v27 == v2.UGCBundleTypes.DynamicHead;
        end;
        return v28;
    end, 
    isReadyForSale = function(v29)
        local v30 = true;
        if v2.ASSET_STATUS.ReviewApproved ~= v29 then
            v30 = true;
            if v2.ASSET_STATUS.OnSale ~= v29 then
                v30 = true;
                if v2.ASSET_STATUS.OffSale ~= v29 then
                    v30 = v2.ASSET_STATUS.DelayedRelease == v29;
                end;
            end;
        end;
        return v30;
    end, 
    isOnSale = function(v31)
        local v32 = true;
        if v2.ASSET_STATUS.OnSale ~= v31 then
            v32 = v2.ASSET_STATUS.Free == v31;
        end;
        return v32;
    end, 
    getMarketplaceFeesPercentage = function(v33, v34)
        local v35 = v33[v34.Name];
        return not not v35 and v35.marketplaceFeesPercentage or 0;
    end
};
v36.calculatePotentialEarning = function(v37, v38, v39, v40)
    v38 = tonumber(v38);
    if v38 then
        v38 = math.floor(v38 * 1 + 0.5) / 1;
        local v41 = math.floor((v38 * (0.01 * v36.getMarketplaceFeesPercentage(v37, v39))) * 1 + 0.5) / 1;
        if v38 < v40 then
            return 0;
        else
            return v38 - v41;
        end;
    else
        return 0;
    end;
end;
v36.getPriceRange = function(v42, v43)
    local v44 = (v42 and v43) and v42[v43.Name];
    return not not v44 and v44.allowedPriceRange or {};
end;
v36.getMinPrice = function(v45, v46)
    local v47 = v36.getPriceRange(v45, v46);
    if not v36.isBuyableMarketplaceAsset(v46) then
        return not not v47.minRobux and tonumber(v47.minRobux) or 0;
    else
        return 0;
    end;
end;
v36.getPriceInfo = function(v48, v49, _)
    local v51 = 0;
    local v52 = 0;
    local v53 = 0;
    if not v36.isUGCBundleType(v49) then
        if not (not v49 or not v48[v49.Name]) then
            local v54 = (v48 and v49) and v48[v49.Name];
            local l_allowedPriceRange_0 = v54.allowedPriceRange;
            v53 = tonumber(v54.marketplaceFeesPercentage) or 0;
            v51 = not l_allowedPriceRange_0.minRobux and 0 or (tonumber(l_allowedPriceRange_0.minRobux) or 0);
            if not l_allowedPriceRange_0.maxRobux then
                v52 = 0;
            else
                return v51, tonumber(l_allowedPriceRange_0.maxRobux) or 0, v53;
            end;
        end;
        return v51, v52, v53;
    else
        local v56 = (v48 and v49) and v48[v49.rawValue()];
        local l_allowedPriceRange_1 = v56.allowedPriceRange;
        v53 = tonumber(v56.marketplaceFeePercentage) or 0;
        v51 = not l_allowedPriceRange_1.minimumPrice and 0 or (tonumber(l_allowedPriceRange_1.minimumPrice) or 0);
        if not l_allowedPriceRange_1.maximumPrice then
            return v51, 0, v53;
        else
            return v51, tonumber(l_allowedPriceRange_1.maximumPrice) or 0, v53;
        end;
    end;
end;
v36.hasAllowedAssetTypesForRelease = function(v58)
    return #v10(v58) > 0;
end;
v36.promptImagePicker = function()
    local v59 = l_StudioService_0:PromptImportFile(v2.IMAGE_TYPES);
    if not v59 then
        return ;
    elseif v11 < v59.Size then
        return nil;
    else
        return v59;
    end;
end;
v36.isCatalogAsset = function(v60)
    local v61 = v2.ASSET_TYPE_INFO[v60];
    local v62 = false;
    if v61 ~= nil then
        v62 = v61.isCatalog == true;
    end;
    return v62;
end;
v36.isMarketplaceAsset = function(v63)
    local v64 = v2.ASSET_TYPE_INFO[v63];
    local v65 = false;
    if v64 ~= nil then
        v65 = v64.isMarketplace == true;
    end;
    return v65;
end;
v36.isCreatorStoreAssetNotIncludingAnimation = function(v66)
    if not (not v66 or not v36.isMarketplaceAsset(v66)) and v66 ~= Enum.AssetType.Animation then
        return true;
    else
        return false;
    end;
end;
v36.isBuyableMarketplaceAsset = function(v67)
    local v68 = v2.ASSET_TYPE_INFO[v67];
    local v69 = false;
    if v68 ~= nil then
        v69 = false;
        if v68.isMarketplace == true then
            v69 = v68.isBuyable == true;
        end;
    end;
    return v69;
end;
v36.getFlowStartScreen = function(v70, v71)
    if v70 == v2.FLOW_TYPE.UPLOAD_FLOW then
        if not v36.hasAllowedAssetTypesForRelease(v71) then
            return v2.SCREENS.ASSET_TYPE_SELECTION;
        else
            return v2.SCREENS.CONFIGURE_ASSET;
        end;
    elseif not (v70 ~= v2.FLOW_TYPE.EDIT_FLOW) or v70 == v2.FLOW_TYPE.DOWNLOAD_FLOW then
        return v2.SCREENS.CONFIGURE_ASSET;
    else
        return ;
    end;
end;
v36.getGenreTypes = function()
    return v2.GENRE_TYPE;
end;
v36.getGenreIndex = function(v72)
    local v73 = 1;
    for v74, v75 in pairs(v2.GENRE_TYPE) do
        if v72 == v75.name then
            return v74;
        end;
    end;
    return v73;
end;
v36.getGenreName = function(v76)
    if #v2.GENRE_TYPE < v76 then
        v76 = 1;
    end;
    return v2.GENRE_TYPE[v76].name;
end;
v36.getOwnerDropDownContent = function(v77, v78)
    local v79 = {
        {
            name = v78:getText("General", "Me"), 
            creatorType = "User", 
            creatorId = v4()
        }
    };
    for _, v81 in ipairs(v77) do
        table.insert(v79, {
            name = v81.name, 
            creatorId = v81.id, 
            creatorType = "Group", 
            item = v81
        });
    end;
    return v79;
end;
v36.getClonedInstances = function(v82)
    local v83 = {};
    for v84 = 1, #v82 do
        local l_status_0, l_result_0 = pcall(function()
            return v82[v84]:Clone();
        end);
        v83[#v83 + 1] = not not l_status_0 and l_result_0 or nil;
    end;
    return v83;
end;
v36.getPreviewType = function(v87, v88)
    local v89 = not not v88 and v2.PreviewTypes.ModelPreview or v2.PreviewTypes.Thumbnail;
    if not (not v87 or not v36.isBuyableMarketplaceAsset(v87)) then
        v89 = v2.PreviewTypes.ImagePicker;
    end;
    if l_UseDefaultThumbnailForAnimation_0 and v87 == Enum.AssetType.Animation then
        v89 = v2.PreviewTypes.Thumbnail;
    end;
    return v89;
end;
v36.getResultThumbnail = function(v90, v91)
    local _ = nil;
    if not v91 then
        return (v5.constructAssetThumbnailUrl(v90, v2.rbxThumbSizes.AssetThumbnailSize, v2.rbxThumbSizes.AssetThumbnailSize));
    else
        return (v91:GetTemporaryId());
    end;
end;
v36.isPackagePublishAllowed = function(v93, v94)
    local v95 = true;
    local v96 = nil;
    if #v93 > 1 then
        v95 = false;
        v96 = if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then if v94 then v94:getText("AssetConfigPackage", "CantConvertMultipleInstancesWarning") else nil else v94:getText("AssetConfigPackage", "CantConvertMultipleInstancesWarning");
    end;
    local v97 = v93[1];
    if v36.isPackage(v97) then
        v95 = false;
    end;
    if (v97:IsA("Model") and v97.PrimaryPart ~= nil) and v97.PrimaryPart.Archivable ~= true then
        v95 = false;
        v96 = if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then if v94 then v94:getText("AssetConfigPackage", "CantConvertModelWithPrimaryPartNonArchivableWarning") else nil else v94:getText("AssetConfigPackage", "CantConvertModelWithPrimaryPartNonArchivableWarning");
    end;
    if v97:IsA("PVInstance") == false and v97:FindFirstChildWhichIsA("PVInstance") ~= nil then
        v96 = if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then if v94 then v94:getText("AssetConfigPackage", "Non3DRoot3DDescendentsWarning") else nil else v94:getText("AssetConfigPackage", "Non3DRoot3DDescendentsWarning");
    end;
    for _, v99 in pairs(v97:GetDescendants()) do
        if ((v99:IsA("PackageLink") and v99.Parent ~= v97) and v99.Status ~= nil) and (not (v99.Status ~= "Changed") or v99.Status == "Changed + New Version Available") then
            v95 = false;
            if not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 and not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
                v96 = v94:getText("AssetConfigPackage", "CantConvertIfChildPackageHasUnpublishedChangesWarning");
            elseif not v94 then
                v96 = nil;
            else
                v96 = v94:getText("AssetConfigPackage", "CantConvertIfChildPackageHasUnpublishedChangesWarning");
            end;
        end;
    end;
    return v95, v96;
end;
v36.isPackage = function(v100)
    if v100:FindFirstChildOfClass("PackageLink") ~= nil then
        return true;
    else
        return false;
    end;
end;
v36.getUGCBodyBundleAssetQuantities = function(v101, v102, v103)
    local v104 = v36.getUGCBodyPartsAssetTypeMap(v101, v102, v103);
    if v104 == nil then
        return nil;
    else
        local v105 = {};
        for v106 in v104, nil, nil do
            local l_Name_0 = v106.Name;
            local v108 = v105[l_Name_0];
            if v108 ~= nil then
                v105[l_Name_0] = v108 + 1;
            else
                v105[l_Name_0] = 1;
            end;
        end;
        return v105;
    end;
end;
v36.getUGCBundleTypeFromString = function(v109)
    return v2.UGCBundleTypeStringToEnumeration[v109];
end;
v36.getAllowedAssetTypeSettingsForBundle = function(v110, v111)
    if not (v111 ~= nil) or v111 == v7.None then
        return nil;
    else
        return v110[v111.rawValue()].allowedAssetTypeSettings;
    end;
end;
v36.getAllowedAssetTypeEnumsForBundle = function(v112, v113)
    local v114 = {};
    local v115 = v36.getAllowedAssetTypeSettingsForBundle(v112, v113);
    if v115 == nil then
        return v114;
    else
        for v116 in v115, nil, nil do
            local v117 = v2.AllowedAssetStringsMetadataToAssetTypeMap[v116];
            if v117 ~= nil then
                table.insert(v114, v117);
            end;
        end;
        return v114;
    end;
end;
v36.getAllowedAssetTypeEnumsForBundleWithSettings = function(v118, v119)
    local v120 = {};
    local v121 = v36.getAllowedAssetTypeSettingsForBundle(v118, v119);
    if v121 == nil then
        return v120;
    else
        for v122, v123 in v121, nil, nil do
            local v124 = v2.AllowedAssetStringsMetadataToAssetTypeMap[v122];
            if v124 ~= nil then
                table.insert(v120, {
                    assetType = v124, 
                    settings = v123
                });
            end;
        end;
        return v120;
    end;
end;
v36.isAllowedUGCAssetType = function(v125, v126)
    return table.find(v126, v125) ~= nil;
end;
v36.getUGCBodyPartsAssetTypeMap = function(v127, v128, v129)
    if v127:IsA("Model") then
        local v130 = v36.getAllowedAssetTypeEnumsForBundle(v128, v129);
        local v131 = {};
        for v132, v133 in v2.UGC_BODY_PARTS, nil, nil do
            local l_v127_FirstChild_0 = v127:FindFirstChild(v133);
            if l_v127_FirstChild_0 ~= nil then
                local v135 = v2.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v132];
                if v36.isAllowedUGCAssetType(v135, v130) then
                    if v131[v135] == nil then
                        v131[v135] = {
                            l_v127_FirstChild_0
                        };
                    else
                        v9.append(v131[v135], {
                            l_v127_FirstChild_0
                        });
                    end;
                end;
            end;
        end;
        return v131;
    else
        return nil;
    end;
end;
v36.AssetTypeRequiresFolderForUpload = function(v136)
    if not ((v136 ~= Enum.AssetType.DynamicHead and v136 ~= Enum.AssetType.EyebrowAccessory) and v136 ~= Enum.AssetType.EyelashAccessory) or v136 == Enum.AssetType.HairAccessory then
        return false;
    else
        return true;
    end;
end;
v36.createUGCBodyPartFolders = function(v137, v138, v139, v140)
    local v141 = v36.getUGCBodyPartsAssetTypeMap(v137, v138, v139);
    if v141 == nil then
        return nil;
    else
        local v142 = {};
        for v143, v144 in v141, nil, nil do
            if not v36.AssetTypeRequiresFolderForUpload(v143) then
                v142[v143] = v144;
            else
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Name = "R15ArtistIntent";
                for _, v147 in v144, nil, nil do
                    v147.Parent = l_Folder_0;
                end;
                v142[v143] = {
                    l_Folder_0
                };
                if v140 then
                    local v148 = l_Folder_0:Clone();
                    v148.Name = "R15Fixed";
                    table.insert(v142[v143], v148);
                    local l_Folder_1 = Instance.new("Folder");
                    l_Folder_1.Name = "R6";
                    table.insert(v142[v143], l_Folder_1);
                end;
            end;
        end;
        return v142;
    end;
end;
v36.getLocalizedUGCBundleName = function(v150, v151)
    if v150 == v2.UGCBundleTypes.Body then
        return v151:getText("AssetConfig", "UGCBodyBundleName");
    elseif v150 == v2.UGCBundleTypes.DynamicHead then
        return v151:getText("AssetConfig", "UGCDynamicHeadBundleName");
    else
        return "";
    end;
end;
v36.sanitizeForValidation = function(v152)
    if not v17() then
        for _, v154 in v152:GetDescendants() do
            if not (not v154:IsA("Motor6D") and v154.Name ~= "OriginalSize") or v154.Name == "OriginalPosition" then
                v154:Destroy();
                if v16() then
                    continue;
                end;
            end;
            if not (not v16() or not v154:IsA("Weld")) and v154.Name == "AccessoryWeld" then
                v154:Destroy();
            elseif not (not (not ((not v16() or not v154:IsA("MeshPart")) or v154.Parent:IsA("Accessory")) and v154.TextureID == "") or v154:FindFirstChildWhichIsA("SurfaceAppearance")) then
                Instance.new("SurfaceAppearance").Parent = v154;
            end;
        end;
        return ;
    else
        v3(v152);
        return ;
    end;
end;
if v18() then
    v36.getOptionalAssetTypesForBundle = function(v155, v156)
        local v157 = v36.getAllowedAssetTypeEnumsForBundleWithSettings(v155, v156);
        local v158 = {};
        for _, v160 in v157, nil, nil do
            if v160.settings.minimumQuantity == 0 then
                table.insert(v158, v160.assetType);
            end;
        end;
        return v158;
    end;
    v36.getOptionalBodyPartsNotFound = function(v161, v162, v163)
        local v164 = v36.getOptionalAssetTypesForBundle(v162, v163);
        local v165 = v36.getUGCBodyPartsAssetTypeMap(v161, v162, v163);
        local v166 = {};
        if v165 == nil then
            return v166;
        else
            for _, v168 in v164, nil, nil do
                if v165[v168] == nil then
                    table.insert(v166, v168);
                end;
            end;
            return v166;
        end;
    end;
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v36.getAllowedAssetTypesByBundleType = function(v169, v170)
        local v171 = v36.getAllowedAssetTypeEnumsForBundle(v169, v170);
        local v172 = {};
        for _, v174 in v171, nil, nil do
            v172[v174] = v174;
        end;
        return v172;
    end;
    v36.getUnknownMeshPartNames = function(v175)
        local v176 = {};
        for _, v178 in pairs(v175:GetChildren()) do
            if not (not (v2.UGC_BODY_PARTS[v178.Name] == nil) or not v178:IsA("MeshPart")) then
                table.insert(v176, v178.Name);
            end;
        end;
        return v176;
    end;
end;
v36.getAvatarAssetTypeAsString = function(v179)
    if v179 ~= nil and type(v179) == "userdata" then
        if not v36.isUGCBundleType(v179) then
            if v36.isCatalogAsset(v179) then
                return v179.Name;
            end;
        else
            return v179.rawValue();
        end;
    end;
    return "";
end;
return v36;
