local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local v12 = require(script.Parent.ContextMenu);
local v13 = require(script.Parent.TextureTable);
local v14 = require(script.Parent.TopPanel);
local l_Util_0 = l_Parent_0.Src.Util;
local v16 = require(l_Util_0.Stats);
local v17 = require(l_Util_0.WorkspaceOperations);
local v18 = v2.PureComponent:extend("App");
v18.refreshData = function(v19)
    v19:setState({
        rows = v17.fetchAllTexturesFromWorkspace()
    });
end;
v18.error = function(v20)
    v20:refreshData();
end;
v18.zoomTo = function(v21, v22, v23)
    if #v22 > 0 then
        if not v17.zoomToExtentsAndSelectInstance(game.Workspace.CurrentCamera, v22[v23]) then
            v21:error();
        else
            l_Selection_0:Set({
                v22[v23]
            });
            v21:setState({
                tick = tick()
            });
            return ;
        end;
    end;
end;
v18.filterRowsBySearchTerm = function(v24)
    local v25 = v24.state.searchTerm:lower();
    local v26 = {};
    for _, v28 in ipairs(v24.state.rows) do
        if v28.Texture:lower():find(v25) then
            table.insert(v26, v28);
        end;
    end;
    return v26;
end;
v18.init = function(v29)
    v29.state = {
        rows = v17.fetchAllTexturesFromWorkspace(), 
        searchTerm = ""
    };
    v29.showRightClickMenu = function(v30, v31)
        v12.showRightClickMenu(v29, v29.props.Plugin:get(), v29.props.Localization, v30, v31);
    end;
end;
v18.render = function(v32)
    local l_props_0 = v32.props;
    local l_App_0 = l_props_0.Stylizer.App;
    local l_Localization_1 = l_props_0.Localization;
    local v36 = v32:filterRowsBySearchTerm();
    local v37, v38 = v16.calculateAggregateStats(v36);
    return v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_App_0.Padding, 
        Spacing = l_App_0.Spacing
    }, {
        TopPanel = v14(v32, v37, v38), 
        SearchBar = v2.createElement(l_SearchBar_0, {
            PlaceholderText = l_Localization_1:getText("Search", "Placeholder"), 
            IncrementalTextSearch = true, 
            IncrementalTextSearchDelay = 0, 
            OnSearchRequested = function(v39)
                v32:setState({
                    searchTerm = v39
                });
            end, 
            Size = l_App_0.SearchBar.Size, 
            LayoutOrder = 2
        }), 
        Table = v13(v32, v36)
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_Stylizer_0
})(v18));
