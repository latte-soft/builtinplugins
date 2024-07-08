local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_withAbsoluteSizeAndPosition_0 = v4.Wrappers.withAbsoluteSizeAndPosition;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.LayoutOrderIterator);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v13 = require(l_script_FirstAncestor_0.Core.Components.DraggableButton);
local v14 = require(l_script_FirstAncestor_0.Core.Thunks.TryCreateContextMenu);
local v15 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v16 = require(l_script_FirstAncestor_0.Core.Networking.Requests.GetCanManageAssetRequest);
local v17 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v18 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v19 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_LinkText_0 = v4.UI.LinkText;
local l_Pane_0 = v4.UI.Pane;
local l_TextLabel_0 = v4.UI.TextLabel;
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v24 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local v25 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v26 = v2.PureComponent:extend("ItemRow");
v26.defaultProps = {
    TextTruncate = Enum.TextTruncate.AtEnd
};
v26.init = function(v27)
    v27.wasAssetBoundsWithinScrollingBounds = false;
    v27.state = {
        isHovered = false, 
        isExpanded = true
    };
    v27.updateHoverState = function(v28)
        v27:setState(function(_)
            local l_props_0 = v27.props;
            if l_props_0.OnHoverChanged then
                l_props_0.OnHoverChanged(v28);
            end;
            return {
                isHovered = v28
            };
        end);
    end;
    v27.onMouseEnter = function()
        v27.updateHoverState(true);
    end;
    v27.onMouseLeave = function()
        v27.updateHoverState(false);
    end;
    v27.toggleIsExpanded = function()
        local l_props_1 = v27.props;
        if l_props_1.OnExpanded then
            l_props_1.OnExpanded(v27.props.AssetInfo.Asset.Id);
        end;
    end;
    v27.onDragStart = function()
        local l_props_2 = v27.props;
        if l_props_2.CanInsertAsset() then
            l_props_2.InsertAsset(true);
        end;
    end;
    v27.onNameClicked = function()
        local l_props_3 = v27.props;
        if l_props_3.InsertAsset then
            l_props_3.InsertAsset(false);
        end;
    end;
    v27.tryCreateLocalizedContextMenu = function()
        local l_props_4 = v27.props;
        l_props_4.tryCreateContextMenu(l_props_4.AssetInfo, l_props_4.Localization, l_props_4.Plugin:get(), l_props_4.TryOpenAssetConfig, (v27.props.getPageInfoAnalyticsContextInfo()));
    end;
    v27.logImpression = function()
        local l_props_5 = v27.props;
        local l_AssetInfo_0 = l_props_5.AssetInfo;
        if l_props_5.LogImpression then
            v27.wasAssetBoundsWithinScrollingBounds = l_props_5.LogImpression(l_AssetInfo_0, l_props_5.AbsoluteSize, l_props_5.AbsolutePosition, v27.wasAssetBoundsWithinScrollingBounds);
        end;
    end;
    v27.renderColumns = function(v37)
        local l_props_6 = v27.props;
        local l_Columns_0 = l_props_6.Columns;
        local v40 = {};
        for _, v42 in l_Columns_0, nil, nil do
            if not v42.Hidden then
                local v43 = v42.OnClick ~= nil;
                local v44 = if not v24() then v8.AUDIO_ROW.LEFT_RIGHT_PADDING else v8.ITEM_ROW.LEFT_RIGHT_PADDING;
                v40[v42.DevLabel] = v2.createElement(l_Pane_0, {
                    LayoutOrder = v37:getNextOrder(), 
                    Padding = {
                        Bottom = if not not v42.Padding and v42.Padding.Bottom then v42.Padding.Bottom else nil, 
                        Left = if not not v42.Padding and v42.Padding.Left then v44 + v42.Padding.Left else v44, 
                        Right = if not not v42.Padding and v42.Padding.Right then v42.Padding.Right else nil, 
                        Top = if not not v42.Padding and v42.Padding.Top then v42.Padding.Top else nil
                    }, 
                    Size = v42.Size
                }, {
                    Text = if not v43 then v2.createElement(l_TextLabel_0, {
                        LayoutOrder = v37:getNextOrder(), 
                        Size = UDim2.fromScale(1, 1), 
                        Text = v42.Text, 
                        Style = "ToolboxItemRowText", 
                        TextTruncate = if not v42.TextTruncate then l_props_6.TextTruncate else v42.TextTruncate, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }) else v2.createElement(l_LinkText_0, {
                        LayoutOrder = v37:getNextOrder(), 
                        OnClick = v42.OnClick, 
                        Size = UDim2.fromScale(1, 1), 
                        Text = v42.Text, 
                        TextTruncate = if not v42.TextTruncate then l_props_6.TextTruncate else v42.TextTruncate, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Style = "ToolboxItemRowLink"
                    })
                });
            end;
        end;
        return v40;
    end;
end;
v26.didMount = function(v45)
    local l_props_7 = v45.props;
    local l_AssetInfo_1 = l_props_7.AssetInfo;
    local l_LogImpression_0 = l_props_7.LogImpression;
    if l_AssetInfo_1.Asset then
        l_props_7.getCanManageAsset(l_props_7.Network.networkInterface, l_AssetInfo_1.Asset.Id);
    end;
    if not l_AssetInfo_1 or not l_LogImpression_0 then
        if l_AssetInfo_1 then
            l_props_7.AssetAnalytics:get():logImpression(l_AssetInfo_1, (l_props_7.getPageInfoAnalyticsContextInfo()));
        end;
        return ;
    else
        v45.logImpression();
        return ;
    end;
end;
v26.didUpdate = function(v49, v50, _)
    local l_props_8 = v49.props;
    if not (v50.AbsolutePosition == l_props_8.AbsolutePosition and v50.AbsoluteSize == l_props_8.AbsoluteSize) or v50.ParentAbsoluteSize ~= l_props_8.ParentAbsoluteSize then
        v49.logImpression();
    end;
end;
v26.render = function(v53)
    local l_props_9 = v53.props;
    local l_state_0 = v53.state;
    local l_Asset_0 = l_props_9.AssetInfo.Asset;
    local l_ExpandedHeight_0 = l_props_9.ExpandedHeight;
    local l_itemRow_0 = l_props_9.Stylizer.itemRow;
    local l_LayoutOrder_0 = l_props_9.LayoutOrder;
    local v60 = not l_Asset_0 and "" or l_Asset_0.Name;
    local l_IsExpanded_0 = l_props_9.IsExpanded;
    local l_isHovered_0 = l_state_0.isHovered;
    local v63 = v9.new();
    local v64 = if not not l_LayoutOrder_0 and l_LayoutOrder_0 % 2 == 0 then l_itemRow_0.backgroundColorEven else l_itemRow_0.backgroundColorOdd;
    local v65 = v5.join({
        AutomaticSize = l_props_9.AutomaticSize, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = if not v25() then nil else l_props_9.Position, 
        Size = UDim2.new(1, 0, 0, if not l_IsExpanded_0 then v8.AUDIO_ROW.ROW_HEIGHT else l_ExpandedHeight_0)
    }, l_props_9.WrapperProps);
    local v66 = if not v24() then v8.AUDIO_ROW.LEFT_RIGHT_PADDING else v8.ITEM_ROW.LEFT_RIGHT_PADDING;
    local v67 = if not v24() then v8.AUDIO_ROW.TOP_BUTTON_PADDING else v8.ITEM_ROW.TOP_BUTTON_PADDING;
    local v68 = if not v24() then v8.AUDIO_ROW.BORDER_SIZE else v8.ITEM_ROW.BORDER_SIZE;
    return v2.createElement(l_Pane_0, v65, {
        Button = v2.createElement(v13, {
            BackgroundColor3 = v64, 
            Size = UDim2.new(1, -v68 * 2, 1, -v68 * 2), 
            Position = UDim2.new(0, v68, 0, v68), 
            ZIndex = 1, 
            [v2.Event.MouseEnter] = v53.onMouseEnter, 
            [v2.Event.MouseLeave] = v53.onMouseLeave, 
            [v2.Event.MouseButton1Click] = v53.toggleIsExpanded, 
            [v2.Event.MouseButton2Click] = v53.tryCreateLocalizedContextMenu, 
            onDragStart = v53.onDragStart
        }, {
            UIStroke = if l_IsExpanded_0 or l_isHovered_0 then v2.createElement("UIStroke", {
                Thickness = v68, 
                Color = l_itemRow_0.borderColor
            }) else nil, 
            UIPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v66 - v68), 
                PaddingLeft = UDim.new(0, v66 - v68), 
                PaddingTop = UDim.new(0, v67 - v68), 
                PaddingBottom = UDim.new(0, v67 - v68)
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Details = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v63:getNextOrder(), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v8.AUDIO_ROW.ICON_SIZE)
            }, v5.join({
                Icon = if not l_props_9.RenderIcon then nil else l_props_9.RenderIcon(l_isHovered_0), 
                Name = v2.createElement(l_Pane_0, {
                    Size = l_props_9.TitleSize, 
                    LayoutOrder = v63:getNextOrder()
                }, {
                    LinkText = v2.createElement(l_LinkText_0, {
                        OnClick = v53.onNameClicked, 
                        HoverAreaSize = if not l_props_9.ForceLinkTextFullWidth then nil else UDim2.new(1, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Style = "ToolboxItemRowTitle", 
                        Text = v60, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            }, v53.renderColumns(v63))), 
            ExpandedContents = if not not l_IsExpanded_0 and l_props_9.RenderExpandedContent then v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v63:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Content = l_props_9.RenderExpandedContent()
            }) else nil
        })
    });
end;
v26 = l_withAbsoluteSizeAndPosition_0((v3.connect(nil, function(v69)
    return {
        getCanManageAsset = function(v70, v71)
            v69(v16(v70, v71));
        end, 
        tryCreateContextMenu = function(v72, v73, v74, v75, v76)
            v69(v14(v72, v73, v74, v75, v76));
        end, 
        getPageInfoAnalyticsContextInfo = function()
            return v69(v15());
        end
    };
end)((l_withContext_0({
    AssetAnalytics = v17, 
    Localization = l_ContextServices_0.Localization, 
    Network = v19, 
    Plugin = l_ContextServices_0.Plugin, 
    Settings = v18, 
    Stylizer = l_ContextServices_0.Stylizer
})(v26)))));
TypedItemRow = function(v77, v78)
    return v2.createElement(v26, v77, v78);
end;
return {
    Component = v26, 
    Generator = TypedItemRow
};
