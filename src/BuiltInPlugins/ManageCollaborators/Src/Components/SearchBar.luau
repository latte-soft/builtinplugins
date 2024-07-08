local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v7 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v7.Style.Stylizer;
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
local l_COLLABORATORTYPE_USER_0 = v3.COLLABORATORTYPE_USER;
local v11 = require(l_Parent_0.Src.Util.PermissionsConstants);
local l_DropdownMenu_0 = v7.UI.DropdownMenu;
local v13 = require(l_Parent_0.Src.Util.CreateFitToContent);
local l_LoadingIndicator_0 = v7.UI.LoadingIndicator;
local l_TextService_0 = game:GetService("TextService");
local v16 = game:getFastFlag("StudioManageCollabFixFocusError");
local v17 = game:DefineFastFlag("StudioManageCollabFixTextBoxNilError", false);
local v18 = v13("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 0)
});
local v19 = v13("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 0), 
    FillDirection = Enum.FillDirection.Horizontal
});
local v20 = v13("ImageLabel", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 0), 
    FillDirection = Enum.FillDirection.Horizontal
});
local v21 = v1.PureComponent:extend("SearchBar");
local function _(v22)
    return not not v22 and v22:gsub("\n", " ") or "";
end;
v21.init = function(v24)
    v24.state = {
        text = "", 
        isFocused = false, 
        isContainerHovered = false, 
        isClearButtonHovered = false, 
        isKeyHovered = false, 
        showDropdown = false, 
        dropdownItem = nil, 
        lastDelay = {}, 
        lastResults = {}, 
        mergedItems = {}
    };
    v24.textBoxRef = v1.createRef();
    v24.requestSearch = function()
        v24.props.onSearchRequested(v24.state.text);
    end;
    v24.onContainerHovered = function()
        v24:setState({
            isContainerHovered = true
        });
    end;
    v24.onContainerHoverEnded = function()
        v24:setState({
            isContainerHovered = false
        });
    end;
    v24.onTextChanged = function(v25)
        local l_Text_0 = v25.Text;
        local v27 = not not l_Text_0 and l_Text_0:gsub("\n", " ") or "";
        l_Text_0 = v24.textBoxRef.current;
        if not (v17 and not l_Text_0) and v24.state.text ~= v27 then
            v24:setState({
                text = v27
            });
            if v24.props.onTextChanged then
                v24.props.onTextChanged(v27);
            end;
            local v28 = {};
            v24.state.lastDelay = v28;
            delay(0.5, function()
                if v28 == v24.state.lastDelay and v27 ~= "" then
                    v24.requestSearch();
                    if not v24.state.showDropdown and next(v24.state.mergedItems) ~= nil then
                        v24.showDropdown();
                    end;
                end;
            end);
            if l_Text_0.AbsoluteSize.x < l_TextService_0:GetTextSize(v27, l_Text_0.TextSize, l_Text_0.Font, Vector2.new(0, math.huge)).x then
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Right;
                return ;
            else
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Left;
            end;
        end;
    end;
    v24.onTextBoxFocused = function(v29, _)
        local l_current_0 = v24.textBoxRef.current;
        v24:setState({
            isFocused = true
        });
        if not v29 then
            l_current_0:ReleaseFocus();
        end;
        if next(v24.state.mergedItems) ~= nil then
            v24.showDropdown();
        end;
    end;
    v24.onTextBoxFocusLost = function(_, _, _)
        if not v16 or not v24.isUnmounting then
            v24:setState({
                isFocused = false, 
                isContainerHovered = false
            });
            if not v24.state.dropdownItem then
                v24.hideDropdown();
            end;
            return ;
        else
            return ;
        end;
    end;
    v24.onClearButtonHovered = function()
        v24:setState({
            isClearButtonHovered = true
        });
    end;
    v24.onClearButtonHoverEnded = function()
        v24:setState({
            isClearButtonHovered = false
        });
    end;
    v24.onClearButtonClicked = function()
        local l_current_1 = v24.textBoxRef.current;
        v24:setState({
            isFocused = true
        });
        l_current_1.Text = "";
        l_current_1:CaptureFocus();
        l_current_1.TextXAlignment = Enum.TextXAlignment.Left;
        v24.onClearButtonHoverEnded();
    end;
    v24.onItemClicked = function(v36)
        v24.props.OnItemClicked(v36.Key);
        v24.hideDropdown();
    end;
    v24.showDropdown = function()
        v24:setState({
            showDropdown = true
        });
    end;
    v24.hideDropdown = function()
        if not v24.state.isFocused then
            v24:setState({
                showDropdown = false, 
                dropdownItem = v1.None, 
                isKeyHovered = false
            });
        end;
    end;
    v24.onKeyMouseEnter = function(v37)
        v24:setState({
            dropdownItem = v37, 
            isKeyHovered = true
        });
    end;
    v24.onKeyMouseLeave = function(v38)
        if v24.state.dropdownItem == v38 then
            v24:setState({
                dropdownItem = v1.None, 
                isKeyHovered = false
            });
        end;
    end;
    v24.onRenderItem = function(v39, v40, v41)
        local l_props_0 = v24.props;
        local l_Stylizer_1 = l_props_0.Stylizer;
        local l_IsGroupGame_0 = l_props_0.IsGroupGame;
        local l_Localization_1 = l_props_0.Localization;
        local l_searchBar_0 = l_Stylizer_1.searchBar;
        local l_dropdownItem_0 = v24.state.dropdownItem;
        local l_NoResultsText_0 = l_props_0.NoResultsText;
        local l_HeaderHeight_0 = l_props_0.HeaderHeight;
        local l_ItemHeight_0 = l_props_0.ItemHeight;
        local l_textPadding_0 = l_searchBar_0.textPadding;
        local v52 = nil;
        local v53 = v24.textBoxRef and v24.textBoxRef.current;
        local l_Is17PlusGame_0 = l_props_0.Is17PlusGame;
        if v53 then
            v53 = v53.Parent;
            local l_AbsolutePosition_0 = v53.AbsolutePosition;
            local v56 = l_AbsolutePosition_0 + v53.AbsoluteSize;
            v52 = Rect.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, v56.X, v56.Y);
        end;
        local v57 = v52.Width - l_searchBar_0.dropDown.item.offset;
        if (typeof(v39) == "string" and v39 ~= "LoadingIndicator") and v39 ~= "NoResults" then
            return v1.createElement("Frame", {
                Size = UDim2.new(0, v57, 0, l_HeaderHeight_0), 
                BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
                LayoutOrder = v40, 
                BorderSizePixel = 0
            }, {
                CollabTypeText = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.searchBar.dropDown.collaboratorTypeText, {
                    Text = l_Localization_1:getText("CollaboratorTypes", v39), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Position = l_Stylizer_1.searchBar.collabTypeTextPosition, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                })), 
                FriendsEditAccessText = (not (l_Is17PlusGame_0 or l_IsGroupGame_0) and v39 == l_COLLABORATORTYPE_USER_0) and v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.searchBar.dropDown.collaboratorTypeText, {
                    Text = l_Localization_1:getText("Description", "FriendsEditAccess"), 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Position = l_searchBar_0.friendsAccessTextPosition, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                })) or nil
            });
        elseif v39 == "NoResults" then
            return v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Normal, {
                Size = UDim2.new(0, v57, 0, l_ItemHeight_0), 
                Text = l_NoResultsText_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
                BorderSizePixel = 0, 
                TextWrapped = true, 
                LayoutOrder = v40
            }), {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_textPadding_0)
                })
            });
        elseif v39 == "LoadingIndicator" then
            return v1.createElement("Frame", {
                Size = UDim2.new(0, v57, 0, l_ItemHeight_0), 
                BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
                BorderSizePixel = 0, 
                LayoutOrder = v40
            }, {
                LoadingIndicator = v1.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ZIndex = 3
                })
            });
        else
            local l_Key_0 = v39.Key;
            local l_IsFriend_0 = v39.IsFriend;
            local v60 = l_Key_0.Type == v11.UserSubjectKey;
            local v61 = not l_Key_0.IsEligible;
            local v62 = nil;
            if v61 then
                v62 = l_Key_0.EligibilityText or l_Localization_1:getText("SearchBar", "UnknownError");
            end;
            local v63 = if not l_IsFriend_0 then l_ItemHeight_0 else l_searchBar_0.nameHeight;
            local v64 = false;
            if l_dropdownItem_0 == l_Key_0 then
                v64 = not v61;
            end;
            local v65 = l_LayoutOrderIterator_0.new();
            local v66 = not not v64 and l_searchBar_0.dropDown.hovered.backgroundColor or l_searchBar_0.dropDown.backgroundColor;
            return v1.createElement("ImageButton", {
                Size = UDim2.new(0, v57, 0, l_ItemHeight_0), 
                BackgroundColor3 = v66, 
                BorderSizePixel = 0, 
                LayoutOrder = v40, 
                AutoButtonColor = false, 
                Active = not v61, 
                [v1.Event.Activated] = v41, 
                [v1.Event.MouseEnter] = function()
                    v24.onKeyMouseEnter(l_Key_0);
                end, 
                [v1.Event.MouseLeave] = function()
                    v24.onKeyMouseLeave(l_Key_0);
                end
            }, {
                GrayOutBox = if not not v61 and l_props_0.Is17PlusGame then v1.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0), 
                    Size = UDim2.new(0, v57, 0, l_ItemHeight_0), 
                    BackgroundTransparency = 0.75, 
                    LayoutOrder = v40
                }) else nil; 
                v1.createElement(v19, {
                    LayoutOrder = v40, 
                    BackgroundTransparency = 1
                }, {
                    IconFrame = v1.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = v65:getNextOrder(), 
                        Size = UDim2.new(0, l_ItemHeight_0, 0, l_ItemHeight_0)
                    }, {
                        SmallIcon = v1.createElement("Frame", {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(0, l_searchBar_0.thumbnailSize, 0, l_searchBar_0.thumbnailSize), 
                            BackgroundColor3 = v66, 
                            BorderSizePixel = 0
                        }, {
                            Icon = v39.Icon
                        }), 
                        Padding = v1.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_searchBar_0.thumbnailPaddingLeft)
                        })
                    }), 
                    NameAndFriendStatus = v1.createElement("Frame", {
                        LayoutOrder = v65:getNextOrder(), 
                        Size = UDim2.new(0, l_searchBar_0.nameLabelWidth, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 0)
                        }), 
                        TextFrame = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Normal, {
                            Size = UDim2.new(0, l_searchBar_0.nameLabelWidth, 0, v63), 
                            Text = v39.Name, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextColor3 = not not v64 and l_searchBar_0.dropDown.hovered.displayText or l_searchBar_0.dropDown.displayText, 
                            BackgroundTransparency = 1, 
                            TextWrapped = true, 
                            ClipsDescendants = true, 
                            LayoutOrder = 1, 
                            BorderSizePixel = 0
                        }), {
                            Padding = v1.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, l_searchBar_0.renderItemTextPadding)
                            })
                        }), 
                        FriendFrame = if not l_IsFriend_0 then nil else v1.createElement(v19, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1
                        }, {
                            Padding = v1.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, l_searchBar_0.renderItemTextPadding), 
                                PaddingBottom = UDim.new(0, l_searchBar_0.renderItemTextPadding)
                            }), 
                            FriendImageLabel = v1.createElement("ImageLabel", {
                                Size = UDim2.new(0, l_searchBar_0.friendIcon.Width, 0, l_searchBar_0.friendIcon.Height), 
                                Image = l_searchBar_0.friendIcon.Image, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1
                            }), 
                            FriendTextLabel = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Subtext, {
                                Size = UDim2.new(1, 0, 0, l_searchBar_0.friendIcon.LabelHeight), 
                                AutomaticSize = Enum.AutomaticSize.X, 
                                Text = l_Localization_1:getText("SearchBar", "FriendLabel"), 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextColor3 = not not v64 and l_searchBar_0.dropDown.hovered.displayText or l_searchBar_0.dropDown.displayText, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 2, 
                                BorderSizePixel = 0
                            }), {
                                Padding = v1.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, l_searchBar_0.renderItemTextPadding / 2)
                                })
                            })
                        })
                    }), 
                    RestrictionLabel = if (not not v61 and l_props_0.Is17PlusGame) and v60 then v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Normal, {
                        Size = UDim2.new(0, l_searchBar_0.dropDown.eligibilityLabelWidth, 0, l_ItemHeight_0), 
                        Text = v62, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = not not v64 and l_searchBar_0.dropDown.hovered.displayText or l_searchBar_0.dropDown.displayText, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v65:getNextOrder(), 
                        BorderSizePixel = 0
                    })) else nil
                })
            });
        end;
    end;
    if v24.props.onTextChanged then
        v24.props.onTextChanged("");
    end;
end;
v21.mergeResultsTable = function(v67, v68)
    local v69 = {};
    if next(v68) == nil then
        if not v67.props.LoadingMore and v67.state.text ~= "" then
            table.insert(v69, "NoResults");
        end;
    else
        local v70 = {};
        for v71, _ in pairs(v68) do
            table.insert(v70, v71);
        end;
        table.sort(v70, function(v73, v74)
            return v68[v73].LayoutOrder < v68[v74].LayoutOrder;
        end);
        for _, v76 in ipairs(v70) do
            table.insert(v69, v76);
            for _, v78 in ipairs(v68[v76]) do
                table.insert(v69, v78);
            end;
        end;
    end;
    if v67.props.LoadingMore then
        table.insert(v69, "LoadingIndicator");
    end;
    return v69;
end;
v21.render = function(v79)
    local l_props_1 = v79.props;
    local l_Stylizer_2 = l_props_1.Stylizer;
    local l_Mouse_0 = l_props_1.Mouse;
    local l_state_0 = v79.state;
    local v84 = l_props_1.LayoutOrder or 0;
    local l_text_0 = l_state_0.text;
    local v86 = l_state_0.isFocused and l_props_1.Enabled;
    local v87 = l_state_0.isContainerHovered and l_props_1.Enabled;
    local v88 = (v79.state.isClearButtonHovered or v79.state.isKeyHovered) and l_props_1.Enabled;
    local v89 = v79.state.isContainerHovered and l_props_1.Enabled;
    if not v88 then
        if not v89 then
            l_Mouse_0:__resetCursor();
        else
            l_Mouse_0:__pushCursor("IBeam");
        end;
    else
        l_Mouse_0:__pushCursor("PointingHand");
    end;
    local l_searchBar_1 = l_Stylizer_2.searchBar;
    local v91 = nil;
    v91 = if not v86 then if v87 then l_searchBar_1.borderHover else l_searchBar_1.border else l_searchBar_1.borderSelected;
    local l_DefaultText_0 = l_props_1.DefaultText;
    local l_ErrorText_0 = l_props_1.ErrorText;
    local v94 = l_state_0.showDropdown and v79.state.text ~= "";
    local v95;
    v95 = (v79.textBoxRef and v79.textBoxRef.current) and v95.Parent;
    local v96 = nil;
    if v95 then
        local l_AbsolutePosition_1 = v95.AbsolutePosition;
        local v98 = l_AbsolutePosition_1 + v95.AbsoluteSize;
        v96 = Rect.new(l_AbsolutePosition_1.X, l_AbsolutePosition_1.Y, v98.X, v98.Y);
    end;
    local v99 = l_props_1.Results or {};
    if l_state_0.lastResults ~= v99 then
        l_state_0.mergedItems = v79:mergeResultsTable(v99);
        l_state_0.lastResults = v99;
    end;
    return v1.createElement(v18, {
        BackgroundTransparency = 1, 
        LayoutOrder = v84
    }, {
        Background = v1.createElement(v20, {
            BackgroundTransparency = 1, 
            Image = v3.ROUNDED_BORDER_IMAGE, 
            ImageColor3 = v91, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v3.ROUNDED_FRAME_SLICE, 
            [v1.Event.MouseEnter] = v79.onContainerHovered, 
            [v1.Event.MouseMoved] = v79.onContainerHovered, 
            [v1.Event.MouseLeave] = v79.onContainerHoverEnded
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12)
            }), 
            TextBox = v1.createElement("TextBox", v2.Dictionary.join(l_Stylizer_2.fontStyle.Normal, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, -l_searchBar_1.searchBarHeight, 0, l_searchBar_1.searchBarHeight), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                ClearTextOnFocus = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = not not l_props_1.Enabled and l_text_0 or "", 
                TextEditable = l_props_1.Enabled, 
                PlaceholderText = l_ErrorText_0 or l_DefaultText_0, 
                PlaceholderColor3 = not not l_ErrorText_0 and l_Stylizer_2.warningColor or l_searchBar_1.placeholderText, 
                [v1.Ref] = v79.textBoxRef, 
                [v1.Change.Text] = v79.onTextChanged, 
                [v1.Event.Focused] = function(...)
                    v79.onTextBoxFocused(l_props_1.Enabled, ...);
                end, 
                [v1.Event.FocusLost] = v79.onTextBoxFocusLost
            }), {
                Dropdown = v95 and v1.createElement(l_DropdownMenu_0, {
                    Hide = not v94, 
                    Items = v79.state.mergedItems, 
                    OnFocusLost = v79.hideDropdown, 
                    OnItemActivated = v79.onItemClicked, 
                    OnRenderItem = v79.onRenderItem, 
                    Style = "Search", 
                    Width = v96.Width, 
                    MaxHeight = l_searchBar_1.dropDown.maxHeight
                })
            }), 
            ClearButtonFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, l_searchBar_1.searchBarHeight, 0, l_searchBar_1.searchBarHeight)
            }, {
                ClearButton = v1.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, l_searchBar_1.clearButtonIconSize, 0, l_searchBar_1.clearButtonIconSize), 
                    BackgroundTransparency = 1, 
                    Visible = l_text_0 ~= "", 
                    Image = l_Stylizer_2.deleteIcon, 
                    [v1.Event.MouseEnter] = v79.onClearButtonHovered, 
                    [v1.Event.MouseMoved] = v79.onClearButtonHovered, 
                    [v1.Event.MouseLeave] = v79.onClearButtonHoverEnded, 
                    [v1.Event.MouseButton1Down] = v79.onClearButtonClicked
                })
            })
        })
    });
end;
v21.didMount = function(v100)
    if v16 then
        v100.isUnmounting = false;
    end;
end;
v21.willUnmount = function(v101)
    if v16 then
        v101.isUnmounting = true;
    end;
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    Mouse = l_ContextServices_0.Mouse
})(v21));
