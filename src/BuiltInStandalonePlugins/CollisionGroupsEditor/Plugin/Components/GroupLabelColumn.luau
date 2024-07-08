local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local _ = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v7 = require(script.Parent.Parent.Constants);
local v8 = require(script.Parent.GroupLabel);
local v9 = v1.PureComponent:extend("GroupLabelColumn");
v9.CalculateColumnHeight = function(v10)
    return v7.GroupRowHeight * v10;
end;
v9.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v14 = nil;
    v14 = if not l_props_0.ToggleListView then v7.GroupRowWidth else v7.GroupRowWidth + l_Stylizer_0.ScrollBarThickness;
    local v15 = {};
    for v16, v17 in ipairs(l_props_0.Groups) do
        v15[v17.Name] = v1.createElement(v8, {
            Group = v17, 
            Groups = l_props_0.Groups, 
            GroupsShown = v16, 
            LayoutOrder = v16, 
            Window = l_props_0.Window, 
            Hovered = l_props_0.RowHovered == v17.Name, 
            OnRowHovered = l_props_0.OnRowHovered
        });
    end;
    return v1.createElement(l_ScrollingFrame_0, {
        Size = UDim2.new(0, v14, 1, -l_Stylizer_0.ScrollBarThickness), 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        CanvasPosition = Vector2.new(0, l_props_0.ScrollPositionY), 
        LayoutOrder = l_props_0.LayoutOrder, 
        EnableScrollBarBackground = false, 
        ScrollingEnabled = l_props_0.ToggleListView, 
        Style = if l_props_0.ToggleListView then nil else l_Stylizer_0.ScrollingFrameNoBar, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = l_Stylizer_0.GroupLabelColumn.Padding
    }, v15);
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
