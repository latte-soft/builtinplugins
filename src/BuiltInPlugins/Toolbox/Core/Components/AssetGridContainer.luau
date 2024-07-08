local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_map_0 = require(l_Packages_0.LuauPolyfill).Array.map;
local v5 = require(l_Parent_0.Core.Util.getStartupAssetId);
local v6 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v7 = require(l_Parent_0.Core.Types.Category);
local v8 = require(l_Parent_0.Core.Types.LayoutMode);
local v9 = require(l_Parent_0.Core.Components.AssetGrid);
local v10 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v11 = require(l_Parent_0.Core.Components.AssetLogicWrapper);
local v12 = require(l_Parent_0.Core.Components.Audio.AudioScroller);
local v13 = require(l_Parent_0.Core.Components.AssetTable.AssetTable);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v15 = require(l_Parent_0.Core.Components.InfoBanner);
local _ = require(l_Parent_0.Core.Types.AssetLogicTypes);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v18 = require(l_Actions_0.GetAssets);
local v19 = require(l_Actions_0.SetAssetPreview);
local v20 = require(l_Parent_0.Core.Thunks.GetAssetPreviewDataForStartup);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v23 = require(l_Parent_0.Core.ContextServices.Settings);
local v24 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v25 = require(l_Parent_0.Core.Networking.Requests.NextPageRequest);
local v26 = require(l_Parent_0.Core.Networking.Requests.PostAssetCheckPermissions);
local v27 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v28 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v29 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local v30 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v31 = v2.PureComponent:extend("AssetGridContainer");
v31.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v31.init = function(v32, v33)
    v32.requestNextPage = function()
        v32.props.nextPage(v33.Network.networkInterface, (v32.props.Settings:get("Plugin")));
    end;
    v32.setAssetPreview = function(v34)
        local l_Id_0 = v34.Asset.Id;
        v33.getAssets({
            v34
        });
        v33.setAssetPreview(true, l_Id_0);
    end;
    v32.logImpression = function(v36, v37, v38, v39)
        local l_props_0 = v32.props;
        if not l_props_0.LogAssetImpression then
            return nil;
        else
            return l_props_0.LogAssetImpression(v36, v39, v37, v38, l_props_0.ParentAbsoluteSize, l_props_0.ParentAbsolutePosition);
        end;
    end;
end;
v31.didMount = function(v41)
    local v42 = tonumber((v5()));
    if v42 then
        local l_props_1 = v41.props;
        l_props_1.getAssetPreviewDataForStartup(v42, l_props_1.TryInsert, l_props_1.Localization, l_props_1.Network.networkInterface, v41.setAssetPreview);
    end;
end;
v31.render = function(v44)
    local l_props_2 = v44.props;
    local v46 = if not v28() then nil else l_props_2.IXP;
    local l_allAssetCount_0 = l_props_2.allAssetCount;
    local l_isLoading_0 = l_props_2.isLoading;
    local l_assetIds_0 = l_props_2.assetIds;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Position_0 = l_props_2.Position;
    local l_RenderTopContent_0 = l_props_2.RenderTopContent;
    local l_Size_0 = l_props_2.Size;
    local l_CanInsertAsset_0 = l_props_2.CanInsertAsset;
    local l_OnAssetPreviewButtonClicked_0 = l_props_2.OnAssetPreviewButtonClicked;
    local l_TryInsert_0 = l_props_2.TryInsert;
    local l_TryOpenAssetConfig_0 = l_props_2.TryOpenAssetConfig;
    local v58 = if not v28() then nil else v7.getTabForCategoryName(l_props_2.categoryName) == v7.INVENTORY;
    if not (not l_allAssetCount_0 or l_allAssetCount_0 <= 0) or l_isLoading_0 then
        if v7.categoryIsPackage(l_props_2.categoryName) and #l_assetIds_0 ~= 0 then
            local v59 = {};
            local v60 = 1;
            while v60 < v10.MaxPackageAssetIdsForHighestPermissionsRequest and l_assetIds_0[v60] ~= nil do
                local v61 = l_assetIds_0[v60];
                if not v44.props.currentUserPackagePermissions[v61] then
                    table.insert(v59, v61);
                end;
                v60 = v60 + 1;
            end;
            if #v59 ~= 0 then
                v44.props.dispatchPostAssetCheckPermissions(v44.props.Network.networkInterface, v59);
            end;
        end;
        if not v7.categoryIsAudio(l_props_2.categoryName) then
            if not (v27(v46) and l_props_2.layoutMode == v8.ListView) or not v58 then
                return v2.createElement(v9, {
                    AssetIds = l_assetIds_0, 
                    AssetMap = l_props_2.idToAssetMap, 
                    LayoutOrder = l_LayoutOrder_0, 
                    Position = l_Position_0, 
                    RenderTopContent = l_RenderTopContent_0, 
                    RequestNextPage = v44.requestNextPage, 
                    Size = l_Size_0, 
                    CanInsertAsset = l_CanInsertAsset_0, 
                    LogAssetImpression = l_props_2.LogAssetImpression, 
                    OnAssetPreviewButtonClicked = l_OnAssetPreviewButtonClicked_0, 
                    OnSearchByCreator = if not v30() then nil else l_props_2.OnSearchByCreator, 
                    ParentAbsolutePosition = l_props_2.ParentAbsolutePosition, 
                    ParentSize = l_props_2.ParentAbsoluteSize, 
                    TryInsert = l_TryInsert_0, 
                    TryOpenAssetConfig = l_TryOpenAssetConfig_0
                });
            else
                return v2.createElement(v13, {
                    Assets = l_map_0(l_props_2.assetIds, function(v62)
                        return l_props_2.idToAssetMap[v62];
                    end), 
                    CanInsertAsset = l_CanInsertAsset_0, 
                    FetchNextPage = v44.requestNextPage, 
                    LogImpression = v44.logImpression, 
                    OnAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                    OnSearchByCreator = if not v29() then nil else l_props_2.OnSearchByCreator, 
                    ParentAbsoluteSize = l_props_2.ParentAbsoluteSize, 
                    Position = l_Position_0, 
                    Size = l_Size_0, 
                    TryInsert = l_TryInsert_0, 
                    TryOpenAssetConfig = l_props_2.TryOpenAssetConfig
                });
            end;
        else
            return v12.Generator({
                Assets = l_map_0(l_props_2.assetIds, function(v63)
                    return l_props_2.idToAssetMap[v63];
                end), 
                CanInsertAsset = l_CanInsertAsset_0, 
                FetchNextPage = v44.requestNextPage, 
                Loading = false, 
                LogImpression = v44.logImpression, 
                OnAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                ParentAbsoluteSize = l_props_2.ParentAbsoluteSize, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                TryInsert = l_TryInsert_0, 
                TryOpenAssetConfig = l_props_2.TryOpenAssetConfig
            });
        end;
    else
        return v2.createElement(v15, {
            Position = l_props_2.NoResultsPosition, 
            Text = l_props_2.Localization:getText("General", "InfoBannerText"), 
            ZIndex = 2
        });
    end;
end;
return v3.connect(function(v64, _)
    v64 = v64 or {};
    local v66 = v64.assets or {};
    local v67 = v64.pageInfo or {};
    return {
        allAssetCount = #v66.idsToRender, 
        assetIds = v66.idsToRender or {}, 
        categoryName = v67.categoryName or v7.DEFAULT.name, 
        currentUserPackagePermissions = v64.packages.permissionsTable or {}, 
        idToAssetMap = v66.idToAssetMap, 
        isLoading = v66.isLoading or false, 
        layoutMode = if not v28() then nil else v67.layoutMode
    };
end, function(v68)
    return {
        dispatchPostAssetCheckPermissions = function(v69, v70)
            v68(v26(v69, v70));
        end, 
        getAssetPreviewDataForStartup = function(v71, v72, v73, v74, v75)
            v68(v20(v71, v72, v73, v74, v75));
        end, 
        getAssets = function(v76)
            return v68(v18(v76));
        end, 
        nextPage = function(v77, v78)
            v68(v25(v77, v78));
        end, 
        setAssetPreview = function(v79, v80)
            return v68(v19(v79, v80));
        end
    };
end)((l_withContext_0({
    IXP = if not v28() then nil else v6, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v23, 
    Network = v24
})((v11(v31)))));
