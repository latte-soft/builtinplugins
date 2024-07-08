local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.LayoutOrderIterator);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Components.TrackList.NumberBox);
local v9 = v1.PureComponent:extend("NumberTrack");
v9.init = function(v10, _)
    v10.state = {
        values = nil, 
        renderFromNumberEntry = false
    };
    v10.getTextWidth = function(v12, v13)
        return v2.getTextWidth(v12, v13.trackTheme.textSize, v13.font);
    end;
    v10.onSetNumber = function(v14, v15)
        local l_props_0 = v10.props;
        local l_state_0 = v10.state;
        local l_Items_0 = l_props_0.Items;
        local l_Values_0 = l_state_0.Values;
        local v20 = {};
        for v21, v22 in ipairs(l_Items_0) do
            if not l_Values_0 or not l_Values_0[v21] then
                v20[v21] = v22.Value;
            else
                v20[v21] = l_Values_0[v21];
            end;
        end;
        v20[v14] = v15;
        v10:setState({
            renderFromNumberEntry = 2, 
            values = v20
        });
    end;
    v10.onItemChanged = function(v23, v24)
        if not v10.props.OnItemChanged then
            return ;
        else
            return v10.props.OnItemChanged(v23, v24);
        end;
    end;
end;
v9.getDerivedStateFromProps = function(_, v26)
    local l_renderFromNumberEntry_0 = v26.renderFromNumberEntry;
    if l_renderFromNumberEntry_0 and l_renderFromNumberEntry_0 > 0 then
        return {
            renderFromNumberEntry = l_renderFromNumberEntry_0 - 1
        };
    else
        return {
            values = v1.None
        };
    end;
end;
v9.render = function(v28)
    local l_props_1 = v28.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_1 = v28.state;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local v33 = l_props_1.Indent or 0;
    local l_Name_0 = l_props_1.Name;
    local l_Items_1 = l_props_1.Items;
    local l_ReadOnly_0 = l_props_1.ReadOnly;
    local l_values_0 = l_state_1.values;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local v39 = l_props_1.NameWidth or v28.getTextWidth(l_Name_0, l_Stylizer_0);
    local v40 = v3.new();
    local v41 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v7.NUMBERTRACK_PADDING)
        }), 
        ArrowPadding = v1.createElement("Frame", {
            Size = UDim2.new(0, v7.ARROW_SIZE * 2 - v7.NUMBERTRACK_PADDING, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v40:getNextOrder()
        }), 
        NameLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(0, v39, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v40:getNextOrder(), 
            Text = l_Name_0, 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
    for v42, v43 in ipairs(l_Items_1) do
        v41[v43.Key .. "_Entry"] = v1.createElement(v8, {
            Size = UDim2.new(0, v7.NUMBERBOX_WIDTH, 1, -4), 
            LayoutOrder = v40:getNextOrder(), 
            Number = not not l_values_0 and l_values_0[v42] or v43.Value, 
            Name = v43.Name, 
            ReadOnly = l_ReadOnly_0, 
            SetNumber = function(v44)
                l_props_1.OnChangeBegan();
                v28.onSetNumber(v42, v44);
                return v28.onItemChanged(v43.Key, v44);
            end, 
            OnDragMoved = function(v45)
                v28.onItemChanged(v43.Key, v43.Value + v45.Delta.X * 0.05);
            end, 
            OnDragBegan = l_props_1.OnChangeBegan
        });
    end;
    return v1.createElement(v6, {
        Height = v7.TRACK_HEIGHT, 
        Indent = v33, 
        LayoutOrder = l_LayoutOrder_0
    }, v41);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
