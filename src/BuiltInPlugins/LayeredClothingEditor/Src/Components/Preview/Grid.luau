local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v4.Components;
local l_ScrollableGrid_0 = l_Components_0.ScrollableGrid;
local l_AssetThumbnailTiles_0 = l_Components_0.AssetThumbnailTiles;
local l_AccessoryAndBodyToolShared_0 = v4.Util.AccessoryAndBodyToolShared;
local _ = l_AccessoryAndBodyToolShared_0.Constants;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local v12 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v12.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_deepCopy_0 = l_Util_0.deepCopy;
local v19 = require(l_Parent_0.Src.Thunks.UpdatePreviewAssetsSelected);
local v20 = require(l_Parent_0.Src.Thunks.GetPrebuiltAssetsInfo);
local l_EditingItemContext_0 = v4.Contexts.EditingItemContext;
local l_AssetServiceWrapper_0 = v4.Contexts.AssetServiceWrapper;
local v23 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Util.ShowDialog);
local v25 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v26 = v1.PureComponent:extend("PreviewGrid");
l_Typecheck_0.wrap(v26, script);
local function _(v27)
    local l_props_0 = v27.props;
    return v3.List.toSet(l_props_0.SelectedAssets[l_props_0.SelectedTab] or {});
end;
local function _(v30, v31)
    local l_UserAddedAssets_0 = v30.props.UserAddedAssets;
    return not not l_UserAddedAssets_0 and l_UserAddedAssets_0[v31] or {};
end;
v26.init = function(v34)
    v34.gridRef = v1.createRef();
    v34.onThumbnailClick = function(v35, v36)
        v34.props.UpdatePreviewAssetsSelected(v35, not v36);
        if not v36 then
            local l_SelectedTab_0 = v34.props.SelectedTab;
            local l_PrebuiltAssetsInfo_0 = v34.props.PrebuiltAssetsInfo;
            local l_Analytics_0 = v34.props.Analytics;
            local v40 = l_PrebuiltAssetsInfo_0[v35] == nil;
            if not v25.FirstAction then
                v25.FirstAction = v23.ACTIONS.Preview;
                l_Analytics_0:getHandler("FirstAction")(v25.FirstAction);
            end;
            l_Analytics_0:getHandler("PreviewAssetSelected")(v40, l_SelectedTab_0, v35, true);
        end;
    end;
end;
local function v48(v41, v42)
    local l_UserAddedAssets_1 = v41.props.UserAddedAssets;
    local v44 = not not l_UserAddedAssets_1 and l_UserAddedAssets_1[v42] or {};
    local v45 = {};
    for _, v47 in ipairs(v44) do
        table.insert(v45, v47.uniqueId);
    end;
    return v45;
end;
local function v69(v49, v50)
    local l_props_1 = v49.props;
    local l_SearchFilter_0 = l_props_1.SearchFilter;
    local l_CategoryFilter_0 = l_props_1.CategoryFilter;
    local v54 = l_deepCopy_0(l_props_1.PrebuiltAssetsInfo);
    local l_UserAddedAssets_2 = v49.props.UserAddedAssets;
    local v56 = not not l_UserAddedAssets_2 and l_UserAddedAssets_2[v50] or {};
    local v57 = l_PreviewConstantsInterface_0.getTabInfo(v50);
    if not v57 then
        return ;
    else
        l_UserAddedAssets_2 = v48(v49, v50);
        local v58 = {};
        local v59 = {};
        if not (l_CategoryFilter_0 ~= "") or l_CategoryFilter_0 == l_PreviewConstants_0.CategoryPrefixes.Default then
            if v57.AssetIds then
                for _, v61 in pairs(v57.AssetIds) do
                    local v62 = v54[v61];
                    if v62 then
                        v62.ThumbnailType = "Asset";
                        if not (l_SearchFilter_0 ~= "" and not string.find(v62.Name or v62.name, l_SearchFilter_0)) then
                            table.insert(v58, v61);
                        end;
                    end;
                end;
            end;
            if v57.BundleIds then
                for _, v64 in pairs(v57.BundleIds) do
                    local v65 = v54[v64];
                    if v65 then
                        v65.ThumbnailType = "BundleThumbnail";
                        if not (l_SearchFilter_0 ~= "" and not string.find(v65.Name or v65.name, l_SearchFilter_0)) then
                            table.insert(v59, v64);
                        end;
                    end;
                end;
            end;
        end;
        local v66 = {};
        if not (l_CategoryFilter_0 ~= "") or l_CategoryFilter_0 == l_PreviewConstants_0.CategoryPrefixes.Custom then
            for _, v68 in ipairs(v56) do
                if not (l_SearchFilter_0 ~= "" and not string.find(v68.instance.Name, l_SearchFilter_0)) then
                    v66[v68.uniqueId] = {
                        Name = v68.instance.Name, 
                        ThumbnailType = "", 
                        Instance = v68.instance
                    };
                end;
            end;
        end;
        return v3.List.join(l_UserAddedAssets_2, v58, v59), (v3.Dictionary.join(v54, v66));
    end;
end;
v26.render = function(v70)
    local l_props_2 = v70.props;
    local l_Size_0 = l_props_2.Size;
    local l_layoutOrder_0 = l_props_2.layoutOrder;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local _ = l_props_2.Analytics;
    local l_SelectedTab_1 = l_props_2.SelectedTab;
    local v77 = l_LayoutOrderIterator_0.new();
    local v78 = {};
    if l_PreviewConstantsInterface_0.getTabInfo(l_SelectedTab_1) then
        local v79, v80 = v69(v70, l_SelectedTab_1);
        local l_join_0 = v3.Dictionary.join;
        local l_v78_0 = v78;
        local l_l_AssetThumbnailTiles_0_0 = l_AssetThumbnailTiles_0;
        local v84 = {
            AssetIds = v79, 
            AssetsInfo = v80, 
            LayoutOrder = v77:getNextOrder()
        };
        local l_props_3 = v70.props;
        v84.SelectedTiles = v3.List.toSet(l_props_3.SelectedAssets[l_props_3.SelectedTab] or {});
        v84.DefaultThumbnail = l_Stylizer_0.DefaultTileImages[l_SelectedTab_1];
        v84.OnThumbnailClick = v70.onThumbnailClick;
        v78 = l_join_0(l_v78_0, l_l_AssetThumbnailTiles_0_0(v84));
    end;
    return v1.createElement(l_ScrollableGrid_0, {
        Size = l_Size_0, 
        CellSize = l_Stylizer_0.TileSize, 
        CellPadding = l_Stylizer_0.TilePadding, 
        LayoutOrder = l_layoutOrder_0
    }, v78);
end;
v26.didMount = function(v86)
    v86.props.GetPrebuiltAssetsInfo(v86.props.API, v86.props.AssetServiceWrapper:get(), l_PreviewConstantsInterface_0.getAllAssetIds(), (l_PreviewConstantsInterface_0.getAllBundleIds()));
    v86.props.UpdatePreviewAssetsSelected();
end;
return v2.connect(function(v87, _)
    local l_previewAssets_0 = v87.previewAssets;
    local l_previewStatus_0 = v87.previewStatus;
    return {
        PrebuiltAssetsInfo = l_previewAssets_0.prebuiltAssetsInfo, 
        SelectedTab = l_previewStatus_0.selectedTab, 
        SearchFilter = l_previewStatus_0.searchFilter, 
        CategoryFilter = l_previewStatus_0.categoryFilter, 
        SelectedAssets = l_previewStatus_0.selectedAssets
    };
end, function(v91)
    return {
        GetPrebuiltAssetsInfo = function(v92, v93, v94, v95)
            v91(v20(v92, v93, v94, v95));
        end, 
        UpdatePreviewAssetsSelected = function(v96, v97)
            v91(v19(v96, v97));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API, 
    Plugin = l_ContextServices_0.Plugin, 
    EditingItemContext = l_EditingItemContext_0, 
    AssetServiceWrapper = l_AssetServiceWrapper_0
})(v26)));
