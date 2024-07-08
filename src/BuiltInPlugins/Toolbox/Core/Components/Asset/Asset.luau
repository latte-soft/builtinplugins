local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v3 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxOpenAssetPreviewIfFiatCannotBeInserted);
local v5 = game:DefineFastFlag("ToolboxFixAbsolutePositionResizing", false);
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Roact);
local v8 = require(l_Packages_0.RoactRodux);
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.DebugFlags);
local v11 = require(l_Util_0.Images);
local v12 = require(l_Util_0.getTimeString);
local v13 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v14 = require(l_Util_0.AssetUtil);
local v15 = require(l_Util_0.FiatUtil);
local v16 = require(l_Parent_0.Core.Localization.getLocalizedAssetStatusMap);
local l_Components_0 = l_Parent_0.Core.Components;
local l_Asset_0 = l_Components_0.Asset;
local v19 = require(l_Components_0.DraggableButton);
local v20 = require(l_Components_0.DropShadow);
local v21 = require(l_Asset_0.AssetCreatorName);
local v22 = require(l_Asset_0.AssetIcon);
local v23 = require(l_Asset_0.AssetName);
local v24 = require(l_Asset_0.Voting.Voting);
local v25 = require(l_Parent_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v26 = require(l_Parent_0.Core.Thunks.TryCreateContextMenu);
local v27 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v28 = require(l_Parent_0.Core.Networking.Requests.GetAssetMediaIdsRequest);
local v29 = require(l_Parent_0.Core.Networking.Requests.GetOwnsAssetRequest);
local v30 = require(l_Parent_0.Core.Networking.Requests.GetCanManageAssetRequest);
local v31 = require(l_Parent_0.Core.Networking.Requests.GetVoteRequest);
local v32 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v33 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v33.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v36 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local _ = v33.UI.TextLabel;
local l_Util_1 = v33.Util;
local l_formatVoteNumber_0 = l_Util_1.formatVoteNumber;
local l_GetTextSize_0 = l_Util_1.GetTextSize;
local l_disableRatings_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableRatings;
local l_Types_0 = l_Parent_0.Core.Types;
local v43 = require(l_Types_0.Category);
local v44 = require(l_Types_0.AssetSubTypes);
local v45 = v7.PureComponent:extend("Asset");
v45.defaultProps = {
    parentSize = Vector2.new(), 
    parentAbsolutePosition = Vector2.new(), 
    logImpression = function()
    end, 
    onAssetHovered = function()
    end, 
    onAssetHoverEnded = function()
    end, 
    shouldLogOnMount = true
};
v45.init = function(v46, v47)
    v46.wasAssetBoundsWithinScrollingBounds = false;
    v46.hasInitiated = false;
    v46.ref = v7.createRef();
    v46.state = {
        hoverPosition = nil
    };
    local _ = v47.canInsertAsset;
    v46.showVotes = false;
    v46.onMouseEntered = function(_, _, _)
        v46.props.onAssetHovered(v46.props.assetId);
        if v46.showVotes then
            v47.getVote(v46.props.Network.networkInterface, v46.props.assetId, v43.getAssetTypeByNumber(v43.getCategoryByName(v46.props.categoryName).assetType));
        end;
        local l_assetData_0 = v46.props.assetData;
        local l_Asset_1 = l_assetData_0.Asset;
        local v54 = false;
        if l_Asset_1.TypeId == Enum.AssetType.Plugin.Value then
            v54 = l_assetData_0.Creator.IsVerifiedCreator;
        end;
        if v54 then
            v47.getAssetMediaIds(v46.props.Network.networkInterface, v46.props.assetId);
        end;
    end;
    v46.onMouseLeave = function(_, _, _)
        v46.props.onAssetHoverEnded(v46.props.assetId);
    end;
    v46.onInputEnded = function(_, v59)
        if v59.UserInputType == Enum.UserInputType.Focus then
            v46.props.onAssetHoverEnded(v46.props.assetId);
        end;
    end;
    v46.onMouseMoved = function(_, _, _)
        v46.props.onAssetHovered(v46.props.assetId);
    end;
    v46.canInsertAsset = function()
        local l_props_0 = v46.props;
        local l_assetData_1 = l_props_0.assetData;
        local l_ownsAsset_0 = l_props_0.ownsAsset;
        if not l_assetData_1 then
            return l_props_0.canInsertAsset();
        else
            return l_props_0.canInsertAsset() and (v43.shouldShowPrices(l_props_0.categoryName) and l_ownsAsset_0 or if not not l_assetData_1.FiatProduct and l_assetData_1.FiatProduct.PurchasePrice then v15.isFree(l_assetData_1.FiatProduct.PurchasePrice) else (not not l_assetData_1.Product and l_assetData_1.Product.Price or 0) == 0);
        end;
    end;
    v46.onDragStart = function(_, _, _)
        if v46.canInsertAsset() then
            v46.props.tryInsert(v46.props.assetData, true, nil, v46.props.swimlaneCategory);
            return ;
        else
            return ;
        end;
    end;
    v46.onClick = function(_, _, _)
        if v46.canInsertAsset() then
            local l_assetData_2 = v46.props.assetData;
            local l_Asset_2 = l_assetData_2.Asset;
            local l_swimlaneCategory_0 = v46.props.swimlaneCategory;
            if l_Asset_2.TypeId == Enum.AssetType.Plugin.Value then
                v46.onAssetPreviewButtonClicked();
                return ;
            else
                v46.props.tryInsert(l_assetData_2, false, nil, l_swimlaneCategory_0);
                return ;
            end;
        else
            if v4() then
                v46.onAssetPreviewButtonClicked();
            end;
            return ;
        end;
    end;
    v46.onAssetPreviewButtonClicked = function()
        v46.props.onAssetPreviewButtonClicked(v46.props.assetData, v46.props.swimlaneCategory);
    end;
    v46.tryCreateContextMenu = function(v75)
        local l_props_1 = v46.props;
        v46.props.tryCreateContextMenu(l_props_1.assetData, v75, l_props_1.Plugin:get(), l_props_1.tryOpenAssetConfig, (v46.props.getPageInfoAnalyticsContextInfo()));
    end;
    v46.onAbsolutePositionChange = function(v77)
        local l_assetData_3 = v46.props.assetData;
        local l_AbsolutePosition_0 = v77.AbsolutePosition;
        local v80 = v14.getAssetSize(v46.props.categoryName);
        local v81 = false;
        if v77.AnchorPoint.X == 0 then
            v81 = v77.AnchorPoint.Y == 0;
        end;
        assert(v81, "self.onAbsolutePositionChange needs the asset AnchorPoint to be 0,0 to calculate the scrollingBounds.");
        local v82 = Vector2.new(v80.X.Offset, v80.Y.Offset);
        v81 = v46.props.parentSize;
        local l_parentAbsolutePosition_0 = v46.props.parentAbsolutePosition;
        local _ = nil;
        v46.wasAssetBoundsWithinScrollingBounds = v46.props.logImpression(l_assetData_3, v46.wasAssetBoundsWithinScrollingBounds, v82, l_AbsolutePosition_0, v81, l_parentAbsolutePosition_0, (v46.props.AssetAnalytics:get().getNavigationContext(v46.props.NavigationContext:get(), v46.props.swimlaneCategory)));
    end;
end;
v45.didMount = function(v85)
    local l_assetData_4 = v85.props.assetData;
    local l_assetId_0 = v85.props.assetId;
    v85.props.getOwnsAsset(v85.props.Network.networkInterface, l_assetId_0);
    v85.props.getCanManageAsset(v85.props.Network.networkInterface, l_assetId_0);
    if l_assetData_4 then
        local _ = v85.props.getPageInfoAnalyticsContextInfo();
        local _ = v85.props.AssetAnalytics:get().getNavigationContext(v85.props.NavigationContext:get(), v85.props.swimlaneCategory);
        if not (not v85.ref.current or not v85.props.shouldLogOnMount) then
            v85.onAbsolutePositionChange(v85.ref.current);
        end;
    end;
end;
v45.didUpdate = function(v90, v91, _)
    if not v5 then
        if v91.parentSize ~= v90.props.parentSize then
            v90.onAbsolutePositionChange(v90.ref.current);
        end;
    elseif v90.ref.current ~= nil and v91.parentSize ~= v90.props.parentSize then
        v90.onAbsolutePositionChange(v90.ref.current);
        return ;
    end;
end;
v45.render = function(v93)
    local l_props_2 = v93.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_0 = l_props_2.Localization;
    local l_assetId_1 = l_props_2.assetId;
    local l_assetData_5 = l_props_2.assetData;
    local l_categoryName_0 = l_props_2.categoryName;
    local l_currentUserPackagePermissions_0 = l_props_2.currentUserPackagePermissions;
    local l_hideCreatorName_0 = l_props_2.hideCreatorName;
    local v102 = v43.categoryIsGroupPackages(l_categoryName_0);
    local v103 = true;
    if l_currentUserPackagePermissions_0[l_assetId_1] ~= v27.EditKey then
        v103 = l_currentUserPackagePermissions_0[l_assetId_1] == v27.OwnKey;
    end;
    local v104 = nil;
    v104 = not v102 and true or v103;
    if l_assetData_5 and v104 then
        local l_LayoutOrder_0 = l_props_2.LayoutOrder;
        local l_ownsAsset_1 = l_props_2.ownsAsset;
        local l_Asset_3 = l_assetData_5.Asset;
        l_assetId_1 = l_props_2.assetId;
        local l_TypeId_0 = l_Asset_3.TypeId;
        local l_IsEndorsed_0 = l_Asset_3.IsEndorsed;
        local l_IsVerifiedCreator_0 = l_assetData_5.Creator.IsVerifiedCreator;
        local l_HasScripts_0 = l_Asset_3.HasScripts;
        local v112 = if not l_Asset_3.AssetSubTypes then nil else v44.contains(l_Asset_3.AssetSubTypes, v44.Package);
        local v113 = false;
        if l_TypeId_0 == Enum.AssetType.Audio.Value then
            v113 = true;
        end;
        local l_Name_0 = l_Asset_3.Name;
        local l_Status_0 = l_Asset_3.Status;
        local v116 = v43.shouldShowPrices(l_props_2.categoryName);
        local v117 = nil;
        local v118 = nil;
        local v119 = nil;
        if v116 then
            v118 = false;
            local l_FiatProduct_0 = l_assetData_5.FiatProduct;
            if not l_FiatProduct_0 or not l_FiatProduct_0.PurchasePrice then
                if not v3() then
                    v118 = true;
                    local v121 = not not l_assetData_5.Product and l_assetData_5.Product.Price or 0;
                    v119 = v121 == 0;
                    v117 = if not v119 then v121 else l_Localization_0:getText("Purchase", "Free");
                else
                    v117 = "";
                    if v10.shouldDebugWarnings() then
                        warn(("AssetTile expected fiatProduct for categoryName %s, but found none for assetId %s"):format(l_props_2.categoryName, l_Asset_3.Id));
                    end;
                end;
            else
                v117 = v15.displayStringFromMoney(l_FiatProduct_0.PurchasePrice, l_Localization_0);
            end;
        end;
        local l_Creator_0 = l_assetData_5.Creator;
        local l_Name_1 = l_Creator_0.Name;
        local v124 = l_props_2.voting or {};
        local l_ShowVotes_0 = v124.ShowVotes;
        local v126 = v43.getTabForCategoryName(l_props_2.categoryName) == v43.CREATIONS;
        if not (not (not (v43.getTabForCategoryName(l_props_2.categoryName) == v43.MARKETPLACE) or v113) and not l_disableRatings_0()) then
            l_ShowVotes_0 = false;
        end;
        v93.showVotes = l_ShowVotes_0;
        local v127 = v126 and l_Status_0 ~= nil;
        local l_isHovered_0 = l_props_2.isHovered;
        local v129 = nil;
        local v130 = nil;
        local v131 = nil;
        local _ = nil;
        local v133 = nil;
        local _ = nil;
        local v135 = nil;
        local v136 = nil;
        local v137 = nil;
        local v138 = false;
        if v124 ~= nil then
            v138 = false;
            if v124.VoteCount ~= nil then
                v138 = l_formatVoteNumber_0.hasEnoughRatings(v124.VoteCount);
            end;
        end;
        v131 = (l_ShowVotes_0 and l_isHovered_0) and v138;
        v138 = l_ShowVotes_0;
        if v138 then
            v138 = false;
            if v124 ~= nil then
                v138 = v124.showVoteButtons;
            end;
        end;
        v130 = v138;
        v138 = l_ShowVotes_0;
        if v138 then
            v138 = l_isHovered_0;
            if v138 then
                v138 = false;
                if v124 ~= nil then
                    v138 = v124.VoteLoading;
                end;
            end;
        end;
        v137 = v138;
        v129 = if not v130 then if v131 or v137 then v9.ASSET_OUTLINE_EXTRA_HEIGHT_WITH_VOTING_COUNT else v9.ASSET_OUTLINE_EXTRA_HEIGHT else v9.ASSET_OUTLINE_EXTRA_HEIGHT_WITH_VOTE_BUTTONS_HOVERED;
        v135 = v9.ASSET_NAME_FONT_SIZE;
        v136 = v9.FONT;
        if not (not (l_GetTextSize_0(l_Name_0, v135, v136).X <= v9.ASSET_WIDTH_NO_PADDING) and not v130) then
            v133 = true;
            v129 = v129 - v9.ASSET_NAME_ONE_LINE_HEIGHT;
        end;
        if not (not v127 or l_hideCreatorName_0) then
            v129 = v129 + v9.ASSET_CREATOR_NAME_HEIGHT;
        end;
        if not (not l_HasScripts_0 and not v112) then
            v129 = v129 + v9.PRICE_HEIGHT;
        end;
        if not ((not v130 or not l_isHovered_0) or not l_HasScripts_0 and not v112) then
            v129 = v129 + v9.ASSET_VOTE_BUTTONS_SCRIPT_PADDING;
        end;
        if not (not v116 and not v113) then
            v129 = v129 + v9.ASSET_INNER_PADDING;
        end;
        local l_outline_0 = l_Stylizer_0.asset.outline;
        local v140 = not not l_isHovered_0 and v129 + 2 * v9.ASSET_OUTLINE_PADDING or 0;
        local l_ASSET_INNER_PADDING_0 = v9.ASSET_INNER_PADDING;
        if v113 then
            l_ASSET_INNER_PADDING_0 = 0;
        end;
        local l_packages_0 = l_Stylizer_0.asset.packages;
        local v143 = "";
        if v113 then
            v143 = l_Asset_3.Duration ~= nil and v12(l_Asset_3.Duration, 1) or "";
        end;
        local l_dropShadowSize_0 = l_Stylizer_0.asset.dropShadowSize;
        return (v7.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v14.getAssetSize(l_categoryName_0), 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            ZIndex = not l_isHovered_0 and 1 or 2, 
            [v7.Change.AbsolutePosition] = v93.onAbsolutePositionChange, 
            [v7.Ref] = v93.ref
        }, {
            DropShadow = l_isHovered_0 and v7.createElement(v20, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -(v9.ASSET_OUTLINE_PADDING + l_dropShadowSize_0)), 
                Size = UDim2.new(1, 2 * (v9.ASSET_OUTLINE_PADDING + l_dropShadowSize_0), 1, v129 + 2 * l_dropShadowSize_0), 
                ZIndex = -2
            }), 
            Outline = v7.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = if l_isHovered_0 or l_props_2.hasTutorialLimits then l_outline_0.transparency else 1, 
                BackgroundColor3 = l_outline_0.backgroundColor, 
                BorderColor3 = l_outline_0.borderColor, 
                BorderSizePixel = 1, 
                Position = UDim2.new(0.5, 0, 0, -v9.ASSET_OUTLINE_PADDING), 
                Size = UDim2.new(1, 2 * v9.ASSET_OUTLINE_PADDING, 1, v129), 
                ZIndex = -1, 
                [v7.Event.MouseLeave] = v93.onMouseLeave, 
                [v7.Event.InputEnded] = v93.onInputEnded
            }, {
                TutorialStroke = if not l_props_2.hasTutorialLimits then nil else v7.createElement("UIStroke", {
                    Thickness = l_Stylizer_0.asset.strokeThickness, 
                    Color = l_Stylizer_0.asset.strokeColor
                })
            }), 
            InnerFrame = v7.createElement(v19, {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, v140), 
                [v7.Event.MouseEnter] = v93.onMouseEntered, 
                [v7.Event.MouseButton2Click] = function()
                    v93.tryCreateContextMenu(l_Localization_0);
                end, 
                onMouseMoved = v93.onMouseMoved, 
                onDragStart = v93.onDragStart, 
                onClick = v93.onClick
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    Padding = UDim.new(0, l_ASSET_INNER_PADDING_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                AssetIcon = v7.createElement(v22, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    LayoutOrder = 0, 
                    assetId = l_assetId_1, 
                    assetName = l_Name_0, 
                    assetTileLocation = l_props_2.assetTileLocation, 
                    currentSoundId = l_props_2.currentSoundId, 
                    isEndorsed = l_IsEndorsed_0, 
                    isLoading = l_props_2.isLoading, 
                    typeId = l_TypeId_0, 
                    originalAssetId = l_props_2.originalAssetId, 
                    voting = v124, 
                    isHovered = l_isHovered_0, 
                    isPackage = v112, 
                    status = not not v127 and l_Status_0 or nil, 
                    onAssetPreviewButtonClicked = v93.onAssetPreviewButtonClicked
                }), 
                AssetName = v7.createElement(v23, {
                    Size = UDim2.new(1, 0, 0.45, 0), 
                    LayoutOrder = 10, 
                    NumberRows = if not v133 then nil else 1, 
                    assetId = l_assetId_1, 
                    assetName = l_Name_0, 
                    TextSize = v135, 
                    Font = v136
                }), 
                Price = v116 and v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 20, 
                    Size = UDim2.new(1, 0, 0, v9.PRICE_HEIGHT)
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    RobuxIcon = ((v118 and not v119) and not l_ownsAsset_1) and v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = v11.ROBUX_SMALL, 
                        Size = v9.Dialog.ROBUX_SIZE, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Stylizer_0.asset.textColor
                    }), 
                    PriceText = not l_ownsAsset_1 and v7.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        Font = v9.FONT, 
                        Size = UDim2.new(1, -20, 0, v9.PRICE_HEIGHT), 
                        TextColor3 = l_Stylizer_0.asset.textColor, 
                        TextSize = v9.PRICE_FONT_SIZE, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v117, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }), 
                    OwnedIcon = l_ownsAsset_1 and v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = v11.OWNED_ICON, 
                        Size = v9.Dialog.ROBUX_SIZE, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Stylizer_0.asset.textColor
                    })
                }), 
                CreatorName = (l_isHovered_0 and not l_hideCreatorName_0) and v7.createElement(v21, {
                    Size = UDim2.new(1, 0, 0.15, 0), 
                    LayoutOrder = 30, 
                    assetId = l_assetId_1, 
                    creator = if not v2() then nil else l_Creator_0, 
                    creatorName = l_Name_1, 
                    clickable = not v126, 
                    isVerifiedCreator = l_IsVerifiedCreator_0, 
                    onClick = if not v2() then nil else l_props_2.onSearchByCreator
                }), 
                Voting = if (v131 or v130) or v137 then v7.createElement(v24, {
                    LayoutOrder = not v130 and 35 or 25, 
                    assetId = l_assetId_1, 
                    voting = v124, 
                    showBackgroundBox = l_isHovered_0
                }) else if v131 or v130 then v7.createElement(v24, {
                    LayoutOrder = not v130 and 35 or 25, 
                    assetId = l_assetId_1, 
                    voting = v124, 
                    showBackgroundBox = l_isHovered_0
                }) else nil, 
                AudioLength = (l_isHovered_0 and v113) and v7.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v9.AUDIO_LENGTH_HEIGHT), 
                    LayoutOrder = 40, 
                    Text = v143, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = v9.FONT, 
                    TextSize = v9.FONT_SIZE_SMALL, 
                    TextColor3 = l_Stylizer_0.asset.textColor
                }), 
                HasScripts = if not (not not l_isHovered_0 and l_HasScripts_0) or v112 then nil else v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 50, 
                    Size = UDim2.new(1, 0, 0, v9.PRICE_HEIGHT)
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    ScriptIcon = v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = v11.SCRIPT, 
                        Size = v9.Dialog.SCRIPT_SIZE, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v7.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -20, 0, v9.PRICE_HEIGHT), 
                        TextColor3 = l_Stylizer_0.asset.textColor, 
                        Font = v9.FONT, 
                        TextSize = v9.STATUS_NAME_FONT_SIZE, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = l_Localization_0:getText("General", "HasScripts"), 
                        TextTruncate = Enum.TextTruncate.None
                    })
                }), 
                Package = if not not l_isHovered_0 and v112 then v7.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 50, 
                    Size = UDim2.new(1, 0, 0, v9.PRICE_HEIGHT)
                }, {
                    Layout = v7.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    PackageIcon = v7.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        Image = l_packages_0.packageImage, 
                        Size = v9.PACKAGE_DETAIL_SIZE, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v7.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -20, 0, v9.PRICE_HEIGHT), 
                        TextColor3 = l_Stylizer_0.asset.textColor, 
                        Font = v9.FONT, 
                        TextSize = v9.STATUS_NAME_FONT_SIZE, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = l_Localization_0:getText("General", "PackagesUpdateable"), 
                        TextTruncate = Enum.TextTruncate.None
                    })
                }) else nil, 
                Status = (l_isHovered_0 and v127) and v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 60, 
                    Size = UDim2.new(1, 0, 0, v9.STATUS_NAME_HEIGHT), 
                    Text = v16(l_Localization_0)[l_Status_0], 
                    TextColor3 = l_Stylizer_0.asset.textColor, 
                    Font = v9.FONT, 
                    TextSize = v9.STATUS_NAME_FONT_SIZE, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    ClipsDescendants = false, 
                    TextTruncate = Enum.TextTruncate.None
                })
            })
        }));
    else
        return ;
    end;
end;
return v8.connect(function(v145, v146)
    v145 = v145 or {};
    local v147 = v145.assets or {};
    local v148 = v145.voting or {};
    local v149 = v145.sound or {};
    local v150 = v147.idToAssetMap or {};
    local l_assetId_2 = v146.assetId;
    local v152 = v145.pageInfo or {};
    local v153 = v152.categoryName or v43.DEFAULT.name;
    local v154 = v152.searchTerm or "";
    local v155 = v145.purchase.cachedOwnedAssets[tostring(l_assetId_2)];
    local _ = (v147.manageableAssets or {})[tostring(l_assetId_2)];
    local _ = nil;
    return {
        assetData = if v146.assetData then v150[l_assetId_2] else v146.assetData, 
        categoryName = v153, 
        currentSoundId = v149.currentSoundId or 0, 
        currentUserPackagePermissions = (v145.packages.permissionsTable or {}) or nil, 
        searchTerm = v154, 
        ownsAsset = v155, 
        isLoading = v149.currentSoundId == l_assetId_2 and (v149.isLoading or false), 
        voting = v148[l_assetId_2] or {}, 
        hasTutorialLimits = v145.tutorialLimits.assetIds ~= nil
    };
end, function(v158)
    return {
        getAssetMediaIds = function(v159, v160)
            v158(v28(v159, v160));
        end, 
        getOwnsAsset = function(v161, v162)
            v158(v29(v161, v162));
        end, 
        getCanManageAsset = function(v163, v164)
            v158(v30(v163, v164));
        end, 
        getVote = function(v165, v166, v167)
            v158(v31(v165, v166, v167, true));
        end, 
        tryCreateContextMenu = function(v168, v169, v170, v171, v172)
            v158(v26(v168, v169, v170, v171, v172));
        end, 
        getPageInfoAnalyticsContextInfo = function()
            return v158(v25());
        end
    };
end)((l_withContext_0({
    AssetAnalytics = v13, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    NavigationContext = v32, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v36
})(v45)));
