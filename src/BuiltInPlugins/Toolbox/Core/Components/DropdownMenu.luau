local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v7 = require(l_Util_0.Images);
local l_ShowOnTop_0 = v3.UI.ShowOnTop;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v12 = require(l_Components_0.RoundButton);
local v13 = require(l_Components_0.DropdownItemsList);
local v14 = v2.PureComponent:extend("DropdownMenu");
v14.init = function(v15, _)
    v15.state = {
        isShowingDropdown = false, 
        showDropDownButtonHovered = false
    };
    v15.currentSelectionRef = v2.createRef();
    v15.baseFrameRef = v2.createRef();
    v15.openDropdown = function()
        if not v15.props.Disabled then
            v15:setState(function(_, _)
                v15.props.Modal.onDropdownToggled(true);
                return {
                    isShowingDropdown = true
                };
            end);
            return ;
        else
            return ;
        end;
    end;
    v15.showDropDownButtonEntered = function()
        if not v15.props.Disabled then
            v15:setState({
                showDropDownButtonHovered = true
            });
            return ;
        else
            return ;
        end;
    end;
    v15.showDropDownButtonLeft = function()
        if not v15.props.Disabled then
            v15:setState({
                showDropDownButtonHovered = false
            });
            return ;
        else
            return ;
        end;
    end;
    v15.closeDropdown = function()
        v15.props.Modal.onDropdownToggled(false);
        v15:setState({
            isShowingDropdown = false
        });
    end;
    v15.focusLost = function(_, v20)
        if v20.UserInputType == Enum.UserInputType.Focus then
            v15.closeDropdown();
        end;
    end;
    v15.refresh = function(_)
        if v15.currentSelectionRef.current then
            local l_current_0 = v15.currentSelectionRef.current;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
            local v25 = l_AbsoluteSize_0.X or v5.DROPDOWN_WIDTH;
            local v26 = (l_AbsolutePosition_0.y + l_AbsoluteSize_0.y) + 2;
            local l_x_0 = l_AbsolutePosition_0.x;
            if not (v15.state.dropDownWidth == v25 and v15.state.dropDownTop == v26) or v15.state.dropDownLeft ~= l_x_0 then
                v15:setState({
                    dropDownWidth = v25, 
                    dropDownTop = v26, 
                    dropDownLeft = l_x_0
                });
            end;
        end;
    end;
    v15.onItemClicked = function(v28, v29)
        if v15.props.onItemClicked then
            v15.props.onItemClicked(v28, v29);
        end;
        v15.closeDropdown();
    end;
end;
local function _(v30)
    local v31 = true;
    if v30.selectable ~= nil then
        v31 = v30.selectable;
    end;
    return v31;
end;
local function v37(v33)
    for v34, v35 in ipairs(v33) do
        local v36 = true;
        if v35.selectable ~= nil then
            v36 = v35.selectable;
        end;
        if v36 then
            return v34;
        end;
    end;
    warn("No selectable items found in DropdownMenu");
    return 1;
end;
v14.didMount = function(v38)
    v38.refresh();
end;
v14.render = function(v39)
    local l_props_0 = v39.props;
    local l_state_0 = v39.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_menuKey_0 = l_props_0.menuKey;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local v46 = l_props_0.LayoutOrder or 0;
    local v47 = l_props_0.items or {};
    local v48 = math.min(l_props_0.visibleDropDownCount or 5, #v47);
    local v49 = l_props_0.rowHeight or 24;
    local v50 = l_props_0.selectedDropDownIndex or 1;
    local v51 = l_props_0.fontSize or v5.FONT_SIZE_MEDIUM;
    local l_setDropdownHeight_0 = l_props_0.setDropdownHeight;
    if #v47 < v50 then
        v50 = 0;
    end;
    local v53 = false;
    if v50 > 0 then
        v53 = false;
        if v50 <= #v47 then
            v53 = v47[v50];
            if v53 then
                local v54 = v47[v50];
                local v55 = true;
                if v54.selectable ~= nil then
                    v55 = v54.selectable;
                end;
                v53 = not v55;
            end;
        end;
    end;
    if v53 then
        v50 = v37(v47);
    end;
    local v56 = false;
    if v50 > 0 then
        v56 = v50 <= #v47;
    end;
    local v57 = l_props_0.Localization:getText("Dropdown", "ChooseOne");
    if not ((not v56 or not v47[v50]) or not v47[v50].name) then
        v57 = v47[v50].name;
    end;
    local v58 = v5.DROPDOWN_SELECTED_BAR + v5.DROPDOWN_TEXT_INSET;
    local v59 = (v5.DROPDOWN_ICON_SIZE * v51) / v5.FONT_SIZE_MEDIUM;
    local l_DROPDOWN_ICON_FROM_RIGHT_0 = v5.DROPDOWN_ICON_FROM_RIGHT;
    local l_currentSelection_0 = l_Stylizer_0.dropdownMenu.currentSelection;
    local l_showDropDownButtonHovered_0 = l_state_0.showDropDownButtonHovered;
    local l_isShowingDropdown_0 = l_state_0.isShowingDropdown;
    local v64 = l_isShowingDropdown_0 or l_showDropDownButtonHovered_0;
    return v2.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v39.baseFrameRef, 
        LayoutOrder = v46
    }, {
        CurrentSelection = v2.createElement(v12, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = if not l_props_0.Disabled then if v64 then l_currentSelection_0.backgroundSelectedColor else l_currentSelection_0.backgroundColor else l_currentSelection_0.backgroundDisabledColor, 
            BorderColor3 = not not v64 and l_currentSelection_0.borderSelectedColor or l_currentSelection_0.borderColor, 
            [v2.Ref] = v39.currentSelectionRef, 
            [v2.Event.Activated] = v39.openDropdown, 
            [v2.Event.MouseEnter] = v39.showDropDownButtonEntered, 
            [v2.Event.MouseLeave] = v39.showDropDownButtonLeft, 
            [v2.Event.InputEnded] = v39.focusLost, 
            [v2.Change.AbsolutePosition] = v39.refresh, 
            [v2.Change.AbsoluteSize] = v39.refresh
        }, {
            CurrentSelectionLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, v58, 0, 0), 
                Size = UDim2.new(1, -((v58 + v59) + l_DROPDOWN_ICON_FROM_RIGHT_0), 1, 0), 
                BackgroundTransparency = 1, 
                TextColor3 = not not v64 and l_currentSelection_0.textSelectedColor or l_currentSelection_0.textColor, 
                Text = v57, 
                Font = v5.FONT, 
                TextSize = v51, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ClipsDescendants = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            DropDownIcon = v2.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, v59, 0, v59), 
                Position = UDim2.new(1, -l_DROPDOWN_ICON_FROM_RIGHT_0, 0.5, 0), 
                Image = v7.ARROW_DOWN_ICON, 
                Rotation = not l_isShowingDropdown_0 and 0 or 180, 
                ImageColor3 = l_currentSelection_0.dropdownIconColor, 
                BackgroundTransparency = 1
            })
        }), 
        DropdownItemsWrapper = l_isShowingDropdown_0 and v2.createElement(l_ShowOnTop_0, {
            Priority = 2
        }, {
            DropdownItemsList = v2.createElement(v13, {
                listKey = l_menuKey_0, 
                items = v47, 
                visibleDropDownCount = v48, 
                rowHeight = v49, 
                fontSize = v51, 
                onItemClicked = v39.onItemClicked, 
                closeDropdown = v39.closeDropdown, 
                setDropdownHeight = l_setDropdownHeight_0, 
                dropDownWidth = l_state_0.dropDownWidth, 
                top = l_state_0.dropDownTop, 
                left = l_state_0.dropDownLeft
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Modal = v6
})(v14));
