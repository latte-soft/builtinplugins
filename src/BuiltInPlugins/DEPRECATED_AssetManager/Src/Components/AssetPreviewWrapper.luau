local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AssetPreview_0 = v3.UI.AssetPreview;
local v7 = require(l_Parent_0.Src.Thunks.OnAssetDoubleClick);
local v8 = require(l_Parent_0.Src.Thunks.OnAssetRightClick);
local v9 = require(l_Parent_0.Src.Thunks.GetAssetFavorited);
local v10 = require(l_Parent_0.Src.Thunks.GetAssetFavoriteCount);
local v11 = require(l_Parent_0.Src.Thunks.ToggleFavoriteStatus);
local l_StudioService_0 = game:GetService("StudioService");
local v13 = v1.PureComponent:extend("AssetPreviewWrapper");
v13.init = function(v14)
    v14.state = {
        selectedPreviewInstance = nil, 
        maxPreviewHeight = 0, 
        maxPreviewWidth = 0
    };
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    v14.onTreeItemClicked = function(v16)
        v14:setState({
            selectedPreviewInstance = v16
        });
    end;
    v14.tryInsert = function()
        local l_props_0 = v14.props;
        l_props_0.dispatchOnAssetDoubleClick(l_props_0.Analytics, l_props_0.AssetData, true);
    end;
    v14.requestFavoriteCounts = function()
        local l_props_1 = v14.props;
        l_props_1.dispatchGetAssetFavoriteCount(l_props_1.API:get(), l_props_1.AssetData.id);
    end;
    v14.checkFavorited = function()
        local l_props_2 = v14.props;
        l_props_2.dispatchGetAssetFavorited(l_props_2.API:get(), l_props_2.AssetData.id, l_l_StudioService_0_UserId_0);
    end;
    v14.onFavoritedActivated = function(_)
        local l_props_3 = v14.props;
        l_props_3.dispatchToggleFavoriteStatus(l_props_3.API:get(), l_props_3.AssetData.id, l_l_StudioService_0_UserId_0, l_props_3.Favorited);
    end;
    v14.tryCreateContextMenu = function()
        v14.props:dispatchOnAssetRightClick();
    end;
    v14.ClickDetectorRef = v1.createRef();
    v14.onDetectorABSSizeChange = function()
        local l_current_0 = v14.ClickDetectorRef.current;
        if l_current_0 then
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            v14:setState({
                maxPreviewWidth = l_AbsoluteSize_0.x - 64, 
                maxPreviewHeight = l_AbsoluteSize_0.y - 64
            });
            return ;
        else
            return ;
        end;
    end;
end;
v13.didMount = function(v24)
    v24.checkFavorited();
    v24.requestFavoriteCounts();
end;
v13.render = function(v25)
    local l_props_4 = v25.props;
    local l_state_0 = v25.state;
    local v28 = l_props_4.Focus:get();
    local l_Localization_0 = l_props_4.Localization;
    local l_Stylizer_0 = l_props_4.Stylizer;
    local l_AssetPreviewData_0 = l_props_4.AssetPreviewData;
    return v1.createElement(v1.Portal, {
        target = v28
    }, {
        AssetPreview = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Background = v1.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = l_Stylizer_0.Overlay.Background.Transparency, 
                ZIndex = 1, 
                [v1.Event.Activated] = l_props_4.OnAssetPreviewClose, 
                [v1.Ref] = v25.ClickDetectorRef, 
                [v1.Change.AbsoluteSize] = v25.onDetectorABSSizeChange
            }), 
            Contents = v1.createElement(l_AssetPreview_0, {
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(math.min(l_state_0.maxPreviewWidth, 640), l_state_0.maxPreviewHeight), 
                AssetData = l_AssetPreviewData_0, 
                AssetInstance = if not v25.state.selectedPreviewInstance then l_AssetPreviewData_0.rootTreeViewInstance else v25.state.selectedPreviewInstance, 
                OnClickContext = v25.tryCreateContextMenu, 
                ActionText = l_Localization_0:getText("AssetPreview", "Insert"), 
                OnClickAction = v25.tryInsert, 
                Favorites = {
                    OnClick = v25.onFavoritedActivated, 
                    Count = not l_AssetPreviewData_0.favoriteCount and 0 or tonumber(l_AssetPreviewData_0.favoriteCount), 
                    IsFavorited = not not l_AssetPreviewData_0.favorited and l_AssetPreviewData_0.favorited
                }, 
                HideCreatorSearch = true, 
                ZIndex = 2
            })
        })
    });
end;
return v2.connect(function(_, _)
end, function(v34)
    return {
        dispatchOnAssetDoubleClick = function(v35, v36, v37)
            v34(v7(v35, v36, v37));
        end, 
        dispatchOnAssetRightClick = function(v38)
            v38.IsAssetPreviewMenu = true;
            v34(v8(v38));
        end, 
        dispatchGetAssetFavorited = function(v39, v40, v41)
            v34(v9(v39, v40, v41));
        end, 
        dispatchGetAssetFavoriteCount = function(v42, v43)
            v34(v10(v42, v43));
        end, 
        dispatchToggleFavoriteStatus = function(v44, v45, v46, v47)
            v34(v11(v44, v45, v46, v47));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    API = l_ContextServices_0.API, 
    Focus = l_ContextServices_0.Focus, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13)));
