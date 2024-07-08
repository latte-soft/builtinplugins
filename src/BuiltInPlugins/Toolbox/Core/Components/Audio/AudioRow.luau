local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_HoverArea_0 = v4.UI.HoverArea;
local l_withAbsoluteSizeAndPosition_0 = v4.Wrappers.withAbsoluteSizeAndPosition;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_script_FirstAncestor_0.Core.Util.Analytics.Analytics);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v14 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v15 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v16 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v17 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v18 = require(l_script_FirstAncestor_0.Core.Networking.Requests.PurchaseAssetRequest);
local v19 = require(l_script_FirstAncestor_0.Core.Util.getIsValidAudioAssetForInventoryGrant);
local v20 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRow);
local v21 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioRowExpandedContent);
local v22 = require(l_script_FirstAncestor_0.Core.Util.Images);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v24 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v25 = require(l_script_FirstAncestor_0.Core.Components.Audio.GetAudioTableSizes);
local v26 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local v27 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxUpdateDisplayedAudioTags);
local v28 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxShowArtistThenCreator);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v30 = v2.PureComponent:extend("AudioRow");
secondsToMinuteString = function(v31)
    local v32 = tonumber(v31) or 0;
    return string.format("%d:%02d", math.floor(v32 / 60), v32 % 60);
end;
local v33 = {
    Artist = "---", 
    MusicAlbum = "---"
};
audioDetailsWithDefaults = function(v34)
    return v5.join(v33, v34);
end;
v30.init = function(v35, v36)
    v35.wasAssetBoundsWithinScrollingBounds = false;
    v35.state = {
        isPlayButtonHovered = false, 
        isExpanded = true, 
        isPlaying = false
    };
    v35.onPlayButtonMouseEnter = function()
        v35:setState({
            isPlayButtonHovered = true
        });
    end;
    v35.onPlayButtonMouseLeave = function()
        v35:setState({
            isPlayButtonHovered = false
        });
    end;
    v35.toggleIsExpanded = function()
        v35.props.OnExpanded(v35.props.AssetInfo.Asset.Id);
    end;
    v35.stopPlaying = function()
        v35:setState({
            isPlaying = false
        });
    end;
    v35.toggleIsPlayer = function()
        v35:setState(function(v37)
            return {
                isPlaying = not v37.isPlaying
            };
        end);
    end;
    v35.onClick = function()
        if v35.props.CanInsertAsset() then
            if l_game_EngineFeature_0 then
                local l_AssetInfo_0 = v35.props.AssetInfo;
                local l_networkInterface_0 = v35.props.Network.networkInterface;
                v19(l_networkInterface_0, l_AssetInfo_0.Asset.Id):andThen(function(v40)
                    if v40 then
                        v35.props.purchaseAsset(l_networkInterface_0, l_AssetInfo_0.Asset.Id, l_AssetInfo_0.Product.ProductId, 0, 3, nil, {
                            currencyCode = "USD", 
                            quantity = {
                                significand = 0, 
                                exponent = 0
                            }
                        });
                        v12.onAudioAssetGrantedToUserInventoryEvent(l_AssetInfo_0.Asset.Id);
                    end;
                end):await();
            end;
            v35.props.InsertAsset(false);
        end;
    end;
    v35.searchBy = function(v41)
        v35.props.searchWithOptions(v35.props.Network.networkInterface, v35.props.Settings:get("Plugin"), {
            Creator = v35.props.creator, 
            AudioSearch = v35.props.audioSearchInfo, 
            AdditionalAudioSearch = v5.join(v36.additionalAudioSearchInfo, v41)
        });
    end;
    v35.onSearchByCreator = function()
        local l_props_0 = v35.props;
        l_props_0.searchWithOptions(l_props_0.Network.networkInterface, l_props_0.Settings:get("Plugin"), {
            Creator = if not l_props_0.AssetInfo.Creator then nil else l_props_0.AssetInfo.Creator.Name
        });
    end;
    v35.onSearchByArtist = function()
        v35.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST] = v35.props.AssetInfo.AudioDetails.Artist
        });
    end;
    v35.onSearchByGenre = function()
        v35.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.GENRE] = v35.props.AssetInfo.AudioDetails.MusicGenre
        });
    end;
    v35.onSearchByCategories = function()
        local l_AudioDetails_0 = v35.props.AssetInfo.AudioDetails;
        local v44 = {};
        if l_AudioDetails_0.SoundEffectCategory then
            table.insert(v44, l_AudioDetails_0.SoundEffectCategory);
            if l_AudioDetails_0.SoundEffectSubcategory then
                table.insert(v44, l_AudioDetails_0.SoundEffectSubcategory);
            end;
        end;
        v35.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.CATEGORIES] = v44
        });
    end;
    v35.onSearchByAlbum = function()
        local l_AudioDetails_1 = v35.props.AssetInfo.AudioDetails;
        v35.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST] = l_AudioDetails_1.Artist, 
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ALBUM] = l_AudioDetails_1.MusicAlbum
        });
    end;
    v35.onSearchByTags = function()
        local l_AudioDetails_2 = v35.props.AssetInfo.AudioDetails;
        if l_AudioDetails_2 then
            if not l_AudioDetails_2.SoundEffectCategory then
                v35.onSearchByGenre();
            else
                v35.onSearchByCategories();
                return ;
            end;
        end;
    end;
    v35.onAssetPreviewButtonClicked = function()
        local l_AssetInfo_1 = v35.props.AssetInfo;
        v35.stopPlaying();
        v35.props.OnAssetPreviewButtonClicked(l_AssetInfo_1);
    end;
    v35.onHoverChanged = function(v48)
        v35:setState(function(_)
            return {
                isHovered = v48
            };
        end);
    end;
    v35.isCapitalizedIgnoreLocale = function(v50)
        if not (v50 ~= nil) or string.len(v50) == 0 then
            return false;
        else
            local v51 = string.sub(v50 or "", 1, 1);
            return v51 == string.upper(v51);
        end;
    end;
    v35.getTags = function(v52)
        local l_Localization_0 = v35.props.Localization;
        if not v27() then
            if v52.Type == v24.MUSIC.name then
                if not v52.MusicGenre then
                    return "---";
                else
                    return (l_Localization_0:getText("Audio.Music.Genre", v52.MusicGenre));
                end;
            elseif v52.Type == v24.SOUND_EFFECTS.name then
                local l_SoundEffectCategory_0 = v52.SoundEffectCategory;
                local l_SoundEffectSubcategory_0 = v52.SoundEffectSubcategory;
                local v56 = not l_SoundEffectCategory_0 and "---" or l_Localization_0:getText("Audio.SoundEffect.Category", l_SoundEffectCategory_0);
                if l_SoundEffectSubcategory_0 then
                    v56 = v56 .. " - " .. l_Localization_0:getText("Audio.SoundEffect.Category", l_SoundEffectSubcategory_0);
                end;
                return v56;
            else
                return nil;
            end;
        else
            local v57 = nil;
            local v58 = nil;
            if not (v52.SoundEffectCategory ~= nil) or v35.isCapitalizedIgnoreLocale(v52.SoundEffectCategory) then
                if not (not (v52.MusicGenre ~= nil) or v35.isCapitalizedIgnoreLocale(v52.MusicGenre)) then
                    v57 = l_Localization_0:getText("Audio.Music.Genre", v52.MusicGenre);
                end;
            else
                v57 = l_Localization_0:getText("Audio.SoundEffect.Category", v52.SoundEffectCategory);
                if not (not (v52.SoundEffectSubcategory ~= nil) or not v35.isCapitalizedIgnoreLocale(v52.SoundEffectSubcategory)) then
                    v58 = l_Localization_0:getText("Audio.SoundEffect.Category", v52.SoundEffectSubcategory);
                end;
            end;
            local v59 = nil;
            if v57 then
                v59 = v57;
                if v58 then
                    v59 = v59 .. " - " .. v58;
                end;
            end;
            return v59;
        end;
    end;
    v35.getColumns = function()
        local l_props_1 = v35.props;
        local l_Asset_0 = l_props_1.AssetInfo.Asset;
        local v62 = audioDetailsWithDefaults(l_props_1.AssetInfo.AudioDetails);
        local v63 = v25(v62.Type, l_props_1.width or 0);
        local l_Creator_0 = l_props_1.AssetInfo.Creator;
        local v65 = "---";
        local v66 = nil;
        if not v28() then
            v65 = if not not l_Creator_0 and l_Creator_0.Name then l_Creator_0.Name else "---";
            v66 = if v65 ~= "---" then v35.onSearchByCreator else nil;
        else
            local v67 = if not l_props_1.AssetInfo.AudioDetails then nil else l_props_1.AssetInfo.AudioDetails.Artist;
            if v67 and string.len(v67) > 0 then
                v65 = v67;
                v66 = v35.onSearchByArtist;
            elseif not (not l_Creator_0 or not l_Creator_0.Name) then
                v65 = l_Creator_0.Name;
                v66 = v35.onSearchByCreator;
            end;
        end;
        return {
            {
                DevLabel = "Creator", 
                OnClick = v66, 
                Size = v63[v9.AUDIO_ROW.COLUMNS.CREATOR], 
                Text = v65
            }, 
            {
                DevLabel = "Tags", 
                OnClick = v35.onSearchByTags, 
                Size = v63[v9.AUDIO_ROW.COLUMNS.TAGS], 
                Text = v35.getTags(v62)
            }, 
            {
                DevLabel = "Duration", 
                Padding = {
                    Left = if not v26() then v9.AUDIO_ROW.LEFT_RIGHT_PADDING else v9.ITEM_ROW.LEFT_RIGHT_PADDING
                }, 
                OnClick = nil, 
                Size = v63[v9.AUDIO_ROW.COLUMNS.LENGTH], 
                Text = secondsToMinuteString(l_Asset_0.Duration)
            }
        };
    end;
    v35.renderIcon = function()
        local l_props_2 = v35.props;
        local l_state_0 = v35.state;
        local l_IsExpanded_0 = l_props_2.IsExpanded;
        local l_itemRow_0 = l_props_2.Stylizer.itemRow;
        local l_isHovered_0 = l_state_0.isHovered;
        local l_isPlayButtonHovered_0 = l_state_0.isPlayButtonHovered;
        local l_isPlaying_0 = l_state_0.isPlaying;
        local v75 = audioDetailsWithDefaults(l_props_2.AssetInfo.AudioDetails).Type == v24.SOUND_EFFECTS.name;
        local v76 = {
            Size = UDim2.new(0, v9.AUDIO_ROW.ICON_SIZE, 0, v9.AUDIO_ROW.ICON_SIZE), 
            [v2.Event.MouseEnter] = v35.onPlayButtonMouseEnter, 
            [v2.Event.MouseLeave] = v35.onPlayButtonMouseLeave
        };
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v9.AUDIO_ROW.ICON_SIZE + if not v26() then v9.AUDIO_ROW.LEFT_RIGHT_PADDING * 2 else v9.ITEM_ROW.LEFT_RIGHT_PADDING * 2, 1, 0)
        }, {
            Button = v2.createElement("ImageButton", if (l_IsExpanded_0 or l_isHovered_0) or l_isPlaying_0 then v5.join(v76, {
                BackgroundColor3 = if l_isPlaying_0 or l_isPlayButtonHovered_0 then l_itemRow_0.pauseButtonColor else l_itemRow_0.playButtonColor, 
                BackgroundTransparency = 0, 
                Image = if not l_isPlaying_0 then v22.AUDIO_PREVIEW_PLAY else v22.AUDIO_PREVIEW_PAUSE, 
                [v2.Event.MouseButton1Click] = v35.toggleIsPlayer
            }) else v5.join(v76, {
                BackgroundTransparency = 1, 
                ImageColor3 = l_itemRow_0.primaryIconColor, 
                Image = if not v75 then v22.MUSIC_ICON else v22.SOUND_EFFECT_ICON
            }), {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 15)
                }), 
                HoverArea = v2.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        });
    end;
    v35.renderExpandedContent = function()
        local l_props_3 = v35.props;
        return v2.createElement(v21, {
            AudioDetails = audioDetailsWithDefaults(l_props_3.AssetInfo.AudioDetails), 
            AssetInfo = l_props_3.AssetInfo, 
            IsPlaying = v35.state.isPlaying, 
            OnAssetPreviewButtonClicked = v35.onAssetPreviewButtonClicked, 
            OnAudioEnd = v35.stopPlaying, 
            OnInsertClicked = v35.onClick
        });
    end;
end;
v30.didUpdate = function(v78, v79, v80)
    local l_state_1 = v78.state;
    local l_props_4 = v78.props;
    if not ((not l_state_1.isPlaying or v80.isPlaying) or l_props_4.IsExpanded) then
        v78:toggleIsExpanded();
    end;
    if not ((l_props_4.IsExpanded or not v79.IsExpanded) or not l_state_1.isPlaying) then
        v78:toggleIsPlayer();
    end;
end;
v30.render = function(v83)
    local l_props_5 = v83.props;
    local _ = v83.state;
    local _ = l_props_5.AssetInfo.Asset;
    local v87 = audioDetailsWithDefaults(l_props_5.AssetInfo.AudioDetails);
    if not (l_props_5.AssetInfo.Creator and l_props_5.AssetInfo.Creator.Name) then
        local _ = "---";
    end;
    return v20.Generator({
        Columns = v83.getColumns(), 
        ExpandedHeight = v9.AUDIO_ROW.EXPANDED_ROW_HEIGHT, 
        OnHoverChanged = v83.onHoverChanged, 
        RenderExpandedContent = v83.renderExpandedContent, 
        RenderIcon = v83.renderIcon, 
        TitleSize = v25(v87.Type, l_props_5.width or 0)[v9.AUDIO_ROW.COLUMNS.TITLE], 
        AssetInfo = l_props_5.AssetInfo, 
        CanInsertAsset = l_props_5.CanInsertAsset, 
        InsertAsset = l_props_5.InsertAsset, 
        IsExpanded = l_props_5.IsExpanded, 
        LayoutOrder = l_props_5.LayoutOrder, 
        LogImpression = l_props_5.LogImpression, 
        OnExpanded = l_props_5.OnExpanded, 
        OnAssetPreviewButtonClicked = l_props_5.OnAssetPreviewButtonClicked, 
        ParentAbsoluteSize = l_props_5.ParentAbsoluteSize, 
        TryOpenAssetConfig = l_props_5.TryOpenAssetConfig
    });
end;
v30 = l_withAbsoluteSizeAndPosition_0((v3.connect(function(v89, _)
    return {
        additionalAudioSearchInfo = v89.pageInfo and v89.pageInfo.additionalAudioSearchInfo, 
        audioSearchInfo = v89.pageInfo and v89.pageInfo.audioSearchInfo, 
        creator = v89.pageInfo and v89.pageInfo.creator
    };
end, function(v91)
    return {
        searchWithOptions = function(v92, v93, v94)
            v91(v15(v92, v93, v94));
        end, 
        purchaseAsset = function(v95, v96, v97, v98, v99, v100, v101)
            v91(v18(v95, v96, v97, v98, v99, v100, v101));
        end
    };
end)((l_withContext_0({
    AssetAnalytics = v14, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Settings = v16, 
    Network = v17
})(v30)))));
TypedAudioRow = function(v102, v103)
    return v2.createElement(v30, v102, v103);
end;
return {
    Component = v30, 
    Generator = TypedAudioRow
};
