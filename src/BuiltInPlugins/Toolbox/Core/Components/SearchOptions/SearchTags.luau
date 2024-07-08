local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Localization.getLocalizedCategoryMap);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LinkText_0 = v3.UI.LinkText;
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v11 = require(l_Parent_0.Core.Components.SearchOptions.SearchTag);
local l_SEARCH_TAG_HEIGHT_0 = v4.SEARCH_TAG_HEIGHT;
local v13 = UDim.new(0, 3);
local v14 = v2.PureComponent:extend("SearchTags");
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
v14.createTag = function(_, v17, v18)
    return v2.createElement(v11, {
        Name = v17.text, 
        LayoutOrder = v18, 
        onDelete = function()
            if v17.onDelete then
                v17.onDelete(v17);
            end;
        end, 
        prefix = v17.prefix
    });
end;
v14.createTags = function(v19, v20, v21)
    local v22 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v13
        })
    };
    for v23, v24 in ipairs(v20) do
        v22[v24] = v19:createTag(v24, v23);
    end;
    return v2.createElement(l_ScrollingFrame_0, {
        AnchorPoint = Vector2.new(0, 1), 
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        Size = v21, 
        ScrollingEnabled = true, 
        Position = UDim2.new(0, 0, 1, 0), 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ScrollBarThickness = 0
    }, v22);
end;
v14.createPrompt = function(v25, v26, v27)
    local l_props_0 = v25.props;
    local l_textColor_0 = v27.searchTag.textColor;
    local l_FONT_SIZE_SMALL_0 = v4.FONT_SIZE_SMALL;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_SEARCH_TAG_HEIGHT_0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v13
        }), 
        BackToHome = v2.createElement(l_LinkText_0, {
            LayoutOrder = 1, 
            OnClick = l_props_0.onBackToHome, 
            Style = "Unobtrusive", 
            Text = ("< %* /"):format((l_props_0.Localization:getText("General", "BackToHome", {
                assetType = v5(l_props_0.Localization)[l_props_0.categoryName]
            })))
        }), 
        Prompt = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            Font = v4.FONT, 
            Text = if not (v26 ~= "") or v26 == nil then l_props_0.Localization:getText("General", "SearchResults") else l_props_0.Localization:getText("General", "SearchResultsKeyword"), 
            TextSize = l_FONT_SIZE_SMALL_0, 
            TextColor3 = l_textColor_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }), 
        SearchTerm = v2.createElement("TextLabel", {
            LayoutOrder = 3, 
            Font = v4.FONT_BOLD, 
            Text = v26 or "", 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = l_FONT_SIZE_SMALL_0, 
            TextColor3 = l_textColor_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
end;
v14.render = function(v31)
    local l_props_1 = v31.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Tags_0 = l_props_1.Tags;
    local l_searchTerm_0 = l_props_1.searchTerm;
    local l_onClearTags_0 = l_props_1.onClearTags;
    local v37 = l_props_1.Localization:getText("General", "SearchResultsClearAll");
    local l_x_0 = l_GetTextSize_0(v37, nil, nil, Vector2.new(0, 0)).x;
    local v39 = UDim2.new(1, -l_x_0 - v13.Offset, 0, l_SEARCH_TAG_HEIGHT_0);
    local v40 = l_searchTerm_0 or "Prompt";
    local v41 = l_Tags_0 and #l_Tags_0 > 0;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, not v15() and 1 or (not v41 and 0.3333333333333333 or 0.6666666666666666), 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_1.LayoutOrder
    }, {
        [v40] = v31:createPrompt(l_searchTerm_0, l_Stylizer_0), 
        ClearAll = v41 and v2.createElement("TextButton", {
            Font = v4.FONT, 
            Text = v37, 
            TextSize = v4.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.searchTag.clearAllText, 
            Size = UDim2.new(0, l_x_0, 0, l_SEARCH_TAG_HEIGHT_0), 
            Position = UDim2.new(1, 0, 0, not v15() and 29 or 20), 
            AnchorPoint = Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = #l_Tags_0 + 1, 
            [v2.Event.Activated] = l_onClearTags_0
        }), 
        Tags = v41 and v31:createTags(l_Tags_0, v39)
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
