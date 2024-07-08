local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_withControl_0 = v3.Wrappers.withControl;
local l_Dash_0 = v3.Dash;
local l_join_0 = l_Dash_0.join;
local l_assign_0 = l_Dash_0.assign;
local l_UI_0 = v3.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v17 = require(l_script_FirstAncestor_0.Src.Util.getSafeName);
local v18 = require(script.Timestamp);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v20 = v2.PureComponent:extend("LayerTreeRow");
v20.init = function(v21)
    v21.onToggle = function()
        if v21.props.OnToggle then
            v21.props.OnToggle(v21.props);
        end;
    end;
    v21.onToggleAdornment = function()
        if v21.props.OnToggleAdornment then
            v21.props.OnToggleAdornment(v21.props.Item);
        end;
    end;
    v21.toggleRef = v2.createRef();
    v21.tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear);
end;
v20.getContents = function(v22, v23, v24)
    local l_props_0 = v22.props;
    return v24[v23.className] or v24.Default, v17(v23), if not v23.weight then nil else string.format("%d%%", (math.floor(v23.weight * 100 + 0.5))), not not l_props_0.Adornments and l_props_0.Adornments[l_props_0.GetItemId(v23)] or {};
end;
v20.render = function(v26)
    local l_props_1 = v26.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Index_0 = l_props_1.Index;
    local l_Item_0 = l_props_1.Item;
    local v31 = l_props_1.Depth or 0;
    local v32 = l_props_1.Children and #l_props_1.Children > 0;
    local l_Expanded_0 = l_props_1.Expanded;
    local l_Size_0 = l_Stylizer_1.Arrow.Size;
    local l_TailItem_0 = l_props_1.TailItem;
    local l_BeforeIndentItem_0 = l_props_1.BeforeIndentItem;
    local l_ExpandableRoot_0 = l_props_1.ExpandableRoot;
    local v38 = l_props_1.Size or UDim2.new(1, 0, 0, l_Stylizer_1.RowHeight);
    local l_Position_0 = l_props_1.Position;
    local v40, v41, v42, v43 = v26:getContents(l_Item_0, l_Stylizer_1.Icons);
    local l_enabled_0 = v43.enabled;
    local l_color_0 = v43.color;
    local v46 = true;
    if v31 == 0 then
        v46 = l_ExpandableRoot_0;
    end;
    local v47 = (v31 - (l_ExpandableRoot_0 and 0 or 1)) * l_Stylizer_1.Indent;
    local l_Padding_0 = l_Stylizer_1.Padding;
    local l_Filter_0 = l_Stylizer_1.Filter;
    local _ = l_Stylizer_1.Detach;
    local v51 = UDim2.new(0, l_Stylizer_1.ColumnWidths.Weight, 1, 0);
    local v52 = UDim2.new(0, l_Stylizer_1.ColumnWidths.Timestamp, 1, 0);
    local v53 = (l_Item_0.state and l_Item_0.state.timePositionNormalized) and l_Item_0.state.length;
    local v54 = nil;
    v54 = if v31 == 0 then if l_RunService_0:IsServer() then l_Stylizer_1.Colors.Server else l_Stylizer_1.Colors.Client else if l_props_1.Selected then l_Stylizer_1.ActiveLayer else l_Stylizer_1.InactiveLayer:Lerp(l_Stylizer_1.ActiveLayer, l_Item_0.weight or 1);
    local v55 = l_Stylizer_1.TimeBar.Inactive:Lerp(l_Stylizer_1.TimeBar.Active, l_Item_0.weight or 1);
    local v56 = if v31 == 0 then l_Stylizer_1.Font.TopLayer else l_Stylizer_1.Font.RegularLayer;
    local v57 = UDim2.new(0, l_Size_0, 0, v38.Y.Offset);
    return v2.createElement(l_Pane_0, l_assign_0({
        LayoutOrder = if not l_BeforeIndentItem_0 then l_Index_0 else 2, 
        Size = v38, 
        Position = l_Position_0, 
        Style = "Box", 
        Layout = if not l_TailItem_0 then Enum.FillDirection.Horizontal else nil, 
        HorizontalAlignment = if not l_TailItem_0 then Enum.HorizontalAlignment.Left else nil, 
        BackgroundColor3 = l_Stylizer_1.Background, 
        Padding = l_Padding_0, 
        Spacing = l_Stylizer_1.Spacing
    }, l_props_1.WrapperProps), {
        Spacer = v2.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(0, v47, 0, 0)
        }), 
        Toggle = v2.createElement(l_Pane_0, {
            LayoutOrder = 4, 
            Size = v57, 
            OnPress = if not not v46 and v32 then v26.onToggle else nil
        }, {
            Button = if not not v46 and v32 then v2.createElement("ImageButton", {
                LayoutOrder = 4, 
                Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_Stylizer_1.Arrow.Image, 
                ImageColor3 = l_Stylizer_1.Arrow.Color, 
                ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
                ImageRectOffset = if not l_Expanded_0 then l_Stylizer_1.Arrow.CollapsedOffset else l_Stylizer_1.Arrow.ExpandedOffset, 
                [v2.Event.Activated] = v26.onToggle
            }) else nil
        }), 
        LeftIcon = v2.createElement(l_Image_0, l_join_0({
            ImageColor3 = v54, 
            LayoutOrder = 6
        }, v40)), 
        Name = v2.createElement(l_TextLabel_0, {
            Font = v56, 
            TextColor = v54, 
            LayoutOrder = 7, 
            Text = v41, 
            Size = UDim2.new(1, if v31 == 0 then -(((((((v47 + v57.X.Offset) + (not v40 and 0 or v40.Size.X.Offset)) + v57.X.Offset) + l_Padding_0.Left) + l_Padding_0.Right) + l_Stylizer_1.Spacing * 3) + l_Stylizer_1.Spacing * 3) else -(((((((((v47 + v57.X.Offset) + (not v40 and 0 or v40.Size.X.Offset)) + l_Stylizer_1.ColumnWidths.Weight) + l_Stylizer_1.ColumnWidths.Timestamp) + v57.X.Offset) + l_Padding_0.Left) + l_Padding_0.Right) + l_Stylizer_1.Spacing * 5) + l_Stylizer_1.Spacing * 3), 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Weight = if v31 ~= 0 then if v42 then v2.createElement(l_TextLabel_0, {
            Font = v56, 
            TextColor = v54, 
            LayoutOrder = 8, 
            Text = v42, 
            Size = v51, 
            TextXAlignment = Enum.TextXAlignment.Right
        }) else v2.createElement(l_Pane_0, {
            Size = v51, 
            LayoutOrder = 8
        }) else nil, 
        Timestamp = if v31 ~= 0 then if v53 then v2.createElement(v18, {
            Size = v52, 
            LayoutOrder = 9, 
            TimePercentage = l_Item_0.state.timePositionNormalized, 
            Length = l_Item_0.state.length, 
            Font = v56, 
            TextColor = v54, 
            BarColor = v55, 
            BarBorder = l_Stylizer_1.TimeBar.Border, 
            BarBackground = l_Stylizer_1.TimeBar.Background
        }) else v2.createElement(l_Pane_0, {
            Size = v52, 
            LayoutOrder = 9
        }) else nil, 
        Adornment = if v31 ~= 0 then v2.createElement(l_Pane_0, {
            LayoutOrder = 10, 
            Size = v57, 
            OnPress = v26.onToggleAdornment
        }, {
            Button = v2.createElement("ImageButton", {
                Size = l_Filter_0.Size, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_Filter_0.Image, 
                ImageColor3 = if not l_enabled_0 then l_Filter_0.InactiveColor else l_color_0, 
                ImageTransparency = if not l_enabled_0 then l_Filter_0.InactiveTransparency else l_Filter_0.ActiveTransparency, 
                [v2.Event.Activated] = v26.onToggleAdornment
            })
        }) else nil
    });
end;
v20.defaultProps = {
    ExpandableRoot = true
};
return l_withControl_0((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v20)));
