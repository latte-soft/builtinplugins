local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Cryo);
local v5 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.AssetConfigConstants);
local v9 = require(l_Util_0.trimString);
local v10 = require(l_Util_0.TagsUtil);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_StyleModifier_0 = v5.Util.StyleModifier;
local l_GetTextSize_0 = v5.Util.GetTextSize;
local l_RoundBox_0 = v5.UI.RoundBox;
local l_withForwardRef_0 = v5.Wrappers.withForwardRef;
local l_Components_0 = l_Parent_0.Core.Components;
local v19 = require(l_Components_0.DropdownItemsList);
local v20 = require(l_Components_0.AssetConfiguration.CatalogTags.CatalogTag);
local v21 = require(l_Parent_0.Core.Networking.Requests.GetTagSuggestionsRequest);
local v22 = require(l_Parent_0.Core.Actions.SetTagSuggestions);
local v23 = (5 + v7.FONT_SIZE_MEDIUM) + 5;
local v24 = v2.PureComponent:extend("TagsComponent");
v24.init = function(v25)
    v25.state = {
        active = false, 
        textFieldPosition = Vector2.new(), 
        textFieldSize = Vector2.new()
    };
    v25.textBoxRef = v2.createRef();
    v25.textFieldRef = v2.createRef();
    v25.lastText = " ";
    v25.onTextFieldAbsoluteSizeChanged = function(v26)
        v25:setState({
            textFieldSize = v26.AbsoluteSize
        });
    end;
    v25.onTextFieldAbsolutePositionChanged = function(v27)
        v25:setState({
            textFieldPosition = v27.AbsolutePosition
        });
    end;
    v25.onTextBoxFocused = function()
        if not ((v25.state.active or not v25.textBoxRef) or not v25.textBoxRef.current) then
            v25.textBoxRef.current.CursorPosition = 9999;
            v25:setState({
                active = true
            });
        end;
    end;
    v25.onTextBoxFocusLost = function(v28, v29)
        if not v29 then
            if not v25.state.active or #v25.props.suggestions == 0 then
                v25:setState({
                    active = false
                });
                return ;
            else
                v28:CaptureFocus();
                return ;
            end;
        else
            if #v9(v28.Text) > 0 and #v25.props.suggestions > 0 then
                v25:addTag(v25.props.suggestions[1]);
                v25.props.clearSuggestions();
                v28.Text = " ";
            end;
            v28:CaptureFocus();
            return ;
        end;
    end;
    v25.onTextBoxTextChanged = function(v30)
        local l_networkInterface_0 = v25.props.Network.networkInterface;
        local l_Text_0 = v30.Text;
        if l_Text_0 ~= v25.lastText then
            local v33 = false;
            if string.sub(l_Text_0, 1, 1) ~= " " then
                l_Text_0 = " " .. l_Text_0;
                local l_tags_0 = v25.props.tags;
                if #v25.lastText == 1 and #l_tags_0 > 0 then
                    v25:removeTag(l_tags_0[#l_tags_0].tagId);
                end;
                v33 = true;
            end;
            if string.sub(l_Text_0, #l_Text_0, #l_Text_0) == "\r" then
                l_Text_0 = string.sub(l_Text_0, 1, #l_Text_0 - 1);
                v33 = true;
            end;
            if not v25:canAddTags() then
                l_Text_0 = " ";
                v33 = true;
            end;
            if v33 then
                v30.Text = l_Text_0;
                v30:ReleaseFocus();
                v30:CaptureFocus();
            end;
            v25.lastText = l_Text_0;
        end;
        local v35 = v9(l_Text_0);
        if #v35 > 0 then
            v25.props.getSuggestions(l_networkInterface_0, v25.props.tags, v35);
            return ;
        else
            v25.props.clearSuggestions();
            return ;
        end;
    end;
    v25.onTextBoxCursorPositionChanged = function(v36)
        if v36.CursorPosition < 2 then
            v36.CursorPosition = 2;
        end;
    end;
end;
v24.canAddTags = function(v37)
    return #v37.props.tags < v37.props.maximumItemTagsPerItem;
end;
v24.addTag = function(v38, v39)
    if not (not v38:canAddTags() or v10.hasTag(v38.props.tags, v39.tagId)) then
        v38.props.onTagsChange(v4.List.join(v38.props.tags, {
            v39
        }));
    end;
end;
v24.removeTag = function(v40, v41)
    local v42 = {};
    for v43 = 1, #v40.props.tags do
        local v44 = v40.props.tags[v43];
        if v44.tagId ~= v41 then
            table.insert(v42, v44);
        end;
    end;
    v40.props.onTagsChange(v42);
end;
v24.getDropdownItems = function(v45)
    local v46 = {};
    for _, v48 in pairs(v45.props.suggestions) do
        table.insert(v46, {
            name = v48.localizedDisplayName, 
            selectable = true
        });
    end;
    return v46;
end;
v24.clearSuggestions = function(v49)
    v49.props.clearSuggestions();
end;
v24.didMount = function(v50)
    if v50.textFieldRef.current then
        v50:setState({
            textFieldPosition = v50.textFieldRef.current.AbsolutePosition, 
            textFieldSize = v50.textFieldRef.current.AbsoluteSize
        });
    end;
end;
v24.render = function(v51)
    local l_props_0 = v51.props;
    local l_state_0 = v51.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v58 = {};
    local v59 = (3 + v7.FONT_SIZE_TITLE) + 3;
    local v60 = 0;
    local v61 = 10;
    local function _(v62)
        local l_v61_0 = v61;
        if l_state_0.textFieldSize.X - 10 < v61 + v62 then
            v60 = v60 + 1;
            v61 = 10;
            l_v61_0 = v61;
        end;
        v61 = (v61 + v62) + 3;
        return l_v61_0, 10 + v60 * (10 + v59);
    end;
    for v65 = 1, #l_props_0.tags do
        local v66 = l_props_0.tags[v65];
        local v67 = l_GetTextSize_0(v66.localizedDisplayName, v7.FONT_SIZE_TITLE, v7.FONT, Vector2.new(0, 0));
        local v68 = (((3 + v67.X) + 3) + 16) + 3;
        local v69 = (3 + v67.Y) + 3;
        local l_v61_1 = v61;
        if l_state_0.textFieldSize.X - 10 < v61 + v68 then
            v60 = v60 + 1;
            v61 = 10;
            l_v61_1 = v61;
        end;
        v61 = (v61 + v68) + 3;
        v58["Tag" .. v65] = v2.createElement(v20, {
            Text = v66.localizedDisplayName, 
            Position = UDim2.new(0, l_v61_1, 0, 10 + v60 * (10 + v59)), 
            Size = UDim2.new(0, v68, 0, v69), 
            textSize = v67, 
            onClose = function()
                v51:removeTag(v66.tagId);
            end
        });
    end;
    local l_v61_2 = v61;
    if l_state_0.textFieldSize.X - 10 < v61 + 100 then
        v60 = v60 + 1;
        v61 = 10;
        l_v61_2 = v61;
    end;
    v61 = (v61 + 100) + 3;
    local l_l_v61_2_0 = l_v61_2;
    v58.TextBox = v2.createElement("TextBox", {
        BackgroundTransparency = 1, 
        ClearTextOnFocus = false, 
        ClipsDescendants = true, 
        Font = v7.FONT, 
        Position = UDim2.new(0, l_l_v61_2_0, 0, 10 + v60 * (10 + v59)), 
        Size = UDim2.new(0, l_state_0.textFieldSize.X - l_l_v61_2_0, 0, v59), 
        TextColor3 = l_Stylizer_0.tags.textColor, 
        TextSize = v7.FONT_SIZE_TITLE, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Text = v51.lastText, 
        [v2.Event.Focused] = v51.onTextBoxFocused, 
        [v2.Event.FocusLost] = v51.onTextBoxFocusLost, 
        [v2.Change.Text] = v51.onTextBoxTextChanged, 
        [v2.Change.CursorPosition] = v51.onTextBoxCursorPositionChanged, 
        [v2.Ref] = v51.textBoxRef
    });
    l_v61_2 = v9(v51.lastText);
    local v73 = false;
    if #l_v61_2 > 0 then
        v73 = false;
        if #l_props_0.suggestions == 0 then
            v73 = l_v61_2 == l_props_0.latestTagSearchQuery;
        end;
    end;
    local v74 = nil;
    local v75 = nil;
    if not v73 then
        v74 = l_Stylizer_0.inputFields.toolTip;
        v75 = l_props_0.Localization:getText("Tags", "MaxTagsDescription", {
            max = l_props_0.maximumItemTagsPerItem
        });
    else
        v74 = l_Stylizer_0.inputFields.error;
        v75 = l_props_0.Localization:getText("Tags", "NoTagFound");
    end;
    local v76 = (((10 + v59) + v60 * (10 + v59)) + 10) + v23;
    local l_createElement_0 = v2.createElement;
    local v78 = "Frame";
    local v79 = {
        Active = true, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, v76 + 10), 
        [v2.Ref] = l_props_0.ForwardRef
    };
    local v80 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Title = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v7.FONT, 
            Size = UDim2.new(0, v8.TITLE_GUTTER_WIDTH, 1, 0), 
            Text = l_Title_0, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            TextSize = v7.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }), 
        Content = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -v8.TITLE_GUTTER_WIDTH, 0, v76)
        }, {
            Textfield = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -v23), 
                [v2.Change.AbsoluteSize] = v51.onTextFieldAbsoluteSizeChanged, 
                [v2.Change.AbsolutePosition] = v51.onTextFieldAbsolutePositionChanged, 
                [v2.Ref] = v51.textFieldRef
            }, {
                Textfield = v2.createElement(l_RoundBox_0, {
                    Style = not v73 and "TagsComponent" or "TagsComponentError", 
                    StyleModifier = (not v51:canAddTags() and l_StyleModifier_0.Disabled or l_state_0.active and l_StyleModifier_0.Selected) or nil
                }, v58)
            }), 
            Description = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v23), 
                Position = UDim2.new(0, 0, 1, -v23), 
                LayoutOrder = 2, 
                Text = v75, 
                TextColor3 = v74, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    };
    local l_active_0 = l_state_0.active;
    if l_active_0 then
        l_active_0 = v51:canAddTags();
        if l_active_0 then
            l_active_0 = false;
            if #l_props_0.suggestions > 0 then
                l_active_0 = v2.createElement(v19, {
                    items = v51:getDropdownItems(), 
                    onItemClicked = function(v82)
                        v51.lastText = " ";
                        v51:addTag(l_props_0.suggestions[v82]);
                        v51.props.clearSuggestions();
                        if not (not v51.textBoxRef or not v51.textBoxRef.current) then
                            v51.textBoxRef.current:CaptureFocus();
                        end;
                    end, 
                    closeDropdown = function()
                        v51:setState({
                            active = false
                        });
                        if not (not v51.textBoxRef or not v51.textBoxRef.current) then
                            v51.textBoxRef.current:ReleaseFocus();
                        end;
                    end, 
                    dropDownWidth = l_state_0.textFieldSize.X, 
                    top = l_state_0.textFieldPosition.Y + l_state_0.textFieldSize.Y, 
                    left = l_state_0.textFieldPosition.X, 
                    windowPosition = l_state_0.textFieldPosition, 
                    windowSize = l_state_0.textFieldSize, 
                    setDropdownHeight = l_props_0.setDropdownHeight
                });
            end;
        end;
    end;
    v80.Suggestions = l_active_0;
    return l_createElement_0(v78, v79, v80);
end;
return l_withForwardRef_0((v3.connect(function(v83, _)
    v83 = v83 or {};
    return {
        suggestions = v83.tagSuggestions or {}, 
        latestTagSuggestionTime = v83.latestTagSuggestionTime or 0, 
        latestTagSearchQuery = v83.latestTagSearchQuery
    };
end, function(v85)
    return {
        getSuggestions = function(v86, v87, v88)
            v85(v21(v86, v87, v88));
        end, 
        clearSuggestions = function()
            v85(v22({}, tick(), ""));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v13
})(v24)))));
