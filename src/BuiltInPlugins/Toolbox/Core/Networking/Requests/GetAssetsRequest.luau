local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.GetAssets);
local v3 = require(l_Actions_0.NetworkError);
local v4 = require(l_Actions_0.SetLoading);
local v5 = require(l_Actions_0.SetCachedCreatorInfo);
local v6 = require(l_Actions_0.SetCurrentPage);
local v7 = require(l_Parent_0.Core.Types.Category);
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.CreatorInfoHelper);
local v10 = require(l_Util_0.PageInfoHelper);
local v11 = require(l_Util_0.PagedRequestCursor);
local v12 = require(l_Util_0.DebugFlags);
local v13 = require(l_Parent_0.Core.Models.AssetInfo);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixGroupCreatedAvatarAssetRequest);
local function v19(v15)
    local v16 = {};
    if v15 then
        for _, v18 in pairs(v15) do
            if not v14() then
                v16[#v16 + 1] = v18.id;
            else
                table.insert(v16, v18.id or v18.assetId);
            end;
        end;
    end;
    return v16;
end;
local function v24(v20)
    local v21 = {};
    if v20 then
        for _, v23 in pairs(v20) do
            v21[#v21 + 1] = v23.id or v23.assetId;
        end;
    end;
    return v21;
end;
local function v30(v25)
    local v26 = {};
    if v25 then
        for _, v28 in pairs(v25) do
            local _ = nil;
            v26[#v26 + 1] = v13.fromItemDetailsRequest(v28);
        end;
    end;
    return v26;
end;
local function v39(v31, v32, v33, v34)
    local v35 = {};
    if v31 then
        for _, v37 in pairs(v31) do
            local _ = nil;
            v35[#v35 + 1] = v13.fromCreationsDetails(v37, v32, v33, v34);
        end;
    end;
    return v35;
end;
local function _(v40)
    if v40 and #v40 > 0 then
        local v41 = v40[1];
        return v41.Creator.Id, v41.Creator.Name, v9.backendToClient(v41.Creator.Type);
    else
        return ;
    end;
end;
local function _(v43, v44, v45, v46)
    v43:dispatch(v5({
        Id = v44, 
        Name = v45, 
        Type = v46
    }));
end;
local function v52(v48, v49, v50, v51)
    if not v10.isPageInfoStale(v49, v48) then
        v48:dispatch(v2(v30(v50), nil, v51));
        v48:dispatch(v6(0));
        v48:dispatch(v4(false));
        return ;
    else
        return ;
    end;
end;
local function v59(v53, v54, v55, v56, v57, v58)
    if not v10.isPageInfoStale(v54, v53) then
        v53:dispatch(v2(v39(v55, v10.getEngineAssetTypeForPageInfoCategory(v54), v56, v58), nil, v57));
        v53:dispatch(v6(0));
        v53:dispatch(v4(false));
        return ;
    else
        return ;
    end;
end;
local function v63(v60, v61, v62)
    if not (not v12.shouldDebugWarnings() or not v61) then
        warn(v61);
    end;
    v60:dispatch(v2({}, nil, v62));
    v60:dispatch(v4(false));
end;
return function(v64, v65)
    return function(v66)
        v66:dispatch(v4(true));
        local v67 = v65.creator and v65.creator.Id == -1;
        local v68 = v7.getTabForCategoryName(v65.categoryName) == v7.CREATIONS;
        local v69 = v7.categoryIsGroupAsset(v65.categoryName) and (not v7.categoryIsAvatarAssetByCategoryName(v65.categoryName) or v14());
        local function v71(v70)
            if not v10.isPageInfoStale(v65, v66) then
                v66:dispatch(v3(v70));
                v66:dispatch(v4(false));
                return ;
            else
                return ;
            end;
        end;
        local function v83(v72)
            local l_responseBody_0 = v72.responseBody;
            local l_pageInfo_0 = v66:getState().pageInfo;
            local _ = v65.categoryName;
            local _ = l_pageInfo_0.categoryName;
            if not v10.isPageInfoStale(v65, v66) then
                if l_responseBody_0 then
                    local l_v66_0 = v66;
                    local l_Results_0 = l_responseBody_0.Results;
                    local v79, v80, v81;
                    if l_Results_0 and #l_Results_0 > 0 then
                        local v82 = l_Results_0[1];
                        v79 = v82.Creator.Id;
                        v80 = v82.Creator.Name;
                        v81 = v9.backendToClient(v82.Creator.Type);
                    else
                        v79 = nil;
                        v80 = nil;
                        v81 = nil;
                    end;
                    l_v66_0:dispatch(v5({
                        Id = v79, 
                        Name = v80, 
                        Type = v81
                    }));
                    v66:dispatch(v2(l_responseBody_0.Results or {}, l_responseBody_0.TotalResults));
                    v66:dispatch(v6(v65.targetPage));
                end;
                v66:dispatch(v4(false));
            end;
        end;
        local function v86(v84)
            return v64:getAssetGroupCreations(v65, v84):andThen(function(v85)
                return v19(v85.responseBody and v85.responseBody.data), v85;
            end);
        end;
        local function v89(v87)
            return v64:getAssetCreations(v65, v87):andThen(function(v88)
                return v24(v88.responseBody and v88.responseBody.data), v88;
            end);
        end;
        if not v67 then
            if not v68 then
                local v90 = false;
                local v91 = v7.categoryIsAudio(v65.categoryName);
                local v92 = v7.categoryIsVideo(v65.categoryName);
                if ((v10.isDeveloperCategory(v65) or v10.isPackagesCategory(v65)) or v91) or v92 then
                    v90 = true;
                end;
                if not v90 then
                    return v64:getAssets(v65):andThen(v83, v71);
                else
                    return v64:getDevelopAsset(v65):andThen(v83, v71);
                end;
            else
                local l_currentCursor_0 = v66:getState().assets.currentCursor;
                if not v11.isNextPageAvailable(l_currentCursor_0) then
                    return ;
                else
                    local v94 = if not v69 then v89 else v86;
                    local v95 = if not v7.getCategoryByName(v65.categoryName) then nil else v7.getCategoryByName(v65.categoryName).assetType;
                    local v96 = false;
                    if v95 ~= v7.AssetType.ANIMATION then
                        v96 = v7.ToolboxMarketplaceAssetTypes[v95] ~= nil;
                    end;
                    return v94(v11.getNextPageCursor(l_currentCursor_0)):andThen(function(v97, v98)
                        local v99 = v11.createCursor(v98.responseBody);
                        if v97 and #v97 > 0 then
                            if not v96 then
                                v64:getAssetCreationDetails(v97):andThen(function(v100)
                                    local l_responseBody_1 = v100.responseBody;
                                    if l_responseBody_1 and #l_responseBody_1 > 0 then
                                        local v102 = false;
                                        local l_creatorTargetId_0 = l_responseBody_1[1].creatorTargetId;
                                        local v104 = v9.getCreatorTypeValueFromName(l_responseBody_1[1].creatorType);
                                        v102 = not v9.isCached(v66, l_creatorTargetId_0, v104);
                                        if v102 then
                                            v64:getCreatorInfo(l_creatorTargetId_0, v104):andThen(function(v105)
                                                local v106 = v9.getNameFromResult(v105, v104);
                                                v66:dispatch(v5({
                                                    Id = l_creatorTargetId_0, 
                                                    Name = v106, 
                                                    Type = v104
                                                }));
                                                v59(v66, v65, l_responseBody_1, v106, v99, v104);
                                            end, v71);
                                        end;
                                        if not v102 then
                                            v59(v66, v65, l_responseBody_1, v66:getState().assets.cachedCreatorInfo.Name, v99, v104);
                                            return ;
                                        end;
                                    else
                                        v63(v66, "getAssetCreationDetails() did not return any asset details", v99);
                                    end;
                                end, v71);
                                return ;
                            else
                                v64:getItemDetailsAssetIds(v97):andThen(function(v107)
                                    local l_data_0 = v107.responseBody.data;
                                    if l_data_0 and #l_data_0 > 0 then
                                        v52(v66, v65, l_data_0, v99);
                                        return ;
                                    else
                                        v63(v66, "getItemDetailsAssetIds() did not return any asset details", v99);
                                        return ;
                                    end;
                                end, v71);
                                return ;
                            end;
                        else
                            v63(v66, nil, v99);
                            return ;
                        end;
                    end, v71);
                end;
            end;
        else
            local v109 = {
                Results = {}, 
                TotalResults = 0
            };
            v66:dispatch(v2(v109.Results, v109.TotalResults));
            v66:dispatch(v6(0));
            v66:dispatch(v4(false));
            return ;
        end;
    end;
end;
