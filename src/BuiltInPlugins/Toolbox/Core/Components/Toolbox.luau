local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixDefaultTabForCreations);
local v3 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnablePluginHomeview);
local l_AICOChatBot_0 = game:GetFastFlag("AICOChatBot");
local l_AICOChatBotFindVariationFix_0 = game:GetFastFlag("AICOChatBotFindVariationFix");
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Cryo);
local v8 = require(l_Packages_0.Roact);
local v9 = require(l_Packages_0.RoactRodux);
local v10 = require(l_Packages_0.Framework);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local l_getHomeViewEnabledAssetTypes_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).getHomeViewEnabledAssetTypes;
local v13 = require(l_Parent_0.SharedPluginConstants);
local l_Util_0 = l_Parent_0.Core.Util;
local v15 = require(l_Util_0.Constants);
local v16 = require(l_Util_0.PageInfoHelper);
local v17 = require(l_Util_0.getTabs);
local v18 = require(l_Util_0.Analytics.Analytics);
local v19 = require(l_Util_0.isInSemanticSearchIXP);
local l_Types_0 = l_Parent_0.Core.Types;
local v21 = require(l_Types_0.Sort);
local v22 = require(l_Types_0.Category);
local v23 = require(l_Types_0.RequestReason);
local l_Components_0 = l_Parent_0.Core.Components;
local v25 = require(l_Components_0.AnnouncementDialog);
local v26 = require(l_Components_0.TabSet);
local v27 = require(l_Components_0.Header);
local v28 = require(l_Components_0.MainView.MainView);
local v29 = require(l_Components_0.SoundPreviewComponent);
local v30 = require(l_Components_0.Home.HomeWrapper);
local v31 = if not v1() then require(l_Parent_0.Core.Components.SearchOptions.SearchOptions) else nil;
local v32 = require(l_Parent_0.Core.Components.SearchOptions.SearchOptionWrappers.AudioMarketplaceSearchOptions);
local v33 = if not v1() then nil else require(l_Parent_0.Core.Components.SearchOptions.SearchOptionWrappers.MarketplaceSearchOptions);
local v34 = if not v1() then nil else require(l_Parent_0.Core.Components.SearchOptions.SearchOptionWrappers.InventorySearchOptions);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v36 = require(l_Requests_0.UpdatePageInfoAndSendRequest);
local v37 = require(l_Requests_0.ChangeMarketplaceTab);
local v38 = require(l_Requests_0.GetToolboxManageableGroupsRequest);
local v39 = require(l_Requests_0.GetRolesRequest);
local v40 = require(l_Requests_0.GetRolesDebugRequest);
local v41 = require(l_Requests_0.GetRobuxBalance);
local v42 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = v10.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v45 = require(l_Parent_0.Core.ContextServices.Settings);
local v46 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v47 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v49 = require(l_Parent_0.Core.Actions.SetLayoutMode);
local v50 = require(l_Parent_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local l_DebugToolboxGetRolesRequest_0 = game:GetFastFlag("DebugToolboxGetRolesRequest");
local v52 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v53 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v54 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v55 = require(l_Parent_0.Core.Types.LayoutMode);
local v56 = require(l_Parent_0.Core.Types.Background);
local v57 = v8.PureComponent:extend("Toolbox");
v57.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v57.handleInitialSettings = function(v58)
    if v58.props.Settings and v58.props.Network then
        local l_networkInterface_0 = v58.props.Network.networkInterface;
        local v60 = v58.props.Settings:get("Plugin");
        local v61 = v60:loadInitialSettings();
        local v62 = nil;
        if v53() then
            v62 = v60:getLayoutMode();
            v58.props.setLayoutMode(v62);
        end;
        local v63 = nil;
        local v64 = nil;
        local v65 = v56.getBackgroundForStudioTheme();
        v63 = 1;
        v64 = "";
        local l_categoryName_0 = v61.categoryName;
        local v67 = v22.getTabForCategoryName(l_categoryName_0);
        if v52() and v67 == v22.CREATIONS then
            v67 = if not v2() then v22.INVENTORY else v22.DEFAULT_TAB;
            l_categoryName_0 = v22.DEFAULT.name;
        end;
        local v68 = {
            categories = v67, 
            categoryName = l_categoryName_0, 
            creator = v61.creator, 
            searchTerm = v64, 
            sortIndex = v63, 
            targetPage = 1, 
            selectedBackgroundIndex = v65, 
            requestReason = v23.InitLoad
        };
        local v69 = true;
        if v67 ~= v22.INVENTORY then
            v69 = v67 == v22.CREATIONS;
        end;
        if v69 then
            v58.props.getToolboxManageableGroups(l_networkInterface_0, v60, v68);
        end;
        local v70 = v54(v58.props.IXP);
        if v70 then
            v70 = false;
            if v62 == v55.ListView then
                v70 = v22.getTabForCategoryName(l_categoryName_0) == v22.INVENTORY;
            end;
        end;
        if not v70 then
            v58.props.updatePageInfo(l_networkInterface_0, v60, v68);
        end;
        return ;
    else
        return ;
    end;
end;
v57.init = function(v71, v72)
    v71.state = {
        toolboxWidth = math.max(v72.initialWidth or 0, v15.TOOLBOX_MIN_WIDTH), 
        showSearchOptions = false
    };
    v71.onAbsoluteSizeChange = function(v73)
        local v74 = math.max(v73.AbsoluteSize.X, v15.TOOLBOX_MIN_WIDTH);
        if v71.state.toolboxWidth ~= v74 then
            v71:setState({
                toolboxWidth = v74
            });
        end;
    end;
    v71:handleInitialSettings();
    v71.toggleSearchOptions = function()
        local l_showSearchOptions_0 = v71.state.showSearchOptions;
        if not l_showSearchOptions_0 then
            local l_categoryName_1 = v71.props.categoryName;
            local v77 = v22.getCategoryByName(l_categoryName_1);
            v18.MarketplaceSearchFilterOpened(if not v77 then nil else v22.ToolboxAssetTypeToEngine[v77.assetType], (v22.getTabKeyForCategoryName(l_categoryName_1)));
        end;
        v71.props.Modal.onSearchOptionsToggled(not l_showSearchOptions_0);
        v71:setState({
            showSearchOptions = not l_showSearchOptions_0
        });
    end;
    local function v83(v78, v79)
        if v22.CREATIONS_KEY == v78 then
            for _, v81 in ipairs(v79) do
                local l_v81_0 = v81;
                if l_v81_0 then
                    l_v81_0 = true;
                    if v81.selectable ~= nil then
                        l_v81_0 = v81.selectable;
                    end;
                end;
                if l_v81_0 then
                    return v81.name;
                end;
            end;
        end;
        return v79[1].name;
    end;
    local function _(v84)
        if l_showRobloxCreatedAssets_0() and v84 == v22.MARKETPLACE_KEY then
            return v22.CREATOR_ROBLOX;
        else
            return nil;
        end;
    end;
    v71.changeMarketplaceTab = function(v86, v87)
        local v88 = v22.getCategories(v86, v71.props.roles, if not v52() then nil else v71.props.IXP);
        local v89 = v7.Dictionary.join({
            categoryName = v83(v86, v88), 
            creator = if not not l_showRobloxCreatedAssets_0() and v86 == v22.MARKETPLACE_KEY then v22.CREATOR_ROBLOX else nil, 
            searchTerm = "", 
            sortIndex = 1, 
            groupIndex = 0
        }, v87 or {});
        v71.props.changeMarketplaceTab(v71.props.Network.networkInterface, v86, v88, v71.props.Settings:get("Plugin"), v89, if not v52() then nil else v71.props.IXP);
        v18.onCategorySelected(v16.getCategory(v71.props.categoryName), (v16.getCategory(v89.categoryName)));
    end;
    v71.onBackToHome = function()
        local l_categoryName_2 = v71.props.categoryName;
        v71.changeMarketplaceTab(v22.getTabKeyForCategoryName(l_categoryName_2), {
            categoryName = l_categoryName_2
        });
    end;
    if l_AICOChatBot_0 then
        v71.updatePageInfoWithSearchTerm = function(v91)
            if v71.props.Settings and v71.props.Network then
                v71.props.updatePageInfo(v71.props.Network.networkInterface, v71.props.Settings:get("Plugin"), {
                    searchTerm = v91
                });
                return ;
            else
                return ;
            end;
        end;
    end;
end;
v57.didUpdate = function(v92, v93, _)
    local l_props_0 = v92.props;
    if v93.searchId ~= l_props_0.searchId then
        v92.props.logSearchAnalytics(l_props_0.searchTerm);
    end;
end;
v57.didMount = function(v96)
    v96:handleInitialSettings();
    v96.props.setRoles(v96.props.Network.networkInterface);
    v96.props.getRobuxBalance(v96.props.Network.networkInterface);
    v96._showPluginsConnection = not not v96.props.pluginLoaderContext and v96.props.pluginLoaderContext.signals["MemStorageService." .. v13.SHOW_TOOLBOX_PLUGINS_EVENT]:Connect(function()
        v96.changeMarketplaceTab(v22.MARKETPLACE_KEY, {
            categoryName = v22.WHITELISTED_PLUGINS.name
        });
        v18.openedFromPluginManagement();
    end) or nil;
    if l_AICOChatBot_0 then
        v96._showPluginsConnection = not not v96.props.pluginLoaderContext and v96.props.pluginLoaderContext.signals["MemStorageService." .. v13.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT]:Connect(function(v97)
            if not l_AICOChatBotFindVariationFix_0() then
                v96.changeMarketplaceTab(v22.MARKETPLACE_KEY, {
                    categoryName = v22.FREE_MODELS.name
                });
                v96.updatePageInfoWithSearchTerm(v97);
                return ;
            else
                v96.changeMarketplaceTab(v22.MARKETPLACE_KEY, {
                    categoryName = v22.FREE_MODELS.name, 
                    searchTerm = v97
                });
                return ;
            end;
        end) or nil;
    end;
    v96._changeMarketplaceTabConnection = not not v96.props.pluginLoaderContext and v96.props.pluginLoaderContext.signals["MemStorageService." .. v15.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE]:Connect(function(v98)
        v96.changeMarketplaceTab(v22.MARKETPLACE_KEY, {
            categoryName = v22.getMarketplaceCategoryByAssetType(Enum.AssetType[v98]).name
        });
        v18.openedExternallyByAssetType(v98);
    end) or nil;
end;
v57.willUnmount = function(v99)
    if v99._showPluginsConnection then
        v99._showPluginsConnection:Disconnect();
        v99._showPluginsConnection = nil;
    end;
    if v99._changeMarketplaceTabConnection then
        v99._changeMarketplaceTabConnection:Disconnect();
        v99._changeMarketplaceTabConnection = nil;
    end;
end;
v57.render = function(v100)
    local l_props_1 = v100.props;
    local l_state_0 = v100.state;
    local l_toolboxWidth_0 = l_state_0.toolboxWidth;
    local l_showSearchOptions_1 = l_state_0.showSearchOptions;
    local _ = l_props_1.backgrounds;
    local l_creator_0 = l_props_1.creator;
    local l_searchTerm_0 = l_props_1.searchTerm;
    local v108 = l_props_1.suggestions or {};
    local l_categoryName_3 = l_props_1.categoryName;
    local l_audioSearchInfo_0 = l_props_1.audioSearchInfo;
    local l_additionalAudioSearchInfo_0 = l_props_1.additionalAudioSearchInfo;
    local l_uiSortIntent_0 = l_props_1.uiSortIntent;
    local v113 = v22.getTabKeyForCategoryName(l_categoryName_3);
    local l_tryOpenAssetConfig_0 = l_props_1.tryOpenAssetConfig;
    local l_pluginGui_0 = l_props_1.pluginGui;
    local l_Size_0 = v100.props.Size;
    local l_Stylizer_0 = v100.props.Stylizer;
    local l_Localization_0 = l_props_1.Localization;
    local l_locale_0 = l_props_1.Localization.locale;
    local l_onAbsoluteSizeChange_0 = v100.onAbsoluteSizeChange;
    local l_TAB_WIDGET_HEIGHT_0 = v15.TAB_WIDGET_HEIGHT;
    local v122 = false;
    local v123 = {};
    local v124 = v22.getEngineAssetType(v22.getCategoryByName(l_categoryName_3).assetType);
    local v125 = if not not v3() and l_getHomeViewEnabledAssetTypes_0() ~= nil then string.split(l_getHomeViewEnabledAssetTypes_0(), ";") else {};
    if ((((v113 == v22.MARKETPLACE_KEY and (not l_creator_0 or l_creator_0 == "")) and l_searchTerm_0 == "") and l_audioSearchInfo_0 == nil) and l_additionalAudioSearchInfo_0 == nil) and l_uiSortIntent_0 == nil then
        if not v3() then
            table.insert(v123, Enum.AssetType.Model);
            table.insert(v123, Enum.AssetType.Audio);
        else
            for _, v127 in ipairs(v125) do
                local v128 = Enum.AssetType[v127];
                if v128 then
                    table.insert(v123, v128);
                end;
            end;
        end;
        v122 = table.find(v123, v124);
    end;
    local v129 = nil;
    if not v1() then
        v129 = if not l_showSearchOptions_1 then nil else v8.createElement(v31, {
            onSearchOptionsToggled = v100.toggleSearchOptions
        });
    else
        local v130 = v22.getTabForCategoryName(l_categoryName_3) == v22.INVENTORY;
        if l_showSearchOptions_1 then
            v129 = if not v130 then if v22.categoryIsAudio(l_categoryName_3) then v8.createElement(v32, {
                OnClose = v100.toggleSearchOptions
            }) else v8.createElement(v33, {
                OnClose = v100.toggleSearchOptions
            }) else v8.createElement(v34, {
                OnClose = v100.toggleSearchOptions
            });
        end;
    end;
    return v8.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = l_Size_0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        [v8.Change.AbsoluteSize] = l_onAbsoluteSizeChange_0, 
        [v8.Event.MouseEnter] = l_props_1.onMouseEnter
    }, {
        AnnouncementDialogContainer = v8.createElement(v25, {
            checkUserInIXP = v19
        }), 
        Tabs = v8.createElement(v26, {
            Disabled = l_props_1.hasTutorialLimits, 
            Size = UDim2.new(1, 0, 0, v15.TAB_WIDGET_HEIGHT), 
            Tabs = if not v52() then v17(l_Localization_0) else v17(l_Localization_0, l_props_1.roles, l_props_1.IXP), 
            CurrentTab = v113, 
            onTabSelected = v100.changeMarketplaceTab
        }), 
        Header = v8.createElement(v27, {
            Position = UDim2.new(0, 0, 0, l_TAB_WIDGET_HEIGHT_0), 
            maxWidth = l_toolboxWidth_0, 
            onSearchOptionsToggled = v100.toggleSearchOptions, 
            pluginGui = l_pluginGui_0
        }), 
        MainView = if not v122 then v8.createElement(v28, {
            Position = UDim2.new(0, 0, 0, (l_TAB_WIDGET_HEIGHT_0 + v15.HEADER_HEIGHT) + 1), 
            Size = UDim2.new(1, 0, 1, -((v15.HEADER_HEIGHT + l_TAB_WIDGET_HEIGHT_0) + 2)), 
            maxWidth = l_toolboxWidth_0, 
            suggestions = v108, 
            tryOpenAssetConfig = l_tryOpenAssetConfig_0, 
            onBackToHome = v100.onBackToHome
        }) else v8.createElement(v30, {
            AssetType = v124, 
            CategoryName = l_categoryName_3, 
            Locale = l_locale_0, 
            Position = UDim2.new(0, 0, 0, (l_TAB_WIDGET_HEIGHT_0 + v15.HEADER_HEIGHT) + 1), 
            Size = UDim2.new(1, 0, 1, -((v15.HEADER_HEIGHT + l_TAB_WIDGET_HEIGHT_0) + 2)), 
            SortName = v21.getDefaultSortNameForCategory(l_categoryName_3), 
            TryOpenAssetConfig = l_tryOpenAssetConfig_0, 
            EnabledAssetTypes = v123
        }), 
        SearchOptions = v129, 
        AudioPreview = v8.createElement(v29)
    });
end;
return v9.connect(function(v131, _)
    v131 = v131 or {};
    local v133 = v131.pageInfo or {};
    return {
        categoryName = v133.categoryName or v22.DEFAULT.name, 
        creator = v133.creator, 
        audioSearchInfo = v133.audioSearchInfo, 
        additionalAudioSearchInfo = v133.additionalAudioSearchInfo, 
        roles = v131.roles or {}, 
        searchId = v133.searchId or "", 
        searchTerm = v133.searchTerm or "", 
        sorts = v133.sorts or {}, 
        uiSortIntent = if not not v133.uiSortIntent and v133.uiSortIntent ~= v7.None then v133.uiSortIntent else nil, 
        hasTutorialLimits = v131.tutorialLimits.assetIds ~= nil
    };
end, function(v134)
    return {
        setRoles = function(v135)
            if not l_DebugToolboxGetRolesRequest_0 then
                v134(v39(v135));
                return ;
            else
                v134(v40(v135));
                return ;
            end;
        end, 
        updatePageInfo = function(v136, v137, v138)
            v134(v36(v136, v137, v138));
        end, 
        changeMarketplaceTab = function(v139, v140, v141, v142, v143, v144)
            v134(v37(v139, v140, v141, v142, v143, v144));
        end, 
        getRobuxBalance = function(v145)
            v134(v41(v145));
        end, 
        getToolboxManageableGroups = function(v146, v147, v148)
            v134(v38(v146, v147, v148));
        end, 
        logSearchAnalytics = function(v149)
            return v134(v50(v149, false));
        end, 
        setLayoutMode = if not v53() then nil else function(v150)
            v134(v49(v150));
        end
    };
end)((l_withContext_0({
    IXP = if v52() or v53() then v42 else nil, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v45, 
    Modal = v46, 
    Network = v47
})(v57)));
