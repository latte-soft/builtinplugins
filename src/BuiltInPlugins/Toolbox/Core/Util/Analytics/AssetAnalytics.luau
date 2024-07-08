local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Dash);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v6 = require(l_Parent_0.Core.Util.getUserId);
local v7 = require(l_Parent_0.Core.Util.Constants);
local v8 = require(l_Parent_0.Core.Util.FiatUtil);
local v9 = require(script.Parent.Analytics);
local v10 = require(script.Parent.Senders);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFFlagFixBuyerStatusAnalytics);
local v13 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagFixSwimlaneAnalytics);
local v14 = {};
v14.__index = v14;
v14.InsertRemainsCheckDelays = {
    30, 
    120, 
    600
};
v14.new = function(v15)
    return (setmetatable({
        _searches = {}, 
        senders = v15 or v10
    }, v14));
end;
v14.mock = function()
    local v16 = {};
    return v14.new({
        sendEventDeferredCalls = v16, 
        sendEventDeferred = function(...)
            table.insert(v16, {
                ...
            });
        end
    });
end;
v14.getNavigationContext = function(v17, v18)
    local v19 = v17:getBreadcrumbRoute();
    local v20 = false;
    local v21 = false;
    if v13() then
        local v22 = v17:getNavigationRoute();
        v20 = table.find(v22, v7.NAVIGATION.RESULTS) ~= nil;
        v21 = table.find(v22, v7.NAVIGATION.ALL_SUBCATEGORIES) ~= nil;
    end;
    return {
        navBreadcrumbs = l_HttpService_0:JSONEncode(v19), 
        navSwimlane = v18, 
        navSeeAll = v20, 
        navSeeAllSubcategory = v21
    };
end;
v14.schedule = function(v23, v24)
    delay(v23, v24);
end;
v14.getAssetCategoryName = function(v25)
    for _, v27 in ipairs(Enum.AssetType:GetEnumItems()) do
        if v27.Value == v25 then
            return v27.Name;
        end;
    end;
    return "";
end;
v14.isAssetDataTrackable = function(v28)
    return (v28 and v28.Asset) and v28.Asset.Id;
end;
v14.isAssetTrackable = function(v29, v30)
    return (v14.isAssetDataTrackable(v29) and v30) and v30.searchId;
end;
v14.getTrackingAttributes = function(v31, v32, v33)
    local v34 = v3.Dictionary.join(v32, v31.Context or {});
    local l_searchId_0 = v32.searchId;
    local v36 = nil;
    local l_AssetSubTypes_0 = v31.Asset.AssetSubTypes;
    if l_AssetSubTypes_0 then
        v36 = table.concat(l_AssetSubTypes_0, ",");
    end;
    local v38 = nil;
    if not v33 then
        v38 = v3.Dictionary.join(v34, {
            assetID = v31.Asset.Id, 
            assetSubTypes = v36, 
            assetType = v14.getAssetCategoryName(v31.Asset.TypeId), 
            userID = v6(), 
            placeID = v9.getPlaceId(), 
            platformID = v9.getPlatformId(), 
            clientID = v9.getClientId(), 
            searchID = l_searchId_0, 
            studioSid = v9.getStudioSessionId(), 
            isEditMode = v9.getIsEditMode(), 
            isVerifiedCreator = v31.Creator.IsVerifiedCreator, 
            label = v31.Asset.Id, 
            value = 0, 
            isEndorsed = v31.Asset.IsEndorsed, 
            hasScripts = v31.Asset.HasScripts
        });
        v38.searchId = nil;
    else
        v38 = v3.Dictionary.join(v34, {
            assetId = v31.Asset.Id, 
            assetSubTypes = v36, 
            assetType = v14.getAssetCategoryName(v31.Asset.TypeId), 
            userId = v6(), 
            placeId = v9.getPlaceId(), 
            platformId = v9.getPlatformId(), 
            clientId = v9.getClientId(), 
            searchId = l_searchId_0, 
            studioSid = v9.getStudioSessionId(), 
            isEditMode = v9.getIsEditMode(), 
            isVerifiedCreator = v31.Creator.IsVerifiedCreator, 
            label = v31.Asset.Id, 
            value = 0, 
            isEndorsed = v31.Asset.IsEndorsed, 
            hasScripts = v31.Asset.HasScripts
        });
    end;
    for v39, v40 in pairs(v38) do
        v38[v39] = tostring(v40);
    end;
    return v38;
end;
v14.logImpression = function(v41, v42, v43, v44, v45)
    if v14.isAssetTrackable(v42, v43) then
        local l_Id_0 = v42.Asset.Id;
        local l_searchId_1 = v43.searchId;
        if not v41._searches[l_searchId_1] then
            v41._searches[l_searchId_1] = {
                impressions = {}
            };
        end;
        local v48 = v41._searches[l_searchId_1];
        local v49 = v14.getTrackingAttributes(v42, v43);
        if v11() then
            v49 = v4.join(v49, {
                layoutMode = v45
            });
        end;
        v49 = v4.join(v49, v44 or {});
        if not v48.impressions[l_Id_0] then
            v41.senders.sendEventDeferred("studio", "Marketplace", "MarketplaceAssetImpression", v49);
            v9.incrementAssetImpressionCounter();
            v48.impressions[l_Id_0] = true;
        end;
        return ;
    else
        return ;
    end;
end;
v14.logPreview = function(v50, v51, v52, v53)
    if v14.isAssetTrackable(v51, v52) then
        local v54 = v14.getTrackingAttributes(v51, v52);
        local v55 = if not not v12() and v53 then v53.purchaserStatus else nil;
        local v56 = v51.FiatProduct and v51.FiatProduct.PurchasePrice;
        v50.senders.sendEventDeferred("studio", "Marketplace", "MarketplaceAssetPreview", (v3.Dictionary.join(v54, {
            buyerStatus = if not v12() then v53 else v55, 
            currencyCode = if not v56 then nil else v56.currencyCode, 
            fiatPrice = if not v56 then nil else v8.calculateQuantity(v56)
        })));
        return ;
    else
        return ;
    end;
end;
v14.logInsert = function(v57, v58, v59, v60, v61, v62, v63)
    if v14.isAssetTrackable(v58, v61) then
        local v64 = {
            method = v59
        };
        if v11() then
            v64.layoutMode = v63;
        end;
        local v65 = v4.join(v64, v14.getTrackingAttributes(v58, v61), {
            navSwimlane = v62
        });
        v57.senders.sendEventDeferred("studio", "Marketplace", "MarketplaceInsert", v65);
        if v60 == nil then
            return ;
        else
            for _, v67 in ipairs(v14.InsertRemainsCheckDelays) do
                v14.schedule(v67, function()
                    if type(v60) == "table" then
                        v57:logRemainsOrDeleted(v67, v65, v60[1]);
                        return ;
                    else
                        v57:logRemainsOrDeleted(v67, v65, v60);
                        return ;
                    end;
                end);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v14.logRemainsOrDeleted = function(v68, v69, v70, v71)
    v68.senders.sendEventDeferred("studio", "Marketplace", ((not not v71 and v71.Parent) and "InsertRemains" or "InsertDeleted") .. tostring(v69), v70);
end;
v14.logNavigationButtonInteraction = function(v72, v73, v74, v75, v76, v77, v78, v79)
    v72.senders.sendEventDeferred("studio", "Marketplace", v73, {
        searchID = v74, 
        searchCategory = v75, 
        subcategoryName = v76, 
        navBreadcrumbs = not not v77 and l_HttpService_0:JSONEncode(v77) or nil, 
        toolboxTab = v78, 
        assetType = v79
    });
end;
v14.logPageView = function(v80, v81, v82, v83, v84, v85, v86)
    v80:logNavigationButtonInteraction("MarketplaceNavigatePageView", v81, v82, v83, v84, v85, v86);
end;
v14.logGoBack = function(v87, v88, v89, v90, v91, v92, v93)
    v87:logNavigationButtonInteraction("MarketplaceNavigateViewBack", v88, v89, v90, v91, v92, v93);
end;
v14.onCallToActionBannerClicked = function(v94, v95)
    v94.senders.sendEventDeferred("studio", "Marketplace", "CallToActionBannerClicked", {
        creatorId = v95
    });
end;
v14.logAssetMediaImpression = function(v96, v97, v98, v99, v100, v101, v102)
    if v14.isAssetDataTrackable(v97) then
        v96.senders.sendEventDeferred("studio", "Marketplace", "AssetMediaImpression", (v4.join(v14.getTrackingAttributes(v97, {}, true), {
            imageId = v98, 
            imageIndex = v99, 
            searchId = v100, 
            source = v101, 
            parentAssetId = v102
        })));
        return ;
    else
        return ;
    end;
end;
v14.onAssetDescriptionLinkClicked = function(v103, v104, v105, v106, v107)
    if v14.isAssetTrackable(v104, v105) then
        v103.senders.sendEventDeferred("studio", "Marketplace", "AssetDescriptionLinkClicked", (v4.join(v14.getTrackingAttributes(v104, v105, true), {
            searchId = v106, 
            url = v107
        })));
        return ;
    else
        return ;
    end;
end;
return v14;
