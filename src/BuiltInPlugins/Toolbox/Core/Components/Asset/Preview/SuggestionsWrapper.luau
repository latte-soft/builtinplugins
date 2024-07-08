local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Core.Components.Asset.Asset);
local v8 = require(l_script_FirstAncestor_0.Core.Components.Categorization.Swimlane);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.AssetUtil);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v13 = (((v10.ASSET_OUTLINE_EXTRA_HEIGHT_WITH_VOTING_COUNT * 2 + v10.ASSET_CREATOR_NAME_HEIGHT) + v10.PRICE_HEIGHT) + v10.ASSET_VOTE_BUTTONS_SCRIPT_PADDING) + v10.ASSET_INNER_PADDING;
local v14 = v2.PureComponent:extend("SuggestionsWrapper");
v14.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v14.init = function(v15)
    v15.state = {
        assetsList = {}, 
        hoveredAssetId = v2.None
    };
    v15.onAssetHovered = function(v16)
        v15:setState(function(v17)
            if not v17.hoveredAssetId or v17.hoveredAssetId == v2.None then
                return {
                    hoveredAssetId = v16
                };
            else
                return ;
            end;
        end);
    end;
    v15.onAssetHoverEnded = function(v18)
        v15:setState(function(v19)
            if v19.hoveredAssetId == v18 then
                return {
                    hoveredAssetId = v2.None
                };
            else
                return ;
            end;
        end);
    end;
    v15.filterOutOriginalAsset = function()
        v15:setState(function(_)
            local l_props_0 = v15.props;
            local l_Assets_0 = l_props_0.Assets;
            local v23 = nil;
            for v24, v25 in pairs(l_Assets_0) do
                if v25.Asset.Id == l_props_0.OriginalAssetId then
                    v23 = v24;
                    break;
                end;
            end;
            if v23 then
                table.remove(l_Assets_0, v23);
            end;
            return {
                assetsList = l_Assets_0
            };
        end);
    end;
    v15.onAssetPreviewButtonClicked = function(v26)
        local l_props_1 = v15.props;
        v15:setState({
            hoveredAssetId = v2.None
        });
        l_props_1.OnAssetPreviewButtonClicked(v26, "Suggestions");
    end;
end;
v14.didMount = function(v28)
    v28.filterOutOriginalAsset();
end;
v14.didUpdate = function(v29, v30, _)
    local l_props_2 = v29.props;
    if not (v30.Assets == l_props_2.Assets) or v30.OriginalAssetId ~= l_props_2.OriginalAssetId then
        v29.filterOutOriginalAsset();
    end;
end;
v14.render = function(v33)
    local l_state_0 = v33.state;
    local l_props_3 = v33.props;
    local l_Offset_0 = v11.getAssetSize(l_props_3.CategoryName).Y.Offset;
    local function v40(_, v38)
        local l_Id_0 = v38.Asset.Id;
        return v2.createElement(v7, {
            assetId = l_Id_0, 
            assetData = v38, 
            assetTileLocation = v10.ASSET_TILE_LOCATION.MORE_FROM, 
            canInsertAsset = l_props_3.CanInsertAsset, 
            hideCreatorName = true, 
            isHovered = l_Id_0 == l_state_0.hoveredAssetId, 
            logImpression = l_props_3.LogAssetImpression, 
            originalAssetId = l_props_3.OriginalAssetId, 
            onAssetHovered = v33.onAssetHovered, 
            onAssetHoverEnded = v33.onAssetHoverEnded, 
            onAssetPreviewButtonClicked = v33.onAssetPreviewButtonClicked, 
            parentAbsolutePosition = l_props_3.ParentAbsolutePosition, 
            parentSize = l_props_3.ParentAbsoluteSize, 
            tryInsert = v33.onAssetPreviewButtonClicked, 
            tryOpenAssetConfig = l_props_3.TryOpenAssetConfig
        });
    end;
    if #l_state_0.assetsList == 0 then
        return ;
    else
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = l_props_3.LayoutOrder, 
            Padding = {
                Bottom = v13 + 10
            }, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Swimlane = v2.createElement(v8, {
                Data = l_state_0.assetsList, 
                IsLoading = l_props_3.IsLoading, 
                IsHeaderResponsive = true, 
                OnClickSeeAll = l_props_3.OnClickSeeAll, 
                OnRenderItem = v40, 
                Size = UDim2.new(1, 0, 0, l_Offset_0), 
                SeeAllTextSize = 18, 
                Title = l_props_3.Localization:getText("Suggestion", "MoreFromCreator", {
                    creatorName = l_props_3.CreatorName
                })
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Settings = l_ContextServices_0.Settings
})(v14));
