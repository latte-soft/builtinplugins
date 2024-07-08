local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_formatLocalDateTime_0 = v4.Util.formatLocalDateTime;
local v6 = require(l_Packages_0.Dash);
local l_HoverArea_0 = v4.UI.HoverArea;
local l_Pane_0 = v4.UI.Pane;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.Images);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v16 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v17 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v18 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v19 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRow);
local v20 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRowExpandedContent);
local v21 = require(l_Util_0.Urls);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v23 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.GetAssetTableSizes);
local v24 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v25 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local v26 = v2.PureComponent:extend("AssetRow");
if v24() then
    v26.init = function(v27)
        v27.wasAssetBoundsWithinScrollingBounds = false;
        v27.state = {
            isHovered = false, 
            isIconHovered = false
        };
        v27.onIconMouseEnter = function()
            v27:setState({
                isIconHovered = true
            });
        end;
        v27.onIconMouseLeave = function()
            v27:setState({
                isIconHovered = false
            });
        end;
        v27.onClick = function()
            local l_props_0 = v27.props;
            if l_props_0.CanInsertAsset() then
                l_props_0.InsertAsset(false);
            end;
        end;
        v27.onSearchByCreator = function()
            local l_props_1 = v27.props;
            if not v25() then
                v27.props.searchWithOptions(v27.props.Network.networkInterface, l_props_1.Settings:get("Plugin"), {
                    Creator = if not l_props_1.AssetInfo.Creator then nil else l_props_1.AssetInfo.Creator.Name
                });
            else
                local l_Creator_0 = l_props_1.AssetInfo.Creator;
                if l_props_1.OnSearchByCreator then
                    l_props_1.OnSearchByCreator(l_Creator_0);
                    return ;
                end;
            end;
        end;
        v27.onHoverChanged = function(v31)
            v27:setState(function(_)
                return {
                    isHovered = v31
                };
            end);
        end;
        v27.getColumns = function()
            local l_props_2 = v27.props;
            local v34 = l_props_2.Localization:getLocale();
            local l_Asset_0 = l_props_2.AssetInfo.Asset;
            local v36 = not l_props_2.AssetInfo.Creator and "---" or l_props_2.AssetInfo.Creator.Name;
            local v37 = not l_Asset_0.Created and "---" or l_Asset_0.Created;
            local v38 = not l_Asset_0.Updated and "---" or l_Asset_0.Updated;
            local v39, _ = v23(not l_props_2.AbsoluteSize and 0 or l_props_2.AbsoluteSize.X);
            return {
                {
                    DevLabel = "Creator", 
                    OnClick = if v36 ~= "---" then v27.onSearchByCreator else nil, 
                    Size = v39[v11.ASSET_ROW_COLUMNS.CREATOR], 
                    Text = v36, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, 
                {
                    DevLabel = "DateUpdated", 
                    Size = v39[v11.ASSET_ROW_COLUMNS.DATE_UPDATED], 
                    Text = l_formatLocalDateTime_0(v38, "MMM D, YYYY", v34), 
                    TextTruncate = Enum.TextTruncate.None
                }, 
                {
                    DevLabel = "DateCreated", 
                    Hidden = v39[v11.ASSET_ROW_COLUMNS.DATE_CREATED] == nil, 
                    Size = v39[v11.ASSET_ROW_COLUMNS.DATE_CREATED], 
                    Text = l_formatLocalDateTime_0(v37, "MMM D, YYYY", v34), 
                    TextTruncate = Enum.TextTruncate.None
                }
            };
        end;
        v27.renderIcon = function()
            local l_props_3 = v27.props;
            local l_state_0 = v27.state;
            return v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(0, v11.ASSET_ROW.ICON_SIZE + (v11.ITEM_ROW.LEFT_RIGHT_PADDING + v11.ASSET_ROW.LEFT_MOST_PADDING), 1, 0)
            }, {
                IconButton = v2.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    Image = if not l_state_0.isHovered then v21.constructAssetThumbnailUrl(l_props_3.AssetInfo.Asset.Id, v11.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE, v11.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE) else v12.MAGNIFIER_PH, 
                    Size = if not l_state_0.isIconHovered then UDim2.fromOffset(v11.ASSET_ROW.ICON_SIZE, v11.ASSET_ROW.ICON_SIZE) else UDim2.fromOffset(20, 20), 
                    [v2.Event.MouseEnter] = v27.onIconMouseEnter, 
                    [v2.Event.MouseLeave] = v27.onIconMouseLeave, 
                    [v2.Event.Activated] = v27.onAssetPreviewButtonClicked
                }, {
                    HoverArea = v2.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                })
            });
        end;
        v27.onAssetPreviewButtonClicked = function()
            local l_props_4 = v27.props;
            local l_AssetInfo_0 = v27.props.AssetInfo;
            if not (not l_props_4.OnExpanded or l_props_4.IsExpanded) then
                l_props_4.OnExpanded(l_AssetInfo_0.Asset.Id);
            end;
            v27.props.OnAssetPreviewButtonClicked(l_AssetInfo_0);
        end;
        v27.renderExpandedContent = function()
            return v2.createElement(v20, {
                AssetInfo = v27.props.AssetInfo, 
                OnAssetPreviewButtonClicked = v27.onAssetPreviewButtonClicked, 
                OnInsertClicked = v27.onClick
            });
        end;
    end;
    v26.render = function(v45)
        local l_props_5 = v45.props;
        return v2.createElement(l_Pane_0, v6.join({
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = l_props_5.LayoutOrder, 
            Position = l_props_5.Position, 
            Size = UDim2.new(1, 0, 0, 0), 
            ZIndex = l_props_5.ZIndex
        }, l_props_5.WrapperProps), {
            ItemRow = v19.Generator({
                AutomaticSize = Enum.AutomaticSize.Y, 
                Columns = v45.getColumns(), 
                RenderExpandedContent = v45.renderExpandedContent, 
                RenderIcon = v45.renderIcon, 
                TitleSize = v23(not l_props_5.AbsoluteSize and 0 or l_props_5.AbsoluteSize.X)[v11.ASSET_ROW_COLUMNS.NAME], 
                AssetInfo = l_props_5.AssetInfo, 
                CanInsertAsset = l_props_5.CanInsertAsset, 
                InsertAsset = l_props_5.InsertAsset, 
                IsExpanded = l_props_5.IsExpanded, 
                LayoutOrder = l_props_5.LayoutOrder, 
                LogImpression = l_props_5.LogImpression, 
                OnExpanded = l_props_5.OnExpanded, 
                OnHoverChanged = v45.onHoverChanged, 
                ParentAbsoluteSize = l_props_5.ParentAbsoluteSize, 
                TryOpenAssetConfig = l_props_5.TryOpenAssetConfig
            })
        });
    end;
    v26 = v3.connect(nil, function(v47)
        return {
            searchWithOptions = function(v48, v49, v50)
                v47(v16(v48, v49, v50));
            end
        };
    end)((l_withContext_0({
        Stylizer = l_ContextServices_0.Stylizer, 
        Localization = l_ContextServices_0.Localization, 
        Plugin = l_ContextServices_0.Plugin, 
        Settings = v17, 
        Network = v18
    })(v26)));
    TypedComponent = function(v51, v52)
        return v2.createElement(v26, v51, v52);
    end;
    return l_withAbsoluteSize_0(TypedComponent);
else
    return v26;
end;
