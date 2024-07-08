local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v12 = require(l_script_FirstAncestor_0.Src.Components.ScriptIconView);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v14 = v2.PureComponent:extend("ScriptIssueRow");
local l_R15MigShowLinkedText_0 = game:GetFastFlag("R15MigShowLinkedText");
v14.isDoubleClick = function(v16)
    local v17 = tick();
    local v18 = v17 < v16.lastClickTime + 0.5;
    v16.lastClickTime = v17;
    return v18;
end;
v14.init = function(v19)
    v19.state = {
        maxLabelSizeX = 0
    };
    v19.rowContainerRef = v2.createRef();
    v19.lastClickTime = 0;
    v19.onToggle = function()
        local l_props_0 = v19.props;
        l_props_0.OnToggle(l_props_0.Row);
    end;
    v19.onClick = function()
        local l_props_1 = v19.props;
        l_props_1.OnClick(l_props_1.Row);
    end;
    v19.onDoubleClick = function()
        local l_props_2 = v19.props;
        if v19:isDoubleClick() then
            l_props_2.OnDoubleClick(l_props_2.Row);
        end;
    end;
    v19.onRightClick = function()
        local l_props_3 = v19.props;
        l_props_3.OnRightClick(l_props_3.Row);
    end;
    v19.onLinkClick = function()
        local l_props_4 = v19.props;
        print((("Row %*"):format((game.HttpService:JSONEncode(l_props_4.Row)))));
        l_GuiService_0:OpenBrowserWindow(l_props_4.Row.item.url);
    end;
    v19.onAbsoluteSizeChanged = function(v25)
        if v25 then
            local v26 = 0;
            for _, v28 in v25:GetChildren() do
                if not (not (v28.Name ~= "Label") or not v28:IsA("GuiObject")) then
                    v26 = v26 + v28.AbsoluteSize.X;
                end;
            end;
            v19:setState({
                maxLabelSizeX = (v25.AbsoluteSize.X - v26) - v19:calculateIndent()
            });
            return ;
        else
            return ;
        end;
    end;
end;
local function _(v29)
    return "(" .. v29.startLine .. "," .. v29.startCharacter .. ")";
end;
v14.calculateIndent = function(v31)
    local l_props_5 = v31.props;
    return l_props_5.Row.depth * l_props_5.Stylizer.Indent;
end;
v14.didUpdate = function(v33, v34)
    if v33.props.Row ~= v34.Row then
        v33.onAbsoluteSizeChanged(v33.rowContainerRef.current);
    end;
end;
local function v39(v35, v36, v37, v38)
    if not l_R15MigShowLinkedText_0 then
        return v2.createElement(l_TextLabel_0, {
            Text = ("<font color = \"rgb(43, 177, 255)\"> %* </font>"):format(v35.codeText), 
            TextSize = v37.TextSize, 
            LayoutOrder = v36:getNextOrder(), 
            RichText = true, 
            AutomaticSize = Enum.AutomaticSize.XY
        });
    else
        return v2.createElement(l_LinkText_0, {
            Text = v35.codeText, 
            TextSize = v37.TextSize, 
            LayoutOrder = v36:getNextOrder(), 
            OnClick = v38, 
            Disabled = true
        });
    end;
end;
v14.render = function(v40)
    local l_state_0 = v40.state;
    local l_props_6 = v40.props;
    local l_Stylizer_0 = l_props_6.Stylizer;
    local l_Size_0 = l_props_6.Size;
    local l_item_0 = l_props_6.Row.item;
    local l_Expanded_0 = l_props_6.Expanded;
    local l_Selected_0 = l_props_6.Selected;
    local v48 = l_item_0.children and #l_item_0.children > 0;
    local v49 = v40:calculateIndent();
    local l_Size_1 = l_Stylizer_0.Arrow.Size;
    local v51 = l_item_0.codeText ~= nil;
    local l_initialIssueCount_0 = l_item_0.initialIssueCount;
    local l_maxLabelSizeX_0 = l_state_0.maxLabelSizeX;
    local v54 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v57 = {
        Style = "Box", 
        BorderSizePixel = 0, 
        Size = l_Size_0, 
        Position = l_props_6.Position, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    };
    local v58 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v61 = {
        LayoutOrder = v54:getNextOrder(), 
        Size = UDim2.new(1, -l_Stylizer_0.IconViewSize.X.Offset - l_Stylizer_0.Spacing, 1, 0), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        OnClick = v40.onDoubleClick, 
        OnRightClick = v40.onRightClick, 
        Padding = {
            Left = v49
        }, 
        ForwardRef = v40.rowContainerRef, 
        [v2.Change.AbsoluteSize] = v40.onAbsoluteSizeChanged
    };
    local v62 = {
        Checkbox = v2.createElement(l_Checkbox_0, {
            LayoutOrder = v54:getNextOrder(), 
            Checked = l_Selected_0, 
            OnClick = v40.onClick
        }), 
        Arrow = v48 and v2.createElement("ImageButton", {
            LayoutOrder = v54:getNextOrder(), 
            Size = UDim2.new(0, l_Size_1, 0, l_Size_1), 
            BackgroundTransparency = 1, 
            Image = l_Stylizer_0.Arrow.Image, 
            ImageColor3 = l_Stylizer_0.Arrow.Color, 
            ImageRectSize = Vector2.new(l_Size_1, l_Size_1), 
            ImageRectOffset = if not l_Expanded_0 then l_Stylizer_0.Arrow.CollapsedOffset else l_Stylizer_0.Arrow.ExpandedOffset, 
            [v2.Event.Activated] = v40.onToggle
        }), 
        ArrowPadding = v2.createElement(l_Pane_0, {
            Size = UDim2.fromOffset(l_Stylizer_0.Arrow.Padding, 0), 
            LayoutOrder = v54:getNextOrder()
        }), 
        WarningLink = v51 and v39(l_item_0, v54, l_Stylizer_0, v40.onLinkClick)
    };
    local l_v51_0 = v51;
    if l_v51_0 then
        l_v51_0 = v2.createElement;
        local l_l_TextLabel_0_0 = l_TextLabel_0;
        local v65 = {};
        local l_range_0 = l_item_0.range;
        v65.Text = "(" .. l_range_0.startLine .. "," .. l_range_0.startCharacter .. ")";
        v65.TextSize = l_Stylizer_0.TextSize;
        v65.AutomaticSize = Enum.AutomaticSize.XY;
        v65.LayoutOrder = v54:getNextOrder();
        l_v51_0 = l_v51_0(l_l_TextLabel_0_0, v65);
    end;
    v62.RangeLabel = l_v51_0;
    v62.Separator = v51 and v2.createElement(l_TextLabel_0, {
        Text = ": ", 
        TextSize = l_Stylizer_0.TextSize, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v54:getNextOrder()
    });
    v62.Label = v2.createElement(l_TextLabel_0, {
        Text = l_item_0.text, 
        TextSize = l_Stylizer_0.TextSize, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v54:getNextOrder(), 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, {
        SizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(l_maxLabelSizeX_0, l_Size_0.Y.Offset)
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = l_item_0.text
        })
    });
    l_v51_0 = false;
    if l_initialIssueCount_0 ~= nil then
        l_v51_0 = v2.createElement(l_TextLabel_0, {
            Text = "(" .. l_initialIssueCount_0 .. ")", 
            Style = "Label", 
            TextSize = l_Stylizer_0.TextSize, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v54:getNextOrder()
        });
    end;
    v62.IssueCount = l_v51_0;
    v58.RowContainer = l_createElement_1(l_l_Pane_0_1, v61, v62);
    v58.IconContainer = if not l_item_0.statuses then nil else v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v54:getNextOrder()
    }, {
        ScriptIconView = v2.createElement(v12, {
            Size = l_Stylizer_0.IconViewSize, 
            Statuses = l_item_0.statuses, 
            ShowCounts = not v51
        })
    });
    return l_createElement_0(l_l_Pane_0_0, v57, v58);
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14));
