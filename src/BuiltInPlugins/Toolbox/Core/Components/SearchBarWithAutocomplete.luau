local l_RunService_0 = game:GetService("RunService");
local l_game_FastInt_0 = game:GetFastInt("ToolboxAutocompleteDropdownSize");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v7 = require(l_Parent_0.Core.Types.Category);
local v8 = require(l_Parent_0.Core.Util.ToolboxUtilities);
local v9 = require(l_Parent_0.Core.Networking.Requests.GetAutocompleteResultsRequest);
local _ = require(l_Parent_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local v11 = require(l_Parent_0.Core.Thunks.LogMarketplaceAutocompleteSearchAnalytics);
local v12 = require(l_Packages_0.Framework);
local l_UI_0 = v12.UI;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v18 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v19 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v20 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v21 = require(l_Parent_0.Core.Components.DropdownMenuItem);
local v22 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
local v23 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v25 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v26 = {};
local function _(v27)
    return v27:match("^%s*$") ~= nil;
end;
local v29 = v4.PureComponent:extend("SearchBarWithAutocomplete");
v29.init = function(v30)
    if v22() then
        v30.getRecentSearches = function()
            local l_Plugin_0 = v30.props.Plugin;
            if not l_Plugin_0 then
                return ;
            else
                local v32 = l_Plugin_0:get();
                local l_v32_Setting_0 = v32:GetSetting("RecentSearchesCache");
                if not l_v32_Setting_0 then
                    v32:SetSetting("RecentSearchesCache", v26);
                    l_v32_Setting_0 = v32:GetSetting("RecentSearchesCache");
                end;
                if not l_v32_Setting_0 then
                    return {};
                else
                    return l_v32_Setting_0;
                end;
            end;
        end;
    end;
    v30.state = {
        showAutocompleteResults = false, 
        displayedSearchTerm = "", 
        lastSearchTerm = "", 
        dropdownMenuRenderItems = if not v22() then nil else v26
    };
    v30.isUserInputting = false;
    v30.autocompleteTimer = 0;
    v30.keyCount = 0;
    v30.deleteCount = 0;
    v30.onInputBegan = function()
        v30.isUserInputting = true;
    end;
    v30.onInputEnded = function()
        v30.isUserInputting = false;
    end;
    v30.onSearchTextChanged = function(v34)
        if v22() then
            local l_props_0 = v30.props;
            if l_props_0.OnTextChanged then
                l_props_0.OnTextChanged(v34);
            end;
        end;
        if v34 ~= v30.state.displayedSearchTerm then
            if string.len(v30.state.displayedSearchTerm) < string.len(v34) then
                local l_v30_0 = v30;
                l_v30_0.keyCount = l_v30_0.keyCount + 1;
            elseif string.len(v34) < string.len(v30.state.displayedSearchTerm) then
                local l_v30_1 = v30;
                l_v30_1.deleteCount = l_v30_1.deleteCount + 1;
            end;
            if not v24() then
                v30:setState({
                    showAutocompleteResults = string.len(v34) > 0, 
                    displayedSearchTerm = v34
                });
            else
                v30:setState(function()
                    return {
                        displayedSearchTerm = v34, 
                        showAutocompleteResults = if v34 ~= nil and v34 ~= v30.props.autocorrectOfferedQuery then string.len(v34) > 0 else nil
                    };
                end);
                return ;
            end;
        end;
    end;
    if v22() then
        v30.onRecentSearchesRenderItem = function(v38, v39, v40)
            if v39 == 1 then
                return v30.renderRecentSearchesDropdownMenuHeader(v38);
            else
                return v30.renderRecentSearchesDropdownMenuItem(v38, v39, v40);
            end;
        end;
    end;
    v30.onAutocompleteRenderItem = function(v41, v42, v43)
        if not v22() or not v30.props.ShowRecentSearchesInAutoComplete then
            return v4.createElement(v21, {
                FocusedText = v30.state.displayedSearchTerm, 
                HideSeparator = v42 == #v30.props.autocompleteResults, 
                LayoutOrder = v42, 
                OnClick = v43, 
                Size = UDim2.new(1, 0, 0, 32), 
                Text = v41
            });
        else
            return v30.onRecentSearchesRenderItem(v41, v42, v43);
        end;
    end;
    v30.onItemActivated = function(v44, _)
        v30.props.OnSearchRequested(v44);
        if not v23() or not v30.props.ShowRecentSearchesInAutoComplete then
            v30.props.logAutocompleteSearchAnalytics(v44, v7.AUTOCOMPLETE_API_NAMES[v30.props.categoryName], v30.state.displayedSearchTerm, v30.keyCount, v30.deleteCount, true);
        else
            v6.MarketplaceRecentSearchClicked(v44);
        end;
        v30.keyCount = 0;
        v30.deleteCount = 0;
        v30:setState({
            displayedSearchTerm = v44
        });
    end;
    if v22() then
        v30.clearAllRecentSearches = function()
            v30.updateRecentSearches(v26);
        end;
        v30.tryCacheSearchTerm = function(v46)
            if not (v46:match("^%s*$") ~= nil) then
                local v47 = v30.getRecentSearches();
                if not table.find(v47, v46) then
                    table.insert(v47, 1, v46);
                    v30.updateRecentSearches(v47);
                end;
                return ;
            else
                return ;
            end;
        end;
        v30.removeSearchTermFromCache = function(v48)
            local v49 = v30.getRecentSearches();
            local v50 = table.find(v49, v48);
            if v50 then
                table.remove(v49, v50);
                v30.updateRecentSearches(v49);
            end;
        end;
    end;
    v30.onSearchRequested = function(v51)
        v30.props.OnSearchRequested(v51);
        if v51 ~= v30.state.displayedSearchTerm then
            v30.props.logAutocompleteSearchAnalytics(v51, v7.AUTOCOMPLETE_API_NAMES[v30.props.categoryName], nil, v30.keyCount, v30.deleteCount, true);
        end;
        v30.keyCount = 0;
        v30.deleteCount = 0;
        v30:setState({
            showAutocompleteResults = false
        });
        if v22() then
            v30.tryCacheSearchTerm(v51);
        end;
    end;
    v30.closeAutocomplete = function()
        v30:setState({
            showAutocompleteResults = false
        });
    end;
    if v22() then
        if v30.props.ShowRecentSearchesInAutoComplete then
            v30.onTextBoxFocusGained = function()
                v30:setState({
                    showAutocompleteResults = true
                });
            end;
        end;
        v30.updateRecentSearches = function(v52)
            v30.props.Plugin:get():SetSetting("RecentSearchesCache", v52);
            local v53 = nil;
            v53 = {
                v30.props.Localization:getText("General", "RecentSearches")
            };
            for _, v55 in v52, nil, nil do
                table.insert(v53, v55);
            end;
            v30:setState({
                dropdownMenuRenderItems = v53
            });
        end;
        v30.renderRecentSearchesDropdownMenuHeader = function(v56)
            return v4.createElement(v21, {
                DisableHover = true, 
                FocusedText = "", 
                Size = UDim2.new(1, 0, 0, 28), 
                Text = v56, 
                OnClick = function()
                end, 
                DropdownMenuItemButtonStyle = "ToolboxRecentSearchesButton", 
                ItemButtonContentOverride = v4.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Text = v30.props.Localization:getText("General", "SearchResultsClearAll"), 
                    TextColor3 = v30.props.Stylizer.linkButton.textColor, 
                    Position = UDim2.new(1, -14, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    LayoutOrder = 3, 
                    Size = UDim2.fromOffset(32, 20), 
                    TextScaled = true, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    [v4.Event.MouseButton1Click] = function()
                        v30.clearAllRecentSearches();
                    end
                })
            });
        end;
        v30.renderRecentSearchesDropdownMenuItem = function(v57, v58, v59)
            local v60, v61 = v4.createBinding("rbxasset://textures/StudioToolbox/Clear.png");
            local v62, v63 = v4.createBinding(v30.props.Stylizer.recentSearchesCloseButton.backgroundColor);
            return v4.createElement(v21, {
                HideSeparator = true, 
                EnableClearButton = true, 
                LayoutOrder = v58, 
                OnClick = v59, 
                Size = UDim2.new(1, 0, 0, 28), 
                Text = v57, 
                DropdownMenuItemButtonStyle = "ToolboxRecentSearchesButton", 
                OnMouseEnter = function()
                    v63(v30.props.Stylizer.recentSearchesCloseButton.hoverColor);
                    v61("rbxasset://textures/StudioToolbox/ClearHover.png");
                end, 
                OnMouseLeave = function()
                    v63(v30.props.Stylizer.recentSearchesCloseButton.backgroundColor);
                    v61("rbxasset://textures/StudioToolbox/Clear.png");
                end, 
                ItemButtonContentOverride = v4.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    Image = v60, 
                    Position = UDim2.new(1, -14, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    ImageColor3 = v62, 
                    LayoutOrder = 3, 
                    Size = UDim2.fromOffset(14, 14), 
                    [v4.Event.MouseButton1Click] = function()
                        v30.removeSearchTermFromCache(v57);
                    end
                })
            });
        end;
    end;
end;
v29.didMount = function(v64)
    if not v8.getShouldDisableAutocomplete() then
        if not (not v22() or not v64.props.ShowRecentSearchesInAutoComplete) then
            v64.updateRecentSearches(v64.getRecentSearches());
        end;
        local l_networkInterface_0 = v64.props.Network.networkInterface;
        v64.runServiceConnection = l_RunService_0.RenderStepped:Connect(function(v66)
            local l_displayedSearchTerm_0 = v64.state.displayedSearchTerm;
            if v64.state.showAutocompleteResults and v64.state.lastSearchTerm ~= l_displayedSearchTerm_0 then
                v64.autocompleteTimer = v64.autocompleteTimer + v66;
                if v64.isUserInputting then
                    v64.autocompleteTimer = 0;
                end;
                if v64.autocompleteTimer > 0.12 and l_displayedSearchTerm_0 ~= "" then
                    v64.props.getAutocompleteResults(l_networkInterface_0, v7.AUTOCOMPLETE_API_NAMES[v64.props.categoryName], l_displayedSearchTerm_0, l_game_FastInt_0);
                    v64.autocompleteTimer = 0;
                    v64:setState({
                        lastSearchTerm = l_displayedSearchTerm_0
                    });
                end;
            end;
            if l_displayedSearchTerm_0 == "" and v64.state.lastSearchTerm ~= "" then
                v64.props.getAutocompleteResults(l_networkInterface_0, v7.AUTOCOMPLETE_API_NAMES[v64.props.categoryName], l_displayedSearchTerm_0, l_game_FastInt_0);
                v64.autocompleteTimer = 0;
                v64:setState({
                    lastSearchTerm = l_displayedSearchTerm_0
                });
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v29.willUnmount = function(v68)
    if v68.runServiceConnection then
        v68.runServiceConnection:Disconnect();
        v68.runServiceConnection = nil;
    end;
end;
v29.didUpdate = function(v69, v70, _)
    if v70.searchTerm ~= v69.props.searchTerm then
        v69:setState({
            displayedSearchTerm = v69.props.searchTerm, 
            lastSearchTerm = v69.props.searchTerm
        });
    end;
end;
v29.render = function(v72)
    local l_props_1 = v72.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        Size = UDim2.new(0, l_props_1.Width, 1, 0)
    }, {
        TutorialStroke = if not not l_props_1.hasTutorialLimits and l_props_1.searchTerm == "" then v4.createElement("UIStroke", {
            Thickness = l_Stylizer_0.asset.strokeThickness, 
            Color = l_Stylizer_0.asset.strokeColor
        }) else nil, 
        TutorialCorner = if not not l_props_1.hasTutorialLimits and l_props_1.searchTerm == "" then v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }) else nil, 
        SearchBar = v4.createElement(l_SearchBar_0, {
            LayoutOrder = l_props_1.LayoutOrder, 
            OnInputBegan = v72.onInputBegan, 
            OnTextBoxFocusGained = if not v22() then nil else v72.onTextBoxFocusGained, 
            OnInputEnded = v72.onInputEnded, 
            OnSearchRequested = v72.onSearchRequested, 
            OnTextChanged = v72.onSearchTextChanged, 
            OnSearchOptionsToggled = l_props_1.OnSearchOptionsToggled, 
            SearchIsFiltered = l_props_1.SearchIsFiltered, 
            ShowSearchButton = false, 
            ShowFilterButton = v25(l_props_1.IXP) or v7.getTabForCategoryName(l_props_1.categoryName) == v7.MARKETPLACE, 
            ShowSearchIcon = true, 
            PlaceholderText = l_props_1.Localization:getText("General", "SearchBarDefaultText"), 
            SearchTerm = v72.state.displayedSearchTerm, 
            Style = "ToolboxSearchBar", 
            Width = l_props_1.Width
        }), 
        AutocompleteDropdown = if not not v22() and if not v22() then nil else v72.props.ShowRecentSearchesInAutoComplete then v4.createElement(l_DropdownMenu_0, {
            Hide = not v72.state.showAutocompleteResults or #v72.state.dropdownMenuRenderItems == 1, 
            Items = v72.state.dropdownMenuRenderItems, 
            OnFocusLost = v72.closeAutocomplete, 
            OnItemActivated = v72.onItemActivated, 
            OnRenderItem = v72.onAutocompleteRenderItem, 
            Priority = 2, 
            Style = "ToolboxSearchBarDropdown", 
            Width = l_props_1.Width
        }) else v4.createElement(l_DropdownMenu_0, {
            Hide = not v72.state.showAutocompleteResults or #l_props_1.autocompleteResults == 0, 
            Items = l_props_1.autocompleteResults, 
            OnFocusLost = v72.closeAutocomplete, 
            OnItemActivated = v72.onItemActivated, 
            OnRenderItem = v72.onAutocompleteRenderItem, 
            Priority = 2, 
            Style = "ToolboxSearchBarDropdown", 
            Width = l_props_1.Width
        })
    });
end;
return v5.connect(function(v75, _)
    v75 = v75 or {};
    local v77 = v75.pageInfo or {};
    local l_correctionState_0 = v77.correctionState;
    local _ = nil;
    return {
        autocompleteResults = not not v75.autocompleteResults and v75.autocompleteResults.autocompleteResults or {}, 
        categoryName = v77.categoryName or v7.DEFAULT.name, 
        searchTerm = v77.searchTerm or "", 
        searchId = v77.searchId or "", 
        autocorrectOfferedQuery = if not v24() then nil else if l_correctionState_0 == v20.AutocorrectResponseState.CorrectionAvailable then v77.correctedQuery else if l_correctionState_0 == v20.AutocorrectResponseState.CorrectionAccepted then v77.userQuery else "", 
        hasTutorialLimits = v75.tutorialLimits.assetIds ~= nil
    };
end, function(v80)
    return {
        logAutocompleteSearchAnalytics = function(v81, v82, v83, v84, v85, v86)
            v80(v11(v81, v82, v83, v84, v85, v86, false));
        end, 
        getAutocompleteResults = function(v87, v88, v89, v90)
            v80(v9(v87, v88, v89, v90));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v19, 
    Plugin = if not v22() then nil else l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    IXP = v18
})(v29)));
