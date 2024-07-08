local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = v3.Util.StyleModifier;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Components.BaseTrack);
local v8 = require(l_script_FirstAncestor_0.Src.Components.EventMarker);
local v9 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.TrackUtils);
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v17 = v1.PureComponent:extend("EventTrack");
v17.init = function(v18)
    v18.state = {
        showFilterMenu = false
    };
    v18.showFilterMenu = function()
        v18:setState({
            showFilterMenu = true
        });
    end;
    v18.hideFilterMenu = function()
        v18:setState({
            showFilterMenu = false
        });
    end;
end;
v17.renderEvent = function(v19, v20, v21, v22)
    local l_props_0 = v19.props;
    local l_Events_0 = l_props_0.Events;
    local l_EventFilters_0 = l_props_0.EventFilters;
    local v26 = not not l_Events_0.Data[v22] and v2.Dictionary.keys(l_Events_0.Data[v22]) or {};
    if l_EventFilters_0 then
        local v27 = {};
        for _, v29 in v26, nil, nil do
            if l_EventFilters_0[v29] then
                table.insert(v27, v29);
            end;
        end;
        v26 = v27;
    end;
    table.sort(v26);
    if not next(v26) then
        return nil;
    else
        return (v1.createElement(v8, {
            Selected = v20, 
            Names = v26, 
            Position = UDim2.new(0, v21, 0.5, 0), 
            ZIndex = l_props_0.ZIndex, 
            OnRightClick = function(_, _)
                l_props_0.OnEventRightClick(v22, v20);
            end, 
            OnInputBegan = function(_, v33)
                l_props_0.OnEventInputBegan(v22, v20, v33);
            end, 
            OnInputEnded = function(_, v35)
                l_props_0.OnEventInputEnded(v22, v20, v35);
            end
        }));
    end;
end;
v17.renderPreviewEvent = function(v36, v37, _)
    return v1.createElement(v8, {
        Selected = true, 
        Position = UDim2.new(0, v37, 0.5, 0), 
        ZIndex = v36.props.ZIndex + 1
    });
end;
v17.renderEvents = function(v39, v40)
    local l_props_1 = v39.props;
    local l_Width_0 = l_props_1.Width;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_Keyframes_0 = l_props_1.Events.Keyframes;
    local l_SelectedEvents_0 = l_props_1.SelectedEvents;
    local v47, v48 = v12.getKeyframesExtents(l_Keyframes_0, l_StartTick_0, l_EndTick_0);
    if v47 ~= nil and v48 ~= nil then
        for v49 = v47, v48 do
            local v50 = l_Keyframes_0[v49];
            v40[v49] = v39:renderEvent(l_SelectedEvents_0 and l_SelectedEvents_0[v50], v12.getScaledKeyframePosition(v50, l_StartTick_0, l_EndTick_0, l_Width_0), v50);
        end;
    end;
end;
v17.makeFilterActions = function(v51)
    local l_props_2 = v51.props;
    local l_Localization_0 = l_props_2.Localization;
    local v54 = {};
    local l_AvailableEvents_0 = l_props_2.AvailableEvents;
    local l_EventFilters_1 = l_props_2.EventFilters;
    for _, v58 in ipairs(l_AvailableEvents_0) do
        table.insert(v54, {
            Text = v58, 
            Checked = l_EventFilters_1 and l_EventFilters_1[v58], 
            OnItemClicked = function(v59)
                l_props_2.ToggleEventFilter(v59.Text);
            end
        });
    end;
    if #v54 > 0 then
        table.insert(v54, v11.MENU_SEPARATOR);
    end;
    local v60 = {
        Text = l_Localization_0:getText("Menu", "Nothing")
    };
    local v61 = false;
    if #l_AvailableEvents_0 > 0 then
        v61 = not l_EventFilters_1 or #v2.Dictionary.keys(l_EventFilters_1) == 0;
    end;
    v60.Checked = v61;
    v60.OnItemClicked = v51.props.ClearEventFilters;
    table.insert(v54, v60);
    table.insert(v54, {
        Text = l_Localization_0:getText("Menu", "Everything"), 
        Checked = not l_EventFilters_1 or #v2.Dictionary.keys(l_EventFilters_1) == #l_AvailableEvents_0, 
        OnItemClicked = v51.props.SetAllEventFilters
    });
    return v54;
end;
v17.render = function(v62)
    local l_props_3 = v62.props;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_Localization_1 = l_props_3.Localization;
    local l_showFilterMenu_0 = v62.state.showFilterMenu;
    local v67 = l_props_3[v1.Children] or {};
    l_props_3[v1.Children] = nil;
    local l_Events_1 = l_props_3.Events;
    if not (not l_Events_1 or not l_Events_1.Keyframes) and #l_Events_1.Keyframes > 0 then
        v62:renderEvents(v67);
    end;
    return v1.createElement(l_Pane_0, {}, {
        FilterButton = v1.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v11.TOGGLE_EDITOR_BUTTON_WIDTH, v11.TOGGLE_EDITOR_BUTTON_HEIGHT), 
            Position = UDim2.fromOffset(v62.props.TrackPadding / 4, v11.TIMELINE_HEIGHT / 2), 
            Style = l_Stylizer_0.button.EventFilter, 
            OnClick = v62.showFilterMenu
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = l_Stylizer_0.eventTheme.filterButton.size, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = l_Stylizer_0.eventTheme.filterButton.image, 
                ImageColor3 = l_Stylizer_0.playbackTheme.iconColor
            }), 
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("Tooltip", "FilterEvents")
            }), 
            FilterMenu = l_showFilterMenu_0 and v1.createElement(v9, {
                Actions = v62:makeFilterActions(), 
                OnMenuOpened = v62.hideFilterMenu
            })
        }), 
        Markers = v1.createElement(v7, l_props_3, v67)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v17));
