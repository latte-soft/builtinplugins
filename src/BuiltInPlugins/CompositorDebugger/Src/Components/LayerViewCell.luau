local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_withContext_0 = v2.ContextServices.withContext;
local l_join_0 = v2.Dash.join;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_PropertyCell_0 = l_UI_0.PropertyCell;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v14 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v15 = v1.PureComponent:extend("LayerViewCell");
v15.init = function(v16)
    v16.onToggle = function()
        v16.props.CellProps.OnToggle(v16.props.Row);
    end;
    v16.textRef = v1.createRef();
    v16.fetchCellContentsWidthIfOverflow = function()
        if not v16.state.textOverflows then
            return 0;
        else
            local l_CellStyle_0 = v16.props.CellProps.CellStyle;
            return v16.textRef.current.AbsoluteSize.X + (l_CellStyle_0.CellPadding.Left + l_CellStyle_0.Indent);
        end;
    end;
    v16.onAbsoluteSizeChanged = function(_)
        if v16.textRef:getValue() then
            v16:setState({
                textOverflows = not v16.textRef:getValue().TextFits
            });
        end;
        local l_props_0 = v16.props;
        if not (not v16.textRef.current or not l_props_0.SetCellContentsWidth) then
            l_props_0.SetCellContentsWidth(l_props_0.ColumnIndex, l_props_0.RowIndex, v16.fetchCellContentsWidthIfOverflow());
        end;
    end;
    v16.onTextInputFocused = function(v20)
        local l_props_1 = v16.props;
        local l_OnFocused_0 = l_props_1.CellProps.OnFocused;
        if l_OnFocused_0 then
            l_OnFocused_0(v20, l_props_1.Row, l_props_1.ColumnIndex);
        end;
    end;
    v16.onTextInputFocusLost = function(v23, v24)
        local l_props_2 = v16.props;
        local l_OnFocusLost_0 = l_props_2.CellProps.OnFocusLost;
        if l_OnFocusLost_0 then
            l_OnFocusLost_0(v23, v24, l_props_2.Row, l_props_2.ColumnIndex);
        end;
    end;
    v16.onPressed = function(...)
        local l_props_3 = v16.props;
        if l_props_3.CellProps.OnCellPressed then
            l_props_3.CellProps.OnCellPressed(l_props_3.Row.item.path, l_props_3.ColumnIndex, ...);
        end;
    end;
    v16.onDoubleClick = function(...)
        local l_props_4 = v16.props;
        if l_props_4.CellProps.OnCellDoubleClick then
            l_props_4.CellProps.OnCellDoubleClick(l_props_4.Row.item.path, l_props_4.ColumnIndex, ...);
        end;
    end;
    v16.getTextElement = function(v29, v30, v31)
        local l_TextInputCols_0 = v29.CellProps.TextInputCols;
        if not ((l_TextInputCols_0 and l_TextInputCols_0[v29.ColumnIndex]) and v29.Row.depth == 0) then
            return not not v30 and v1.createElement(l_TextLabel_0, {
                LayoutOrder = 3, 
                Size = v31, 
                Text = v30, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                ref = v16.textRef
            }) or nil;
        else
            return v1.createElement(l_DEPRECATED_TextInput_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                OnFocused = v16.onTextInputFocused, 
                OnFocusLost = v16.onTextInputFocusLost, 
                Size = v31, 
                Text = v30, 
                ref = v16.textRef
            });
        end;
    end;
    v16.getTextFromProps = function(v33)
        local v34 = v33.Columns[v33.ColumnIndex];
        return v33.Row.item[v34.Key or v34.Name];
    end;
    v16.getPropertyCell = function(v35)
        return v1.createElement(l_Pane_0, {}, {
            PropertyCell = v1.createElement(l_PropertyCell_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(1, -6, 1, 0), 
                Position = UDim2.new(0, 3, 0.5, 0), 
                GetAutocompleteItems = v16.props.CellProps.GetAutocompleteItems, 
                Item = v35.Item, 
                LayoutOrder = 3, 
                OnChanged = v16.onChanged, 
                OnDoubleClick = v35.OnDoubleClick, 
                OnPressed = v35.OnPressed, 
                Schema = v35.Schema, 
                Value = v35.Value
            })
        });
    end;
    v16.onChanged = function(v36)
        if v16.props.CellProps.OnCellEdited then
            v16.props.CellProps.OnCellEdited(v36, v16.props.Row.item.path, v16.props.ColumnIndex);
        end;
    end;
end;
v15.didUpdate = function(v37, v38)
    local l_props_5 = v37.props;
    if not (not (not (v38.RowIndex == l_props_5.RowIndex) or v37.getTextFromProps(v38) ~= v37.getTextFromProps(l_props_5)) or not l_props_5.SetCellContentsWidth) then
        l_props_5.SetCellContentsWidth(l_props_5.ColumnIndex, l_props_5.RowIndex, v37.fetchCellContentsWidthIfOverflow());
    end;
end;
v15.render = function(v40)
    local l_props_6 = v40.props;
    local _ = l_props_6.Stylizer;
    local v43 = l_props_6.Columns[l_props_6.ColumnIndex];
    local v44 = v43.Key or v43.Name;
    local v45 = l_props_6.Width or UDim.new(1 / #l_props_6.Columns, 0);
    local l_Row_0 = l_props_6.Row;
    local l_CellProps_0 = l_props_6.CellProps;
    local v48 = l_Row_0.item[v44];
    local v49 = nil;
    local v50 = nil;
    local v51 = false;
    if typeof(v48) == "table" then
        v49 = tostring(v48.Value);
        v50 = v48.LeftIcon;
        if v48.Schema then
            v51 = true;
        end;
    else
        v49 = tostring(v48);
    end;
    local v52 = l_props_6.Tooltip or v49;
    local v53 = false;
    if v52 ~= nil then
        v53 = false;
        if v52 ~= "" then
            v53 = v40.state.textOverflows and not l_CellProps_0.DisableTooltip;
        end;
    end;
    local v54 = l_join_0(l_props_6.Style, l_CellProps_0.CellStyle);
    if not (l_props_6.RowIndex % 2 == 1 and v54.BackgroundOdd) then
        local _ = v54.BackgroundEven;
    end;
    local v56 = if not l_props_6.Emphasis then v54.BackgroundEven else v54.BackgroundOdd;
    if not (not l_props_6.HighlightCell or not v54[l_StyleModifier_0.Hover]) then
        v56 = l_props_6.RowIndex % 2 == 1 and v54[l_StyleModifier_0.Hover].BackgroundOdd or v54[l_StyleModifier_0.Hover].BackgroundEven;
    end;
    local v57 = l_CellProps_0.Expansion[l_CellProps_0.GetItemId(l_Row_0.item)];
    local l_Size_0 = v54.Arrow.Size;
    local v59 = l_Row_0.depth * v54.Indent;
    local v60 = l_props_6.ColumnIndex == 1;
    local v61 = if not v51 then v54.CellPadding else v54.SchemaCellPadding;
    local v62 = not not v60 and {
        Top = v61.Top, 
        Left = v54.CellPadding.Left + v59, 
        Right = v61.Right, 
        Bottom = v61.Bottom
    } or v61;
    local v63 = v60 and l_Row_0.hasChildren;
    local v64 = 0;
    local v65 = nil;
    if not (not (typeof(v48) == "table") or not v48.Actions) then
        v64 = v64 + v54.CellSpacing;
        v65 = {};
        for v66, v67 in ipairs(v48.Actions) do
            if v67.Id == v14.LAYERVIEW_ACTIONS.NoOp then
                v65["Action " .. v66] = v1.createElement(l_Pane_0, {
                    Size = v67.Icon.Size, 
                    LayoutOrder = v66, 
                    BackgroundTransparency = 1
                });
            else
                v65[v67.Id] = v1.createElement("ImageButton", {
                    Size = v67.Icon.Size, 
                    LayoutOrder = v66, 
                    BackgroundTransparency = 1, 
                    Image = v67.Icon.Image, 
                    ImageColor3 = v54.Text, 
                    [v1.Event.Activated] = function()
                        if l_CellProps_0.OnCellAction then
                            l_CellProps_0.OnCellAction(v67.Id, l_Row_0.item.path, l_props_6.ColumnIndex);
                        end;
                    end
                });
            end;
            v64 = v64 + (v67.Icon.Size.X.Offset + v54.CellSpacing);
        end;
    end;
    local v68 = 0;
    if v50 then
        v68 = v68 + (v54.CellSpacing + v50.Size.X.Offset);
    end;
    if v63 then
        v68 = v68 + (v54.CellSpacing + l_Size_0);
    end;
    local v69 = UDim2.new(1, -v68, 1, 0);
    return v1.createElement(l_Pane_0, {
        Style = "Box", 
        BackgroundColor3 = v56, 
        BorderSizePixel = 1, 
        BorderColor3 = v54.Border, 
        Size = UDim2.new(v45.Scale, v45.Offset, 1, 0), 
        [v1.Change.AbsoluteSize] = v40.onAbsoluteSizeChanged, 
        ClipsDescendants = true
    }, {
        Tooltip = v53 and v1.createElement(l_Tooltip_0, {
            MaxWidth = v54.Tooltip.MaxWidth, 
            Text = v52, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Left = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = l_props_6.ColumnIndex, 
            Padding = v62, 
            Spacing = v54.CellSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Size = UDim2.new(1, -v64, 1, 0)
        }, {
            Toggle = if not v63 then nil else v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }, {
                Icon = v1.createElement("ImageButton", {
                    Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
                    BackgroundTransparency = 1, 
                    Image = v54.Arrow.Image, 
                    ImageColor3 = v54.Arrow.Color, 
                    ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
                    ImageRectOffset = if not v57 then v54.Arrow.CollapsedOffset else v54.Arrow.ExpandedOffset, 
                    [v1.Event.Activated] = v40.onToggle
                })
            }), 
            LeftIcon = not not v50 and v1.createElement(l_Image_0, l_join_0({
                LayoutOrder = 2
            }, v50)) or nil, 
            Text = if not v51 or v48.Disabled then v40.getTextElement(l_props_6, v49, v69) else v40.getPropertyCell({
                OnDoubleClick = v40.onDoubleClick, 
                OnPressed = v40.onPressed, 
                Schema = v48.Schema, 
                Size = v69, 
                Value = v48.Value
            })
        }), 
        Right = if not v65 then nil else v1.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Position = UDim2.new(1, -3, 0.5, 0), 
            Spacing = v54.CellSpacing
        }, v65)
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v15));
