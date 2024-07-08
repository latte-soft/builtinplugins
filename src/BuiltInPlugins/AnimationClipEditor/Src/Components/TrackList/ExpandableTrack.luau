local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.DoubleClickDetector);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Components.ContextButton);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = v1.PureComponent:extend("ExpandableTrack");
v8.init = function(v9)
    local v10 = v2.new();
    v9.onExpandToggled = function()
        if v9.props.OnExpandToggled then
            v9.props.OnExpandToggled(not v9.props.Expanded);
        end;
    end;
    v9.onTrackSelected = function()
        if v10:isDoubleClick() then
            v9.onExpandToggled();
        end;
        if v9.props.OnTrackSelected then
            v9.props.OnTrackSelected();
        end;
    end;
    v9.onContextButtonClick = function()
        if v9.props.OnContextButtonClick then
            v9.props.OnContextButtonClick();
        end;
    end;
end;
v8.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v15 = l_props_0.Indent or 0;
    local l_Name_0 = l_props_0.Name;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_arrow_0 = l_trackTheme_0.arrow;
    local v19 = l_props_0.Expanded or false;
    local v20 = l_props_0.Selected or false;
    return v1.createElement(v5, {
        Selected = v20, 
        Height = v7.TRACK_HEIGHT, 
        Indent = v15, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Arrow = v1.createElement("ImageButton", {
            Size = UDim2.new(0, v7.ARROW_SIZE, 0, v7.ARROW_SIZE), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v7.ARROW_SIZE / 2, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = not not v19 and l_arrow_0.expanded or l_arrow_0.collapsed, 
            ImageColor3 = not not v20 and l_trackTheme_0.selectedTextColor or l_trackTheme_0.textColor, 
            ScaleType = Enum.ScaleType.Fit, 
            [v1.Event.Activated] = v11.onExpandToggled
        }), 
        NameLabel = v1.createElement("TextButton", {
            Size = UDim2.new(1, -v7.TRACKLIST_BUTTON_SIZE - v7.ARROW_SIZE * 2, 1, 0), 
            Position = UDim2.new(0, v7.ARROW_SIZE * 2, 0, 0), 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            Text = l_Name_0, 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = not not v20 and l_trackTheme_0.selectedTextColor or l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v1.Event.Activated] = v11.onTrackSelected
        }), 
        ContextButton = v1.createElement(v6, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v7.TRACKLIST_RIGHT_PADDING, 0.5, 0), 
            TrackSelected = v20, 
            OnActivated = v11.onContextButtonClick
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
