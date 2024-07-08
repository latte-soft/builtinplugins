local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DropdownMenu_0 = v3.UI.DropdownMenu;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v8 = v1.PureComponent:extend("FilteringTextBox");
v8.init = function(v9, v10)
    v9.state = {
        hoveredItem = nil, 
        currentText = v10.Text or ""
    };
    v9.frameRef = v1.createRef();
    v9.onItemClicked = function(v11)
        v9.props.OnItemClicked(v11);
    end;
    v9.onItemMouseEnter = function(v12)
        v9:setState({
            hoveredItem = v12
        });
    end;
    v9.onItemMouseLeave = function(v13)
        if v9.state.hoveredItem == v13 then
            v9:setState({
                hoveredItem = v1.None
            });
        end;
    end;
    v9.updateText = function(v14)
        v9:setState({
            currentText = v14
        });
    end;
    v9.onFocusChanged = function(v15, v16, v17)
        if v17 or v9.state.hoveredItem == nil then
            v9.props.FocusChanged(v15, v16, v17);
        end;
        v9.updateText(v15.Text);
    end;
end;
v8.render = function(v18)
    local l_props_0 = v18.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_dropdownTheme_0 = l_Stylizer_0.dropdownTheme;
    local l_state_0 = v18.state;
    local v23 = v18.frameRef and v18.frameRef.current;
    local v24 = nil;
    if v23 then
        local l_AbsolutePosition_0 = v23.AbsolutePosition;
        local v26 = l_AbsolutePosition_0 + v23.AbsoluteSize;
        v24 = Rect.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, v26.X, v26.Y);
    end;
    local v27 = l_props_0.Items or {};
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_MaxItems_0 = l_props_0.MaxItems;
    local l_currentText_0 = l_state_0.currentText;
    local l_hoveredItem_0 = l_state_0.hoveredItem;
    local v34 = v2.List.filter(v27, function(v33)
        return string.find(v33, l_currentText_0, 1, true) ~= nil;
    end);
    local l_createElement_0 = v1.createElement;
    local v36 = "Frame";
    local v37 = {
        Size = l_Size_0, 
        Position = l_Position_0, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v18.frameRef
    };
    local v38 = {
        TextBox = v1.createElement(v7, v2.Dictionary.join(l_props_0, {
            Size = UDim2.new(1, 0, 1, 0), 
            FocusChanged = v18.onFocusChanged, 
            TextChanged = v18.updateText
        }))
    };
    local v39 = false;
    if #v34 > 0 then
        v39 = v23 and v1.createElement(l_DropdownMenu_0, {
            OnItemActivated = v18.onItemClicked, 
            OnFocusLost = v18.hideDropdown, 
            SourceExtents = v24, 
            MaxHeight = not not l_MaxItems_0 and l_dropdownTheme_0.itemHeight * l_MaxItems_0 or nil, 
            Width = v24.Width, 
            ShowBorder = true, 
            ScrollBarPadding = 2, 
            ScrollBarThickness = 10, 
            Items = v34, 
            OnRenderItem = function(v40, v41, v42)
                return v1.createElement("TextButton", {
                    Size = UDim2.new(0, v24.Width, 0, 22), 
                    Font = l_Stylizer_0.font, 
                    TextSize = l_dropdownTheme_0.textSize, 
                    Text = v40, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = l_dropdownTheme_0.textColor, 
                    BackgroundColor3 = l_hoveredItem_0 == v40 and l_dropdownTheme_0.hoveredItemColor or l_dropdownTheme_0.itemColor, 
                    BorderSizePixel = 0, 
                    AutoButtonColor = false, 
                    LayoutOrder = v41, 
                    [v1.Event.Activated] = v42, 
                    [v1.Event.MouseEnter] = function()
                        v18.onItemMouseEnter(v40);
                    end, 
                    [v1.Event.MouseLeave] = function()
                        v18.onItemMouseLeave(v40);
                    end
                }, {
                    Padding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 5)
                    })
                });
            end
        });
    end;
    v38.Dropdown = v39;
    return l_createElement_0(v36, v37, v38);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
