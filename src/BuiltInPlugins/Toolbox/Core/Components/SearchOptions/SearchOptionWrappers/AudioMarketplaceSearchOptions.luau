local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Framework);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.debounce);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v12 = require(l_script_FirstAncestor_0.Core.Networking.Requests.UserSearchRequest);
local v13 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioSearch);
local v14 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.LiveSearchBar);
local v15 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v16 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsLayout);
local v17 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.VerfifiedCreatorCheckbox);
local _ = require(l_script_FirstAncestor_0.Core.Reducers.PageInfo);
local l_RadioButtonList_0 = v5.UI.RadioButtonList;
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local v21 = require(l_script_FirstAncestor_0.Core.Types.BackendTypes);
local v22 = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Types.SearchOptionsTypes);
local l_game_FastInt_0 = game:GetFastInt("ToolboxLiveSearchDebounceWait");
game:DefineFastFlag("StudioAudioNewTrendingSort", false);
local v25 = {
    LongestToShortest = "LongestToShortest", 
    MostUsed = "MostUsed", 
    New = "New", 
    Relevance = "Relevance", 
    ShortestToLongest = "ShortestToLongest", 
    Trending = "Trending"
};
local v26 = if not game:GetFastFlag("StudioAudioNewTrendingSort") then {
    v25.Relevance, 
    v25.MostUsed, 
    v25.ShortestToLongest, 
    v25.LongestToShortest
} else {
    v25.Relevance, 
    v25.MostUsed, 
    v25.Trending, 
    v25.New, 
    v25.ShortestToLongest, 
    v25.LongestToShortest
};
local v27 = {
    [v25.Relevance] = {
        uiSortIntent = v21.UiSortIntent.Relevance
    }, 
    [v25.MostUsed] = {
        uiSortIntent = v21.UiSortIntent.MostTaken
    }, 
    [v25.Trending] = {
        uiSortIntent = v21.UiSortIntent.Trending
    }, 
    [v25.New] = {
        uiSortIntent = v21.UiSortIntent.DateCreated, 
        sortDirection = v21.SortDirection.Descending
    }, 
    [v25.ShortestToLongest] = {
        uiSortIntent = v21.UiSortIntent.Duration, 
        sortDirection = v21.SortDirection.Ascending
    }, 
    [v25.LongestToShortest] = {
        uiSortIntent = v21.UiSortIntent.Duration, 
        sortDirection = v21.SortDirection.Descending
    }
};
local function v31(v28)
    if v28.uiSortIntent then
        if v28.uiSortIntent == v21.UiSortIntent.Duration and v28.sortDirection == nil then
            return v25.Relevance;
        else
            for v29, v30 in v27, nil, nil do
                if v28.uiSortIntent == v30.uiSortIntent and (not (v28.sortDirection ~= nil) or v28.sortDirection == v30.sortDirection) then
                    return v29;
                end;
            end;
        end;
    end;
    return v21.UiSortIntent.Default;
end;
local v32 = v3.PureComponent:extend("AudioMarketplaceSearchOptions");
v32.init = function(v33)
    v33.getInitState = function(v34)
        return {
            includeUnverifiedCreators = v34.includeUnverifiedCreators, 
            minDuration = v34.minDuration or v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = v34.maxDuration or v7.MAX_AUDIO_SEARCH_DURATION, 
            sortIntentKey = v34.initialSortIntentKey, 
            searchTerm = v34.initialCreatorName
        };
    end;
    v33.state = v33.getInitState(v33.props);
    v33.debouncedUserSearch = v8(function(v35)
        local l_props_0 = v33.props;
        l_props_0.userSearch(l_props_0.Network.networkInterface, v35);
    end, l_game_FastInt_0);
    v33.updateUserSearch = function(v37, v38)
        v33:setState({
            searchTerm = v37, 
            extraSearchDetails = v38
        });
        v33.debouncedUserSearch(v37);
    end;
    v33.onSelectSortIntent = function(v39)
        v33:setState({
            sortIntentKey = v39
        });
    end;
    v33.onDurationChange = function(v40, v41)
        local l_state_0 = v33.state;
        if not (v40 == l_state_0.minDuration) or v41 ~= l_state_0.maxDuration then
            v33:setState({
                minDuration = v40, 
                maxDuration = v41
            });
        end;
    end;
    v33.onToggleIdVerified = function()
        v33:setState(function(v43)
            return {
                includeUnverifiedCreators = not v43.includeUnverifiedCreators
            };
        end);
    end;
    v33.getSearchOptions = function()
        local _ = v33.props;
        local l_state_1 = v33.state;
        local v46 = if not l_state_1.sortIntentKey then nil else v27[l_state_1.sortIntentKey];
        local v47 = {
            Creator = l_state_1.searchTerm, 
            includeUnverifiedCreators = l_state_1.includeUnverifiedCreators, 
            uiSortIntent = if not v46 then v2.None else v46.uiSortIntent, 
            sortDirection = if not not v46 and v46.sortDirection then v46.sortDirection else v2.None
        };
        if not (l_state_1.minDuration == v7.MIN_AUDIO_SEARCH_DURATION) or l_state_1.maxDuration ~= v7.MAX_AUDIO_SEARCH_DURATION then
            v47.AudioSearch = {
                minDuration = l_state_1.minDuration, 
                maxDuration = l_state_1.maxDuration
            };
        end;
        if l_state_1.extraSearchDetails and next(l_state_1.extraSearchDetails) ~= nil then
            v47.Creator = {
                Name = l_state_1.extraSearchDetails.Name, 
                Id = l_state_1.extraSearchDetails.Id
            };
        end;
        return v47;
    end;
    v33.onReset = function()
        v33:setState({
            includeUnverifiedCreators = false, 
            minDuration = v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = v7.MAX_AUDIO_SEARCH_DURATION, 
            sortIntentKey = v25.Relevance, 
            searchTerm = "", 
            extraSearchDetails = {}
        });
    end;
    v33.onClose = function()
        v33.onReset();
        v33.props.OnClose();
    end;
end;
v32.didUpdate = function(v48, v49, _)
    v48:setState(function(_, v52)
        if not (((v49.includeUnverifiedCreators == v52.includeUnverifiedCreators and v49.maxDuration == v52.maxDuration) and v49.minDuration == v52.minDuration) and (v49.pageInfo and v49.pageInfo.uiSortIntent) == v52.pageInfo.uiSortIntent) or (v49.pageInfo and v49.pageInfo.sortDirection) ~= v52.pageInfo.sortDirection then
            return v48.getInitState(v52);
        else
            return ;
        end;
    end);
end;
v32.render = function(v53)
    local l_props_2 = v53.props;
    local l_state_2 = v53.state;
    local l_categoryName_0 = l_props_2.categoryName;
    local l_Localization_0 = l_props_2.Localization;
    local l_initialSortIntentKey_0 = l_props_2.initialSortIntentKey;
    local l_minDuration_0 = l_state_2.minDuration;
    local l_maxDuration_0 = l_state_2.maxDuration;
    local l_sortIntentKey_0 = l_state_2.sortIntentKey;
    local v62 = {};
    for _, v64 in v26, nil, nil do
        table.insert(v62, {
            Key = v64, 
            Text = l_Localization_0:getText("SearchOptionsSort", v64)
        });
    end;
    local v65 = v22.categoryIsAudio(l_categoryName_0);
    local v66 = l_LayoutOrderIterator_0.new();
    return v3.createElement(v16, {
        GetSearchOptions = v53.getSearchOptions, 
        OnClose = v53.onClose, 
        OnReset = v53.onReset
    }, {
        Creator = v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionCreator"), 
            LayoutOrder = v66:getNextOrder()
        }, {
            CheckboxAndDescriptionContainer = v3.createElement(v17, {
                LayoutOrder = v66:getNextOrder(), 
                IsChecked = l_state_2.includeUnverifiedCreators, 
                OnClick = v53.onToggleIdVerified
            }), 
            SearchBar = v3.createElement(v14, {
                defaultTextKey = "SearchBarCreatorText", 
                searchTerm = l_state_2.searchTerm, 
                results = l_props_2.liveSearchData.results, 
                updateSearch = v53.updateUserSearch, 
                width = v7.SEARCH_BAR_WIDTH, 
                LayoutOrder = v66:getNextOrder()
            })
        }), 
        AudioSearchHeader = v65 and v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionAudioLength"), 
            LayoutOrder = v66:getNextOrder()
        }, {
            AudioSearch = v3.createElement(v13, {
                minDuration = l_minDuration_0, 
                maxDuration = l_maxDuration_0, 
                onDurationChange = v53.onDurationChange
            })
        }), 
        SortBy = v3.createElement(v15, {
            Header = l_Localization_0:getText("General", "SearchOptionSort"), 
            LayoutOrder = v66:getNextOrder(), 
            HideLowerSeparator = true
        }, {
            RadioButtons = v3.createElement(l_RadioButtonList_0, {
                Buttons = v62, 
                CurrentSelectedKey = l_sortIntentKey_0, 
                SelectedKey = l_initialSortIntentKey_0, 
                OnClick = v53.onSelectSortIntent
            })
        })
    });
end;
return v4.connect(function(v67)
    v67 = v67 or {};
    local v68 = v67.pageInfo or {};
    local v69 = v68.audioSearchInfo or {};
    return {
        categoryName = v68.categoryName or v22.DEFAULT.name, 
        includeUnverifiedCreators = v68.includeUnverifiedCreators, 
        initialSortIntentKey = v31(v68), 
        initialCreatorName = not v68.creator and "" or v68.creator.Name, 
        liveSearchData = if not v67.liveSearch then nil else {
            searchTerm = v67.liveSearch.searchTerm, 
            results = v67.liveSearch.results
        }, 
        maxDuration = v69.maxDuration, 
        minDuration = v69.minDuration, 
        pageInfo = v68
    };
end, function(v70)
    return {
        userSearch = function(v71, v72)
            v70(v12(v71, v72));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v11
})(v32)));
