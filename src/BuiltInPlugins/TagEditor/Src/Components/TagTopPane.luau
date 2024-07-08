local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v15 = require(l_Parent_0.Src.Actions);
local v16 = require(l_Parent_0.Src.Util.GetUniqueGroupName);
local v17 = require(l_Parent_0.Src.TagManager);
local v18 = require(script.Parent.NewTagTextInput);
local v19 = require(script.Parent.TagListView);
local v20 = game:DefineFastFlag("TagEditorSearchClear", false);
local v21 = v2.PureComponent:extend("TagTopPane");
v21.init = function(v22)
    v22.onSearchRequested = function(v23)
        v22.props.setSearch(v23);
    end;
    v22.onTextChanged = function(v24)
        if v24 == "" then
            v22.props.setSearch("");
        end;
    end;
    v22.onDeleteClicked = function()
        local l_props_0 = v22.props;
        if not l_props_0.tagMenu then
            if l_props_0.groupMenu then
                v17.Get():DeleteGroup(l_props_0.groupMenu);
                l_props_0.openGroupMenu(nil);
            end;
            return ;
        else
            v17.Get():DelTag(l_props_0.tagMenu);
            l_props_0.openTagMenu(nil);
            return ;
        end;
    end;
    v22.onNewGroupClicked = function(v26)
        local l_props_1 = v22.props;
        if l_props_1.tagMenu ~= nil then
            v17.Get():SetGroup(l_props_1.tagMenu, (v16(v26:getText("Info", "NewGroup"))));
        end;
    end;
    v22.onWorldViewButtonClicked = function()
        local l_props_2 = v22.props;
        l_props_2.setWorldView(not l_props_2.worldView);
        if not l_props_2.worldView then
            l_props_2.Analytics:report("worldVisualization");
        end;
    end;
    v22.state = {
        worldViewButtonWidth = 0
    };
    v22.worldViewButtonRef = v2.createRef();
end;
v21.updateExtents = function(v29, v30)
    task.defer(function()
        local v31 = not not v29.worldViewButtonRef.current and v29.worldViewButtonRef.current.AbsoluteSize.X or 0;
        if not v30 or v30.worldViewButtonWidth ~= v31 then
            v29:setState({
                worldViewButtonWidth = v31
            });
        end;
    end);
end;
v21.didUpdate = function(v32, _, v34)
    v32:updateExtents(v34);
end;
v21.didMount = function(v35)
    v35:updateExtents();
end;
v21.render = function(v36)
    local l_props_3 = v36.props;
    local l_Localization_1 = l_props_3.Localization;
    local l_TagTopPane_0 = l_props_3.Stylizer.TagTopPane;
    local v40 = l_LayoutOrderIterator_0.new();
    local v41 = l_LayoutOrderIterator_0.new();
    local v42 = l_LayoutOrderIterator_0.new();
    local l_VisibleIcon_0 = l_props_3.Stylizer.VisibleIcon;
    local l_VisibleOffIcon_0 = l_props_3.Stylizer.VisibleOffIcon;
    local v45 = l_props_3.groupMenu or not l_props_3.tagMenu;
    local v46 = not l_props_3.tagMenu and not l_props_3.groupMenu;
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = 1, 
        Padding = l_TagTopPane_0.Padding
    }, {
        SearchRowPane = v2.createElement(l_Pane_0, {
            Size = l_TagTopPane_0.SearchBarPaneSize, 
            LayoutOrder = v40:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_TagTopPane_0.RowSpacing
        }, {
            SearchBar = v2.createElement(l_SearchBar_0, {
                Size = l_TagTopPane_0.SearchBarSize, 
                ShowSearchButton = false, 
                ShowSearchIcon = true, 
                LayoutOrder = v41:getNextOrder(), 
                OnSearchRequested = v36.onSearchRequested, 
                OnTextChanged = if not v20 then nil else v36.onTextChanged, 
                Style = "Compact", 
                PlaceholderText = l_Localization_1:getText("General", "Search")
            }), 
            NewGroupButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "RoundBox", 
                LeftIcon = l_TagTopPane_0.NewGroupIcon, 
                OnClick = function()
                    v36.onNewGroupClicked(l_Localization_1);
                end, 
                LayoutOrder = v41:getNextOrder(), 
                Style = v45 and "Disabled", 
                Disabled = v45, 
                TooltipText = if not v45 then l_Localization_1:getText("Tooltip", "NewGroupEnabled") else l_Localization_1:getText("Tooltip", "NewGroupDisabled")
            }), 
            DeleteButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "RoundBox", 
                LeftIcon = l_TagTopPane_0.DeleteIcon, 
                OnClick = v36.onDeleteClicked, 
                LayoutOrder = v41:getNextOrder(), 
                Style = v46 and "Disabled", 
                Disabled = v46, 
                TooltipText = if not v46 then l_Localization_1:getText("Tooltip", "DeleteEnabled") else l_Localization_1:getText("Tooltip", "DeleteDisabled")
            })
        }), 
        NewTagRowPane = v2.createElement(l_Pane_0, {
            Size = l_TagTopPane_0.NewTagRowSize, 
            LayoutOrder = v40:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            NewTagTextInput = v2.createElement(v18, {
                WidthOffset = v36.state.worldViewButtonWidth, 
                LayoutOrder = v42:getNextOrder()
            }), 
            ToggleWorldViewButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "RoundBox", 
                LeftIcon = if not l_props_3.worldView then l_VisibleOffIcon_0 else l_VisibleIcon_0, 
                Padding = 5, 
                Spacing = 4, 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = l_Localization_1:getText("Info", "WorldView"), 
                OnClick = v36.onWorldViewButtonClicked, 
                LayoutOrder = v42:getNextOrder(), 
                Size = l_TagTopPane_0.WorldViewButtonSize, 
                TooltipText = l_Localization_1:getText("Tooltip", "WorldView"), 
                [v2.Ref] = v36.worldViewButtonRef
            })
        }), 
        TagListView = v2.createElement(v19, {
            LayoutOrder = v40:getNextOrder()
        })
    });
end;
return v3.connect(function(v47, _)
    return {
        tagMenu = v47.TagMenu, 
        groupMenu = v47.GroupMenu, 
        worldView = v47.WorldView, 
        groupData = v47.GroupData
    };
end, function(v49)
    return {
        setSearch = function(v50)
            v49(v15.SetSearch(v50));
        end, 
        openTagMenu = function(v51)
            v49(v15.OpenTagMenu(v51));
        end, 
        openGroupMenu = function(v52)
            v49(v15.OpenGroupMenu(v52));
        end, 
        setWorldView = function(v53)
            v49(v15.ToggleWorldView(v53));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v21)));
