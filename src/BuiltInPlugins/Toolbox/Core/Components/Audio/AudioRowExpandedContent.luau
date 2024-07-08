local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_Pane_0 = v4.UI.Pane;
local l_TextLabel_0 = v4.UI.TextLabel;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v9 = require(l_Util_0.Constants);
local v10 = require(l_Util_0.LayoutOrderIterator);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v14 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v15 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v16 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioPlayer);
local v17 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioRowInsertButton);
local v18 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRowMetadata);
local v19 = require(l_script_FirstAncestor_0.Core.Components.Asset.Preview.PopUpWrapperButton);
local v20 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v21 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v23 = v2.PureComponent:extend("AudioRowExpandedContent");
v23.defaultProps = {
    Size = UDim2.new(1, 0, 0, 26)
};
v23.init = function(v24)
    v24.searchBy = function(v25)
        local l_props_0 = v24.props;
        v24.props.searchWithOptions(l_props_0.Network.networkInterface, l_props_0.Settings:get("Plugin"), {
            Creator = l_props_0.creator, 
            AudioSearch = l_props_0.audioSearchInfo, 
            AdditionalAudioSearch = v5.join(l_props_0.additionalAudioSearchInfo, v25)
        });
    end;
    v24.onSearchByCategories = function()
        local l_AudioDetails_0 = v24.props.AssetInfo.AudioDetails;
        local v28 = {};
        if l_AudioDetails_0.SoundEffectCategory then
            table.insert(v28, l_AudioDetails_0.SoundEffectCategory);
            if l_AudioDetails_0.SoundEffectSubcategory then
                table.insert(v28, l_AudioDetails_0.SoundEffectSubcategory);
            end;
        end;
        v24.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.CATEGORIES] = v28
        });
    end;
    v24.onSearchByAlbum = function()
        local l_AudioDetails_1 = v24.props.AssetInfo.AudioDetails;
        v24.searchBy({
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ARTIST] = l_AudioDetails_1.Artist, 
            [v9.ADDITIONAL_AUDIO_SEARCH_KEYS.ALBUM] = l_AudioDetails_1.MusicAlbum
        });
    end;
    v24.onSearchByCreator = function()
        local l_props_1 = v24.props;
        l_props_1.searchWithOptions(l_props_1.Network.networkInterface, l_props_1.Settings:get("Plugin"), {
            Creator = if not l_props_1.AssetInfo.Creator then nil else l_props_1.AssetInfo.Creator.Name, 
            AudioSearch = l_props_1.audioSearchInfo, 
            AdditionalAudioSearch = l_props_1.additionalAudioSearchInfo
        });
    end;
end;
v23.render = function(v31)
    local l_props_2 = v31.props;
    local l_Localization_0 = l_props_2.Localization;
    local l_itemRow_0 = l_props_2.Stylizer.itemRow;
    local l_AudioDetails_2 = l_props_2.AudioDetails;
    local v36 = not l_props_2.AssetInfo.Creator and "---" or l_props_2.AssetInfo.Creator.Name;
    local l_IsPlaying_0 = l_props_2.IsPlaying;
    local l_Asset_0 = l_props_2.AssetInfo.Asset;
    local l_Id_0 = l_Asset_0.Id;
    local v40 = l_Asset_0.Description or "---";
    local l_SoundEffectCategory_0 = l_AudioDetails_2.SoundEffectCategory;
    local l_Type_0 = l_AudioDetails_2.Type;
    local v43 = l_Type_0 == v15.SOUND_EFFECTS.name;
    local v44 = l_Type_0 == v15.MUSIC.name;
    local l_Artist_0 = l_AudioDetails_2.Artist;
    local l_MusicAlbum_0 = l_AudioDetails_2.MusicAlbum;
    local v47 = "";
    if l_Artist_0 ~= "---" then
        v47 = l_Artist_0;
    end;
    if l_MusicAlbum_0 ~= "---" then
        if v47 ~= "" then
            v47 = v47 .. " - ";
        end;
        v47 = v47 .. l_MusicAlbum_0;
    end;
    local v48 = v10.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_2.LayoutOrder, 
        Size = l_props_2.Size
    }, {
        AudioPlayerFrame = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v48:getNextOrder(), 
            Padding = {
                Left = 4, 
                Right = if not v21() then v9.AUDIO_ROW.LEFT_RIGHT_PADDING else v9.ITEM_ROW.LEFT_RIGHT_PADDING
            }, 
            Size = UDim2.new(1, 0, 0, 26), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            AudioPlayer = v2.createElement(v16, {
                SoundId = l_Id_0, 
                IsPlaying = l_IsPlaying_0, 
                OnEnd = l_props_2.OnAudioEnd
            })
        }), 
        AdditionalMusicDetails = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v48:getNextOrder(), 
            Padding = {
                Left = 10, 
                Right = 10
            }
        }, {
            DescriptionContainer = v2.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v48:getNextOrder(), 
                Spacing = 10, 
                Size = UDim2.new(1, 0, 0, 26)
            }, {
                Description = v2.createElement(l_TextLabel_0, {
                    LayoutOrder = v48:getNextOrder(), 
                    Size = UDim2.new(1, -80, 1, 0), 
                    Text = v40, 
                    TextColor = l_itemRow_0.textColor, 
                    TextSize = v9.FONT_SIZE_MEDIUM, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                AssetPreview = v2.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v48:getNextOrder(), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Size = UDim2.new(0, 26, 0, 26), 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    PopUpWrapperButton = v2.createElement(v19, {
                        HoverSize = UDim2.new(0, 26, 0, 26), 
                        onClick = l_props_2.OnAssetPreviewButtonClicked, 
                        ShowIcon = true, 
                        Size = UDim2.new(0, 20, 0, 20)
                    })
                }), 
                Insert = v2.createElement(v17, {
                    LayoutOrder = v48:getNextOrder(), 
                    OnClick = l_props_2.OnInsertClicked
                })
            }), 
            AlbumContainer = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v48:getNextOrder(), 
                Spacing = 10, 
                Padding = {
                    Left = 5, 
                    Right = 5
                }, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                AlbumArist = if not v44 then nil else v2.createElement(v18, {
                    LayoutOrder = v48:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("AudioView", "AlbumArtist"):upper(), 
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    Text = v47, 
                    OnClick = v31.onSearchByAlbum
                }), 
                Category = if not v43 then nil else v2.createElement(v18, {
                    LayoutOrder = v48:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("AudioView", "Category"):upper(), 
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    Text = l_SoundEffectCategory_0, 
                    OnClick = v31.onSearchByCategories
                }), 
                UploadBy = v2.createElement(v18, {
                    LayoutOrder = v48:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("AudioView", "UploadedBy"):upper(), 
                    Size = UDim2.new(0.5, 0, 1, 0), 
                    Text = v36, 
                    OnClick = v31.onSearchByCreator
                })
            })
        })
    });
end;
return (v3.connect(function(v49, _)
    return {
        additionalAudioSearchInfo = v49.pageInfo and v49.pageInfo.additionalAudioSearchInfo, 
        audioSearchInfo = v49.pageInfo and v49.pageInfo.audioSearchInfo, 
        creator = v49.pageInfo and v49.pageInfo.creator
    };
end, function(v51)
    return {
        searchWithOptions = function(v52, v53, v54)
            v51(v20(v52, v53, v54));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v13, 
    Settings = v14, 
    Stylizer = l_ContextServices_0.Stylizer
})(v23))));
