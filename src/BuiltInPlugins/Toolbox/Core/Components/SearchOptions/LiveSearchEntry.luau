local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("LiveSearchEntry");
v7.init = function(v8, _)
    v8.state = {
        hovering = false
    };
    v8.closeDropdown = function()
        if v8.props.closeDropdown then
            v8.props.closeDropdown();
        end;
    end;
    v8.onClick = function()
        if v8.props.onClick then
            v8.props.onClick();
        end;
        v8.closeDropdown();
    end;
    v8.mouseEnter = function()
        v8:setState({
            hovering = true
        });
    end;
    v8.mouseLeave = function()
        v8:setState({
            hovering = false
        });
    end;
end;
v7.render = function(v10)
    local l_DROPDOWN_SELECTED_BAR_0 = v4.DROPDOWN_SELECTED_BAR;
    local l_SEARCH_ENTRY_HEIGHT_0 = v4.SEARCH_ENTRY_HEIGHT;
    local l_Stylizer_0 = v10.props.Stylizer;
    local l_isDarkerTheme_0 = l_Stylizer_0.isDarkerTheme;
    local l_dropdownMenu_0 = l_Stylizer_0.dropdownMenu;
    local l_item_0 = l_dropdownMenu_0.item;
    local l_hovering_0 = v10.state.hovering;
    return v2.createElement("ImageButton", {
        Size = UDim2.new(1, -v4.SCROLLBAR_BACKGROUND_THICKNESS + v4.SCROLLBAR_PADDING, 0, l_SEARCH_ENTRY_HEIGHT_0), 
        BackgroundColor3 = not not l_hovering_0 and l_item_0.backgroundSelectedColor or l_item_0.backgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = v10.props.LayoutOrder, 
        ZIndex = 2, 
        AutoButtonColor = false, 
        [v2.Event.Activated] = v10.onClick, 
        [v2.Event.MouseEnter] = v10.mouseEnter, 
        [v2.Event.MouseLeave] = v10.mouseLeave
    }, {
        SelectedBar = not l_isDarkerTheme_0 and v2.createElement("Frame", {
            Size = UDim2.new(0, l_DROPDOWN_SELECTED_BAR_0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_dropdownMenu_0.item.selectedBarColor, 
            Visible = l_hovering_0, 
            ZIndex = 2
        }), 
        Container = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            Thumbnail = v2.createElement("ImageLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(0.8, 0, 0.8, 0), 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = v10.props.Thumbnail, 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }), 
            TextLabel = v2.createElement("TextLabel", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v10.props.Name, 
                TextColor3 = l_item_0.textColor, 
                Font = v4.FONT, 
                TextSize = v4.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                ClipsDescendants = true, 
                ZIndex = 3
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
