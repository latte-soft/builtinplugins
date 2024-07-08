local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_supportsStyleSheets_0 = v1.Styling.supportsStyleSheets;
local l_joinTags_0 = v1.Styling.joinTags;
local v6 = require(script.Parent.styles);
local l_v6_Attribute_0 = v6:GetAttribute("ArrowSize");
local l_v6_Attribute_1 = v6:GetAttribute("CellPadding");
local l_v6_Attribute_2 = v6:GetAttribute("Indent");
local l_SharedFlags_0 = v1.SharedFlags;
local v11 = l_SharedFlags_0.getFFlagDevFrameworkTreeTableCellPadding();
local v12 = l_SharedFlags_0.getFFlagDevFrameworkFixTreeTableHoverScroll();
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_PropertyCell_0 = l_UI_0.PropertyCell;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_TweenService_0 = game:GetService("TweenService");
local v24 = TweenInfo.new(0.1, Enum.EasingStyle.Linear);
local v25 = Color3.new(0.2, 0.2, 0.5);
local v26 = v2.PureComponent:extend("TreeTableCell");
v26.init = function(v27)
    v27.state = {
        textOverflows = false
    };
    v27.onToggle = function()
        v27.props.CellProps.OnToggle(v27.props.Row);
    end;
    v27.textRef = v2.createRef();
    v27.toggleRef = v2.createRef();
    v27.fetchCellContentsWidthIfOverflow = function()
        if not v27.state.textOverflows then
            return 0;
        else
            local l_CellStyle_0 = v27.props.CellProps.CellStyle;
            return v27.textRef.current.AbsoluteSize.X + if not l_supportsStyleSheets_0 then l_CellStyle_0.CellPadding.Left + l_CellStyle_0.Indent else l_v6_Attribute_1 + l_v6_Attribute_2;
        end;
    end;
    v27.onAbsoluteSizeChanged = function()
        if v27.textRef:getValue() then
            v27:setState({
                textOverflows = not v27.textRef:getValue().TextFits
            });
        end;
        local l_props_0 = v27.props;
        if not (not v27.textRef.current or not l_props_0.SetCellContentsWidth) then
            l_props_0.SetCellContentsWidth(l_props_0.ColumnIndex, l_props_0.RowIndex, v27.fetchCellContentsWidthIfOverflow());
        end;
    end;
    v27.onTextInputFocusLost = function(v30, v31)
        local l_props_1 = v27.props;
        local l_OnFocusLost_0 = l_props_1.CellProps.OnFocusLost;
        if l_OnFocusLost_0 then
            l_OnFocusLost_0(v30, v31, l_props_1.Row, l_props_1.ColumnIndex);
        end;
    end;
    v27.onPressed = function(...)
        local l_props_2 = v27.props;
        if l_props_2.CellProps.OnCellPressed then
            l_props_2.CellProps.OnCellPressed(l_props_2.Row.item.Path, l_props_2.ColumnIndex, ...);
        end;
    end;
    v27.onDoubleClick = function(...)
        local l_props_3 = v27.props;
        if l_props_3.CellProps.OnCellDoubleClick then
            l_props_3.CellProps.OnCellDoubleClick(l_props_3.Row.item.Path, l_props_3.ColumnIndex, ...);
        end;
    end;
    v27.getTextElement = function(v36, v37, v38)
        local l_TextInputCols_0 = v36.CellProps.TextInputCols;
        if not ((l_TextInputCols_0 and l_TextInputCols_0[v36.ColumnIndex]) and v36.Row.depth == 0) then
            return not not v37 and v2.createElement(l_TextLabel_0, {
                LayoutOrder = 3, 
                Size = v38, 
                Text = v37, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [v2.Ref] = v27.textRef
            }) or nil;
        else
            return v2.createElement(l_DEPRECATED_TextInput_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                OnFocusLost = v27.onTextInputFocusLost, 
                Size = v38, 
                Text = v37, 
                [v2.Ref] = v27.textRef
            });
        end;
    end;
    v27.getTextFromProps = function(v40)
        local v41 = v40.Columns[v40.ColumnIndex];
        return v40.Row.item[v41.Key or v41.Name];
    end;
    v27.getPropertyCell = function(v42)
        local l_CellProps_0 = v27.props.CellProps;
        return v2.createElement(l_PropertyCell_0, {
            ErrorMessage = v42.ErrorMessage, 
            GetAutocompleteItems = l_CellProps_0.GetAutocompleteItems, 
            Item = v42.Item, 
            LayoutOrder = 3, 
            OnMenuAction = function(v44)
                return function()
                    v27.props.CellProps.OnCellAction(v44, v27.props.Row.item.Path, v27.props.ColumnIndex);
                end;
            end, 
            OnChanged = v27.onChanged, 
            OnClick = v42.OnClick, 
            OnDoubleClick = v42.OnDoubleClick, 
            OnPressed = v42.OnPressed, 
            Renderers = l_join_0(l_CellProps_0.Renderers, v42.Renderers), 
            Schema = v42.Schema, 
            Selected = v42.Selected, 
            Size = v42.Size, 
            StyleModifier = v42.StyleModifier, 
            Value = v42.Value, 
            Disabled = v27.props.Row.item._disabled
        });
    end;
    v27.onChanged = function(v45)
        if v27.props.CellProps.OnCellEdited then
            v27.props.CellProps.OnCellEdited(v45, v27.props.Row.item.Path, v27.props.ColumnIndex);
        end;
    end;
    v27.defaultGetItemId = function(v46)
        return v46;
    end;
    v27.getItemId = not not v27.props.CellProps and v27.props.CellProps.GetItemId or v27.defaultGetItemId;
end;
v26.didMount = function(v47)
    local l_props_4 = v47.props;
    local v49 = l_props_4.CellProps.Expansion[v47.getItemId(l_props_4.Row.item)];
    if not (not v47.toggleRef.current or not v49) then
        v47.toggleRef.current.Rotation = 90;
    end;
end;
v26.willUpdate = function(v50, v51)
    if not (v51.CellProps == v50.props.CellProps) or not (not v51.CellProps or not v50.props.CellProps) and v51.CellProps.GetItemId ~= v50.props.CellProps.GetItemId then
        v50.getItemId = (not not v51 and v51.CellProps) and v51.CellProps.GetItemId or v50.defaultGetItemId;
    end;
end;
v26.didUpdate = function(v52, v53)
    local l_props_5 = v52.props;
    if not (not (not (v53.RowIndex == l_props_5.RowIndex) or v52.getTextFromProps(v53) ~= v52.getTextFromProps(l_props_5)) or not l_props_5.SetCellContentsWidth) then
        l_props_5.SetCellContentsWidth(l_props_5.ColumnIndex, l_props_5.RowIndex, v52.fetchCellContentsWidthIfOverflow());
    end;
    local v55 = l_props_5.CellProps.Expansion[v52.getItemId(l_props_5.Row.item)];
    if v52.toggleTween then
        v52.toggleTween:Pause();
    end;
    if v52.toggleRef.current then
        local v56 = not v55 and 0 or 90;
        if v53.Row.item == l_props_5.Row.item then
            v52.toggleTween = l_TweenService_0:Create(v52.toggleRef.current, v24, {
                Rotation = v56
            });
            v52.toggleTween:Play();
            return ;
        else
            v52.toggleRef.current.Rotation = v56;
        end;
    end;
end;
v26.render = function(v57)
    local l_props_6 = v57.props;
    local v59 = l_props_6.Columns[l_props_6.ColumnIndex];
    local v60 = v59.Key or v59.Name;
    local v61 = l_props_6.Width or UDim.new(1 / #l_props_6.Columns, 0);
    local l_Row_0 = l_props_6.Row;
    local l_CellProps_1 = l_props_6.CellProps;
    local v64 = l_Row_0.item[v60];
    local v65 = nil;
    local v66 = nil;
    local v67 = false;
    if typeof(v64) == "table" then
        v65 = tostring(v64.Value);
        v66 = v64.LeftIcon;
        if v64.Schema then
            v67 = true;
        end;
    else
        v65 = if v64 ~= nil then tostring(v64) else "";
    end;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    if typeof(v64) == "table" then
        v68 = (l_props_6.Tooltip or v64.ErrorMessage) or v65;
        v70 = v68 == v64.ErrorMessage;
    else
        v68 = l_props_6.Tooltip or v65;
    end;
    local v71 = false;
    if v68 ~= nil then
        v71 = false;
        if v68 ~= "" then
            v71 = (v57.state.textOverflows or v70) and not l_CellProps_1.DisableTooltip;
        end;
    end;
    v69 = v71;
    v71 = if not l_supportsStyleSheets_0 then l_join_0(l_props_6.Style, l_CellProps_1.CellStyle) else nil;
    local v72 = if not l_supportsStyleSheets_0 then if l_Row_0.depth == 1 then v71.BackgroundEven else v71.BackgroundOdd else nil;
    if not ((l_supportsStyleSheets_0 or not l_props_6.HighlightCell) or not v71[l_StyleModifier_0.Hover]) then
        v72 = if l_Row_0.depth == 1 then v71[l_StyleModifier_0.Hover].BackgroundEven else v71[l_StyleModifier_0.Hover].BackgroundOdd;
    end;
    if not (not (l_Row_0.item.select and l_Row_0.item.select.Value) and ((not l_Row_0.item.Path.parent or not l_Row_0.item.Path.parent.select) or not l_Row_0.item.Path.parent.select.Value)) then
        v72 = v25;
    end;
    local v73 = if not l_supportsStyleSheets_0 then v71.Arrow.Size else l_v6_Attribute_0;
    local v74 = l_Row_0.depth * if not l_supportsStyleSheets_0 then v71.Indent else l_v6_Attribute_2;
    local v75 = l_props_6.ColumnIndex == 2;
    local v76 = if not l_supportsStyleSheets_0 then if v67 then v71.SchemaCellPadding else v71.CellPadding else nil;
    local v77 = if not l_supportsStyleSheets_0 then v75 and {
        Top = v76.Top, 
        Left = v71.CellPadding.Left + v74, 
        Right = v76.Right, 
        Bottom = v76.Bottom
    } or v76 else nil;
    local v78 = if not v11 then v75 and l_Row_0.hasChildren else l_Row_0.hasChildren;
    local v79 = 0;
    local v80 = nil;
    if not (not (typeof(v64) == "table") or not v64.Actions) then
        v79 = v79 + if not l_supportsStyleSheets_0 then v71.CellSpacing else l_v6_Attribute_1;
        v80 = {};
        for v81, v82 in ipairs(v64.Actions) do
            v80["Action " .. v81] = v2.createElement(l_IconButton_0, if not l_supportsStyleSheets_0 then {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v81, 
                LeftIcon = v82.Icon.Image, 
                OnClick = function()
                    if l_CellProps_1.OnCellAction then
                        l_CellProps_1.OnCellAction(v82.Id, l_Row_0.item.Path, l_props_6.ColumnIndex);
                    end;
                end, 
                Size = v82.Icon.Size, 
                Style = "Compact", 
                TooltipText = v82.Tooltip
            } else {
                Cursor = "PointingHand", 
                LayoutOrder = v81, 
                LeftIcon = v82.Icon.Image, 
                OnClick = function()
                    if l_CellProps_1.OnCellAction then
                        l_CellProps_1.OnCellAction(v82.Id, l_Row_0.item.Path, l_props_6.ColumnIndex);
                    end;
                end, 
                Size = v82.Icon.Size, 
                TooltipText = v82.Tooltip, 
                IconTag = "Icon16 Primary", 
                [v3.Tag] = l_joinTags_0("Compact", v82[v3.Tag])
            });
            v79 = v79 + 32;
        end;
    end;
    local v83 = 0;
    if v66 then
        v83 = v83 + (if not l_supportsStyleSheets_0 then v71.CellSpacing else l_v6_Attribute_1 + v66.Size.X.Offset);
    end;
    local v84 = if not v11 then v78 else v75;
    if v84 then
        v83 = v83 + (if not l_supportsStyleSheets_0 then v71.CellSpacing else l_v6_Attribute_1 + v73);
    end;
    local v85 = UDim2.new(1, -v83, 1, 0);
    local v86 = if not l_supportsStyleSheets_0 then nil else l_joinTags_0("Component-TreeTableCell", l_props_6.StyleModifier == l_StyleModifier_0.Selected and "Selected" or (l_props_6.Emphasis and "Secondary" or "Row"), l_props_6[v3.Tag]);
    local l_v80_0 = v80;
    if l_v80_0 then
        l_v80_0 = true;
        if l_props_6.StyleModifier ~= l_StyleModifier_0.Hover then
            l_v80_0 = l_props_6.StyleModifier == l_StyleModifier_0.Selected;
        end;
    end;
    return v2.createElement(l_Pane_0, if not l_supportsStyleSheets_0 then {
        Style = "Box", 
        BackgroundColor3 = v72, 
        BorderSizePixel = 1, 
        BorderColor3 = v71.Border, 
        Size = UDim2.new(v61.Scale, v61.Offset, 1, 0), 
        [v2.Change.AbsoluteSize] = v57.onAbsoluteSizeChanged, 
        ClipsDescendants = true
    } else {
        ClipsDescendants = true, 
        Size = UDim2.new(v61.Scale, v61.Offset, 1, 0), 
        [v2.Change.AbsoluteSize] = v57.onAbsoluteSizeChanged, 
        [v3.Tag] = v86
    }, {
        Tooltip = v69 and v2.createElement(l_Tooltip_0, {
            MaxWidth = if not v71 then nil else v71.Tooltip.MaxWidth, 
            Text = v68, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Left = v2.createElement(l_Pane_0, if not l_supportsStyleSheets_0 then {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = l_props_6.ColumnIndex, 
            Padding = v77, 
            Spacing = v71.CellSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Size = if not v12 then UDim2.new(1, -v79, 1, 0) else UDim2.new(1, not l_v80_0 and 0 or -v79, 1, 0)
        } else {
            LayoutOrder = l_props_6.ColumnIndex, 
            Size = if not v12 then UDim2.new(1, -v79 - v74, 1, 0) else UDim2.new(1, if not l_v80_0 then -v74 else -v79 - v74, 1, 0), 
            Position = UDim2.new(0, v74, 0, 0), 
            [v3.Tag] = "Left X-RowM X-Middle"
        }, {
            Toggle = if not v84 then nil else v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }, {
                Icon = v2.createElement("ImageButton", if not l_supportsStyleSheets_0 then {
                    Size = UDim2.fromOffset(v73, v73), 
                    BackgroundTransparency = 1, 
                    ImageTransparency = if not v11 or v78 then nil else 1, 
                    Image = v71.Arrow.Image, 
                    ImageColor3 = v71.Arrow.Color, 
                    ImageRectSize = Vector2.new(v73, v73), 
                    ImageRectOffset = v71.Arrow.CollapsedOffset, 
                    [v2.Ref] = v57.toggleRef, 
                    [v2.Event.Activated] = v57.onToggle
                } else {
                    [v3.Tag] = not v11 and "Arrow" or l_joinTags_0("Arrow", if v78 then nil else "Invisible"), 
                    [v2.Ref] = v57.toggleRef, 
                    [v2.Event.Activated] = v57.onToggle
                })
            }), 
            LeftIcon = not not v66 and v2.createElement(l_Image_0, l_join_0({
                LayoutOrder = 2
            }, v66)) or nil, 
            Text = if not v67 then v57.getTextElement(l_props_6, v65, v85) else v57.getPropertyCell({
                ErrorMessage = v64.ErrorMessage, 
                OnClick = v64.OnClick, 
                OnDoubleClick = v57.onDoubleClick, 
                OnPressed = v57.onPressed, 
                Renderers = v64.Renderers, 
                Schema = v64.Schema, 
                Selected = v64.Selected, 
                Size = v85, 
                Value = v64.Value
            })
        }), 
        Right = if not l_v80_0 then nil else v2.createElement(l_Pane_0, if not l_supportsStyleSheets_0 then {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            Position = UDim2.new(1, -v71.CellSpacing, 0.5, 0), 
            Spacing = v71.CellSpacing
        } else {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -l_v6_Attribute_1, 0.5, 0), 
            [v3.Tag] = "X-RowM X-Fit X-Middle"
        }, v80)
    });
end;
return v26;
