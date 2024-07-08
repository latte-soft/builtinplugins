local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(script.Parent.Urls);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StudioService_0 = game:GetService("StudioService");
local l_UserService_0 = game:GetService("UserService");
local v7 = require(l_script_FirstAncestor_0.Src.Util.Images);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v9 = {
    _fetchScopeId = 0, 
    _fetchTotalAssets = 0, 
    _fetchLimit = require(l_script_FirstAncestor_0.Src.Flags.getFIntAmrAssetFetchCount)(), 
    _fetchAssetsTrackers = {}
};
local function _(v10, v11)
    local l_v9_0 = v9;
    l_v9_0._fetchTotalAssets = l_v9_0._fetchTotalAssets + v10;
    v11:Fire((math.clamp(v9._fetchTotalAssets / v9._fetchLimit, 0, 1)));
end;
local function v18(v14, v15)
    v9._fetchAssetsTrackers[v14] = true;
    for _, v17 in v1.AssetType, nil, nil do
        if not v9._fetchAssetsTrackers[v17] then
            return ;
        end;
    end;
    v9._fetchAssetsTrackers = {};
    v15:Fire();
end;
v9.fetchUsernameAsync = function(v19)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_status_0, l_result_0 = pcall(function()
        return l_UserService_0:GetUserInfosByUserIdsAsync({
            l_l_StudioService_0_UserId_0
        });
    end);
    if not l_status_0 then
        v19("", true);
        return ;
    else
        v19(l_result_0[1].Username, false);
        return ;
    end;
end;
v9.fetchGroupsAsync = function(v23, v24)
    v3.CreateFetchGroupsRequest():makeRequest():andThen(function(v25)
        v23(v25.responseBody);
    end, v24);
end;
local function _(v26)
    if v26 == 1 then
        return v1.Scope.User;
    elseif v26 == 2 then
        return v1.Scope.Group;
    else
        return v1.Scope.Unknown;
    end;
end;
local function v37(v28, v29)
    local v30 = {};
    local v31 = {};
    for _, v33 in v28, nil, nil do
        local l_asset_0 = v33.asset;
        local l_creator_0 = v33.creator;
        local l_type_0 = l_creator_0.type;
        l_type_0 = {
            AssetId = l_asset_0.id, 
            AssetType = v29, 
            DisplayName = l_asset_0.name, 
            Created = DateTime.fromIsoDate(l_asset_0.createdUtc), 
            Modified = DateTime.fromIsoDate(l_asset_0.updatedUtc), 
            ModerationStatus = l_asset_0.moderationStatus, 
            Owner = {
                Id = l_creator_0.id, 
                Name = l_creator_0.name, 
                Scope = if l_type_0 == 1 then v1.Scope.User else if l_type_0 == 2 then v1.Scope.Group else v1.Scope.Unknown
            }
        };
        table.insert(v30, l_type_0);
        v31[l_creator_0.name] = l_type_0.Owner;
    end;
    return v30, v31;
end;
local function _(v38)
    for v39, v40 in v38, nil, nil do
        v38[v39] = v40.id;
    end;
end;
local function _(v42)
    if v42 == v1.AssetType.Image then
        return "decal";
    elseif v42 == v1.AssetType.Mesh then
        return "meshpart";
    else
        return string.lower(v42);
    end;
end;
v9._fetchAssetsLegacyAsyncImpl = function(v44, v45, v46, v47, v48, v49, v50)
    local v51 = {
        limit = v49
    };
    if not (v50 == "") then
        v51.cursor = v50;
    end;
    v44(v46.Id, v45 == v1.AssetType.Image and "decal" or (v45 == v1.AssetType.Mesh and "meshpart" or string.lower(v45)), v51):makeRequest():andThen(function(v52)
        if v46.Id ~= v9._fetchScopeId then
            v9._fetchAssetsTrackers[v45] = nil;
            local l_OnFetchProgressChanged_0 = v46.OnFetchProgressChanged;
            local l_v9_1 = v9;
            l_v9_1._fetchTotalAssets = l_v9_1._fetchTotalAssets + 0;
            l_OnFetchProgressChanged_0:Fire((math.clamp(v9._fetchTotalAssets / v9._fetchLimit, 0, 1)));
            v47({}, {});
            return ;
        elseif not v52.errors then
            assert(v52.responseBody.data, "No data in response");
            if #v52.responseBody.data == 0 then
                v18(v45, v46.OnFetchFinished);
                local l_OnFetchProgressChanged_1 = v46.OnFetchProgressChanged;
                local l_v9_2 = v9;
                l_v9_2._fetchTotalAssets = l_v9_2._fetchTotalAssets + 0;
                l_OnFetchProgressChanged_1:Fire((math.clamp(v9._fetchTotalAssets / v9._fetchLimit, 0, 1)));
                v47({}, {});
                return ;
            else
                local l_data_0 = v52.responseBody.data;
                for v58, v59 in l_data_0, nil, nil do
                    l_data_0[v58] = v59.id;
                end;
                (function(v60, v61, v62, v63, v64, v65, v66)
                    v3.CreateFetchAssetInfosRequest(v60):makeRequest():andThen(function(v67)
                        if v61.Id ~= v9._fetchScopeId then
                            v64({}, {});
                            return ;
                        elseif v67.responseBody and v67.responseBody.data then
                            local v68, v69 = v37(v67.responseBody.data, v62);
                            local v70 = #v68;
                            local l_OnFetchProgressChanged_2 = v61.OnFetchProgressChanged;
                            local l_v9_3 = v9;
                            l_v9_3._fetchTotalAssets = l_v9_3._fetchTotalAssets + v70;
                            l_OnFetchProgressChanged_2:Fire((math.clamp(v9._fetchTotalAssets / v9._fetchLimit, 0, 1)));
                            v64(v68, v69);
                            if v66 and v9._fetchTotalAssets < v9._fetchLimit then
                                v9._fetchAssetsLegacyAsyncImpl(v63, v62, v61, v64, v65, math.min(#v68, v9._fetchLimit - v9._fetchTotalAssets), v66);
                                return ;
                            else
                                v18(v62, v61.OnFetchFinished);
                                return ;
                            end;
                        else
                            v65("No data in response");
                            return ;
                        end;
                    end, function(v73)
                        v18(v62, v61.OnFetchFinished);
                        v65(v2.pretty(v73.responseBody.errors), v73.responseBody.status);
                    end);
                end)(v52.responseBody.data, v46, v45, v44, v47, v48, v52.responseBody.nextPageCursor);
                return ;
            end;
        else
            v18(v45, v46.OnFetchFinished);
            v48(v52.errors, v52.status);
            return ;
        end;
    end, function(v74)
        v18(v45, v46.OnFetchFinished);
        v48(v2.pretty(v74.responseBody.errors), v74.responseBody.status);
    end);
end;
v9.fetchAssetsLegacyAsync = function(v75, v76, v77)
    v9._fetchScopeId = v75.Id;
    v9._fetchTotalAssets = 0;
    v9._fetchAssetsTrackers = {};
    local v78 = if v75.Scope == v1.Scope.User then v3.CreateFetchAssetsForUserRequest else v3.CreateFetchAssetsForGroupRequest;
    local v79 = v75.Scope == v1.Scope.User and 100 or 50;
    for _, v81 in v1.AssetType, nil, nil do
        v9._fetchAssetsLegacyAsyncImpl(v78, v81, v75, v76, v77, v79, "");
    end;
end;
v9.getThumbnailUriForScope = function(v82)
    if v82.Scope == v1.Scope.User then
        return (("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v82.Id));
    elseif v82.Scope == v1.Scope.Group then
        return (("rbxthumb://type=GroupIcon&id=%*&w=150&h=150"):format(v82.Id));
    else
        if v8() then
            warn("ExplorerRow: Unsupported Scope type for image icon", v82.Scope);
        end;
        return "";
    end;
end;
v9.getThumbnailForScopeAsync = function(v83, v84)
    l_ContentProvider_0:PreloadAsync({
        (v9.getThumbnailUriForScope(v83))
    }, function(v85, v86)
        if v86 == Enum.AssetFetchStatus.Success then
            v84(v85);
            return ;
        else
            if v8() then
                warn("Failed to fetch thumbnail for scope", v83);
            end;
            if v83.Scope == v1.Scope.User then
                v84(v7.ICON_USER_DEFAULT);
                return ;
            elseif v83.Scope == v1.Scope.Group then
                v84(v7.ICON_GROUP_DEFAULT);
                return ;
            else
                v84(v7.PLACEHOLDER);
                return ;
            end;
        end;
    end);
end;
v9.getThumbnailForItem = function(v87)
    return (("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v87.AssetId));
end;
v9.getThumbnailForItemAsync = function(v88, v89)
    l_ContentProvider_0:PreloadAsync({
        (v9.getThumbnailForItem(v88))
    }, function(v90, v91)
        if v91 == Enum.AssetFetchStatus.Success then
            v89(v90);
            return ;
        else
            if v8() then
                warn("Failed to fetch thumbnail for item", v88);
            end;
            v89(v7.PLACEHOLDER);
            return ;
        end;
    end);
end;
return v9;
