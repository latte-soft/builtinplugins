local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v6 = require(l_Parent_0.Core.Util.Constants);
local v7 = require(l_Parent_0.Core.Util.DebugFlags);
local v8 = require(l_Parent_0.Core.Util.Images);
local v9 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v10 = require(l_Parent_0.Core.Localization.getLocalizedCategories);
local v11 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v11 = require(l_Parent_0.Core.Util.getIsIXPVariableEnabled);
end;
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v13 = require(l_Parent_0.Core.Types.Category);
local v14 = require(l_Parent_0.Core.Types.LayoutMode);
local _ = require(l_Parent_0.Core.Types.AnalyticsTypes);
local v16 = require(l_Packages_0.Framework);
local l_deepCopy_0 = v16.Util.deepCopy;
local l_IconButton_0 = v16.UI.IconButton;
local _ = v16.UI.Tooltip;
local v20 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v23 = require(l_Parent_0.Core.ContextServices.Settings);
local v24 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v25 = require(l_Parent_0.Core.Components.DropdownMenu);
local v26 = require(l_Parent_0.Core.Components.SearchBarWithAutocomplete);
local v27 = require(l_Parent_0.Core.Actions.SetLayoutMode);
local v28 = require(l_Parent_0.Core.Actions.UpdateSearchTerm);
local v29 = require(l_Parent_0.Core.Networking.Requests.RequestSearchRequest);
local v30 = require(l_Parent_0.Core.Networking.Requests.SelectCategoryRequest);
local v31 = require(l_Parent_0.Core.Networking.Requests.SelectGroupRequest);
local v32 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
local v33 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v34 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v35 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local v36 = require(l_Parent_0.Core.Util.ToolboxCommunication);
local v37 = v3.PureComponent:extend("Header");
local l_settings_0 = settings;
local v39 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v39 = {
        [v13.MY_PACKAGES.name] = true, 
        [v13.GROUP_PACKAGES.name] = true, 
        [v13.CREATIONS_GROUP_PACKAGES.name] = true
    };
end;
v37.init = function(v40)
    v40.state = {
        searchTerm = ""
    };
    v40.keyCount = 0;
    v40.deleteCount = 0;
    v40.unlocalizedCategories = nil;
    local v41 = nil;
    v40.onCategorySelected = function(v42, _)
        local l_networkInterface_0 = v40.props.Network.networkInterface;
        local v45 = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v11(v40.props.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
        local v46 = nil;
        v46 = if not v45 then v40.props.categories[v42].name else v40.unlocalizedCategories[v42].name;
        if v40.props.categoryName ~= v46 then
            v5.onCategorySelected(v40.props.categoryName, v46);
            v41 = v40.props.Settings:get("Plugin");
            v40.props.selectCategory(l_networkInterface_0, v41, v46);
            if v40.props.searchTerm and v40.props.searchTerm ~= "" then
                v40.onSearchRequested(v40.props.searchTerm, v46);
            end;
        end;
    end;
    v40.onGroupSelected = function(v47)
        if v40.props.groupIndex ~= v47 then
            v40.props.selectGroup(v40.props.Network.networkInterface, v47);
        end;
    end;
    v40.onSearchRequested = function(v48, v49)
        local l_networkInterface_1 = v40.props.Network.networkInterface;
        local v51 = v40.props.Settings:get("Plugin");
        if not (not (type(v48) ~= "string") or not v7.shouldDebugWarnings()) then
            warn(("Toolbox onSearchRequested searchTerm = %s is not a string"):format((tostring(v48))));
        end;
        local l_creatorFilter_0 = v40.props.creatorFilter;
        if not (l_creatorFilter_0 and l_creatorFilter_0.Id) then
            local _ = nil;
        end;
        local _ = v9.getCategory(v49 or v40.props.categoryName);
        v40.keyCount = 0;
        v40.deleteCount = 0;
        v40.mostRecentSearchRequestTime = tick();
        local l_mostRecentSearchRequestTime_0 = v40.mostRecentSearchRequestTime;
        delay(l_settings_0():GetFVariable("StudioSearchWithoutInsertionTimeSeconds"), function()
            if l_mostRecentSearchRequestTime_0 == v40.mostRecentSearchRequestTime then
                v40:checkRecentAssetInsertion();
            end;
        end);
        if not (v13.categoryIsFont(v40.props.categoryName) and v13.categoryIsFont(v49 or v40.props.categoryName)) then
            v40.props.requestSearch(l_networkInterface_1, v51, v48, v49);
            v36:fire("SearchRequested", {
                searchTerm = v48
            });
            return ;
        else
            v40.props.updateSearchTerm(v48);
            return ;
        end;
    end;
    v40.onSearchOptionsToggled = function()
        if v40.props.onSearchOptionsToggled then
            v40.props.onSearchOptionsToggled();
        end;
    end;
    v40.onSearchTextChanged = function(v56)
        if string.len(v40.state.searchTerm) < string.len(v56) then
            local l_v40_0 = v40;
            l_v40_0.keyCount = l_v40_0.keyCount + 1;
        elseif string.len(v56) < string.len(v40.state.searchTerm) then
            local l_v40_1 = v40;
            l_v40_1.deleteCount = l_v40_1.deleteCount + 1;
        end;
        v40:setState({
            searchTerm = v56
        });
    end;
    v40.toggleLayoutMode = if not v33() then nil else function()
        local l_props_0 = v40.props;
        local v60 = l_props_0.Settings:get("Plugin");
        local v61 = if l_props_0.layoutMode == v14.Grid then v14.ListView else v14.Grid;
        l_props_0.setLayoutMode(v61);
        v60:setLayoutMode(v61);
        if v35() then
            local v62 = v13.getCategoryByName(l_props_0.categoryName);
            v5.MarketplaceListViewToggleClicked(v61, {
                assetType = if not v62 then nil else v62.assetType, 
                searchId = l_props_0.searchId
            });
        end;
    end;
end;
v37.willUpdate = function(v63, v64, _)
    if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
        v63.unlocalizedCategories = v64.categories;
    end;
end;
v37.render = function(v66)
    local l_props_1 = v66.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Localization_0 = l_props_1.Localization;
    local v70 = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v11(l_props_1.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled");
    local l_categoryName_0 = l_props_1.categoryName;
    local v72 = nil;
    local v73 = nil;
    if not v70 then
        v72 = v10(l_Localization_0, l_props_1.categories);
        v73 = v13.getCategoryIndex(l_categoryName_0, l_props_1.roles, if not v12() then nil else l_props_1.IXP);
    else
        local v74 = l_deepCopy_0(l_props_1.categories);
        for v75, v76 in pairs(v74) do
            if v39[v76.category] then
                table.remove(v74, v75);
            end;
        end;
        v72 = v10(l_Localization_0, v74);
        v73 = 1;
        for v77, v78 in ipairs(v74) do
            if v78.name == l_categoryName_0 then
                v73 = v77;
            end;
        end;
        v66.unlocalizedCategories = v74;
    end;
    local l_onCategorySelected_0 = v66.onCategorySelected;
    local l_searchTerm_0 = l_props_1.searchTerm;
    local l_onSearchRequested_0 = v66.onSearchRequested;
    local l_groups_0 = l_props_1.groups;
    local l_groupIndex_0 = l_props_1.groupIndex;
    local l_onGroupSelected_0 = v66.onGroupSelected;
    local v85;
    if not v34(l_props_1.IXP) then
        v85 = nil;
    else
        v85 = false;
        if v13.getTabForCategoryName(l_props_1.categoryName) == v13.INVENTORY then
            v85 = false;
            if l_props_1.categoryName ~= v13.MY_AUDIO.name then
                v85 = l_props_1.categoryName ~= v13.MY_FONTS.name;
            end;
        end;
    end;
    local l_searchIsFiltered_0 = l_props_1.searchIsFiltered;
    local v87 = nil;
    local v88 = nil;
    if not v34(l_props_1.IXP) then
        v87 = v6.HEADER_DROPDOWN_MAX_WIDTH;
        v88 = 0;
    else
        v87 = if not v85 then v6.HEADER_DROPDOWN_MAX_WIDTH else v6.HEADER_DROPDOWN_MIN_WIDTH + (not v85 and 0 or 5);
        v88 = not v85 and 0 or v6.HEADER_OPTIONSBUTTON_WIDTH + v6.HEADER_INNER_PADDING;
    end;
    local _ = v66.onSearchOptionsToggled;
    local v90 = math.max(100, ((((l_props_1.maxWidth or 0) - 2 * v6.HEADER_OUTER_PADDING) - v87) - v88) - v6.HEADER_INNER_PADDING);
    local v91 = v13.categoryIsGroupAsset(l_categoryName_0);
    local l_header_0 = l_Stylizer_0.header;
    local v93 = v13.getTabForCategoryName(l_categoryName_0) == v13.CREATIONS;
    local _ = v13.getTabForCategoryName(l_categoryName_0) == v13.INVENTORY;
    local v95 = v93 and not v91;
    local v96 = not v91 and not v93;
    if v13.getTabForCategoryName(l_categoryName_0) == v13.RECENT then
        v96 = false;
        v95 = true;
    end;
    local v97 = {
        LayoutOrder = 1, 
        OnSearchRequested = l_onSearchRequested_0, 
        OnTextChanged = v66.onSearchTextChanged, 
        SearchTerm = l_searchTerm_0, 
        Width = v90, 
        OnSearchOptionsToggled = v66.onSearchOptionsToggled, 
        SearchIsFiltered = l_searchIsFiltered_0
    };
    local v98;
    if not v32() then
        v98 = nil;
    else
        v98 = true;
        if v66.state.searchTerm ~= "" then
            v98 = v66.state.searchTerm == nil;
        end;
    end;
    v97.ShowRecentSearchesInAutoComplete = v98;
    return v3.createElement("ImageButton", {
        Position = l_props_1.Position, 
        Size = UDim2.new(1, 0, 0, v6.HEADER_HEIGHT), 
        BackgroundColor3 = l_header_0.backgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        AutoButtonColor = false
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v6.HEADER_OUTER_PADDING), 
            PaddingLeft = UDim.new(0, v6.HEADER_OUTER_PADDING), 
            PaddingRight = UDim.new(0, v6.HEADER_OUTER_PADDING), 
            PaddingTop = UDim.new(0, v6.HEADER_OUTER_PADDING)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v6.HEADER_INNER_PADDING)
        }), 
        CategoryMenu = v3.createElement(v25, {
            Disabled = l_props_1.hasTutorialLimits, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = not not v95 and UDim2.new(1, 0, 1, 0) or UDim2.new(0, v87, 1, 0), 
            LayoutOrder = 0, 
            visibleDropDownCount = 8, 
            selectedDropDownIndex = v73, 
            items = v72, 
            menuKey = if v93 then nil else "category", 
            onItemClicked = l_onCategorySelected_0
        }), 
        SearchBar = v96 and v3.createElement(v26, v97), 
        ToggleListViewButton = if not not v33() and v85 then v3.createElement(l_IconButton_0, {
            BackgroundStyle = "None", 
            Cursor = "PointingHand", 
            IconColor = l_header_0.iconColor, 
            IconSize = v6.HEADER_OPTIONSBUTTON_WIDTH, 
            LayoutOrder = 2, 
            LeftIcon = if l_props_1.layoutMode == v14.ListView then v8.GALLERY_ICON else v8.LIST_ICON, 
            OnClick = v66.toggleLayoutMode, 
            Padding = 2, 
            Size = UDim2.fromOffset(v88, v6.HEADER_OPTIONSBUTTON_HEIGHT), 
            TooltipText = if l_props_1.layoutMode == v14.ListView then l_Localization_0:getText("General", "GridView") else l_Localization_0:getText("General", "ListView")
        }) else nil, 
        GroupMenu = v91 and v3.createElement(v25, {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(0, v90, 1, 0), 
            LayoutOrder = 1, 
            visibleDropDownCount = 8, 
            selectedDropDownIndex = l_groupIndex_0, 
            items = l_groups_0, 
            menuKey = "id", 
            onItemClicked = l_onGroupSelected_0
        })
    });
end;
v37.checkRecentAssetInsertion = function(v99)
    if v99.props.mostRecentAssetInsertTime < v99.mostRecentSearchRequestTime then
        v5.onTermSearchedWithoutInsertion(v9.getCategory(v99.props.categoryName), v99.props.searchTerm);
    end;
end;
local function _(v100)
    if v100 then
        return v100:FindFirstChild("tabRefresh");
    else
        return nil;
    end;
end;
local function _(v102)
    local v103 = if v102 then v102:FindFirstChild("tabRefresh") else nil;
    if not v103 then
        v103 = Instance.new("BindableEvent");
        v103.Name = "tabRefresh";
        v103.Parent = v102;
    end;
    return v103;
end;
local function _(v105)
    local v106 = if v105 then v105:FindFirstChild("tabRefresh") else nil;
    if v106 then
        v106:Destroy();
    end;
end;
v37.addTabRefreshCallback = function(v108)
    if not v108.tabRefreshConnection then
        local l_pluginGui_0 = v108.props.pluginGui;
        local v110 = if l_pluginGui_0 then l_pluginGui_0:FindFirstChild("tabRefresh") else nil;
        if not v110 then
            v110 = Instance.new("BindableEvent");
            v110.Name = "tabRefresh";
            v110.Parent = l_pluginGui_0;
        end;
        v108.tabRefreshConnection = v110.Event:connect(function()
            v108.props.selectCategory(v108.props.Network.networkInterface, v108.props.Settings:get("Plugin"), v108.props.categoryName);
        end);
    end;
end;
v37.removeTabRefreshCallback = function(v111)
    if v111.tabRefreshConnection then
        v111.tabRefreshConnection:disconnect();
        v111.tabRefreshConnection = nil;
    end;
end;
v37.didMount = function(v112)
    if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
        v112.unlocalizedCategories = v112.props.categories;
    end;
    local l_pluginGui_1 = v112.props.pluginGui;
    if not if l_pluginGui_1 then l_pluginGui_1:FindFirstChild("tabRefresh") else nil then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = "tabRefresh";
        l_BindableEvent_0.Parent = l_pluginGui_1;
    end;
    v112:addTabRefreshCallback();
end;
v37.willUnmount = function(v115)
    v115:removeTabRefreshCallback();
    local l_pluginGui_2 = v115.props.pluginGui;
    local v117 = if l_pluginGui_2 then l_pluginGui_2:FindFirstChild("tabRefresh") else nil;
    if v117 then
        v117:Destroy();
    end;
end;
v37 = l_withContext_0({
    IXP = if (l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 or v33()) or v12() then v20 else nil, 
    Settings = v23, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v24
})(v37);
isSearchFiltered = function(v118)
    return v118.includeUnverifiedCreators;
end;
return v4.connect(function(v119, _)
    v119 = v119 or {};
    local v121 = v119.assets or {};
    local v122 = v119.pageInfo or {};
    return {
        categories = v122.categories or {}, 
        categoryName = v122.categoryName or v13.DEFAULT.name, 
        creatorFilter = v122.creator or {}, 
        groups = v122.groups or {}, 
        groupIndex = v122.groupIndex or 0, 
        layoutMode = if not v33() then nil else v122.layoutMode, 
        mostRecentAssetInsertTime = v121.mostRecentAssetInsertTime, 
        roles = v119.roles, 
        searchId = if not v35() then nil else v122.searchId, 
        searchIsFiltered = isSearchFiltered(v122), 
        searchTerm = v122.searchTerm or "", 
        hasTutorialLimits = v119.tutorialLimits.assetIds ~= nil
    };
end, function(v123)
    return {
        selectCategory = function(v124, v125, v126)
            v123(v30(v124, v125, v126));
        end, 
        selectGroup = function(v127, v128)
            v123(v31(v127, v128));
        end, 
        requestSearch = function(v129, v130, v131, v132)
            v123(v29(v129, v130, v131, v132, false));
        end, 
        setLayoutMode = if not v33() then nil else function(v133)
            v123(v27(v133));
        end, 
        updateSearchTerm = function(v134)
            v123(v28(v134));
        end
    };
end)(v37);
