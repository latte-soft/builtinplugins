local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_IconButton_0 = l_UI_0.IconButton;
local l_SearchBar_0 = l_UI_0.SearchBar;
local v14 = v2.PureComponent:extend("Topbar");
v14.render = function(v15)
    local l_props_0 = v15.props;
    return v2.createElement(l_Pane_0, {
        Style = "None", 
        Size = UDim2.new(1, 0, 0, 32), 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = 5
    }, {
        SearchBar = v2.createElement(l_SearchBar_0, {
            LayoutOrder = 1, 
            Width = 300, 
            IncrementalTextSearch = true, 
            IncrementalTextSearchDelay = 150, 
            ShowSearchButton = false, 
            ShowSearchIcon = true, 
            PlaceholderText = l_props_0.Localization:getText("Topbar", "SearchbarPlaceholder"), 
            OnSearchRequested = l_props_0.OnSearch
        }), 
        ClearList = v2.createElement(l_IconButton_0, {
            LayoutOrder = 2, 
            Size = UDim2.fromScale(0, 1), 
            AutomaticSize = Enum.AutomaticSize.X, 
            LeftIcon = "rbxasset://textures/RoduxDevtools/ClearList.png", 
            Text = l_props_0.Localization:getText("Topbar", "ClearList.Text"), 
            TooltipText = l_props_0.Localization:getText("Topbar", "ClearList.Tooltip"), 
            Disabled = l_props_0.EventCount == 0, 
            OnClick = function()
                if l_props_0.OnClearList then
                    l_props_0.OnClearList();
                    return ;
                else
                    return ;
                end;
            end
        })
    });
end;
return v3.connect(function(v17, _)
    return {
        SearchTerm = v17.searchTerm, 
        EventCount = #v17.events
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14)));
