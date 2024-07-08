local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_TableRow_0 = l_UI_0.TableRow;
local l_Dash_0 = v2.Dash;
local l_map_0 = l_Dash_0.map;
local l_collect_0 = l_Dash_0.collect;
local l_reduce_0 = l_Dash_0.reduce;
local l_some_0 = l_Dash_0.some;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_SplitPane_0 = l_UI_0.SplitPane;
local v15 = require(script.TableHeaderCell);
local v16 = v1.PureComponent:extend("AudioTable");
local v17 = UDim.new(0, 50);
v16.init = function(v18)
    v18:calculateRowIndices(v18.props.Rows);
    v18.onHoverRow = function(v19)
        if v18.props.OnHoverRow then
            v18.props.OnHoverRow(v19.Row, v19.RowIndex);
        end;
    end;
    v18.onHoverRowEnd = function(v20)
        if v18.props.OnHoverRowEnd then
            v18.props.OnHoverRowEnd(v20.Row, v20.RowIndex);
        end;
    end;
    v18.onSelectRow = function(v21)
        if v18.props.OnSelectRow then
            v18.props.OnSelectRow(v21.Row, v21.RowIndex);
        end;
    end;
    v18.onDoubleClick = function(v22)
        if v18.props.OnDoubleClick then
            v18.props.OnDoubleClick(v22.Row, v22.RowIndex);
        end;
    end;
    v18.onRightClickRow = function(v23)
        if v18.props.OnRightClickRow then
            v18.props.OnRightClickRow(v23);
        end;
    end;
    v18:_flushRenderRow();
    v18.getDefaultRowKey = function(v24)
        return "Row " .. (v18.rowToIndex[v24] or tostring(v24));
    end;
    v18.onSizeChange = function(v25)
        local l_props_0 = v18.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        v18.props.OnSizeChange((v25.AbsoluteSize.Y - (l_Stylizer_0.HeaderHeight + (not not l_props_0.Footer and l_Stylizer_0.FooterHeight or 0))) - 5);
    end;
end;
v16._flushRenderRow = function(v28)
    v28.onRenderRow = function(v29)
        local v30 = v28.rowToIndex[v29];
        return v1.createElement(v28.props.RowComponent or l_TableRow_0, {
            CellProps = v28.props.CellProps, 
            CellComponent = v28.props.CellComponent, 
            Columns = v28.props.Columns, 
            Rows = v28.props.Rows, 
            Row = v29, 
            RowIndex = v30, 
            Selected = v30 == v28.props.SelectedRow, 
            OnHover = v28.props.OnHoverRow and v28.onHoverRow, 
            OnHoverEnd = v28.props.OnHoverRowEnd and v28.onHoverRowEnd, 
            OnPress = v28.props.OnSelectRow and v28.onSelectRow, 
            OnDoubleClick = v28.props.OnDoubleClick and v28.onDoubleClick, 
            OnRightClick = v28.onRightClickRow
        });
    end;
end;
v16.willUpdate = function(v31, v32)
    local l_props_1 = v31.props;
    if l_props_1.Rows ~= v32.Rows then
        v31:calculateRowIndices(v32.Rows);
    end;
    if l_props_1.Columns ~= v32.Columns then
        local v34 = #l_props_1.Columns ~= #v32.Columns;
        local v37 = l_some_0(l_props_1.Columns, function(v35, v36)
            return v32.Columns[v36].Width ~= v35.Width;
        end);
        if not (not v34 and not v37) then
            v31:_flushRenderRow();
        end;
    end;
end;
v16.calculateRowIndices = function(v38, v39)
    v38.rowToIndex = l_collect_0(v39, function(v40, v41)
        return v41, v40;
    end);
end;
v16.renderResizableHeadings = function(v42)
    local l_props_2 = v42.props;
    local l_Stylizer_1 = l_props_2.Stylizer;
    return v1.createElement(l_SplitPane_0, {
        UseScale = l_props_2.UseScale, 
        ClampSize = l_props_2.ClampSize, 
        Sizes = l_map_0(l_props_2.Columns, function(v45)
            return v45.Width or UDim.new(1 / #l_props_2.Columns, 0);
        end), 
        MinSizes = l_map_0(l_props_2.Columns, function(v46)
            return v46.MinWidth or v17;
        end), 
        OnSizesChange = l_props_2.OnColumnSizesChange
    }, l_map_0(l_props_2.Columns, function(v47, v48)
        local v49 = l_props_2.SortIndex == v48 and l_props_2.SortOrder or nil;
        return v1.createElement(v15, {
            Name = v47.Name, 
            Order = v49, 
            Width = UDim.new(1, 0), 
            ColumnIndex = v48, 
            Style = l_Stylizer_1, 
            OnPress = not not v42.props.OnSortChange and function()
                v42.props.OnSortChange(v48, if v49 == Enum.SortDirection.Descending then Enum.SortDirection.Ascending else Enum.SortDirection.Descending);
            end or nil
        });
    end));
end;
v16.renderFixedHeadings = function(v50)
    local l_props_3 = v50.props;
    local l_Stylizer_2 = l_props_3.Stylizer;
    return l_map_0(l_props_3.Columns, function(v53, v54)
        local v55 = v53.Width or UDim.new(1 / #l_props_3.Columns, 0);
        local v56 = l_props_3.SortIndex == v54 and l_props_3.SortOrder or nil;
        return v1.createElement(v15, {
            Name = v53.Name, 
            Order = v56, 
            Width = v55, 
            ColumnIndex = v54, 
            Style = l_Stylizer_2, 
            OnPress = not not v50.props.OnSortChange and function()
                v50.props.OnSortChange(v54, v56 == Enum.SortDirection.Descending and Enum.SortDirection.Ascending or Enum.SortDirection.Descending);
            end or nil
        });
    end);
end;
v16.renderHeadings = function(v57)
    if not v57.props.OnColumnSizesChange then
        return v57:renderFixedHeadings();
    else
        return v57:renderResizableHeadings();
    end;
end;
v16.renderScroll = function(v58)
    return v1.createElement(l_ScrollingFrame_0, {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        CanvasSize = UDim2.fromOffset(0, 0)
    }, {
        Group = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            Children = v58:renderRows()
        })
    });
end;
v16.renderRows = function(v59)
    return v1.createFragment((l_map_0(v59.props.Rows, function(v60, v61)
        return v1.createElement(l_Pane_0, {
            LayoutOrder = v61, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Row = v59.onRenderRow(v60)
        });
    end)));
end;
v16.render = function(v62)
    local l_props_4 = v62.props;
    local l_Stylizer_3 = l_props_4.Stylizer;
    local v65 = v62:renderHeadings();
    local l_ShowFooter_0 = l_props_4.ShowFooter;
    local l_ShowHeader_0 = l_props_4.ShowHeader;
    if l_ShowHeader_0 == nil then
        l_ShowHeader_0 = true;
    end;
    if l_ShowFooter_0 == nil then
        l_ShowFooter_0 = l_props_4.Footer ~= nil;
    end;
    local v68 = not not l_ShowHeader_0 and l_Stylizer_3.HeaderHeight or 0;
    local v69 = not not l_ShowFooter_0 and l_Stylizer_3.FooterHeight or 0;
    local v70 = not not l_props_4.Scroll and v62:renderScroll() or v62:renderRows();
    local v71 = l_ShowHeader_0 and v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = 1, 
        Size = UDim2.new(1, -8, 0, v68), 
        Style = "SubtleBox", 
        BorderColor3 = l_Stylizer_3.Border, 
        BorderSizePixel = 1
    }, v65);
    local v72 = (l_props_4.OnColumnSizesChange and not l_props_4.UseScale) and not l_props_4.ClampSize;
    local v73 = 0;
    local v74 = UDim2.new(1, 0, 1, -(v68 + v69));
    if v72 then
        v73 = l_reduce_0(l_props_4.Columns, function(v75, v76)
            return v75 + (not v76.Width and 0 or v76.Width.Offset);
        end, 0);
        if v73 > 0 then
            v74 = UDim2.new(0, v73, 1, -(v68 + v69));
        end;
    end;
    local v77 = v1.createElement(l_Pane_0, {
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = 2, 
        LayoutOrder = 2, 
        Size = v74, 
        [v1.Event.MouseLeave] = l_props_4.OnMouseLeave
    }, {
        Child = v70
    });
    local _ = nil;
    return v1.createElement(l_Pane_0, {
        Size = l_props_4.Size, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Style = "BorderBox", 
        Padding = 1, 
        [v1.Change.AbsoluteSize] = not not l_props_4.OnSizeChange and v62.onSizeChange or nil
    }, {
        Top = if not v72 then v1.createFragment({
            Header = v71, 
            List = v77
        }) else v1.createElement(l_ScrollingFrame_0, {
            CanvasSize = UDim2.fromOffset(v73, 0), 
            ScrollingDirection = Enum.ScrollingDirection.X
        }, {
            Child = v1.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                Header = v71, 
                List = v77
            })
        }), 
        Footer = l_ShowFooter_0 and v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            Style = "SubtleBox", 
            BorderColor3 = l_Stylizer_3.Border, 
            BorderSizePixel = 1, 
            Size = UDim2.new(1, 0, 0, v69)
        }, {
            Content = l_props_4.Footer
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16));
