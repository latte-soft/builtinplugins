local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.Images);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextService_0 = game:GetService("TextService");
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_DropdownMenu_0 = v3.UI.DropdownMenu;
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local v13 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.CollaboratorSearchItem);
local v14 = v2.PureComponent:extend("CollaboratorSearchBar");
local function _(v15)
    return not not v15 and v15:gsub("\n", " ") or "";
end;
v14.init = function(v17)
    v17.state = {
        text = "", 
        isFocused = false, 
        isContainerHovered = false, 
        isClearButtonHovered = false, 
        showDropdown = false, 
        dropdownItem = nil, 
        lastDelay = {}, 
        lastResults = {}, 
        mergedItems = {}
    };
    v17.textBoxRef = v2.createRef();
    v17.requestSearch = function()
        v17.props.onSearchRequested(v17.state.text);
    end;
    v17.onContainerHovered = function()
        v17:setState({
            isContainerHovered = true
        });
    end;
    v17.onContainerHoverEnded = function()
        v17:setState({
            isContainerHovered = false
        });
    end;
    v17.onTextChanged = function(v18)
        local l_Text_0 = v18.Text;
        local v20 = not not l_Text_0 and l_Text_0:gsub("\n", " ") or "";
        l_Text_0 = v17.textBoxRef.current;
        if v17.state.text ~= v20 then
            v17:setState({
                text = v20
            });
            if v17.props.onTextChanged then
                v17.props.onTextChanged(v20);
            end;
            local v21 = {};
            v17.state.lastDelay = v21;
            delay(0.5, function()
                if v21 == v17.state.lastDelay and v20 ~= "" then
                    v17.requestSearch();
                    if not v17.state.showDropdown and next(v17.state.mergedItems) ~= nil then
                        v17.showDropdown();
                    end;
                end;
            end);
            if l_Text_0.AbsoluteSize.x < l_TextService_0:GetTextSize(v20, l_Text_0.TextSize, l_Text_0.Font, Vector2.new(math.huge, math.huge)).x then
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Right;
                return ;
            else
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Left;
            end;
        end;
    end;
    v17.onTextBoxFocused = function(_)
        local l_current_0 = v17.textBoxRef.current;
        v17:setState({
            isFocused = true
        });
        if not v17.props.Enabled then
            l_current_0:ReleaseFocus();
        end;
        if next(v17.state.mergedItems) ~= nil then
            v17.showDropdown();
        end;
    end;
    v17.onTextBoxFocusLost = function(_, _, _)
        v17:setState({
            isFocused = false, 
            isContainerHovered = false
        });
    end;
    v17.onClearButtonHovered = function()
        v17:setState({
            isClearButtonHovered = true
        });
    end;
    v17.onClearButtonHoverEnded = function()
        v17:setState({
            isClearButtonHovered = false
        });
    end;
    v17.onClearButtonClicked = function()
        local l_current_1 = v17.textBoxRef.current;
        v17:setState({
            isFocused = true
        });
        l_current_1.Text = "";
        l_current_1:CaptureFocus();
        l_current_1.TextXAlignment = Enum.TextXAlignment.Left;
        v17.onClearButtonHoverEnded();
    end;
    v17.onItemClicked = function(v28)
        v17.props.OnItemClicked(v28.Key);
        v17.hideDropdown();
    end;
    v17.showDropdown = function()
        v17:setState({
            showDropdown = true
        });
    end;
    v17.hideDropdown = function()
        if not v17.state.isFocused then
            v17:setState({
                showDropdown = false, 
                dropdownItem = v2.None
            });
        end;
    end;
    if v17.props.onTextChanged then
        v17.props.onTextChanged("");
    end;
end;
v14.mergeResultsTable = function(v29, v30)
    local v31 = {};
    if next(v30) == nil then
        if not v29.props.LoadingMore and v29.state.text ~= "" then
            table.insert(v31, "NoResults");
        end;
    else
        local v32 = {};
        for v33, _ in pairs(v30) do
            table.insert(v32, v33);
        end;
        table.sort(v32, function(v35, v36)
            return v30[v35].LayoutOrder < v30[v36].LayoutOrder;
        end);
        for _, v38 in ipairs(v32) do
            table.insert(v31, v38);
            for _, v40 in ipairs(v30[v38]) do
                table.insert(v31, v40);
            end;
        end;
    end;
    if v29.props.LoadingMore then
        table.insert(v31, "LoadingIndicator");
    end;
    return v31;
end;
v14.onRenderItem = function(v41, v42, v43, v44, v45, _)
    local l_props_0 = v41.props;
    local l_HeaderHeight_0 = l_props_0.HeaderHeight;
    local l_NoResultsText_0 = l_props_0.NoResultsText;
    local v50 = l_props_0.TextPadding or 16;
    local l_searchBar_0 = v45.assetConfig.packagePermissions.searchBar;
    if (typeof(v42) == "string" and v42 ~= "LoadingIndicator") and v42 ~= "NoResults" then
        return v2.createElement("TextLabel", {
            BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = v43, 
            Font = v5.FONT, 
            Size = UDim2.new(1, 0, 0, l_HeaderHeight_0), 
            Text = v42, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextSize = 16, 
            TextColor3 = l_searchBar_0.placeholderText
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v50)
            })
        });
    elseif v42 == "NoResults" then
        return v2.createElement("TextLabel", {
            BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
            BorderSizePixel = 0, 
            Font = v5.FONT, 
            LayoutOrder = v43, 
            Text = l_NoResultsText_0, 
            TextSize = v5.FONT_SIZE_TITLE, 
            TextColor3 = v45.assetConfig.textColor, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 50)
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v50)
            })
        });
    elseif v42 == "LoadingIndicator" then
        return v2.createElement("Frame", {
            BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = v43, 
            Size = UDim2.new(1, 0, 0, 50)
        }, {
            LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ZIndex = 3
            })
        });
    else
        return v2.createElement(v13, {
            Icon = v42.Icon, 
            LayoutOrder = v43, 
            Name = v42.Name, 
            OnActivated = v44, 
            Size = UDim2.new(1, 0, 0, 50), 
            TextPadding = v50
        });
    end;
end;
v14.render = function(v52)
    local l_props_1 = v52.props;
    local l_state_0 = v52.state;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v56 = l_LayoutOrderIterator_0.new();
    local v57 = l_props_1.LayoutOrder or 0;
    local l_text_0 = l_state_0.text;
    local v59 = l_state_0.isFocused and l_props_1.Enabled;
    local v60 = l_state_0.isContainerHovered and l_props_1.Enabled;
    local l_isClearButtonHovered_0 = l_state_0.isClearButtonHovered;
    local l_searchBar_1 = l_Stylizer_0.assetConfig.packagePermissions.searchBar;
    local v63 = nil;
    v63 = if not v59 then if v60 then l_searchBar_1.borderHover else l_searchBar_1.border else l_searchBar_1.borderSelected;
    local l_DefaultText_0 = l_props_1.DefaultText;
    local l_ErrorText_0 = l_props_1.ErrorText;
    local _ = l_props_1.NoResultsText;
    local l_showDropdown_0 = l_state_0.showDropdown;
    local v68;
    v68 = (v52.textBoxRef and v52.textBoxRef.current) and v68.Parent;
    local v69 = nil;
    if v68 then
        local l_AbsolutePosition_0 = v68.AbsolutePosition;
        local v71 = l_AbsolutePosition_0 + v68.AbsoluteSize;
        v69 = Rect.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, v71.X, v71.Y);
    end;
    local v72 = l_props_1.Results or {};
    local _ = l_props_1.HeaderHeight;
    local l_ItemHeight_0 = l_props_1.ItemHeight;
    local l_MaxItems_0 = l_props_1.MaxItems;
    local _ = l_props_1.ShowRibbon;
    local v77 = l_props_1.TextPadding or 16;
    local _ = l_props_1.ScrollBarPadding;
    local _ = l_props_1.ScrollBarThickness;
    if not (l_MaxItems_0 and l_MaxItems_0 * l_ItemHeight_0) then
        local _ = nil;
    end;
    local _ = l_state_0.dropdownItem;
    if l_state_0.lastResults ~= v72 then
        l_state_0.mergedItems = v52:mergeResultsTable(v72);
        l_state_0.lastResults = v72;
    end;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v57, 
        BackgroundColor3 = l_Stylizer_0.inputFields.backgroundColor, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Background = v2.createElement("ImageLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Image = v6.ROUNDED_BORDER_IMAGE, 
            ImageColor3 = v63, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v5.ROUNDED_FRAME_SLICE, 
            [v2.Event.MouseEnter] = v52.onContainerHovered, 
            [v2.Event.MouseMoved] = v52.onContainerHovered, 
            [v2.Event.MouseLeave] = v52.onContainerHoverEnded
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            TextBox = v2.createElement("TextBox", {
                Font = v5.FONT, 
                TextSize = v5.FONT_SIZE_TITLE, 
                TextColor3 = l_Stylizer_0.assetConfig.textColor, 
                LayoutOrder = v56:getNextOrder(), 
                Size = UDim2.new(1, -80, 0, 40), 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = not not l_props_1.Enabled and l_text_0 or "", 
                TextEditable = l_props_1.Enabled, 
                PlaceholderText = l_ErrorText_0 or l_DefaultText_0, 
                PlaceholderColor3 = not not l_ErrorText_0 and l_Stylizer_0.warningColor or l_searchBar_1.placeholderText, 
                [v2.Ref] = v52.textBoxRef, 
                [v2.Change.Text] = v52.onTextChanged, 
                [v2.Event.Focused] = v52.onTextBoxFocused, 
                [v2.Event.FocusLost] = v52.onTextBoxFocusLost
            }, {
                TextPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v77)
                }), 
                Dropdown = v2.createElement(l_DropdownMenu_0, {
                    Hide = not (l_showDropdown_0 and v68), 
                    Items = v52.state.mergedItems, 
                    OnFocusLost = v52.hideDropdown, 
                    OnItemActivated = v52.onItemClicked, 
                    OnRenderItem = function(v82, v83, v84)
                        return v52:onRenderItem(v82, v83, v84, l_Stylizer_0, v69);
                    end, 
                    Width = not not v69 and v69.Width or nil
                })
            }), 
            ClearButtonFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v56:getNextOrder(), 
                Size = UDim2.new(0, 40, 0, 40)
            }, {
                ClearButton = v2.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 24, 0, 24), 
                    BackgroundTransparency = 1, 
                    Visible = l_text_0 ~= "", 
                    Image = not not l_isClearButtonHovered_0 and v6.CLEAR_ICON_HOVER or v6.CLEAR_ICON, 
                    ImageColor3 = l_searchBar_1.clearButton.image, 
                    [v2.Event.MouseEnter] = v52.onClearButtonHovered, 
                    [v2.Event.MouseMoved] = v52.onClearButtonHovered, 
                    [v2.Event.MouseLeave] = v52.onClearButtonHoverEnded, 
                    [v2.Event.MouseButton1Down] = v52.onClearButtonClicked
                })
            }), 
            ImageFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v56:getNextOrder(), 
                Size = UDim2.new(0, 40, 0, 40)
            }, {
                Image = v2.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 20, 0, 20), 
                    BackgroundTransparency = 1, 
                    Image = v6.SEARCH_ICON, 
                    ImageColor3 = l_Stylizer_0.assetConfig.packagePermissions.searchBar.searchIcon
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));
