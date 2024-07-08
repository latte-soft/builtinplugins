local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Util.Images);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v2.PureComponent:extend("SearchBar");
v8.init = function(v9)
    v9.state = {
        isSearchButtonHovered = false, 
        isClearButtonHovered = false
    };
    v9.onClearButtonHovered = function()
        v9:setState({
            isClearButtonHovered = true
        });
    end;
    v9.onClearButtonHoverEnded = function()
        v9:setState({
            isClearButtonHovered = false
        });
    end;
    v9.onClearButtonClicked = function()
        v9.props.onClearButtonClicked();
        v9.onClearButtonHoverEnded();
    end;
    v9.onSearchButtonHovered = function()
        v9:setState({
            isSearchButtonHovered = true
        });
    end;
    v9.onSearchButtonHoverEnded = function()
        v9:setState({
            isSearchButtonHovered = false
        });
    end;
end;
v8.render = function(v10)
    local l_props_0 = v10.props;
    local l_state_0 = v10.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_isSearchButtonHovered_0 = l_state_0.isSearchButtonHovered;
    local l_isClearButtonHovered_0 = l_state_0.isClearButtonHovered;
    local l_showClearButton_0 = l_props_0.showClearButton;
    local l_showSearchButton_0 = l_props_0.showSearchButton;
    local l_onSearchButtonClicked_0 = l_props_0.onSearchButtonClicked;
    local l_SEARCH_BAR_BUTTON_WIDTH_0 = v4.SEARCH_BAR_BUTTON_WIDTH;
    local v20 = not not l_showSearchButton_0 and 2 * l_SEARCH_BAR_BUTTON_WIDTH_0 + 1 or l_SEARCH_BAR_BUTTON_WIDTH_0;
    local l_SEARCH_BAR_BUTTON_INSET_0 = v4.SEARCH_BAR_BUTTON_INSET;
    local l_searchBar_0 = l_Stylizer_0.searchBar;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(1, 0, 0, 0), 
        Size = UDim2.new(0, v20, 1, 0), 
        BackgroundTransparency = 1
    }, {
        ClearButton = l_showClearButton_0 and v2.createElement("ImageButton", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.new(0, l_SEARCH_BAR_BUTTON_INSET_0, 0, l_SEARCH_BAR_BUTTON_INSET_0), 
            Size = UDim2.new(0, l_SEARCH_BAR_BUTTON_WIDTH_0 - 2 * l_SEARCH_BAR_BUTTON_INSET_0, 1, -(2 * l_SEARCH_BAR_BUTTON_INSET_0)), 
            BackgroundTransparency = 1, 
            [v2.Event.MouseEnter] = v10.onClearButtonHovered, 
            [v2.Event.MouseMoved] = v10.onClearButtonHovered, 
            [v2.Event.MouseLeave] = v10.onClearButtonHoverEnded, 
            [v2.Event.MouseButton1Down] = v10.onClearButtonClicked
        }, {
            ImageLabel = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, v4.SEARCH_BAR_BUTTON_ICON_SIZE, 0, v4.SEARCH_BAR_BUTTON_ICON_SIZE), 
                BackgroundTransparency = 1, 
                Image = not not l_isClearButtonHovered_0 and v5.CLEAR_ICON_HOVER or v5.CLEAR_ICON, 
                ImageColor3 = l_searchBar_0.clearButton.imageColor
            })
        }), 
        Line = l_showSearchButton_0 and v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.new(0, l_SEARCH_BAR_BUTTON_WIDTH_0, 0, 1), 
            Size = UDim2.new(0, 1, 1, -2), 
            BackgroundColor3 = l_searchBar_0.divideLineColor, 
            BorderSizePixel = 0
        }), 
        SearchButton = l_showSearchButton_0 and v2.createElement("ImageButton", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -l_SEARCH_BAR_BUTTON_INSET_0, 0, l_SEARCH_BAR_BUTTON_INSET_0), 
            Size = UDim2.new(0, l_SEARCH_BAR_BUTTON_WIDTH_0 - 2 * l_SEARCH_BAR_BUTTON_INSET_0, 1, -(2 * l_SEARCH_BAR_BUTTON_INSET_0)), 
            BackgroundTransparency = 1, 
            [v2.Event.MouseEnter] = v10.onSearchButtonHovered, 
            [v2.Event.MouseMoved] = v10.onSearchButtonHovered, 
            [v2.Event.MouseLeave] = v10.onSearchButtonHoverEnded, 
            [v2.Event.MouseButton1Down] = l_onSearchButtonClicked_0
        }, {
            ImageLabel = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, v4.SEARCH_BAR_BUTTON_ICON_SIZE, 0, v4.SEARCH_BAR_BUTTON_ICON_SIZE), 
                BackgroundTransparency = 1, 
                Image = v5.SEARCH_ICON, 
                ImageColor3 = not not l_isSearchButtonHovered_0 and l_searchBar_0.searchButton.imageSelectedColor or l_searchBar_0.searchButton.imageColor
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
