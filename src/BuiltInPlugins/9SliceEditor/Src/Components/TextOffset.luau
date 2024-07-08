local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v13 = v1.PureComponent:extend("TextOffset");
local v14 = v4.Left.rawValue();
local v15 = v4.Right.rawValue();
local v16 = v4.Top.rawValue();
local v17 = v4.Bottom.rawValue();
local function v20(v18, v19)
    return {
        v18[v4.Left.rawValue()], 
        v19.X - v18[v4.Right.rawValue()], 
        v18[v4.Top.rawValue()], 
        v19.Y - v18[v4.Bottom.rawValue()]
    };
end;
v13.init = function(v21, _)
    v21.onLeftFocusLost = function(_, v24)
        local l_sliceRect_0 = v21.props.sliceRect;
        local l_setSliceRect_0 = v21.props.setSliceRect;
        local v27 = v20(l_sliceRect_0, v21.props.pixelDimensions)[v14];
        local v28 = tonumber(v24.Text);
        if not v28 then
            v24.Text = ("%d"):format(v27);
            return ;
        else
            local v29 = math.round((math.clamp(v28, 0, l_sliceRect_0[v15])));
            l_setSliceRect_0({
                v29, 
                l_sliceRect_0[v15], 
                l_sliceRect_0[v16], 
                l_sliceRect_0[v17]
            }, true);
            v24.Text = ("%d"):format(v29);
            return ;
        end;
    end;
    v21.onRightFocusLost = function(_, v31)
        local l_sliceRect_1 = v21.props.sliceRect;
        local l_setSliceRect_1 = v21.props.setSliceRect;
        local l_pixelDimensions_0 = v21.props.pixelDimensions;
        local v35 = v20(l_sliceRect_1, l_pixelDimensions_0)[v15];
        local v36 = tonumber(v31.Text);
        if not v36 then
            v31.Text = ("%d"):format(v35);
            return ;
        else
            local v37 = math.round((math.clamp(v36, 0, l_pixelDimensions_0.X - l_sliceRect_1[v14])));
            l_setSliceRect_1({
                l_sliceRect_1[v14], 
                l_pixelDimensions_0.X - v37, 
                l_sliceRect_1[v16], 
                l_sliceRect_1[v17]
            }, true);
            v31.Text = ("%d"):format(v37);
            return ;
        end;
    end;
    v21.onTopFocusLost = function(_, v39)
        local l_sliceRect_2 = v21.props.sliceRect;
        local l_setSliceRect_2 = v21.props.setSliceRect;
        local v42 = v20(l_sliceRect_2, v21.props.pixelDimensions)[v16];
        local v43 = tonumber(v39.Text);
        if not v43 then
            v39.Text = ("%d"):format(v42);
            return ;
        else
            local v44 = math.round((math.clamp(v43, 0, l_sliceRect_2[v17])));
            l_setSliceRect_2({
                l_sliceRect_2[v14], 
                l_sliceRect_2[v15], 
                v44, 
                l_sliceRect_2[v17]
            }, true);
            v39.Text = ("%d"):format(v44);
            return ;
        end;
    end;
    v21.onBottomFocusLost = function(_, v46)
        local l_sliceRect_3 = v21.props.sliceRect;
        local l_setSliceRect_3 = v21.props.setSliceRect;
        local l_pixelDimensions_1 = v21.props.pixelDimensions;
        local v50 = v20(l_sliceRect_3, l_pixelDimensions_1)[v17];
        local v51 = tonumber(v46.Text);
        if not v51 then
            v46.Text = ("%d"):format(v50);
            return ;
        else
            local v52 = math.round((math.clamp(v51, 0, l_pixelDimensions_1.Y - l_sliceRect_3[v16])));
            l_setSliceRect_3({
                l_sliceRect_3[v14], 
                l_sliceRect_3[v15], 
                l_sliceRect_3[v16], 
                l_pixelDimensions_1.Y - v52
            }, true);
            v46.Text = ("%d"):format(v52);
            return ;
        end;
    end;
end;
v13.render = function(v53)
    local l_props_0 = v53.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_pixelDimensions_2 = l_props_0.pixelDimensions;
    local l_sliceRect_4 = l_props_0.sliceRect;
    local l_orientation_0 = l_props_0.orientation;
    local l_TextOffsetItem_0 = l_Stylizer_0.TextOffsetItem;
    local v60 = nil;
    local v61 = v20(l_sliceRect_4, l_pixelDimensions_2)[l_orientation_0];
    if l_orientation_0 == v14 then
        v60 = v53.onLeftFocusLost;
    elseif l_orientation_0 == v15 then
        v60 = v53.onRightFocusLost;
    elseif l_orientation_0 == v16 then
        v60 = v53.onTopFocusLost;
    elseif l_orientation_0 == v17 then
        v60 = v53.onBottomFocusLost;
    end;
    return v1.createElement(l_Pane_0, {
        Size = l_TextOffsetItem_0.PaneSize, 
        LayoutOrder = l_props_0.layoutOrder or 0
    }, {
        Label = v1.createElement(l_TextLabel_0, {
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.new(0, l_TextOffsetItem_0.LabelXWidth, 1, 0), 
            Text = l_props_0.labelText or "", 
            TextSize = v3.TEXTSIZE, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        TextInput = v1.createElement(l_DEPRECATED_TextInput_0, {
            Enabled = true, 
            Size = l_TextOffsetItem_0.TextBoxSize, 
            Position = UDim2.fromOffset(l_TextOffsetItem_0.LabelXWidth + l_TextOffsetItem_0.LabelTextBoxSpacing, 0), 
            Style = l_TextOffsetItem_0.Style, 
            Text = ("%d"):format(v61), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OnFocusLost = v60
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
