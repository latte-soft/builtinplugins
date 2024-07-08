local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.DebugFlags);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local l_Components_0 = l_Parent_0.Core.Components;
local v11 = require(l_Components_0.StyledScrollingFrame);
local v12 = require(l_Components_0.ClickEventDetectFrame);
local v13 = require(l_Components_0.RoundFrame);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxDropdownItemsListHoverFix);
local v15 = v2.PureComponent:extend("DropdownItemsList");
v15.init = function(v16)
    v16.state = {
        dropdownHoveredItemIndex = 0
    };
    v16.onDropdownItemMouseEntered = function(v17)
        if not v14() then
            v16:setState({
                dropdownHoveredItemIndex = v17
            });
            return ;
        else
            v16:setState(function(v18)
                if v18.dropdownHoveredItemIndex == v17 then
                    return ;
                else
                    return {
                        dropdownHoveredItemIndex = v17
                    };
                end;
            end);
            return ;
        end;
    end;
    v16.onDropdownItemMouseLeft = function(v19)
        if not v14() then
            if v16.state.dropdownHoveredItemIndex == v19 then
                v16:setState({
                    dropdownHoveredItemIndex = 0
                });
            end;
            return ;
        else
            v16:setState(function(v20)
                if v20.dropdownHoveredItemIndex == v19 then
                    return {
                        dropdownHoveredItemIndex = 0
                    };
                else
                    return ;
                end;
            end);
            return ;
        end;
    end;
    v16.onDropdownItemActivated = function(v21, v22, v23)
        if v23 then
            v23(v21, v22);
        end;
    end;
    v16.lastReportedHeight = nil;
end;
local function _(v24)
    local v25 = true;
    if v24.selectable ~= nil then
        v25 = v24.selectable;
    end;
    return v25;
end;
v15.getScrollButtons = function(v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
    local l_isDarkerTheme_0 = v37.isDarkerTheme;
    local l_dropdownMenu_0 = v37.dropdownMenu;
    local l_item_0 = l_dropdownMenu_0.item;
    local v41 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v42, v43 in ipairs(v28) do
        if not (v43.name or not v6.shouldDebugWarnings()) then
            warn(("Index %d in DropdownMenu doesn't have a 'name' member"):format(v42));
        end;
        local v44 = true;
        if v43.selectable ~= nil then
            v44 = v43.selectable;
        end;
        local v45 = not not v44 and l_item_0.textColor or l_item_0.labelTextColor;
        local l_name_0 = v43.name;
        local v47 = false;
        if v29 == v42 then
            v47 = v44;
        end;
        local v48 = not not v30 and v43[v30] or l_name_0;
        v31 = math.max(v31, (l_GetTextSize_0(l_name_0, v34, nil, Vector2.new(0, 0)).X + v32 * 2) + v5.SCROLLBAR_BACKGROUND_THICKNESS);
        v41[v48 or l_name_0] = v2.createElement("ImageButton", {
            Size = UDim2.new(1, -v5.SCROLLBAR_BACKGROUND_THICKNESS + v5.SCROLLBAR_PADDING, 0, v33), 
            BackgroundColor3 = not not v47 and l_item_0.backgroundSelectedColor or l_item_0.backgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = v42, 
            ZIndex = 2, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = function(_, _, _)
                if v44 then
                    v27.onDropdownItemActivated(v42, v43, v35);
                end;
            end, 
            [v2.Event.MouseEnter] = function(_, _, _)
                v27.onDropdownItemMouseEntered(v42);
            end, 
            [v2.Event.MouseLeave] = function(_, _, _)
                v27.onDropdownItemMouseLeft(v42);
            end, 
            [v2.Event.InputEnded] = v27.focusLost
        }, {
            SelectedBar = not l_isDarkerTheme_0 and v2.createElement("Frame", {
                Size = UDim2.new(0, v36, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_dropdownMenu_0.item.selectedBarColor, 
                Visible = v47, 
                ZIndex = 2
            }), 
            TextLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, v32, 0, 0), 
                Size = UDim2.new(1, -v32, 1, 0), 
                BackgroundTransparency = 1, 
                Text = l_name_0, 
                TextColor3 = v45, 
                Font = v5.FONT, 
                TextSize = v34, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ClipsDescendants = true, 
                ZIndex = 3
            })
        });
    end;
    return v41;
end;
v15.render = function(v58)
    local l_props_0 = v58.props;
    local l_state_0 = v58.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_listKey_0 = l_props_0.listKey;
    local l_left_0 = l_props_0.left;
    local l_top_0 = l_props_0.top;
    local l_dropDownWidth_0 = l_props_0.dropDownWidth;
    local v66 = l_props_0.items or {};
    local v67 = #v66;
    local v68 = math.min(l_props_0.visibleDropDownCount or 5, v67);
    local v69 = l_props_0.rowHeight or 24;
    local v70 = l_props_0.fontSize or v5.FONT_SIZE_MEDIUM;
    local l_setDropdownHeight_0 = l_props_0.setDropdownHeight;
    local l_windowPosition_0 = l_props_0.windowPosition;
    local l_windowSize_0 = l_props_0.windowSize;
    local l_onItemClicked_0 = l_props_0.onItemClicked;
    local l_DROPDOWN_SELECTED_BAR_0 = v5.DROPDOWN_SELECTED_BAR;
    local v76 = l_DROPDOWN_SELECTED_BAR_0 + v5.DROPDOWN_TEXT_INSET;
    local l_dropdownMenu_1 = l_Stylizer_0.dropdownMenu;
    local l_dropdownHoveredItemIndex_0 = l_state_0.dropdownHoveredItemIndex;
    local l_DROPDOWN_WIDTH_0 = v5.DROPDOWN_WIDTH;
    local v80 = v68 * v69;
    if l_setDropdownHeight_0 and v58.lastReportedHeight ~= v80 then
        v58.lastReportedHeight = v80;
        l_setDropdownHeight_0(v80);
    end;
    return v2.createElement(v12, {
        windowPosition = l_windowPosition_0, 
        windowSize = l_windowSize_0, 
        [v2.Event.Activated] = v58.props.closeDropdown
    }, {
        StyledScrollingFrame = v2.createElement(v11, {
            Position = UDim2.new(0, l_left_0, 0, l_top_0), 
            Size = UDim2.new(0, l_dropDownWidth_0, 0, v80), 
            CanvasSize = UDim2.new(0, 0, 0, v67 * v69), 
            ZIndex = 1
        }, (v58:getScrollButtons(v66, l_dropdownHoveredItemIndex_0, l_listKey_0, l_DROPDOWN_WIDTH_0, v76, v69, v70, l_onItemClicked_0, l_DROPDOWN_SELECTED_BAR_0, l_Stylizer_0))), 
        DropDownContainer = v2.createElement(v13, {
            Position = UDim2.new(0, l_left_0, 0, l_top_0), 
            Size = UDim2.new(0, l_dropDownWidth_0, 0, v80), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            BorderColor3 = l_dropdownMenu_1.dropdownFrame.borderColor
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));
