local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.Urls);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Core.Localization.getLocalizedCategoryMap);
local v10 = require(l_Parent_0.Core.Components.Categorization.IconTile);
local l_LinkText_0 = v2.UI.LinkText;
local l_ResponsiveGrid_0 = v2.UI.ResponsiveGrid;
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagAddMoreAudioSwimlaneAnalytics);
local l_MAIN_VIEW_PADDING_0 = v5.MAIN_VIEW_PADDING;
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v5.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local v18 = v3.PureComponent:extend("SubcategoriesView");
v18.defaultProps = {
    Size = UDim2.new(1, 0, 0, 0)
};
v18.init = function(v19, _)
    v19.state = {
        maxTileHeight = 0
    };
    v19.onClickBack = function(_)
        local l_OnClickBack_0 = v19.props.OnClickBack;
        if l_OnClickBack_0 then
            l_OnClickBack_0();
        end;
    end;
    v19.onClickSubcategory = function(v23)
        local l_props_0 = v19.props;
        local l_CategoryName_0 = l_props_0.CategoryName;
        local l_OnClickSubcategory_0 = l_props_0.OnClickSubcategory;
        local l_OnClickSeeAllAssets_0 = l_props_0.OnClickSeeAllAssets;
        local l_SortName_0 = l_props_0.SortName;
        local v29 = l_props_0.SubcategoryDict[v23];
        if not (v29.childCount == 0) or not l_OnClickSeeAllAssets_0 then
            if l_OnClickSubcategory_0 then
                l_OnClickSubcategory_0({
                    v23
                }, v29.children, l_CategoryName_0, l_SortName_0, v29.queryParams);
            end;
            return ;
        else
            l_OnClickSeeAllAssets_0(nil, l_CategoryName_0, l_SortName_0, nil, v29.queryParams, if not v15() then nil else v29.name);
            return ;
        end;
    end;
    v19.onTileSizeChanged = function(v30)
        v19:setState(function(v31)
            return {
                maxTileHeight = math.max(v31.maxTileHeight, v30.Y)
            };
        end);
    end;
    v19.getSubcategoryElements = function()
        local l_SubcategoryDict_0 = v19.props.SubcategoryDict;
        local v33 = {};
        for _, v35 in pairs(l_SubcategoryDict_0) do
            local v36 = nil;
            local v37 = nil;
            if v35.thumbnail then
                v36 = Color3.fromHex(v35.thumbnail.backgroundColor);
                v37 = v6.constructAssetThumbnailUrl(v35.thumbnail.assetId, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
            end;
            v33[v35.name] = v3.createElement(v10, {
                BackgroundColor = v36, 
                Image = v37, 
                Key = v35.name, 
                LayoutOrder = v35.index, 
                OnClick = v19.onClickSubcategory, 
                Title = v35.displayName, 
                OnAbsoluteSizeChanged = v19.onTileSizeChanged
            });
        end;
        return v33;
    end;
end;
v18.render = function(v38)
    local l_props_1 = v38.props;
    local l_state_0 = v38.state;
    local l_Localization_0 = l_props_1.Localization;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Position_0 = l_props_1.Position;
    local l_Size_0 = l_props_1.Size;
    return v3.createElement("Frame", {
        BackgroundColor3 = l_props_1.Stylizer.backgroundColor, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, {
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            AutoSizeCanvas = true, 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            Layout = Enum.FillDirection.Vertical, 
            EnableScrollBarBackground = true, 
            Padding = v5.MAIN_VIEW_PADDING, 
            Size = l_Size_0, 
            Spacing = UDim.new(0, l_MAIN_VIEW_PADDING_0)
        }, {
            BackButton = v3.createElement(l_LinkText_0, {
                LayoutOrder = 1, 
                OnClick = v38.onClickBack, 
                Style = "Unobtrusive", 
                Text = "< " .. l_Localization_0:getText("General", "BackToHome", {
                    assetType = v9(l_Localization_0)[l_props_1.CategoryName]
                })
            }), 
            InnerGrid = v3.createElement(l_ResponsiveGrid_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                CutOffs = {
                    {
                        ColumnCount = 1, 
                        MinWidth = 0
                    }, 
                    {
                        ColumnCount = 2, 
                        MinWidth = 376
                    }, 
                    {
                        ColumnCount = 3, 
                        MinWidth = 736
                    }
                }, 
                ItemHeight = UDim.new(0, l_state_0.maxTileHeight), 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0)
            }, (v38.getSubcategoryElements()))
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v18));
