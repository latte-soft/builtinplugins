local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Dash);
local l_Pane_0 = v2.UI.Pane;
local _ = v2.Wrappers.withAbsoluteSize;
local l_withAbsoluteSizeAndPosition_0 = v2.Wrappers.withAbsoluteSizeAndPosition;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v13 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v14 = require(l_Util_0.Constants);
local v15 = require(l_Util_0.LayoutOrderIterator);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v17 = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v18 = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v19 = require(l_script_FirstAncestor_0.Core.Components.LoadScroller);
local v20 = require(l_script_FirstAncestor_0.Core.Components.InfoBanner);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v22 = require(l_script_FirstAncestor_0.Core.Components.Font.FontTile);
local v23 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local l_FONT_TILE_HEIGHT_0 = v14.FONT_TILE_HEIGHT;
local v25 = v3.PureComponent:extend("FontView");
v25.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v25.init = function(v26)
    v26.hasExceededContentMaxWidth = function()
        local l_AbsoluteSize_0 = v26.props.AbsoluteSize;
        return l_AbsoluteSize_0 and l_AbsoluteSize_0.X > 640;
    end;
    v26.logImpression = function(v28, v29, v30, v31)
        local l_props_0 = v26.props;
        if not l_props_0.LogAssetImpression then
            return nil;
        else
            return l_props_0.LogAssetImpression(v28, v31, v29, v30, l_props_0.AbsoluteSize, l_props_0.AbsolutePosition);
        end;
    end;
    v26.renderFontTile = function(v33, v34, v35)
        local l_props_1 = v26.props;
        local l_OnAssetPreviewButtonClicked_0 = l_props_1.OnAssetPreviewButtonClicked;
        return v3.createElement(v22, {
            AssetInfo = v34, 
            LayoutOrder = v33, 
            LogImpression = function(v38, v39, v40, v41)
                return v26.logImpression(v38, v39, v40, v41);
            end, 
            OnAssetPreviewButtonClicked = function()
                l_OnAssetPreviewButtonClicked_0(v34);
            end, 
            ParentAbsoluteSize = l_props_1.AbsoluteSize, 
            Size = UDim2.new(not v35 and 1 or 0.5, 0, 0, l_FONT_TILE_HEIGHT_0)
        });
    end;
    v26.renderResponsiveContent = function(v42)
        local v43 = v26.hasExceededContentMaxWidth();
        local v44 = v15.new();
        local v45 = nil;
        if v43 and #v42 > 1 then
            local v46 = {};
            v45 = {};
            for _, v48 in pairs(v42) do
                table.insert(v46, (v26.renderFontTile(#v46, v48, true)));
                if #v46 == 2 then
                    local v49 = v44:getNextOrder();
                    v45[v49] = v3.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Layout = Enum.FillDirection.Horizontal, 
                        LayoutOrder = v49, 
                        Size = UDim2.new(1, 0, 0, 10), 
                        Spacing = 10
                    }, v46);
                    v46 = {};
                end;
            end;
            if #v46 > 0 then
                local v50 = v44:getNextOrder();
                v45[v50] = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v50, 
                    Size = UDim2.new(1, 0, 0, 10), 
                    Spacing = 10
                }, v46);
            end;
        else
            v45 = v5.map(v42, function(v51)
                return v26.renderFontTile(v44:getNextOrder(), v51, false);
            end);
        end;
        return v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Size = UDim2.new(1, 1, 0, 10), 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v45);
    end;
    v26.renderList = function(v52)
        local v53 = v26.hasExceededContentMaxWidth();
        local v54 = #v52.assets;
        if not v52.loading and (not (type(v54) == "number") or v54 <= 0) then
            return v3.createElement(v20, {
                Position = v26.props.NoResultsPosition, 
                Text = v26.props.Localization:getText("General", "InfoBannerText"), 
                ZIndex = 2
            });
        else
            return v3.createElement(v19, {
                CalculateCanvasHeight = function()
                    local v55 = #v52.assets;
                    return ((l_FONT_TILE_HEIGHT_0 + 10) * if not v53 then v55 else math.ceil(v55 / 2) + (not v52.loading and 0 or 60)) + 20;
                end, 
                FetchNextPage = function()
                    if not v52 or not v52.fetchNextPage then
                        return ;
                    else
                        return v52.fetchNextPage();
                    end;
                end, 
                Items = v52.assets, 
                Loading = v52.loading, 
                PageSize = 30, 
                RenderContent = v26.renderResponsiveContent, 
                RenderTopContent = nil, 
                Total = v52.total
            });
        end;
    end;
end;
v25.render = function(v56)
    local l_props_2 = v56.props;
    return v3.createElement(l_Pane_0, v5.join({
        BackgroundColor = l_props_2.Stylizer.backgroundColor, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Position = l_props_2.Position, 
        Size = l_props_2.Size, 
        Style = "Box"
    }, l_props_2.WrapperProps), {
        Results = v18.Generator({
            categoryName = l_props_2.CategoryName, 
            networkInterface = l_props_2.Network.networkInterface, 
            initialPageSize = 30, 
            includeUnverifiedCreators = l_props_2.IncludeUnverifiedCreators, 
            queryParams = {}, 
            render = v56.renderList, 
            searchTerm = l_props_2.searchTerm, 
            sectionName = nil
        })
    });
end;
return l_withAbsoluteSizeAndPosition_0(v17((l_withContext_0({
    AssetAnalytics = v13, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v11
})((v4.connect(function(v58, _)
    return {
        searchTerm = ((v58 or {}).pageInfo or {}).searchTerm
    };
end, function(v60)
    return {
        getPageInfoAnalyticsContextInfo = function()
            return v60(v23());
        end
    };
end)(v25))))));
