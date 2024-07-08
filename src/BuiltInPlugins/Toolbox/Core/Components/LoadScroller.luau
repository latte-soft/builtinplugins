local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v6 = require(l_script_FirstAncestor_0.Core.Components.StyledScrollingFrame);
local v7 = require(l_script_FirstAncestor_0.Core.Components.NoSceneSuggestions);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local l_Pane_0 = v3.UI.Pane;
local v12 = v2.PureComponent:extend("LoadScroller");
v12.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v12.init = function(v13, v14)
    v13.state = {
        initialLoading = v14.Loading
    };
    v13.scrollingFrameRef = v2.createRef();
    v13.calculateRenderBounds = function(_)
        v13:setState(function(_)
        end);
    end;
    v13.checkForNextPage = function()
        local l_props_0 = v13.props;
        local l_current_0 = v13.scrollingFrameRef.current;
        if (not l_current_0 or l_props_0.Loading) or l_props_0.Total and l_props_0.Total == #l_props_0.Items then
            return ;
        else
            if not (not (l_current_0.CanvasSize.Y.Offset - (l_current_0.CanvasPosition.Y + l_current_0.AbsoluteWindowSize.Y) < v4.DIST_FROM_BOTTOM_BEFORE_NEXT_PAGE) or not l_props_0.FetchNextPage) then
                l_props_0.FetchNextPage(l_props_0.PageSize);
            end;
            return ;
        end;
    end;
end;
v12.didMount = function(v19)
    v19.checkForNextPage();
end;
v12.didUpdate = function(v20, v21)
    local l_props_1 = v20.props;
    v20.checkForNextPage();
    if not (l_props_1.Loading or not v21.Loading) then
        v20:setState({
            initialLoading = false
        });
    end;
end;
v12.render = function(v23)
    local l_props_2 = v23.props;
    local l_initialLoading_0 = v23.state.initialLoading;
    local l_Items_0 = l_props_2.Items;
    local l_CalculateCanvasHeight_0 = l_props_2.CalculateCanvasHeight;
    local l_Loading_0 = l_props_2.Loading;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Position_0 = l_props_2.Position;
    local l_RenderTopContent_0 = l_props_2.RenderTopContent;
    local l_RenderContent_0 = l_props_2.RenderContent;
    local l_Size_0 = l_props_2.Size;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Navigation_0 = l_props_2.Navigation;
    local v36 = l_CalculateCanvasHeight_0();
    if not l_initialLoading_0 then
        local v37 = nil;
        if l_RenderTopContent_0 then
            v37 = l_RenderTopContent_0();
        end;
        local _ = nil;
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = l_Size_0, 
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            [v2.Change.AbsoluteSize] = v23.checkForNextPage
        }, {
            StyledScrollingFrame = v2.createElement(v6, {
                CanvasSize = UDim2.new(1, 0, 0, v36), 
                Size = UDim2.new(1, 0, 1, 0), 
                onScroll = v23.checkForNextPage, 
                [v2.Ref] = v23.scrollingFrameRef, 
                [v2.Change.AbsoluteSize] = v23.checkForNextPage
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v4.LOAD_SCROLL_PADDING), 
                    PaddingRight = UDim.new(0, v4.LOAD_SCROLL_PADDING + v4.SCROLLBAR_BACKGROUND_THICKNESS), 
                    PaddingTop = UDim.new(0, v4.LOAD_SCROLL_PADDING), 
                    PaddingBottom = UDim.new(0, v4.LOAD_SCROLL_PADDING)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopContent = v37, 
                Content = if not (not (l_Navigation_0:getCurrentPath() == v4.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME) or l_props_2.Loading) and #l_props_2.Items == 0 then v2.createElement(v7, {
                    LayoutOrder = 2
                }) else l_RenderContent_0(l_Items_0), 
                LoadingIndicator = l_Loading_0 and v2.createElement(l_Pane_0, {
                    LayoutOrder = 3, 
                    Size = UDim2.fromScale(1, 1), 
                    Layout = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }, {
                    Wrapper = v2.createElement("Frame", {
                        Size = UDim2.new(0, 60, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        LoadingIndicator = v2.createElement(l_LoadingIndicator_0)
                    })
                })
            })
        });
    else
        return v2.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Navigation = v5
})(v12));
