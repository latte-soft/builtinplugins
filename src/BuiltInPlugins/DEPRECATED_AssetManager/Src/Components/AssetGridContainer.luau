local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.InsertAsset);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_InsertAssetContext_0 = v1.Context.InsertAssetContext;
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v5.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_ComponentSymbols_0 = v5.Style.ComponentSymbols;
local l_UI_0 = v5.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v17 = require(l_Parent_0.Src.Util.Screens);
local v18 = require(l_Parent_0.Src.Util.View);
local v19 = require(l_Parent_0.Src.Components.ListItem);
local v20 = require(l_Parent_0.Src.Components.Tile);
local v21 = require(l_Parent_0.Src.Actions.SetAssets);
local v22 = require(l_Parent_0.Src.Thunks.GetAssets);
local v23 = require(l_Parent_0.Src.Thunks.LoadAllAliases);
local v24 = require(l_Parent_0.Src.Thunks.OnAssetDrag);
local v25 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v26 = require(l_Parent_0.Src.Thunks.OnScreenChange);
local v27 = require(l_Parent_0.Src.Thunks.UpdateSelectedAssets);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_BulkImportService_0 = game:GetService("BulkImportService");
local l_shouldEnableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).shouldEnableAudioImport;
local l_shouldEnableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).shouldEnableVideoImport;
local l_AssetManagerMigrateAliasesEndpoint2_0 = game:GetFastFlag("AssetManagerMigrateAliasesEndpoint2");
local v33 = v2.Component:extend("AssetGridContainer");
local function v36(v34)
    local v35 = true;
    if v34.Path ~= v17.IMAGES.Path then
        v35 = true;
        if v34.Path ~= v17.MESHES.Path then
            if l_shouldEnableAudioImport_0() then
                v35 = true;
                if not (v34.Path ~= v17.AUDIO.Path) then
                    goto label0;
                end;
            end;
            if l_shouldEnableVideoImport_0() then
                v35 = true;
                if not (v34.Path ~= v17.VIDEO.Path) then
                    goto label0;
                end;
            end;
            v35 = v34.Path == v17.MODELS.Path;
        end;
    end;
    ::label0::;
    return v35;
end;
local function v44(v37, v38, v39)
    if v38.Path == v17.MAIN.Path then
        for _, v41 in pairs(v17) do
            if v41.Path ~= v17.MAIN.Path then
                return true;
            end;
        end;
    else
        for _, v43 in pairs(v37) do
            if string.find(string.lower(v43.name), string.lower(v39), 1, true) then
                return true;
            end;
        end;
    end;
    return false;
end;
v33.init = function(v45)
    v45.state = {
        currentScreen = "", 
        currentView = ""
    };
    v45.hasItemsToDisplay = false;
    v45.gridLayoutRef = v2.createRef();
    v45.listLayoutRef = v2.createRef();
    v45.bulkImportFinishedConnection = nil;
    v45.importSessionFinishedConnection = nil;
    v45.onClearSelection = function()
        if v45.props.Enabled then
            v45.props.dispatchUpdateSelectedAssets({});
            return ;
        else
            return ;
        end;
    end;
    v45.onMouseButton2Click = function()
        local l_props_0 = v45.props;
        if l_props_0.Enabled then
            v45.props.dispatchUpdateSelectedAssets({});
            local l_CurrentScreen_0 = l_props_0.CurrentScreen;
            if l_CurrentScreen_0.Path == v17.PLACES.Path then
                l_props_0:dispatchOnAssetRightClick({
                    ClassName = "Folder", 
                    Screen = l_CurrentScreen_0
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v45.onOpenAssetPreview = function(v48)
        v45.props.dispatchUpdateSelectedAssets({
            [v48.key] = true
        });
        v45.props.OnOpenAssetPreview(v48, v45.props.AssetsTable.assetPreviewData[v48.id]);
    end;
    v45.onAssetPreviewClose = function()
        v45.props.OnAssetPreviewClose();
    end;
    v45.onAssetDrag = function(v49)
        local l_props_1 = v45.props;
        l_props_1.dispatchOnAssetDrag(l_props_1.InsertAsset:get(), v49, l_props_1.Analytics);
    end;
    v45.onOpenConfirmRemovePlaceDialog = function()
        v45.props.OnOpenConfirmRemovePlaceDialog();
    end;
end;
v33.didMount = function(v51)
    v51.bulkImportFinishedConnection = l_BulkImportService_0.BulkImportFinished:connect(function(v52)
        local l_props_2 = v51.props;
        local l_CurrentScreen_1 = l_props_2.CurrentScreen;
        if not (not (v52 == 1) or not v36(l_CurrentScreen_1)) then
            local v55 = l_props_2.API:get();
            l_props_2.dispatchSetAssets({
                assets = {}
            });
            l_props_2.dispatchGetAssets(v55, l_CurrentScreen_1.AssetType);
        end;
    end);
    v51.importSessionFinishedConnection = l_AssetManagerService_0.ImportSessionFinished:Connect(function()
        local l_props_3 = v51.props;
        local l_CurrentScreen_2 = l_props_3.CurrentScreen;
        if v36(l_CurrentScreen_2) then
            local v58 = l_props_3.API:get();
            l_props_3.dispatchSetAssets({
                assets = {}
            });
            l_props_3.dispatchGetAssets(v58, l_CurrentScreen_2.AssetType);
        end;
    end);
end;
v33.willUnmount = function(v59)
    if v59.bulkImportFinishedConnection then
        v59.bulkImportFinishedConnection:disconnect();
    end;
    if v59.importSessionFinishedConnection then
        v59.importSessionFinishedConnection:Disconnect();
    end;
end;
v33.createTiles = function(v60, _, v62, v63, v64, v65, v66, v67, v68, v69)
    local v70 = 0;
    local v71 = {
        GridLayout = v2.createElement("UIGridLayout", {
            CellSize = v63[l_ComponentSymbols_0.Tile].Size, 
            CellPadding = v63.AssetGridContainer.CellPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v60.gridLayoutRef
        })
    };
    if v66.Path == v17.MAIN.Path then
        for _, v73 in pairs(v17) do
            if v73.Path ~= v17.MAIN.Path then
                v71[v73.Path] = v2.createElement(v20, {
                    AssetData = {
                        name = v62:getText("Folders", v73.Path), 
                        ClassName = "Folder", 
                        Screen = v73
                    }, 
                    LayoutOrder = v73.LayoutOrder, 
                    StyleModifier = not not v68[v73.LayoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v69
                });
            end;
        end;
    else
        for _, v75 in pairs(v64) do
            if string.find(string.lower(v75.name), string.lower(v67), 1, true) then
                v75.key = v75.layoutOrder;
                v71[v75.id] = v2.createElement(v20, {
                    AssetData = v75, 
                    ModerationData = v65[v75.id], 
                    LayoutOrder = v75.layoutOrder, 
                    StyleModifier = not not v68[v75.layoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v69, 
                    OnOpenAssetPreview = v60.onOpenAssetPreview, 
                    OnAssetPreviewClose = v60.onAssetPreviewClose, 
                    OnAssetDrag = v60.onAssetDrag, 
                    OnOpenConfirmRemovePlaceDialog = v60.onOpenConfirmRemovePlaceDialog
                });
                v70 = v70 + 1;
            end;
        end;
    end;
    return v71, v70;
end;
v33.createListItems = function(v76, _, v78, _, v80, v81, v82, v83, v84, v85)
    local v86 = 0;
    local v87 = {
        ListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v76.listLayoutRef
        })
    };
    if v82.Path == v17.MAIN.Path then
        for _, v89 in pairs(v17) do
            if v89.Path ~= v17.MAIN.Path then
                v87[v89.Path] = v2.createElement(v19, {
                    AssetData = {
                        name = v78:getText("Folders", v89.Path), 
                        ClassName = "Folder", 
                        Screen = v89
                    }, 
                    LayoutOrder = v89.LayoutOrder, 
                    StyleModifier = not not v84[v89.LayoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v85
                });
            end;
        end;
    else
        for _, v91 in pairs(v80) do
            if string.find(string.lower(v91.name), string.lower(v83), 1, true) then
                v91.key = v91.layoutOrder;
                v87[v91.id] = v2.createElement(v19, {
                    AssetData = v91, 
                    ModerationData = v81[v91.id], 
                    LayoutOrder = v91.layoutOrder, 
                    StyleModifier = not not v84[v91.layoutOrder] and l_StyleModifier_0.Selected or nil, 
                    Enabled = v85, 
                    OnOpenAssetPreview = v76.onOpenAssetPreview, 
                    OnAssetPreviewClose = v76.onAssetPreviewClose, 
                    OnAssetDrag = v76.onAssetDrag, 
                    OnOpenConfirmRemovePlaceDialog = v76.onOpenConfirmRemovePlaceDialog
                });
                v86 = v86 + 1;
            end;
        end;
    end;
    return v87, v86;
end;
v33.didUpdate = function(v92)
    local l_props_4 = v92.props;
    local l_View_0 = l_props_4.View;
    if l_View_0 ~= v92.state.currentView then
        v92:setState({
            currentView = l_View_0
        });
    end;
    local v95 = v44(l_props_4.AssetsTable.assets, l_props_4.CurrentScreen, l_props_4.SearchTerm);
    if v95 ~= v92.hasItemsToDisplay then
        v92.hasItemsToDisplay = v95;
        if v95 then
            v92:setState({});
        end;
    end;
end;
v33.render = function(v96)
    local l_props_5 = v96.props;
    local v98 = l_props_5.API:get();
    local l_Stylizer_0 = l_props_5.Stylizer;
    local l_Localization_0 = l_props_5.Localization;
    local l_Size_0 = l_props_5.Size;
    local l_LayoutOrder_0 = l_props_5.LayoutOrder;
    local l_Enabled_0 = l_props_5.Enabled;
    local l_AssetsTable_0 = l_props_5.AssetsTable;
    local l_assets_0 = l_AssetsTable_0.assets;
    local l_assetsModerationData_0 = l_AssetsTable_0.assetsModerationData;
    local l_nextPageCursor_0 = l_AssetsTable_0.nextPageCursor;
    local l_pageNumber_0 = l_AssetsTable_0.pageNumber;
    local l_CurrentScreen_3 = l_props_5.CurrentScreen;
    local l_IsFetchingAssets_0 = l_props_5.IsFetchingAssets;
    local l_SearchTerm_0 = l_props_5.SearchTerm;
    local l_SelectedAssets_0 = l_props_5.SelectedAssets;
    local l_dispatchGetAssets_0 = l_props_5.dispatchGetAssets;
    local l_dispatchLoadAllAliases_0 = l_props_5.dispatchLoadAllAliases;
    local l_View_1 = l_props_5.View;
    local v116 = nil;
    local v117 = nil;
    local v118 = nil;
    if l_View_1.Key == v18.LIST.Key then
        local v119, v120 = v96:createListItems(v98, l_Localization_0, l_Stylizer_0, l_assets_0, l_assetsModerationData_0, l_CurrentScreen_3, l_SearchTerm_0, l_SelectedAssets_0, l_Enabled_0);
        v116 = v119;
        v117 = v120;
        v118 = v96.listLayoutRef;
    elseif l_View_1.Key == v18.GRID.Key then
        local v121, v122 = v96:createTiles(v98, l_Localization_0, l_Stylizer_0, l_assets_0, l_assetsModerationData_0, l_CurrentScreen_3, l_SearchTerm_0, l_SelectedAssets_0, l_Enabled_0);
        v116 = v121;
        v117 = v122;
        v118 = v96.gridLayoutRef;
    end;
    local v123 = true;
    if l_CurrentScreen_3.Path ~= v17.MAIN.Path then
        v123 = v117 ~= 0;
    end;
    local v124 = nil;
    v124 = if not l_AssetManagerMigrateAliasesEndpoint2_0 then l_pageNumber_0 ~= nil else l_nextPageCursor_0 ~= nil;
    local v125 = l_Localization_0:getText("AssetGrid", "NoResults", {
        assetType = l_Localization_0:getText("Folders", l_CurrentScreen_3.Path)
    });
    local v126 = l_GetTextSize_0(v125, l_Stylizer_0.FontSizeMedium, l_Stylizer_0.Font);
    local v127 = l_Localization_0:getText("AssetGrid", "LoadButton");
    local v128 = l_GetTextSize_0(v127, l_Stylizer_0.FontSizeLarge, l_Stylizer_0.Font);
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1
    }, {
        AssetGrid = v123 and v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            NextPageRequestDistance = 100, 
            NextPageFunc = function()
                if not l_nextPageCursor_0 then
                    if l_pageNumber_0 then
                        l_dispatchGetAssets_0(v98, l_CurrentScreen_3.AssetType, nil, l_pageNumber_0);
                    end;
                    return ;
                else
                    l_dispatchGetAssets_0(v98, l_CurrentScreen_3.AssetType, l_nextPageCursor_0);
                    return ;
                end;
            end
        }, v116), 
        ActionButton = v123 and v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v2.Event.Activated] = v96.onClearSelection, 
            [v2.Event.MouseButton2Click] = v96.onMouseButton2Click
        }), 
        NoResultsText = ((not v123 and not l_IsFetchingAssets_0) and not v124) and v2.createElement("TextLabel", {
            Size = UDim2.new(0, v126.X, 0, v126.Y), 
            Position = UDim2.new(0.5, 0, 0.3, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = v125, 
            TextColor3 = l_Stylizer_0.DisabledColor, 
            Font = l_Stylizer_0.Font, 
            TextSize = l_Stylizer_0.FontSizeMedium, 
            BackgroundTransparency = 1
        }), 
        LoadButton = ((not v123 and not l_IsFetchingAssets_0) and v124) and v2.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = v127, 
            Size = UDim2.new(0, v128.X + l_Stylizer_0.AssetGridContainer.LoadButton.PaddingX, 0, v128.Y + l_Stylizer_0.AssetGridContainer.LoadButton.PaddingY), 
            Position = UDim2.new(0.5, 0, 0.3, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = function()
                l_dispatchLoadAllAliases_0(v98, l_CurrentScreen_3.AssetType);
            end
        }, {
            v2.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        LoadingIndicator = l_IsFetchingAssets_0 and v2.createElement(l_LoadingIndicator_0, {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 2
        })
    });
end;
return v3.connect(function(v129, _)
    local l_AssetManagerReducer_0 = v129.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        CurrentScreen = v129.Screen.currentScreen, 
        IsFetchingAssets = l_AssetManagerReducer_0.isFetchingAssets, 
        SearchTerm = l_AssetManagerReducer_0.searchTerm, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets, 
        View = l_AssetManagerReducer_0.view
    };
end, function(v132)
    return {
        dispatchGetAssets = function(v133, v134, v135, v136)
            v132(v22(v133, v134, v135, v136));
        end, 
        dispatchLoadAllAliases = function(v137, v138)
            v132(v23(v137, v138));
        end, 
        dispatchOnAssetRightClick = function(v139, v140)
            v139.AssetData = v140;
            v132(v25(v139));
        end, 
        dispatchOnAssetDrag = function(v141, v142, v143)
            v132(v24(v141, v142, v143));
        end, 
        dispatchOnScreenChange = function(v144, v145)
            v132(v26(v144, v145));
        end, 
        dispatchSetAssets = function(v146)
            v132(v21(v146));
        end, 
        dispatchUpdateSelectedAssets = function(v147)
            v132(v27(v147));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    InsertAsset = l_InsertAssetContext_0, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v33)));
