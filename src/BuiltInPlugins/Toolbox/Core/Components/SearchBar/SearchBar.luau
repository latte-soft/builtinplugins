local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v8 = require(l_Parent_0.Core.Components.RoundButton);
local v9 = require(l_Parent_0.Core.Components.SearchBar.SearchBarButtons);
local v10 = v2.PureComponent:extend("SearchBar");
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local function _(v12)
    return not not v12 and v12:gsub("\n", " ") or "";
end;
v10.init = function(v14)
    v14.state = {
        text = "", 
        lastSearchTermAsProp = "", 
        isFocused = false, 
        isContainerHovered = false
    };
    v14.textBoxRef = v2.createRef();
    v14.requestSearch = function()
        v14.props.onSearchRequested(v14.state.text);
    end;
    v14.onContainerHovered = function()
        v14:setState({
            isContainerHovered = true
        });
    end;
    v14.onContainerHoverEnded = function()
        v14:setState({
            isContainerHovered = false
        });
    end;
    v14.onBackgroundClicked = function()
        if not (not v14.textBoxRef or not v14.textBoxRef.current) then
            v14.textBoxRef.current:CaptureFocus();
        end;
    end;
    v14.onBackgroundFocusLost = function(_, v16)
        if v16.UserInputType == Enum.UserInputType.Focus then
            v14:onFocusLost(false);
        end;
    end;
    v14.onTextChanged = function(v17)
        local l_Text_0 = v17.Text;
        local v19 = not not l_Text_0 and l_Text_0:gsub("\n", " ") or "";
        if v14.state.text ~= v19 then
            v14:setState({
                text = v19
            });
            if v14.props.onTextChanged then
                v14.props.onTextChanged(v19);
            end;
        end;
    end;
    v14.onTextBoxFocused = function(_)
        v14:setState({
            isFocused = true
        });
    end;
    v14.onTextBoxFocusLost = function(_, v22, _)
        v14:onFocusLost(v22);
    end;
    v14.onClearButtonClicked = function()
        if not v11() then
            v14:setState({
                text = "", 
                isFocused = true
            });
            v14.textBoxRef.current:CaptureFocus();
            v14.requestSearch();
            return ;
        else
            v14:setState({
                text = "", 
                isFocused = true
            }, function()
                v14.textBoxRef.current:CaptureFocus();
                v14.requestSearch();
            end);
            return ;
        end;
    end;
end;
v10.getDerivedStateFromProps = function(v24, v25)
    local l_searchTerm_0 = v24.searchTerm;
    local v27 = not not l_searchTerm_0 and l_searchTerm_0:gsub("\n", " ") or "";
    if v27 ~= (v25.lastSearchTermAsProp or "") then
        return {
            text = v27, 
            lastSearchTermAsProp = v27
        };
    else
        return {};
    end;
end;
v10.onFocusLost = function(v28, v29)
    v28:setState({
        isFocused = false, 
        isContainerHovered = false
    });
    if v29 then
        v28.requestSearch();
    end;
end;
v10.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_width_0 = l_props_0.width;
    local v35 = l_props_0.LayoutOrder or 0;
    local l_text_0 = l_state_0.text;
    local l_isFocused_0 = l_state_0.isFocused;
    local l_isContainerHovered_0 = l_state_0.isContainerHovered;
    local v39 = #l_text_0 > 0;
    local l_showSearchButton_0 = v30.props.showSearchButton;
    local l_IsLive_0 = l_props_0.IsLive;
    local v42 = (not not l_showSearchButton_0 and 2 * v4.SEARCH_BAR_BUTTON_WIDTH + 1 or v4.SEARCH_BAR_BUTTON_WIDTH) - 6;
    local v43 = l_GetTextSize_0(l_text_0, nil, nil, Vector2.new(0, 0)).x < (l_width_0 - v42) - 20;
    local l_searchBar_0 = l_Stylizer_0.searchBar;
    local _ = nil;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, l_width_0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v35
    }, {
        Background = v2.createElement(v8, {
            Position = UDim2.new(0, -1, 0, -1), 
            Size = UDim2.new(1, 2, 1, 2), 
            BorderColor3 = if not l_isFocused_0 then if l_isContainerHovered_0 then l_searchBar_0.borderHoveredColor else l_searchBar_0.borderColor else l_searchBar_0.borderSelectedColor, 
            ClipsDescendants = true, 
            BackgroundColor3 = not not l_IsLive_0 and l_searchBar_0.liveBackgroundColor or l_searchBar_0.backgroundColor, 
            [v2.Event.MouseEnter] = v30.onContainerHovered, 
            [v2.Event.MouseMoved] = v30.onContainerHovered, 
            [v2.Event.MouseLeave] = v30.onContainerHoverEnded, 
            [v2.Event.MouseButton1Down] = v30.onBackgroundClicked, 
            [v2.Event.InputEnded] = v30.onBackgroundFocusLost
        }, {
            TextContainer = v2.createElement("Frame", {
                Position = UDim2.new(0, 10, 0, 0), 
                Size = UDim2.new(1, -(v42 + 20), 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                TextBox = v2.createElement("TextBox", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    ClearTextOnFocus = false, 
                    Font = v4.FONT, 
                    TextSize = v4.FONT_SIZE_MEDIUM, 
                    TextXAlignment = not not v43 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
                    TextColor3 = l_searchBar_0.textColor, 
                    Text = l_text_0, 
                    PlaceholderText = l_props_0.Localization:getText("General", v30.props.defaultTextKey or "SearchBarDefaultText"), 
                    PlaceholderColor3 = l_searchBar_0.placeholderTextColor, 
                    [v2.Ref] = v30.textBoxRef, 
                    [v2.Change.Text] = v30.onTextChanged, 
                    [v2.Event.Focused] = v30.onTextBoxFocused, 
                    [v2.Event.FocusLost] = v30.onTextBoxFocusLost
                })
            }), 
            Buttons = v2.createElement(v9, {
                showClearButton = v39, 
                showSearchButton = l_showSearchButton_0, 
                onClearButtonClicked = v30.onClearButtonClicked, 
                onSearchButtonClicked = v30.requestSearch
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
