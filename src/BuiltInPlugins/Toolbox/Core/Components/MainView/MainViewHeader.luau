local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.Constants);
local v6 = require(l_Parent_0.Core.Util.getTimeString);
local v7 = require(l_Parent_0.Core.ContextServices.Settings);
local v8 = require(l_Parent_0.Core.Types.Category);
local v9 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v13 = require(l_Packages_0.Cryo);
local l_deepCopy_0 = v4.Util.deepCopy;
local l_Pane_0 = v4.UI.Pane;
local v16 = require(l_Parent_0.Core.Components.Autocorrect.Autocorrect);
local v17 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v18 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v19 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v20 = v2.PureComponent:extend("MainViewHeader");
local v21 = require(l_Parent_0.Core.Components.SearchOptions.SearchTags);
v20.init = function(v22)
    v22.onTagsCleared = function()
        v22.props.searchWithOptions(v22.props.Network.networkInterface, v22.props.Settings:get("Plugin"), if not v19() then {
            Creator = "", 
            AudioSearch = v13.None, 
            AdditionalAudioSearch = v13.None, 
            includeUnverifiedCreators = false, 
            uiSortIntent = v13.None
        } else {
            Creator = "", 
            AudioSearch = v13.None, 
            AdditionalAudioSearch = v13.None, 
            includeUnverifiedCreators = false, 
            creatorTargetIds = {}, 
            groupTargetIds = {}, 
            uiSortIntent = v13.None
        });
    end;
    v22.onCreatorCleared = function()
        v22.props.searchWithOptions(v22.props.Network.networkInterface, v22.props.Settings:get("Plugin"), {
            Creator = "", 
            AudioSearch = v22.props.audioSearchInfo, 
            AdditionalAudioSearch = v22.props.additionalAudioSearchInfo, 
            includeUnverifiedCreators = v22.props.includeUnverifiedCreators
        });
    end;
    v22.onCreatorTargetIdRemoved = not v19() and function()
    end or function(v23)
        local l_props_0 = v22.props;
        local l_networkInterface_0 = l_props_0.Network.networkInterface;
        local v26 = l_props_0.Settings:get("Plugin");
        local v27 = tostring(v23.tagId);
        local l_includeUnverifiedCreators_0 = l_props_0.includeUnverifiedCreators;
        local v29 = l_deepCopy_0(l_props_0.creatorTargetIds);
        local v30 = l_deepCopy_0(l_props_0.groupTargetIds);
        local l_uiSortIntent_0 = l_props_0.uiSortIntent;
        v29[v27] = nil;
        v22.props.searchWithOptions(l_networkInterface_0, v26, {
            creatorTargetIds = v29, 
            groupTargetIds = v30, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_0, 
            uiSortIntent = l_uiSortIntent_0
        });
    end;
    v22.onGroupTargetIdRemoved = not v19() and function()
    end or function(v32)
        local l_props_1 = v22.props;
        local l_networkInterface_1 = l_props_1.Network.networkInterface;
        local v35 = l_props_1.Settings:get("Plugin");
        local v36 = tostring(v32.tagId);
        local l_includeUnverifiedCreators_1 = l_props_1.includeUnverifiedCreators;
        local v38 = l_deepCopy_0(l_props_1.creatorTargetIds);
        local v39 = l_deepCopy_0(l_props_1.groupTargetIds);
        local l_uiSortIntent_1 = l_props_1.uiSortIntent;
        v39[v36] = nil;
        v22.props.searchWithOptions(l_networkInterface_1, v35, {
            creatorTargetIds = v38, 
            groupTargetIds = v39, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_1, 
            uiSortIntent = l_uiSortIntent_1
        });
    end;
    v22.createOptions = function()
        local l_creator_0 = v22.props.creator;
        return {
            Creator = not not l_creator_0 and l_creator_0.Name or "", 
            AudioSearch = v22.props.audioSearchInfo, 
            AdditionalAudioSearch = v22.props.additionalAudioSearchInfo, 
            includeUnverifiedCreators = v22.props.includeUnverifiedCreators
        };
    end;
    v22.clearAdditionalAudioSearchByKeys = function(v42)
        local l_networkInterface_2 = v22.props.Network.networkInterface;
        local v44 = v22.props.Settings:get("Plugin");
        local v45 = v22.createOptions();
        for _, v47 in ipairs(v42) do
            v45.AdditionalAudioSearch[v47] = nil;
        end;
        if next(v45.AdditionalAudioSearch) == nil then
            v45.AdditionalAudioSearch = nil;
        end;
        v22.props.searchWithOptions(l_networkInterface_2, v44, v45);
    end;
    v22.onAudioSearchArtistCleared = function()
        v22.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST
        });
    end;
    v22.onAudioSearchCategoriesCleared = function()
        v22.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.CATEGORIES
        });
    end;
    v22.onAudioSearchGenreCleared = function()
        v22.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.GENRE
        });
    end;
    v22.onAudioSearchAlbumCleared = function()
        v22.clearAdditionalAudioSearchByKeys({
            v5.ADDITIONAL_AUDIO_SEARCH_KEYS.ALBUM
        });
    end;
    v22.onAudioSearchCleared = function()
        local l_networkInterface_3 = v22.props.Network.networkInterface;
        local v49 = v22.props.Settings:get("Plugin");
        local v50 = v22.createOptions();
        v50.AudioSearch = v13.None;
        v22.props.searchWithOptions(l_networkInterface_3, v49, v50);
    end;
    v22.onIsVerifiedCleared = function()
        local l_networkInterface_4 = v22.props.Network.networkInterface;
        local v52 = v22.props.Settings:get("Plugin");
        local l_creator_1 = v22.props.creator;
        v22.props.searchWithOptions(l_networkInterface_4, v52, {
            Creator = not not l_creator_1 and l_creator_1.Name or "", 
            AudioSearch = v22.props.audioSearchInfo, 
            includeUnverifiedCreators = false
        });
    end;
    v22.onSortIntentRemoved = function()
        local l_networkInterface_5 = v22.props.Network.networkInterface;
        local v55 = v22.props.Settings:get("Plugin");
        local v56 = v22.createOptions();
        v56.uiSortIntent = v13.None;
        v22.props.searchWithOptions(l_networkInterface_5, v55, v56);
    end;
end;
v20.render = function(v57)
    local l_props_2 = v57.props;
    local v59 = l_props_2.searchTerm or "";
    local l_Name_0 = l_props_2.creatorFilter.Name;
    local l_includeUnverifiedCreators_2 = l_props_2.includeUnverifiedCreators;
    local l_uiSortIntent_2 = l_props_2.uiSortIntent;
    local l_sortDirection_0 = l_props_2.sortDirection;
    local v64 = nil;
    local l_audioSearchInfo_0 = l_props_2.audioSearchInfo;
    if not ((not l_audioSearchInfo_0 or not l_audioSearchInfo_0.maxDuration) or not l_audioSearchInfo_0.minDuration) then
        v64 = v6(l_audioSearchInfo_0.minDuration, nil) .. " - " .. v6(l_audioSearchInfo_0.maxDuration, nil);
    end;
    local v66 = l_props_2.containerWidth or 0;
    local v67 = not v18() and 0 or l_props_2.headerHeight;
    local v68 = {};
    if l_props_2.showTags then
        if not v18() then
            v67 = v67 + v5.SEARCH_TERMS_HEIGHT;
        end;
        local v69 = v57.props.Localization:getText("General", "SearchTagCreator");
        local v70 = v57.props.Localization:getText("General", "SearchTagLength");
        local v71 = v57.props.Localization:getText("General", "SearchTagIdUnverified");
        local v72 = {};
        if l_Name_0 then
            table.insert(v72, {
                prefix = v69, 
                text = l_Name_0, 
                onDelete = v57.onCreatorCleared
            });
        end;
        if not (not v19() or not next(l_props_2.creatorTargetIds)) then
            for _, v74 in pairs(l_props_2.creatorTargetIds) do
                table.insert(v72, {
                    prefix = v69, 
                    text = v74.Name, 
                    onDelete = v57.onCreatorTargetIdRemoved, 
                    tagId = v74.Id
                });
            end;
        end;
        if not (not v19() or not next(l_props_2.groupTargetIds)) then
            for _, v76 in pairs(l_props_2.groupTargetIds) do
                table.insert(v72, {
                    prefix = v69, 
                    text = v76.Name, 
                    onDelete = v57.onGroupTargetIdRemoved, 
                    tagId = v76.Id
                });
            end;
        end;
        if v64 then
            table.insert(v72, {
                prefix = v70, 
                text = v64, 
                onDelete = v57.onAudioSearchCleared
            });
        end;
        local v77 = l_props_2.additionalAudioSearchInfo or {};
        if v77.artist then
            table.insert(v72, {
                prefix = v57.props.Localization:getText("AudioView", "Artist") .. ":", 
                text = v77.artist, 
                onDelete = v57.onAudioSearchArtistCleared
            });
        end;
        if v77.categories then
            local v78 = {};
            for _, v80 in ipairs(v77.categories) do
                table.insert(v78, v57.props.Localization:getText("Audio.SoundEffect.Category", v80));
            end;
            table.insert(v72, {
                prefix = v57.props.Localization:getText("AudioView", "Category") .. ":", 
                text = table.concat(v78, " - "), 
                onDelete = v57.onAudioSearchCategoriesCleared
            });
        end;
        if v77.genre then
            table.insert(v72, {
                prefix = v57.props.Localization:getText("General", "Genre") .. ":", 
                text = v57.props.Localization:getText("Audio.Music.Genre", v77.genre), 
                onDelete = v57.onAudioSearchGenreCleared
            });
        end;
        if v77.album then
            table.insert(v72, {
                prefix = v57.props.Localization:getText("AudioView", "Album") .. ":", 
                text = v77.album, 
                onDelete = v57.onAudioSearchAlbumCleared
            });
        end;
        if l_uiSortIntent_2 then
            local v81 = v57.props.Localization:getText("UiSortIntent", l_uiSortIntent_2);
            local v82 = if not l_sortDirection_0 then nil else v57.props.Localization:getText("SortDirection", l_sortDirection_0);
            table.insert(v72, {
                prefix = v57.props.Localization:getText("General", "SearchOptionSort") .. ":", 
                text = if not v82 then v81 else ("%*, %*"):format(v81, v82), 
                onDelete = v57.onSortIntentRemoved
            });
        end;
        if (l_includeUnverifiedCreators_2 or l_Name_0) or v64 then
            table.insert(v72, {
                prefix = v71, 
                text = "", 
                onDelete = v57.onIsVerifiedCleared
            });
        end;
        v68.SearchTags = v2.createElement(v21, {
            Tags = v72, 
            onClearTags = v57.onTagsCleared, 
            searchTerm = v59, 
            categoryName = l_props_2.categoryName, 
            onBackToHome = l_props_2.onBackToHome, 
            LayoutOrder = 1
        });
        local v83;
        if not v18() then
            v83 = nil;
        else
            v83 = false;
            if l_props_2.correctionState == v9.AutocorrectResponseState.CorrectionAvailable then
                v83 = l_props_2.correctedQuery ~= "";
            end;
        end;
        local v84;
        if not v18() then
            v84 = nil;
        else
            v84 = false;
            if l_props_2.correctionState == v9.AutocorrectResponseState.CorrectionAccepted then
                v84 = l_props_2.userQuery ~= "";
            end;
        end;
        local v85 = v18() and (v83 or v84);
        if not (not (v18() and next(v72) ~= nil) or v85) then
            v67 = v67 + v5.MAIN_VIEW_VERTICAL_PADDING;
        end;
        v68.Autocorrect = if not v85 then nil else v2.createElement(v16, {
            CorrectedQuery = l_props_2.correctedQuery, 
            CorrectionState = l_props_2.correctionState, 
            CurrentQuery = v59, 
            LayoutOrder = 2, 
            UserQuery = l_props_2.userQuery
        });
    end;
    if not v18() then
        v67 = math.max(v67, v5.MAIN_VIEW_NO_HEADER_HEIGHT);
    end;
    return v2.createElement(not v18() and "Frame" or l_Pane_0, {
        Position = UDim2.new(0, 0, 0, -2), 
        Size = UDim2.new(0, v66, 0, v67), 
        BackgroundTransparency = 1, 
        HorizontalAlignment = if not v18() then nil else Enum.HorizontalAlignment.Left, 
        Layout = if not v18() then nil else Enum.FillDirection.Vertical, 
        VerticalAlignment = if not v18() then nil else Enum.VerticalAlignment.Top, 
        ZIndex = 2
    }, v68);
end;
return v3.connect(function(v86, _)
    local v88 = (v86 or {}).pageInfo or {};
    return {
        audioSearchInfo = v88.audioSearchInfo, 
        additionalAudioSearchInfo = v88.additionalAudioSearchInfo, 
        creator = v88.creator, 
        categoryName = v88.categoryName or v8.DEFAULT.name, 
        searchTerm = v88.searchTerm or "", 
        includeUnverifiedCreators = v88.includeUnverifiedCreators, 
        creatorFilter = v88.creator or {}, 
        creatorTargetIds = if not v19() then nil else if not not v88.creatorTargetIds and v88.creatorTargetIds ~= v13.None then v88.creatorTargetIds else {}, 
        groupTargetIds = if not v19() then nil else if not not v88.groupTargetIds and v88.groupTargetIds ~= v13.None then v88.groupTargetIds else {}, 
        uiSortIntent = if not v19() then nil else if not not v88.uiSortIntent and v88.uiSortIntent ~= v13.None then v88.uiSortIntent else nil, 
        sortDirection = if not not v88.sortDirection and v88.sortDirection ~= v13.None then v88.sortDirection else nil, 
        correctionState = if not v18() then nil else v88.correctionState, 
        correctedQuery = if not v18() then nil else v88.correctedQuery, 
        userQuery = if not v18() then nil else v88.userQuery
    };
end, function(v89)
    return {
        searchWithOptions = function(v90, v91, v92)
            v89(v17(v90, v91, v92));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Settings = v7, 
    Network = v12
})(v20)));
