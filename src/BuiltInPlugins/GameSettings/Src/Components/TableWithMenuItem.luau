local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_FitTextLabel_0 = v3.Util.FitFrame.FitTextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextService_0 = game:GetService("TextService");
local v12 = v1.PureComponent:extend("TableWithMenuItem");
local function v21(v13, v14, v15)
    local v16 = {};
    local v17 = 1 / (#v14 + 1);
    for v18 = 0, #v14 do
        local v19 = v14[v18];
        local _ = nil;
        v16[v18] = if v18 == 0 then v1.createElement("Frame", {
            LayoutOrder = v18, 
            Size = UDim2.new(v17, 0, 0, v13.table.icon.height), 
            BackgroundTransparency = 1
        }, {
            Icon = v1.createElement("Frame", {
                Size = UDim2.new(0, v13.table.icon.height, 0, v13.table.icon.height), 
                BackgroundTransparency = 1
            }, {
                Icon = v15
            })
        }) else if v18 ~= #v14 then v1.createElement("TextLabel", v2.Dictionary.join(v13.fontStyle.Smaller, {
            Size = UDim2.new(v17, 0, 0, v13.table.item.height), 
            LayoutOrder = v18, 
            Text = v19, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v19, 
                Enabled = true
            })
        }) else v1.createElement("TextLabel", v2.Dictionary.join(v13.fontStyle.Smaller, {
            Size = UDim2.new(v17, -v13.table.menu.buttonSize, 0, v13.table.item.height), 
            LayoutOrder = v18, 
            Text = v19, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v19, 
                Enabled = true
            })
        });
    end;
    return v16;
end;
local function v28(v22, v23)
    local v24 = {};
    for v25 = 1, #v23 do
        local v26 = v23[v25];
        local _ = nil;
        v24[v25] = if v25 ~= #v23 then v1.createElement("TextLabel", v2.Dictionary.join(v22.fontStyle.Smaller, {
            Size = UDim2.new(1 / #v23, 0, 0, v22.table.item.height), 
            LayoutOrder = v25, 
            Text = v26, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v26, 
                Enabled = true
            })
        }) else v1.createElement("TextLabel", v2.Dictionary.join(v22.fontStyle.Smaller, {
            Size = UDim2.new(1 / #v23, -v22.table.menu.buttonSize, 0, v22.table.item.height), 
            LayoutOrder = v25, 
            Text = v26, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = v26, 
                Enabled = true
            })
        });
    end;
    return v24;
end;
v12.init = function(v29)
    v29.state = {
        showMenu = false, 
        isButtonHovered = false, 
        menuItem = nil
    };
    v29.buttonRef = v1.createRef();
    v29.onItemClicked = function(v30)
        v29.props.OnItemClicked(v30.Key);
        v29.hideMenu();
    end;
    v29.showMenu = function()
        v29:setState({
            showMenu = true
        });
    end;
    v29.hideMenu = function()
        v29:setState({
            showMenu = false, 
            menuItem = v1.None
        });
    end;
    v29.onMenuItemEnter = function(v31)
        v29:setState({
            menuItem = v31
        });
    end;
    v29.onMenuItemLeave = function(v32)
        if v29.state.menuItem == v32 then
            v29:setState({
                menuItem = v1.None
            });
        end;
    end;
end;
v12.renderMenuItem = function(v33, v34, v35, v36, v37, v38)
    local l_Key_0 = v34.Key;
    local l_Text_0 = v34.Text;
    local v41 = v33.state.menuItem == l_Key_0;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Text_0, v37.fontStyle.Normal.TextSize, v37.fontStyle.Normal.Font, Vector2.new(v38, math.huge));
    local l_background_0 = v37.dropDownEntry.background;
    if v41 then
        l_background_0 = v37.dropDownEntry.hovered;
    end;
    return v1.createElement("ImageButton", {
        Size = UDim2.new(0, v38, 0, l_l_TextService_0_TextSize_0.Y + v37.table.menu.buttonPaddingY), 
        BackgroundColor3 = l_background_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v35, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v36, 
        [v1.Event.MouseEnter] = function()
            v33.onMenuItemEnter(l_Key_0);
        end, 
        [v1.Event.MouseLeave] = function()
            v33.onMenuItemLeave(l_Key_0);
        end
    }, {
        v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        }); 
        Label = v1.createElement("TextLabel", v2.Dictionary.join(v37.fontStyle.Smaller, {
            Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_0.Y), 
            Position = UDim2.new(0, v37.table.textPadding, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Text = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1
        }))
    });
end;
v12.render = function(v44)
    local l_props_0 = v44.props;
    local l_state_0 = v44.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_RowData_0 = l_props_0.RowData;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Icon_0 = l_props_0.Icon;
    local v51 = not not l_Icon_0 and v21(l_Stylizer_0, l_RowData_0, l_Icon_0) or v28(l_Stylizer_0, l_RowData_0);
    local l_showMenu_0 = l_state_0.showMenu;
    local l_MenuItems_0 = l_props_0.MenuItems;
    local v54 = 0;
    for _, v56 in ipairs(l_MenuItems_0) do
        v54 = math.max(v54, l_TextService_0:GetTextSize(v56.Text, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(math.huge, math.huge)).X + l_Stylizer_0.table.menu.itemPadding);
    end;
    v51[#l_RowData_0 + 1] = v1.createElement("ImageButton", {
        Size = UDim2.new(0, l_Stylizer_0.table.menu.buttonSize, 0, l_Stylizer_0.table.menu.buttonSize), 
        LayoutOrder = #l_RowData_0 + 1, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v44.buttonRef, 
        [v1.Event.Activated] = v44.showMenu
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_Stylizer_0.table.item.padding)
        }), 
        Dots = v1.createElement(l_FitTextLabel_0, v2.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = "...", 
            Font = Enum.Font.SourceSansBold, 
            BackgroundTransparency = 1, 
            width = l_Stylizer_0.table.menu.buttonSize
        })), 
        Menu = v1.createElement(l_DropdownMenu_0, {
            Hide = not l_showMenu_0, 
            Items = l_MenuItems_0, 
            OnFocusLost = v44.hideMenu, 
            OnItemActivated = v44.onItemClicked, 
            OnRenderItem = function(v57, v58, v59)
                return v44:renderMenuItem(v57, v58, v59, l_Stylizer_0, v54);
            end, 
            Width = v54
        }); 
        v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        })
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, not not l_Icon_0 and l_Stylizer_0.table.icon.height + 10 or l_Stylizer_0.table.item.height), 
        BackgroundColor3 = l_Stylizer_0.table.item.background, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, v2.Dictionary.join({
        RowLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.table.textPadding), 
            PaddingRight = UDim.new(0, l_Stylizer_0.table.textPadding)
        })
    }, v51));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v12));
