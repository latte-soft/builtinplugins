local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Packages.Dash);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ScrollingFrame_0 = v4.UI.ScrollingFrame;
local v12 = require(l_Parent_0.Src.Actions);
local v13 = require(script.Parent.TagListRow);
local v14 = require(script.Parent.TagListUnknownRow);
local v15 = v2.PureComponent:extend("TagListView");
v15.init = function(v16)
    v16.toggleGroup = function(v17)
        local v18 = "Hide" .. v17;
        v16.setCollapseState(v18, not v16.props.uiGroupCollapseState[v18]);
    end;
    v16.toggleUnknownGroup = function()
        v16.setCollapseState("UnknownTagsHide", not v16.props.uiGroupCollapseState.UnknownTagsHide);
    end;
    v16.setCollapseState = function(v19, v20)
        local l_props_0 = v16.props;
        l_props_0.setUIGroupCollapseState(v5.join(l_props_0.uiGroupCollapseState, {
            [v19] = v20
        }));
    end;
end;
v15.render = function(v22)
    local l_props_1 = v22.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_TagListView_0 = l_props_1.Stylizer.TagListView;
    local l_tags_0 = l_props_1.tags;
    local l_unknownTags_0 = l_props_1.unknownTags;
    local v28 = {};
    local v29 = "";
    local v30 = 0;
    local v31 = 0;
    while v30 < #l_tags_0 do
        v30 = v30 + 1;
        local v32 = l_tags_0[v30];
        local v33 = v32.Group or "";
        local v34 = v32.Name or "";
        if v33 ~= v29 then
            v31 = v31 + 1;
            v29 = v33;
            v28[v31] = v2.createElement(v13, {
                LayoutOrder = v31, 
                GroupName = v33, 
                IsGroupCollapsed = l_props_1.uiGroupCollapseState["Hide" .. v33], 
                IsVisibleToggled = true, 
                ToggleGroup = v22.toggleGroup
            });
        end;
        if not l_props_1.uiGroupCollapseState["Hide" .. v33] then
            v31 = v31 + 1;
            v28[v31] = v2.createElement(v13, {
                LayoutOrder = v31, 
                TagName = v34, 
                TagGroup = v33, 
                TagIcon = v32.Icon, 
                IsTagAssignedToSome = v32.HasSome, 
                IsTagAssignedToAll = v32.HasAll, 
                IsVisibleToggled = v32.Visible
            });
        end;
    end;
    v30 = 0;
    if #l_unknownTags_0 > 0 then
        v31 = v31 + 1;
        v28[v31] = v2.createElement(v13, {
            LayoutOrder = v31, 
            GroupName = l_Localization_1:getText("Groups", "UnknownTags"), 
            Disabled = true, 
            IsGroupCollapsed = l_props_1.uiGroupCollapseState.UnknownTagsHide, 
            ToggleGroup = v22.toggleUnknownGroup
        });
    end;
    while v30 < #l_unknownTags_0 do
        v30 = v30 + 1;
        local v35 = l_unknownTags_0[v30];
        if not l_props_1.uiGroupCollapseState.UnknownTagsHide then
            v31 = v31 + 1;
            v28[v31] = v2.createElement(v14, {
                LayoutOrder = v31, 
                TagName = v35
            });
        end;
    end;
    return v2.createElement(l_ScrollingFrame_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Size = l_TagListView_0.Size, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = l_TagListView_0.Spacing
    }, v28);
end;
return v3.connect(function(v36, _)
    local v38 = {};
    for _, v40 in pairs(v36.TagData) do
        if not v36.Search or v40.Name:lower():find(v36.Search:lower(), 1, true) then
            v38[#v38 + 1] = v40;
        end;
    end;
    local v41 = {};
    for _, v43 in pairs(v36.UnknownTags) do
        if not v36.Search or v43:lower():find(v36.Search:lower(), 1, true) then
            v41[#v41 + 1] = v43;
        end;
    end;
    return {
        tags = v38, 
        searchTerm = v36.Search, 
        uiGroupCollapseState = v36.UIGroupCollapseState, 
        unknownTags = v41
    };
end, function(v44)
    return {
        setUIGroupCollapseState = function(v45)
            v44(v12.SetUIGroupCollapseState(v45));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v15)));
