local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v9 = require(script.Parent.Parent.Constants);
local v10 = require(script.Parent.GroupCountDisplay);
local v11 = v1.Component:extend("TableHeader");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_TableHeader_0 = l_props_0.Stylizer.TableHeader;
    local v15 = {};
    for v16, v17 in ipairs(l_props_0.Groups) do
        v15[v17.Name] = v1.createElement(l_Pane_0, {
            Size = v9.GridHeaderLabelSize, 
            Style = "GroupLabel", 
            StyleModifier = if v17.Name == l_props_0.ColHovered then l_StyleModifier_0.Hover else nil, 
            LayoutOrder = #l_props_0.Groups - v16
        }, {
            TextLabel = v1.createElement(l_TextLabel_0, {
                Style = "GroupLabel", 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v17.Name
            })
        });
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, v9.GroupRowHeight), 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_TableHeader_0.Padding, 
        Spacing = -1
    }, {
        GroupCountDisplay = v1.createElement(v10, {
            GroupCount = #l_props_0.Groups, 
            LayoutOrder = 1
        }), 
        Headers = v1.createElement(l_ScrollingFrame_0, {
            Size = l_TableHeader_0.ScrollingFrameSize, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            CanvasPosition = Vector2.new(l_props_0.ScrollPositionX, 0), 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = l_TableHeader_0.ScrollingFramePadding, 
            LayoutOrder = 2, 
            ScrollBarThickness = 0, 
            ScrollingEnabled = false
        }, v15)
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
