local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.Constants);
local v5 = require(l_Parent_0.Src.Util.BreakpointHelperFunctions);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v12 = v1.PureComponent:extend("BreakpointsEnabledCell");
v12.init = function(v13)
    v13.onToggle = function()
        v13.props.CellProps.OnToggle(v13.props.Row);
    end;
    v13.onBreakpointIconClicked = function()
        local l_Row_0 = v13.props.Row;
        v5.setBreakpointRowEnabled(game:GetService("MetaBreakpointManager"):GetBreakpointById(l_Row_0.item.id), l_Row_0, v13.props.Analytics, "LuaBreakpointsTable.BreakpointIconClicked", v13.props.CurrentConnectionId);
    end;
end;
local function v16(v15)
    if v15.item.isValid then
        if v15.item.debugpointType == "Breakpoint" then
            if not v15.item.condition or v15.item.condition == "" then
                return not not v15.item.isEnabled and v4.DebugpointIconTable.breakpointEnabled or v4.DebugpointIconTable.breakpointDisabled;
            else
                return not not v15.item.isEnabled and v4.DebugpointIconTable.conditionalEnabled or v4.DebugpointIconTable.conditionalDisabled;
            end;
        else
            return not not v15.item.isEnabled and v4.DebugpointIconTable.logpointEnabled or v4.DebugpointIconTable.logpointDisabled;
        end;
    else
        return v4.DebugpointIconTable.invalidBreakpoint;
    end;
end;
v12.render = function(v17)
    local l_props_0 = v17.props;
    local l_Row_1 = l_props_0.Row;
    local l_Style_0 = l_props_0.Style;
    local l_HasChildren_0 = l_props_0.HasChildren;
    local v22 = l_props_0.ColumnIndex == 1;
    local v23 = l_Row_1.depth * l_Style_0.Indent;
    local v24 = l_Style_0.CellPadding.Left + v23;
    if not l_HasChildren_0 then
        v24 = v24 + v23 * 2;
    end;
    local l_Size_0 = l_Style_0.Arrow.Size;
    return v1.createElement(l_Pane_0, {
        Style = "Box", 
        BackgroundColor3 = l_props_0.BackgroundColor, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(l_props_0.Width.Scale, l_props_0.Width.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Left = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 0, 
            Padding = not not v22 and {
                Top = l_Style_0.CellPadding.Top, 
                Left = v24, 
                Right = l_Style_0.CellPadding.Right, 
                Bottom = l_Style_0.CellPadding.Bottom
            } or l_Style_0.CellPadding, 
            Spacing = l_Style_0.CellSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Toggle = not not l_HasChildren_0 and v1.createElement("ImageButton", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_Size_0, 0, l_Size_0), 
                BackgroundTransparency = 1, 
                Image = l_Style_0.Arrow.Image, 
                ImageColor3 = l_Style_0.Arrow.Color, 
                ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
                ImageRectOffset = not not l_props_0.CellProps.Expansion[l_Row_1.item] and l_Style_0.Arrow.ExpandedOffset or l_Style_0.Arrow.CollapsedOffset, 
                [v1.Event.Activated] = v17.onToggle
            }) or nil, 
            ChildCountIndicator = l_HasChildren_0 and v1.createElement(l_TextLabel_0, {
                Text = "(x" .. #l_Row_1.item.children .. ")", 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v4.ICON_SIZE, 0, v4.ICON_SIZE)
            }), 
            BreakpointIconPane = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                OnPress = v17.onBreakpointIconClicked, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                BreakpointIcon = v1.createElement(l_Image_0, {
                    Size = UDim2.new(0, v4.ICON_SIZE, 0, v4.ICON_SIZE), 
                    Image = v16(l_Row_1)
                })
            })
        })
    });
end;
return (v2.connect(function(v26, _)
    return {
        CurrentConnectionId = v26.Common.currentDebuggerConnectionId
    };
end)((l_ContextServices_0.withContext({
    Analytics = l_Analytics_0
})(v12))));
