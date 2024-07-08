local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.DoubleClickDetector);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v6 = require(l_script_FirstAncestor_0.Src.Components.TrackList.NumberBox);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextButton);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = v1.PureComponent:extend("Track");
v9.init = function(v10)
    local v11 = v2.new();
    v10.onExpandToggled = function()
        if v10.props.OnExpandToggled then
            v10.props.OnExpandToggled(not v10.props.Expanded);
        end;
    end;
    v10.onTrackSelected = function()
        if v11:isDoubleClick() then
            v10.onExpandToggled();
        end;
        if v10.props.OnTrackSelected then
            v10.props.OnTrackSelected();
        end;
    end;
    v10.onContextButtonClick = function()
        if not (v10.props.ReadOnly or not v10.props.OnContextButtonClick) then
            v10.props.OnContextButtonClick();
        end;
    end;
    v10.onItemChanged = function(v12, v13)
        if not v10.props.OnItemChanged then
            return ;
        else
            return v10.props.OnItemChanged(v12, v13);
        end;
    end;
end;
v9.render = function(v14)
    local l_props_0 = v14.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v18 = l_props_0.Indent or 0;
    local l_Name_0 = l_props_0.Name;
    local v20 = l_props_0.Items or {};
    local v21 = l_props_0.DragMultiplier or v8.NUMBERBOX_DRAG_MULTIPLIER;
    local l_ReadOnly_0 = l_props_0.ReadOnly;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_arrow_0 = l_trackTheme_0.arrow;
    local v25 = l_props_0.Expanded or false;
    local v26 = l_props_0.Selected or false;
    local v27 = {
        Arrow = not not (v14.props.OnExpandToggled ~= nil) and v1.createElement("ImageButton", {
            Size = UDim2.new(0, v8.ARROW_SIZE, 0, v8.ARROW_SIZE), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v8.ARROW_SIZE / 2, 0.5, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Image = not not v25 and l_arrow_0.expanded or l_arrow_0.collapsed, 
            ImageColor3 = not not v26 and l_trackTheme_0.selectedTextColor or l_trackTheme_0.textColor, 
            ScaleType = Enum.ScaleType.Fit, 
            [v1.Event.Activated] = v14.onExpandToggled
        }) or nil, 
        NameLabel = v1.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, v8.ARROW_SIZE * 2, 0, 0), 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            Text = l_Name_0, 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = not not v26 and l_trackTheme_0.selectedTextColor or l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v1.Event.Activated] = v14.onTrackSelected
        }), 
        ContextButton = not not (v14.props.OnContextButtonClick ~= nil) and v1.createElement(v7, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v8.TRACKLIST_RIGHT_PADDING, 0.5, 0), 
            ZIndex = 2, 
            TrackSelected = v26, 
            OnActivated = v14.onContextButtonClick
        }) or nil
    };
    for v28, v29 in ipairs(v20) do
        v27[v29.Key .. "_Entry"] = v1.createElement(v6, {
            Size = UDim2.new(0, v8.NUMBERBOX_WIDTH, 1, -v8.NUMBERBOX_PADDING), 
            Position = UDim2.new(1, (((v28 - #v20) - 1) * (v8.NUMBERBOX_WIDTH + v8.NUMBERBOX_PADDING) - v8.TRACKLIST_BUTTON_SIZE) - v8.TRACKLIST_RIGHT_PADDING, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Number = v29.Value, 
            Name = v29.Name, 
            Color = l_Stylizer_0.curveTheme[not not v8.TRACK_THEME_MAPPING[v29.Type] and v8.TRACK_THEME_MAPPING[v29.Type][v29.Name] or "Default"], 
            Precision = if v29.Type == v8.TRACK_TYPES.Facs then v8.NUMBER_FACS_PRECISION else v8.NUMBER_PRECISION, 
            ReadOnly = l_ReadOnly_0, 
            SetNumber = function(v30)
                l_props_0.OnChangeBegan();
                return v14.onItemChanged(v29.Key, v30);
            end, 
            OnDragMoved = function(v31)
                v14.onItemChanged(v29.Key, v29.Value + v31.Delta.X * v21);
            end, 
            OnDragBegan = l_props_0.OnChangeBegan
        });
    end;
    return v1.createElement(v5, {
        Selected = v26, 
        Height = v8.TRACK_HEIGHT, 
        Indent = v18, 
        LayoutOrder = l_LayoutOrder_0
    }, v27);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
