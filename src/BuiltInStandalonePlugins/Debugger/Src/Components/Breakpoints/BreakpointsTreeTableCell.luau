local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_join_0 = v2.Dash.join;
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_TreeTableCell_0 = v2.UI.TreeTableCell;
local v8 = require(l_Parent_0.Src.Components.Breakpoints.BreakpointsEnabledCell);
local v9 = require(l_Parent_0.Src.Components.Breakpoints.BreakpointsContinueExecutionCell);
local v10 = require(l_Parent_0.Src.Components.Breakpoints.BreakpointsRemoveOnHitCell);
local v11 = v1.PureComponent:extend("BreakpointsTreeTableCell");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_Key_0 = l_props_0.Columns[l_props_0.ColumnIndex].Key;
    local v15 = l_props_0.Width or UDim.new(1 / #l_props_0.Columns, 0);
    local l_Row_0 = l_props_0.Row;
    local l_CellProps_0 = l_props_0.CellProps;
    local v18 = l_Row_0.item[l_Key_0];
    local v19 = l_Key_0 == "isEnabled";
    local v20 = l_Key_0 == "continueExecution";
    local v21 = l_Key_0 == "removeOnHit";
    local v22 = l_join_0(l_props_0.Style, l_CellProps_0.CellStyle);
    local v23 = l_props_0.RowIndex % 2 == 1 and v22.BackgroundOdd or v22.BackgroundEven;
    if not (not l_props_0.HighlightCell or not v22[l_StyleModifier_0.Hover]) then
        v23 = l_props_0.RowIndex % 2 == 1 and v22[l_StyleModifier_0.Hover].BackgroundOdd or v22[l_StyleModifier_0.Hover].BackgroundEven;
    end;
    local v24 = l_Row_0.item.children and #l_Row_0.item.children > 0;
    if not v19 then
        if not v20 then
            if not v21 then
                return v1.createElement(l_TreeTableCell_0, {
                    CellProps = l_props_0.CellProps, 
                    Columns = l_props_0.Columns, 
                    ColumnIndex = l_props_0.ColumnIndex, 
                    Row = l_props_0.Row, 
                    Width = l_props_0.Width, 
                    Style = l_props_0.Style, 
                    RowIndex = l_props_0.RowIndex, 
                    HighlightCell = l_props_0.HighlightCell, 
                    OnRightClick = l_props_0.OnRightClick, 
                    SetCellContentsWidth = l_props_0.SetCellContentsWidth, 
                    Emphasis = l_props_0.Emphasis
                });
            else
                return v1.createElement(v10, {
                    Row = l_Row_0, 
                    Style = v22, 
                    HasChildren = v24, 
                    BackgroundColor = v23, 
                    Width = v15, 
                    Value = v18
                });
            end;
        else
            return v1.createElement(v9, {
                Row = l_Row_0, 
                Style = v22, 
                HasChildren = v24, 
                BackgroundColor = v23, 
                Width = v15, 
                Value = v18
            });
        end;
    else
        return v1.createElement(v8, {
            ColumnIndex = l_props_0.ColumnIndex, 
            Row = l_Row_0, 
            Style = v22, 
            HasChildren = v24, 
            BackgroundColor = v23, 
            Width = v15, 
            CellProps = l_CellProps_0
        });
    end;
end;
return (l_ContextServices_0.withContext({
    Analytics = l_Analytics_0
})(v11));
