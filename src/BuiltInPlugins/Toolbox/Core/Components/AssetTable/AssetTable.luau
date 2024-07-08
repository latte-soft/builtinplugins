local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local _ = require(l_Util_0.DebugFlags);
local v11 = require(l_Util_0.Analytics.Analytics);
local _ = require(l_script_FirstAncestor_0.Core.Types.AnalyticsTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v14 = require(l_script_FirstAncestor_0.Core.Types.Category);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local l_UI_0 = v4.UI;
local _ = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v23 = require(l_script_FirstAncestor_0.Core.Components.AssetRow.AssetRow);
local l_List_0 = l_UI_0.List;
local v25 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.GetAssetTableSizes);
local v26 = v2.PureComponent:extend("AssetTable");
if require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows)() then
    local v27 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
    local v28 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
    v26.init = function(v29)
        v29.state = {
            expandedAssetId = nil
        };
        v29.setExpandedAssetId = function(v30)
            v29:setState(function(v31)
                return {
                    expandedAssetId = if v30 == v31.expandedAssetId then v2.None else v30
                };
            end);
            if v27() then
                local l_props_0 = v29.props;
                local l_Assets_0 = l_props_0.Assets;
                local v34 = v14.getCategoryByName(l_props_0.categoryName);
                local v35 = {
                    assetType = if not v34 then nil else v34.assetType, 
                    searchId = l_props_0.searchId
                };
                local v36 = 1;
                for v37, v38 in l_Assets_0, nil, nil do
                    if v38.Asset and v38.Asset.Id == v30 then
                        v36 = v37;
                        break;
                    end;
                end;
                v11.MarketplaceAssetRowExpanded(v30, math.floor((v36 - 1) / 20), (v36 - 1) % 20, v35);
            end;
        end;
        v29.createHeaderElement = function(v39, v40, v41, v42)
            local l_props_1 = v29.props;
            local v44 = v25(v42);
            local l_itemRow_0 = l_props_1.Stylizer.itemRow;
            local v46 = v44[v40];
            if not v46 then
                return nil;
            else
                local l_createElement_0 = v2.createElement;
                local l_l_TextLabel_0_0 = l_TextLabel_0;
                local v49 = {
                    Font = v9.FONT, 
                    LayoutOrder = v41, 
                    Size = v46, 
                    Text = v39, 
                    TextColor = l_itemRow_0.headerTextColor, 
                    TextSize = v9.FONT_SIZE_SMALL, 
                    TextXAlignment = Enum.TextXAlignment.Left
                };
                local v50 = {};
                local v51 = false;
                if v41 ~= 1 then
                    v51 = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v9.ITEM_ROW.LEFT_RIGHT_PADDING)
                    });
                end;
                v50.UIPadding = v51;
                return (l_createElement_0(l_l_TextLabel_0_0, v49, v50));
            end;
        end;
        v29.getAssetElementProps = function(v52, v53, v54, v55)
            local l_props_2 = v29.props;
            local l_state_0 = v29.state;
            local l_LogImpression_0 = l_props_2.LogImpression;
            local l_CanInsertAsset_0 = l_props_2.CanInsertAsset;
            local l_expandedAssetId_0 = l_state_0.expandedAssetId;
            local function v62(v61)
                if l_props_2.TryInsert then
                    l_props_2.TryInsert(v52, v61 or false);
                end;
            end;
            local v63 = not not v52.Asset and v52.Asset.Id == l_expandedAssetId_0;
            return {
                AssetInfo = v52, 
                CanInsertAsset = l_CanInsertAsset_0, 
                InsertAsset = v62, 
                IsExpanded = v63, 
                Key = if not not v52 and v52.Asset then v52.Asset.Id else v53, 
                LayoutOrder = v53, 
                LogImpression = l_LogImpression_0, 
                OnExpanded = v29.setExpandedAssetId, 
                OnAssetPreviewButtonClicked = l_props_2.OnAssetPreviewButtonClicked, 
                OnSearchByCreator = if not v28() then nil else l_props_2.OnSearchByCreator, 
                ParentAbsoluteSize = l_props_2.ParentAbsoluteSize, 
                Position = v54, 
                Size = v55, 
                TryOpenAssetConfig = l_props_2.TryOpenAssetConfig, 
                ZIndex = if not v63 then nil else 2
            };
        end;
        v29.renderHeader = function(_, _, v66, v67)
            local l_props_3 = v29.props;
            local l_Localization_0 = l_props_3.Localization;
            local v70 = not l_props_3.AbsoluteSize and 0 or l_props_3.AbsoluteSize.X;
            local v71 = l_LayoutOrderIterator_0.new();
            local function _(v72, v73, v74)
                return v29.createHeaderElement(v72, v73, v74, v70);
            end;
            return v2.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = v67, 
                Layout = Enum.FillDirection.Horizontal, 
                Padding = {
                    Right = v9.ITEM_ROW.BORDER_SIZE, 
                    Left = v9.ITEM_ROW.BORDER_SIZE, 
                    Top = v9.ITEM_ROW.BORDER_SIZE, 
                    Bottom = v9.ITEM_ROW.BORDER_SIZE
                }, 
                Position = v66
            }, {
                Type = v29.createHeaderElement("", v9.ASSET_ROW_COLUMNS.ICON, v71:getNextOrder(), v70), 
                Name = v29.createHeaderElement(l_Localization_0:getText("AssetTable", "Name"):upper(), v9.ASSET_ROW_COLUMNS.NAME, v71:getNextOrder(), v70), 
                Creator = v29.createHeaderElement(l_Localization_0:getText("AssetTable", "Creator"):upper(), v9.ASSET_ROW_COLUMNS.CREATOR, v71:getNextOrder(), v70), 
                DateUpdated = v29.createHeaderElement(l_Localization_0:getText("AssetTable", "DateUpdated"):upper(), v9.ASSET_ROW_COLUMNS.DATE_UPDATED, v71:getNextOrder(), v70), 
                DateCreated = v29.createHeaderElement(l_Localization_0:getText("AssetTable", "DateCreated"):upper(), v9.ASSET_ROW_COLUMNS.DATE_CREATED, v71:getNextOrder(), v70)
            });
        end;
    end;
    v26.render = function(v76)
        local l_props_4 = v76.props;
        local l_state_1 = v76.state;
        local l_Assets_1 = l_props_4.Assets;
        local l_LayoutOrder_0 = l_props_4.LayoutOrder;
        local v81 = not l_props_4.AbsoluteSize and 0 or l_props_4.AbsoluteSize.X;
        local v82 = {
            HEADER = {
                AbsoluteSize = Vector2.new(v81, 20), 
                OnRender = v76.renderHeader
            }
        };
        if l_state_1.expandedAssetId then
            v82[l_state_1.expandedAssetId] = {
                AbsoluteSize = Vector2.new(v81, 90), 
                OnRender = function(v83, v84, v85, v86)
                    return v2.createElement(v23, v76.getAssetElementProps(v83, v84, v85, v86));
                end
            };
        end;
        return v2.createElement(l_Pane_0, v5.join({
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_props_4.Position, 
            Size = l_props_4.Size, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, l_props_4.WrapperProps), {
            List = v2.createElement(l_List_0, {
                GetRowProps = v76.getAssetElementProps, 
                Rows = l_Assets_1, 
                RowComponent = v23, 
                RowHeight = v9.AUDIO_ROW.ROW_HEIGHT, 
                Size = UDim2.fromScale(1, 1), 
                OnScrollUpdate = function(v87, v88)
                    if (v88 and v88.Y > 0) and v88.Y <= v87.Y + l_props_4.AbsoluteSize.Y then
                        l_props_4.FetchNextPage(20);
                    end;
                end, 
                LayoutOrder = l_LayoutOrder_0, 
                SpecialRows = v82
            })
        });
    end;
    v26 = v3.connect(function(v89, _)
        local v91 = (v89 or {}).pageInfo or {};
        return {
            categoryName = if not v27() then nil else v91.categoryName or v14.DEFAULT.name, 
            searchId = if not v27() then nil else v91.searchId
        };
    end, nil)((l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Stylizer = l_ContextServices_0.Stylizer
    })(v26)));
    TypedComponent = function(v92, v93)
        return v2.createElement(v26, v92, v93);
    end;
    return l_withAbsoluteSize_0(TypedComponent);
else
    return v26;
end;
