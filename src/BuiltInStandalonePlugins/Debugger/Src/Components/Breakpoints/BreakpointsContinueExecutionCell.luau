local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local v5 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v9 = v1.PureComponent:extend("BreakpointsContinueExecutionCell");
v9.init = function(v10)
    v10.onCheckboxClicked = function()
        local l_Row_0 = v10.props.Row;
        game:GetService("MetaBreakpointManager"):GetBreakpointById(l_Row_0.item.id):SetContinueExecution(not l_Row_0.item.continueExecution);
        v10.props.Analytics:report(v5.MetaBreakpointContinueExecutionChanged, "LuaBreakpointsTable");
    end;
end;
v9.render = function(v12)
    local l_props_0 = v12.props;
    return v1.createElement(l_Pane_0, {
        Style = "Box", 
        BackgroundColor3 = l_props_0.BackgroundColor, 
        BorderSizePixel = 1, 
        BorderColor3 = l_props_0.Style.Border, 
        Size = UDim2.new(l_props_0.Width.Scale, l_props_0.Width.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        EnabledCheckbox = l_props_0.HasChildren and v1.createElement(l_Checkbox_0, {
            Checked = l_props_0.Value, 
            OnClick = v12.onCheckboxClicked
        })
    });
end;
return (l_ContextServices_0.withContext({
    Analytics = l_Analytics_0
})(v9));
