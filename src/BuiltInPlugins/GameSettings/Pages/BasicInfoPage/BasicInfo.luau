local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_TranslateGameModeratedErrors_0 = game:GetFastFlag("TranslateGameModeratedErrors");
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_StudioEnableVRToggle_0 = game:GetFastFlag("StudioEnableVRToggle");
local l_RemoveVRToggleDialog2_0 = game:GetFastFlag("RemoveVRToggleDialog2");
local l_StudioGenreOverhaulPlaceholder_0 = game:GetFastFlag("StudioGenreOverhaulPlaceholder");
local l_game_FastString_0 = game:GetFastString("StudioGenreOverhaulExplainationLink");
local l_StudioGenreOverhaulInfo_0 = game:GetFastFlag("StudioGenreOverhaulInfo");
local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("TeamCreateService");
local l_Name_0 = script.Name;
local v12 = {
    Moderated = "ErrorNameModerated", 
    Empty = "ErrorNameEmpty"
};
local v13 = {
    Moderated = "ErrorDescModerated"
};
local v14 = {
    UploadingTooQuickly = "ErrorImageLimit", 
    ImageNotRecognized = "ErrorImageNotRecognized"
};
local v15 = {
    Moderated = "ErrorAltTextModerated"
};
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v18 = require(l_Parent_1.Packages.Roact);
local v19 = require(l_Parent_1.Packages.RoactRodux);
local v20 = require(l_Parent_1.Packages.Cryo);
local v21 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v21.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v24 = require(l_Parent_1.Src.ContextServices.Dialog);
local v25 = nil;
if l_GameSettingsExperienceGuidelines_0 then
    v25 = require(l_Parent_0.Components.Guidelines);
end;
local l_UI_0 = v21.UI;
local l_BulletList_0 = l_UI_0.BulletList;
local l_Separator_0 = l_UI_0.Separator;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithInlineLink_0 = l_UI_0.TextWithInlineLink;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Pane_0 = l_UI_0.Pane;
local l_MultiImagePicker_0 = l_UI_0.MultiImagePicker;
local l_Util_0 = v21.Util;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_deepJoin_0 = l_Util_0.deepJoin;
local v44 = require(l_Parent_1.Src.Components.CheckBoxSet);
local v45 = require(l_Parent_1.Src.Components.UploadableIcon.UploadableIconWidget);
local v46 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v47 = require(l_Parent_1.Src.Components.Dialog.ListDialog);
local v48 = require(l_Parent_1.Src.Components.Dialog.SimpleDialog);
local v49 = require(l_Parent_1.Src.Components.SettingsPages.InsufficientPermissionsPage);
local v50 = require(l_Parent_1.Src.Actions.AddChange);
local v51 = require(l_Parent_1.Src.Actions.AddErrors);
local v52 = require(l_Parent_1.Src.Actions.DiscardError);
local v53 = require(l_Parent_1.Src.Actions.SetCreatorId);
local v54 = require(l_Parent_1.Src.Actions.SetCreatorType);
local v55 = require(l_Parent_1.Src.Util.FileUtils);
local v56 = require(l_Parent_1.Src.Util.DEPRECATED_Constants);
local v57 = require(l_Parent_1.Src.Util.GameSettingsUtilities);
local l_shouldShowDevPublishLocations_0 = v57.shouldShowDevPublishLocations;
local l_getPlayerAppDownloadLink_0 = v57.getPlayerAppDownloadLink;
local l_getOptInLocationsRequirementsLink_0 = v57.getOptInLocationsRequirementsLink;
local l_getSocialMediaReferencesAllowed_0 = v57.getSocialMediaReferencesAllowed;
local l_sendAnalyticsToKibana_0 = v57.sendAnalyticsToKibana;
local l_calculateTextSize_0 = v57.calculateTextSize;
local v64 = require(l_Parent_1.Src.Util.KeyProvider);
local v65 = v64.getOptInLocationsKeyName();
local v66 = v64.getChinaKeyName();
local v67 = v64.getPlayerAcceptanceKeyName();
local v68 = v64.getApprovedKeyName();
local v69 = v64.getInReviewKeyName();
local v70 = v64.getRejectedKeyName();
local v71 = v64.getLuobuStudioDevPublishKeyName();
local v72 = v64.getCheckboxToggleKeyName();
local v73 = v64.getSelectedKeyName();
local v74 = v64.getTermsOfUseDialogKeyName();
local v75 = v64.getButtonClickedKeyName();
local function v115(v76, v77)
    local l_gameId_0 = v76:getState().Metadata.gameId;
    local l_gameInfoController_0 = v77.gameInfoController;
    local l_gameMetadataController_0 = v77.gameMetadataController;
    local l_policyInfoController_0 = v77.policyInfoController;
    local l_placesController_0 = v77.placesController;
    return {
        function(v83)
            if l_GameSettingsExperienceGuidelines_0 then
                v83.gameId = l_gameId_0;
            end;
        end, 
        function(v84)
            v84.name = l_gameInfoController_0:getName(l_gameId_0);
        end, 
        function(v85)
            v85.description = l_gameInfoController_0:getDescription(l_gameId_0);
        end, 
        function(v86)
            if l_GameSettingsExperienceGuidelines_0 then
                v86.guidelines = l_gameInfoController_0:getGuidelines(l_gameId_0);
            end;
        end, 
        function(v87)
            v87.genre = l_gameInfoController_0:getGenre(l_gameId_0);
        end, 
        function(v88)
            local v89 = l_gameInfoController_0:getSupportedDevices(l_gameId_0);
            local v90 = {};
            for _, v92 in ipairs(v89) do
                v90[v92] = true;
            end;
            v88.playableDevices = v90;
        end, 
        function(v93)
            local v94 = l_gameInfoController_0:getThumbnails(l_gameId_0);
            local v95 = {};
            local v96 = {};
            for _, v98 in pairs(v94) do
                local v99 = tostring(v98.id);
                v95[v99] = v98;
                table.insert(v96, v99);
            end;
            v93.thumbnailOrder = v96;
            v93.thumbnails = v95;
        end, 
        function(v100)
            local v101, v102 = l_gameInfoController_0:getIcon(l_gameId_0);
            v100.gameIcon = v101 or "None";
            v100.gameIconApproved = v102;
        end, 
        function(_)
            v76:dispatch(v53((l_gameMetadataController_0:getCreatorId(l_gameId_0))));
        end, 
        function(_)
            v76:dispatch(v54((l_gameMetadataController_0:getCreatorType(l_gameId_0))));
        end, 
        function(v105)
            if l_shouldShowDevPublishLocations_0() then
                local v106 = l_gameInfoController_0:getOptInLocations(l_gameId_0);
                local v107 = {};
                if not (v106 ~= nil) or next(v106) == nil then
                    v107 = {
                        China = {
                            status = "Unknown", 
                            selected = false
                        }
                    };
                else
                    for _, v109 in pairs(v106) do
                        local l_region_0 = v109.region;
                        local v111 = {
                            status = v109.status
                        };
                        local v112 = false;
                        if v109.status ~= "Removed" then
                            v112 = v109.status ~= "Unknown";
                        end;
                        v111.selected = v112;
                        v107[l_region_0] = v111;
                    end;
                end;
                v105[v65] = v107;
            end;
        end, 
        function(v113)
            if l_shouldShowDevPublishLocations_0() then
                v113[v67] = l_policyInfoController_0:getPlayerAcceptances();
            end;
        end, 
        function(v114)
            if l_shouldShowDevPublishLocations_0() then
                v114.publishedVersions = l_placesController_0:getAssetPublishedVersions((l_gameMetadataController_0:getRootPlace(l_gameId_0)));
            end;
        end
    };
end;
local function v170(v116, v117)
    local v118 = v116:getState();
    local l_gameId_1 = v118.Metadata.gameId;
    local l_gameInfoController_1 = v117.gameInfoController;
    local l_localization_0 = v117.localization;
    return {
        function()
            local l_name_0 = v118.Settings.Changed.name;
            if l_name_0 ~= nil then
                local l_status_0, l_result_0 = pcall(function()
                    l_gameInfoController_1:setName(l_gameId_1, l_name_0);
                end);
                if not l_status_0 then
                    if l_result_0 == l_gameInfoController_1.NameModerated then
                        v116:dispatch(v51({
                            name = "Moderated"
                        }));
                    end;
                    if not l_TranslateGameModeratedErrors_0 then
                        error("Game name was moderated");
                    else
                        error(l_localization_0:getText("General", "GameNameWasModerated"));
                        return ;
                    end;
                end;
            end;
        end, 
        function()
            local l_description_0 = v118.Settings.Changed.description;
            if l_description_0 ~= nil then
                local l_status_1, l_result_1 = pcall(function()
                    l_gameInfoController_1:setDescription(l_gameId_1, l_description_0);
                end);
                if not l_status_1 then
                    if l_result_1 == l_gameInfoController_1.DescriptionModerated then
                        v116:dispatch(v51({
                            description = "Moderated"
                        }));
                    end;
                    if not l_TranslateGameModeratedErrors_0 then
                        error("Game description was moderated");
                    else
                        error(l_localization_0:getText("General", "GameDescriptionWasModerated"));
                        return ;
                    end;
                end;
            end;
        end, 
        function()
            local l_genre_0 = v118.Settings.Changed.genre;
            if l_genre_0 ~= nil then
                l_gameInfoController_1:setGenre(l_gameId_1, l_genre_0);
            end;
        end, 
        function()
            local l_playableDevices_0 = v118.Settings.Changed.playableDevices;
            if l_playableDevices_0 ~= nil then
                local v130 = {};
                for v131, v132 in pairs(l_playableDevices_0) do
                    if v132 then
                        table.insert(v130, v131);
                    end;
                end;
                l_gameInfoController_1:setSupportedDevices(l_gameId_1, v130);
            end;
        end, 
        function(_)
            local l_thumbnails_0 = v118.Settings.Current.thumbnails;
            local l_thumbnails_1 = v118.Settings.Changed.thumbnails;
            local l_thumbnailOrder_0 = v118.Settings.Current.thumbnailOrder;
            local l_thumbnailOrder_1 = v118.Settings.Changed.thumbnailOrder;
            if not (l_thumbnails_1 == nil) or l_thumbnailOrder_1 ~= nil then
                local v138 = nil;
                do
                    local l_v138_0 = v138;
                    if not (not l_thumbnails_0 or not l_thumbnails_1) then
                        local v140 = {};
                        local v141 = {};
                        local v142 = {};
                        for v143 in pairs(l_thumbnails_0) do
                            if l_thumbnails_1[v143] == nil then
                                table.insert(v141, (tonumber(v143)));
                            end;
                        end;
                        for v144, v145 in pairs(l_thumbnails_1) do
                            if l_thumbnails_0[v144] == nil then
                                table.insert(v140, v145.asset);
                                if v145.altText ~= "" then
                                    v142[v144] = v145.altText;
                                end;
                            elseif l_thumbnails_0[v144].altText ~= v145.altText then
                                v142[v144] = v145.altText;
                            end;
                        end;
                        local v146 = 0;
                        do
                            local l_v146_0 = v146;
                            if #v141 > 0 then
                                l_v146_0 = l_v146_0 + 1;
                                coroutine.wrap(function()
                                    local l_status_2, l_result_2 = pcall(function()
                                        l_gameInfoController_1:removeThumbnails(l_gameId_1, v141);
                                    end);
                                    if not l_status_2 then
                                        l_v138_0 = l_result_2;
                                    end;
                                    l_v146_0 = l_v146_0 - 1;
                                end)();
                            end;
                            if #v140 > 0 then
                                l_v146_0 = l_v146_0 + 1;
                                coroutine.wrap(function()
                                    local l_status_3, l_result_3 = pcall(function()
                                        return l_gameInfoController_1:addThumbnails(l_gameId_1, v140);
                                    end);
                                    if not l_status_3 then
                                        l_v138_0 = l_result_3;
                                    else
                                        for v152, v153 in pairs(l_result_3) do
                                            local l_v152_TemporaryId_0 = v152:GetTemporaryId();
                                            l_thumbnailOrder_1 = v20.Dictionary.join(l_thumbnailOrder_1, {
                                                [v20.List.find(l_thumbnailOrder_1, l_v152_TemporaryId_0)] = v153
                                            });
                                            if v142[l_v152_TemporaryId_0] ~= nil then
                                                local v155 = v142[l_v152_TemporaryId_0];
                                                v142[l_v152_TemporaryId_0] = nil;
                                                v142[v153] = v155;
                                            end;
                                        end;
                                    end;
                                    l_v146_0 = l_v146_0 - 1;
                                end)();
                            end;
                            while l_v146_0 > 0 do
                                wait();
                            end;
                            local v156 = nil;
                            for v157, v158 in pairs(v142) do
                                l_v146_0 = l_v146_0 + 1;
                                coroutine.wrap(function()
                                    local v159 = {
                                        MediaAssetId = v157, 
                                        MediaAssetAltText = v158
                                    };
                                    local l_status_4, l_result_4 = pcall(function()
                                        return l_gameInfoController_1:updateThumbnailAltText(l_gameId_1, v159);
                                    end);
                                    if not l_status_4 then
                                        if l_result_4 == l_gameInfoController_1.AltTextModerated then
                                            v116:dispatch(v51({
                                                altText = {
                                                    ThumbnailId = v157, 
                                                    Error = "Moderated"
                                                }
                                            }));
                                            l_v138_0 = "Thumbnail alt text was moderated";
                                        end;
                                    elseif l_result_4 ~= nil and l_result_4.MediaAssetAltText ~= v158 then
                                        if v156 == nil then
                                            v156 = table.clone(v118.Settings.Changed.thumbnails);
                                        end;
                                        v156[v157].altText = l_result_4.MediaAssetAltText;
                                    end;
                                    l_v146_0 = l_v146_0 - 1;
                                end)();
                            end;
                            while l_v146_0 > 0 do
                                wait();
                            end;
                            if v156 ~= nil then
                                v116:dispatch(v50("thumbnails", v156));
                            end;
                        end;
                    end;
                    if l_thumbnailOrder_0 ~= l_thumbnailOrder_1 and l_thumbnailOrder_1 ~= nil then
                        for v162, v163 in pairs(l_thumbnailOrder_1) do
                            l_thumbnailOrder_1 = v20.Dictionary.join(l_thumbnailOrder_1, {
                                [v162] = tonumber(v163)
                            });
                        end;
                        l_gameInfoController_1:setThumbnailsOrder(l_gameId_1, l_thumbnailOrder_1);
                    end;
                    if l_v138_0 then
                        error(l_v138_0);
                    end;
                end;
            end;
        end, 
        function()
            local l_gameIcon_0 = v118.Settings.Changed.gameIcon;
            if l_gameIcon_0 ~= nil then
                l_gameInfoController_1:setIcon(l_gameId_1, l_gameIcon_0);
            end;
        end, 
        function()
            if l_shouldShowDevPublishLocations_0() then
                local v165 = v118.Settings.Changed[v65];
                if v165 ~= nil then
                    local v166 = {};
                    local v167 = {};
                    for v168, v169 in pairs(v165) do
                        if not v169.selected then
                            table.insert(v167, v168);
                        else
                            table.insert(v166, v168);
                        end;
                    end;
                    l_gameInfoController_1:setOptInLocations(l_gameId_1, v166, v167);
                end;
            end;
        end
    };
end;
local function v174(v171, v172)
    local l_Errors_0 = v172.Settings.Errors;
    return {
        GameId = if not l_GameSettingsExperienceGuidelines_0 then nil else v171("gameId"), 
        Name = v171("name"), 
        Guidelines = if not l_GameSettingsExperienceGuidelines_0 then nil else v171("guidelines"), 
        Description = v171("description"), 
        Genre = v171("genre"), 
        Devices = v171("playableDevices"), 
        Thumbnails = v171("thumbnails"), 
        ThumbnailOrder = v171("thumbnailOrder"), 
        GameIcon = v171("gameIcon"), 
        OptInLocations = not not l_shouldShowDevPublishLocations_0() and v171(v65) or nil, 
        PlayerAcceptance = not not l_shouldShowDevPublishLocations_0() and v171(v67) or nil, 
        PublishedVersions = not not l_shouldShowDevPublishLocations_0() and v171("publishedVersions") or nil, 
        NameError = l_Errors_0.name, 
        DescriptionError = l_Errors_0.description, 
        DevicesError = l_Errors_0.playableDevices, 
        ThumbnailsError = l_Errors_0.thumbnails, 
        AltTextError = l_Errors_0.altText, 
        GameIconError = l_Errors_0.gameIcon, 
        IsCurrentlyActive = v172.Settings.Current.isActive, 
        OwnerId = v172.GameOwnerMetadata.creatorId, 
        OwnerType = v172.GameOwnerMetadata.creatorType
    };
end;
local function v194(v175, v176)
    return {
        ThumbnailsChanged = function(v177)
            v176(v52("altText"));
            v176(v50("thumbnails", v177));
            if v56.MAX_THUMBNAILS < #v20.Dictionary.keys(v177) then
                v176(v51({
                    thumbnails = "TooMany"
                }));
            end;
        end, 
        GenreChanged = v175("genre"), 
        NameChanged = function(v178)
            v176(v50("name", v178));
            local v179 = utf8.len(v178);
            if not (v179 ~= 0) or string.len((string.gsub(v178, " ", ""))) == 0 then
                v176(v51({
                    name = "Empty"
                }));
                return ;
            else
                if v179 > 50 then
                    v176(v51({
                        name = "TooLong"
                    }));
                end;
                return ;
            end;
        end, 
        DescriptionChanged = function(v180)
            v176(v50("description", v180));
            if utf8.len(v180) > 1000 then
                v176(v51({
                    description = "TooLong"
                }));
            end;
        end, 
        DevicesChanged = function(v181)
            v176(v50("playableDevices", v181));
            for _, v183 in pairs(v181) do
                if v183 then
                    return ;
                end;
            end;
            v176(v51({
                playableDevices = "NoDevices"
            }));
        end, 
        OptInLocationsChanged = function(v184)
            if l_shouldShowDevPublishLocations_0() then
                v176(v50(v65, v184));
            end;
        end, 
        GameIconChanged = v175("gameIcon"), 
        AddThumbnails = function(v185, v186, v187)
            local v188 = v20.Dictionary.join(v186, {});
            local v189 = v20.List.join(v187, {});
            for _, v191 in pairs(v185) do
                local l_v191_TemporaryId_0 = v191:GetTemporaryId();
                table.insert(v189, l_v191_TemporaryId_0);
                v188[l_v191_TemporaryId_0] = {
                    asset = v191, 
                    tempId = l_v191_TemporaryId_0
                };
            end;
            v176(v50("thumbnails", v188));
            v176(v50("thumbnailOrder", v189));
            if v56.MAX_THUMBNAILS < #v189 then
                v176(v51({
                    thumbnails = "TooMany"
                }));
            end;
        end, 
        ThumbnailOrderChanged = function(v193)
            v176(v50("thumbnailOrder", v193));
            if v56.MAX_THUMBNAILS < #v193 then
                v176(v51({
                    thumbnails = "TooMany"
                }));
            end;
        end
    };
end;
local v195 = v18.PureComponent:extend(script.Name);
v195.hasPermissionToEdit = function(v196)
    local l_props_0 = v196.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_OwnerType_0 = l_props_0.OwnerType;
    local v200 = true;
    if l_OwnerType_0 ~= Enum.CreatorType.Group then
        v200 = l_OwnerId_0 == l_StudioService_0:GetUserId();
    end;
    return v200;
end;
local function _(v201)
    if not v201.data or next(v201.data) == nil then
        return false;
    else
        return true;
    end;
end;
v195.init = function(v203)
    v203.state = {};
    v203.addIcons = function()
        local v204 = v55.PromptForGameIcon(v203, v203.props.Localization);
        if v204 then
            v203.props.GameIconChanged(v204);
        end;
    end;
    v203.addThumbnails = function()
        local l_props_1 = v203.props;
        local v206 = v55.PromptForThumbnails(v203, l_props_1.Localization, l_props_1.Dialog.showDialog);
        if v206 then
            v203.props.AddThumbnails(v206, l_props_1.Thumbnails, l_props_1.ThumbnailOrder);
        end;
    end;
    v203.getModerationStatus = function(v207, v208, v209)
        local l_Stylizer_0 = v207.props.Stylizer;
        local l_Localization_0 = v207.props.Localization;
        local v212 = l_Localization_0:getText(v65, "Status");
        local l_TextColor3_0 = l_Stylizer_0.fontStyle.Subtitle.TextColor3;
        local v214 = true;
        if v209 == v68 then
            v212 = v212 .. l_Localization_0:getText(v65, v209 .. v208);
        elseif v209 == v69 then
            v212 = v212 .. l_Localization_0:getText(v65, v69);
        elseif v209 == v70 then
            l_TextColor3_0 = l_Stylizer_0.fontStyle.Error.TextColor3;
            v212 = v212 .. l_Localization_0:getText(v65, v209);
        else
            v214 = false;
        end;
        return {
            statusText = v212, 
            textColor = l_TextColor3_0, 
            show = v214
        };
    end;
    v203.onMouseEnter = function()
        if v203.state.StyleModifier == nil then
            v203:setState({
                StyleModifier = l_StyleModifier_0.Hover
            });
        end;
    end;
    v203.onMouseLeave = function()
        if v203.state.StyleModifier == l_StyleModifier_0.Hover then
            v203:setState({
                StyleModifier = v18.None
            });
        end;
    end;
    v203.getOptInLocationsRequirementsLink = function()
        local l_PublishedVersions_0 = v203.props.PublishedVersions;
        if not not l_PublishedVersions_0.data and next(l_PublishedVersions_0.data) ~= nil then
            l_GuiService_0:OpenBrowserWindow((l_getOptInLocationsRequirementsLink_0(v66)));
        end;
    end;
    v203.createOptInLocationBoxes = function(v216, v217)
        local l_props_2 = v216.props;
        local l_Localization_1 = v216.props.Localization;
        local l_Stylizer_1 = v216.props.Stylizer;
        local v221 = l_props_2[v65];
        local l_PublishedVersions_1 = l_props_2.PublishedVersions;
        local v223 = not not l_PublishedVersions_1.data and next(l_PublishedVersions_1.data) ~= nil;
        l_PublishedVersions_1 = l_calculateTextSize_0(l_Localization_1:getText(v65, "RequirementsLinkText"), 14, "SourceSans");
        local v224 = {};
        local v225 = not v223;
        for v226, v227 in pairs(v221) do
            local l_status_5 = v227.status;
            local l_selected_0 = v227.selected;
            local v230 = v216:getModerationStatus(v226, l_status_5);
            local v231 = not not l_shouldShowDevPublishLocations_0() and l_LayoutOrderIterator_0.new() or nil;
            table.insert(v224, {
                Id = v226, 
                Title = l_Localization_1:getText("General", "Location" .. v226), 
                Selected = l_selected_0, 
                LinkTextFrame = v18.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = v217:getNextOrder(), 
                    Position = UDim2.new(0, 0, 0, l_Stylizer_1.requirementsLink.paddingY), 
                    Size = UDim2.new(1, l_Stylizer_1.extraOptInInfo.length, 0, l_Stylizer_1.extraOptInInfo.height)
                }, {
                    UILayout = v18.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, l_Stylizer_1.extraOptInInfo.padding), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    StatusRequirements = v18.createElement("Frame", {
                        BorderSizePixel = 0, 
                        LayoutOrder = v217:getNextOrder()
                    }, {
                        UILayout = v18.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, l_Stylizer_1.requirementsLink.paddingX), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        ModerationStatus = not not v230.show and v18.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Stylizer_1.fontStyle.Subtext.Font, 
                            LayoutOrder = -1, 
                            Size = UDim2.new(0, l_calculateTextSize_0(v230.statusText, l_Stylizer_1.fontStyle.Subtext.TextSize, l_Stylizer_1.fontStyle.Subtext.Font).X, 0, l_Stylizer_1.fontStyle.Subtext.TextSize), 
                            Text = v230.statusText, 
                            TextColor3 = v230.textColor, 
                            TextSize = l_Stylizer_1.fontStyle.Subtext.TextSize, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }) or nil, 
                        RequirementsFrame = v18.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v217:getNextOrder(), 
                            Size = UDim2.new(0, l_Stylizer_1.requirementsLink.length, 0, l_Stylizer_1.requirementsLink.height)
                        }, {
                            LinkTextLabel = v18.createElement(l_TextLabel_0, {
                                Position = UDim2.new(0, l_PublishedVersions_1.X, 0, 0), 
                                Size = UDim2.new(1, -l_PublishedVersions_1.X, 1, 0), 
                                Style = "Body", 
                                Text = l_Localization_1:getText(v65, "ChinaRequirements"), 
                                TextTransparency = if v223 then nil else 0.5, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Top
                            }), 
                            RequirementsLinkText = v18.createElement(l_LinkText_0, {
                                OnClick = v216.getOptInLocationsRequirementsLink, 
                                Size = UDim2.new(0, l_PublishedVersions_1.X, 0, l_PublishedVersions_1.Y), 
                                Style = "Body", 
                                Text = l_Localization_1:getText(v65, "RequirementsLinkText")
                            })
                        })
                    }), 
                    Warning = not not v225 and v18.createElement("Frame", {
                        BorderSizePixel = 0, 
                        LayoutOrder = v217:getNextOrder()
                    }, {
                        UILayout = v18.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, l_Stylizer_1.optInWarning.padding), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Image = v18.createElement(l_Image_0, {
                            LayoutOrder = v231:getNextOrder(), 
                            Size = UDim2.fromOffset(l_Stylizer_1.optInWarning.size, l_Stylizer_1.optInWarning.size), 
                            Style = "WarningStyle"
                        }), 
                        Text = v18.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Stylizer_1.fontStyle.Smaller.Font, 
                            LayoutOrder = v231:getNextOrder(), 
                            Size = UDim2.new(0, l_calculateTextSize_0(l_Localization_1:getText(v65, "SavedGameWarning"), l_Stylizer_1.fontStyle.Smaller.TextSize, l_Stylizer_1.fontStyle.Smaller.Font).X, 0, l_Stylizer_1.fontStyle.Smaller.TextSize), 
                            Text = l_Localization_1:getText(v65, "SavedGameWarning"), 
                            TextColor3 = l_Stylizer_1.fontStyle.Header.TextColor3, 
                            TextTransparency = l_Stylizer_1.optInWarning.transparency, 
                            TextSize = l_Stylizer_1.fontStyle.Smaller.TextSize, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    }) or nil
                })
            });
            v225 = false;
        end;
        return v224;
    end;
end;
v195.render = function(v232)
    local l_Localization_2 = v232.props.Localization;
    local l_Stylizer_2 = v232.props.Stylizer;
    local v235 = l_LayoutOrderIterator_0.new();
    return v18.createElement(v46, {
        SettingsLoadJobs = v115, 
        SettingsSaveJobs = v170, 
        Title = l_Localization_2:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = function()
            if v232:hasPermissionToEdit() then
                local l_props_3 = v232.props;
                local l_Devices_0 = l_props_3.Devices;
                local l_Dialog_0 = l_props_3.Dialog;
                local v239 = nil;
                local v240 = nil;
                local v241 = nil;
                if l_shouldShowDevPublishLocations_0() then
                    v239 = l_props_3[v65];
                    v240 = not not l_props_3.PlayerAcceptance and l_props_3.PlayerAcceptance or nil;
                    local l_PublishedVersions_2 = l_props_3.PublishedVersions;
                    v241 = not not l_PublishedVersions_2.data and next(l_PublishedVersions_2.data) ~= nil;
                end;
                local v243 = {
                    {
                        Id = "All", 
                        Label = l_Localization_2:getText("General", "GenreAll")
                    }, 
                    {
                        Id = "Adventure", 
                        Label = l_Localization_2:getText("General", "GenreAdventure")
                    }, 
                    {
                        Id = "Tutorial", 
                        Label = l_Localization_2:getText("General", "GenreBuilding")
                    }, 
                    {
                        Id = "Funny", 
                        Label = l_Localization_2:getText("General", "GenreComedy")
                    }, 
                    {
                        Id = "Ninja", 
                        Label = l_Localization_2:getText("General", "GenreFighting")
                    }, 
                    {
                        Id = "FPS", 
                        Label = l_Localization_2:getText("General", "GenreFPS")
                    }, 
                    {
                        Id = "Scary", 
                        Label = l_Localization_2:getText("General", "GenreHorror")
                    }, 
                    {
                        Id = "Fantasy", 
                        Label = l_Localization_2:getText("General", "GenreMedieval")
                    }, 
                    {
                        Id = "War", 
                        Label = l_Localization_2:getText("General", "GenreMilitary")
                    }, 
                    {
                        Id = "Pirate", 
                        Label = l_Localization_2:getText("General", "GenreNaval")
                    }, 
                    {
                        Id = "RPG", 
                        Label = l_Localization_2:getText("General", "GenreRPG")
                    }, 
                    {
                        Id = "SciFi", 
                        Label = l_Localization_2:getText("General", "GenreSciFi")
                    }, 
                    {
                        Id = "Sports", 
                        Label = l_Localization_2:getText("General", "GenreSports")
                    }, 
                    {
                        Id = "TownAndCity", 
                        Label = l_Localization_2:getText("General", "GenreTownAndCity")
                    }, 
                    {
                        Id = "WildWest", 
                        Label = l_Localization_2:getText("General", "GenreWestern")
                    }
                };
                local v244 = l_getSocialMediaReferencesAllowed_0();
                local v245 = v18.createElement(l_BulletList_0, {
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Items = {
                        if not v244 then l_Localization_2:getText("General", "ThumbnailsLimitLuobu", {
                            maxThumbnails = v56.MAX_THUMBNAILS
                        }) else l_Localization_2:getText("General", "ThumbnailsLimit", {
                            maxThumbnails = v56.MAX_THUMBNAILS
                        }), 
                        l_Localization_2:getText("General", "ThumbnailsHint", {
                            fileTypes = table.concat(v56.IMAGE_TYPES, ", ")
                        }), 
                        l_Localization_2:getText("General", "ThumbnailsModeration")
                    }
                });
                local v246 = nil;
                if not (not l_props_3.NameError or not v12[l_props_3.NameError]) then
                    v246 = l_Localization_2:getText("General", v12[l_props_3.NameError]);
                end;
                local v247 = nil;
                if not (not l_props_3.DescriptionError or not v13[l_props_3.DescriptionError]) then
                    v247 = l_Localization_2:getText("General", v13[l_props_3.DescriptionError]);
                end;
                local v248 = nil;
                if not (not l_props_3.GameIconError or not v14[l_props_3.GameIconError]) then
                    v248 = l_Localization_2:getText("General", v14[l_props_3.GameIconError]);
                end;
                local v249 = nil;
                if not (not l_props_3.ThumbnailsError or not v14[l_props_3.ThumbnailsError]) then
                    v249 = l_Localization_2:getText("General", v14[l_props_3.ThumbnailsError]);
                end;
                local v250 = nil;
                if not ((not l_props_3.AltTextError or not l_props_3.AltTextError.Error) or not v15[l_props_3.AltTextError.Error]) then
                    v250 = l_Localization_2:getText("General", v15[l_props_3.AltTextError.Error]);
                end;
                local v251 = nil;
                if l_props_3.DevicesError then
                    v251 = l_Localization_2:getText("General", "ErrorNoDevices");
                end;
                genrePaneSizeOverflowX = 8;
                local v254 = {
                    GenreInfo = if l_StudioGenreOverhaulInfo_0 then v18.createElement(l_Pane_0, {
                        LayoutOrder = v235:getNextOrder(), 
                        Size = UDim2.new(1, genrePaneSizeOverflowX, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Layout = Enum.FillDirection.Horizontal, 
                        Spacing = l_Stylizer_2.genreInfo.imageTextGap, 
                        BackgroundColor3 = l_Stylizer_2.genreInfo.paneBackgroundColor, 
                        BorderColor3 = l_Stylizer_2.genreInfo.paneBorderColor, 
                        BorderSizePixel = l_Stylizer_2.genreInfo.paneBorderSize
                    }, {
                        UIPadding = v18.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, l_Stylizer_2.genreInfo.panePadding), 
                            PaddingBottom = UDim.new(0, l_Stylizer_2.genreInfo.panePadding), 
                            PaddingLeft = UDim.new(0, l_Stylizer_2.genreInfo.panePadding), 
                            PaddingRight = UDim.new(0, l_Stylizer_2.genreInfo.panePadding + genrePaneSizeOverflowX)
                        }), 
                        InfoIcon = v18.createElement("Frame", {
                            Size = UDim2.fromOffset(l_Stylizer_2.genreInfo.imageSize, l_Stylizer_2.genreInfo.imageSize), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = v235:getNextOrder()
                        }, {
                            Padding = v18.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 2), 
                                PaddingBottom = UDim.new(0, 2), 
                                PaddingLeft = UDim.new(0, 2), 
                                PaddingRight = UDim.new(0, 2)
                            }), 
                            Image = v18.createElement(l_Image_0, {
                                Size = UDim2.new(1, 0, 1, 0), 
                                Image = l_Stylizer_2.genreInfo.image
                            })
                        }), 
                        TextBox = v18.createElement(l_Pane_0, {
                            Layout = Enum.FillDirection.Vertical, 
                            LayoutOrder = v235:getNextOrder(), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left
                        }, {
                            Text = v18.createElement(l_TextLabel_0, v20.Dictionary.join(l_Stylizer_2.genreInfo.BodyBodyDefault, {
                                LayoutOrder = v235:getNextOrder(), 
                                Text = l_Localization_2:getText("General", "GenreOverhaulInfo"), 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextWrapped = true
                            })), 
                            LinkText = v18.createElement(l_LinkText_0, v20.Dictionary.join(l_Stylizer_2.genreInfo.BodyBodyDefault, {
                                LayoutOrder = v235:getNextOrder(), 
                                OnClick = function()
                                    l_GuiService_0:OpenBrowserWindow(l_game_FastString_0);
                                end, 
                                Text = l_Localization_2:getText("General", "GenreOverhaulMessageLink")
                            }))
                        })
                    }) else nil, 
                    Name = v18.createElement(l_TitledFrame_0, {
                        LayoutOrder = v235:getNextOrder(), 
                        Title = l_Localization_2:getText("General", "TitleName")
                    }, {
                        TextBox = v18.createElement(l_TextInput_0, {
                            Disabled = l_props_3.Name == nil, 
                            ErrorText = v246, 
                            MaxLength = 50, 
                            OnTextChanged = l_props_3.NameChanged, 
                            Text = l_props_3.Name or ""
                        })
                    }), 
                    Description = v18.createElement(l_TitledFrame_0, {
                        LayoutOrder = v235:getNextOrder(), 
                        Title = l_Localization_2:getText("General", "TitleDescription")
                    }, {
                        TextBox = v18.createElement(l_TextInput_0, {
                            Disabled = l_props_3.Description == nil, 
                            ErrorText = v247, 
                            MaxLength = 1000, 
                            MultiLine = true, 
                            OnTextChanged = l_props_3.DescriptionChanged, 
                            Height = 130, 
                            Text = l_props_3.Description or ""
                        })
                    }), 
                    Separator = v18.createElement(l_Separator_0, {
                        LayoutOrder = v235:getNextOrder()
                    }), 
                    Guidelines = if not l_GameSettingsExperienceGuidelines_0 then nil else v18.createElement(v25, {
                        LayoutOrder = v235:getNextOrder(), 
                        GameGuideline = l_props_3.Guidelines, 
                        GameId = l_props_3.GameId
                    }), 
                    Separator2 = if not l_GameSettingsExperienceGuidelines_0 then nil else v18.createElement(l_Separator_0, {
                        LayoutOrder = v235:getNextOrder()
                    }), 
                    Icon = v18.createElement(v45, {
                        Title = l_Localization_2:getText("General", "TitleGameIcon"), 
                        LayoutOrder = v235:getNextOrder(), 
                        Enabled = l_props_3.GameIcon ~= nil, 
                        Icon = l_props_3.GameIcon, 
                        TutorialEnabled = true, 
                        AddIcon = v232.addIcons, 
                        ErrorMessage = v248
                    }), 
                    Separator3 = v18.createElement(l_Separator_0, {
                        LayoutOrder = v235:getNextOrder()
                    }), 
                    Thumbnails = v18.createElement(l_MultiImagePicker_0, {
                        LayoutOrder = v235:getNextOrder(), 
                        Enabled = l_props_3.Thumbnails ~= nil, 
                        Thumbnails = l_props_3.Thumbnails, 
                        Order = l_props_3.ThumbnailOrder, 
                        Notes = v245, 
                        IsVideoAllowed = v244, 
                        AddThumbnail = v232.addThumbnails, 
                        ErrorMessage = v249, 
                        ThumbnailsChanged = l_props_3.ThumbnailsChanged, 
                        ThumbnailOrderChanged = l_props_3.ThumbnailOrderChanged, 
                        AltTextError = {
                            ThumbnailId = if not l_props_3.AltTextError then nil else l_props_3.AltTextError.ThumbnailId, 
                            ErrorMessage = v250
                        }
                    }), 
                    Separator4 = v18.createElement(l_Separator_0, {
                        LayoutOrder = v235:getNextOrder()
                    }), 
                    Genre = if not l_StudioGenreOverhaulInfo_0 then if l_StudioGenreOverhaulPlaceholder_0 then v18.createElement(l_TitledFrame_0, {
                        LayoutOrder = v235:getNextOrder(), 
                        Title = l_Localization_2:getText("General", "TitleGenre")
                    }, {
                        Body = v18.createElement(l_TextWithInlineLink_0, {
                            OnLinkClicked = function()
                                l_GuiService_0:OpenBrowserWindow(l_game_FastString_0);
                            end, 
                            Text = l_Localization_2:getText("General", "GenreOverhaulMessageBody"), 
                            LinkText = l_Localization_2:getText("General", "GenreOverhaulMessageLink"), 
                            LinkPlaceholder = "[link]", 
                            MaxWidth = l_Stylizer_2.textWithInlineLink.maxWidth, 
                            TextProps = v20.Dictionary.join(l_Stylizer_2.fontStyle.Smaller, {
                                BackgroundTransparency = 1, 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextYAlignment = Enum.TextYAlignment.Top
                            }), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left
                        })
                    }) else v18.createElement(l_TitledFrame_0, {
                        LayoutOrder = v235:getNextOrder(), 
                        Title = l_Localization_2:getText("General", "TitleGenre")
                    }, {
                        Selector = v18.createElement(l_SelectInput_0, {
                            Items = v243, 
                            Enabled = l_props_3.Genre ~= nil, 
                            SelectedId = l_props_3.Genre, 
                            OnItemActivated = function(v252)
                                l_props_3.GenreChanged(v252.Id);
                            end
                        })
                    }) else nil, 
                    Separator5 = if not l_StudioGenreOverhaulInfo_0 then v18.createElement(l_Separator_0, {
                        LayoutOrder = v235:getNextOrder()
                    }) else nil, 
                    Devices = v18.createElement(v44, {
                        Title = l_Localization_2:getText("General", "TitleDevices"), 
                        LayoutOrder = v235:getNextOrder(), 
                        Boxes = {
                            {
                                Id = "Computer", 
                                Title = l_Localization_2:getText("General", "DeviceComputer"), 
                                Selected = not not l_Devices_0 and l_Devices_0.Computer
                            }, 
                            {
                                Id = "Phone", 
                                Title = l_Localization_2:getText("General", "DevicePhone"), 
                                Selected = not not l_Devices_0 and l_Devices_0.Phone
                            }, 
                            {
                                Id = "Tablet", 
                                Title = l_Localization_2:getText("General", "DeviceTablet"), 
                                Selected = not not l_Devices_0 and l_Devices_0.Tablet
                            }, 
                            {
                                Id = "Console", 
                                Title = l_Localization_2:getText("General", "DeviceConsole"), 
                                Selected = not not l_Devices_0 and l_Devices_0.Console
                            }, 
                            if not l_StudioEnableVRToggle_0 then nil else {
                                Id = "VR", 
                                Title = l_Localization_2:getText("General", "DeviceVR"), 
                                Selected = not not l_Devices_0 and l_Devices_0.VR
                            }
                        }, 
                        Enabled = l_Devices_0 ~= nil, 
                        ErrorMessage = v251, 
                        EntryClicked = function(v253)
                            if (not (not (l_RemoveVRToggleDialog2_0 or not l_StudioEnableVRToggle_0) and v253.Id == "VR") or v253.Selected) or l_Dialog_0.showDialog(v47, {
                                Size = Vector2.new(600, 308), 
                                Title = l_Localization_2:getText("VRPrompt", "Title"), 
                                Header = l_Localization_2:getText("VRPrompt", "Header"), 
                                Entries = {
                                    l_Localization_2:getText("VRPrompt", "DialogItem1"), 
                                    l_Localization_2:getText("VRPrompt", "DialogItem2"), 
                                    l_Localization_2:getText("VRPrompt", "DialogItem3"), 
                                    l_Localization_2:getText("VRPrompt", "DialogItem4")
                                }, 
                                Buttons = {
                                    l_Localization_2:getText("General", "ReplyDisagree"), 
                                    l_Localization_2:getText("General", "ReplyAgree")
                                }
                            }):await() then
                                l_props_3.DevicesChanged((v20.Dictionary.join(l_Devices_0, {
                                    [v253.Id] = not not v253.Selected and v20.None or not v253.Selected
                                })));
                                return ;
                            else
                                return ;
                            end;
                        end
                    }), 
                    Separator6 = not not l_shouldShowDevPublishLocations_0() and v18.createElement(l_Separator_0, {
                        LayoutOrder = v235:getNextOrder()
                    }) or nil
                };
                local v255;
                if l_shouldShowDevPublishLocations_0() then
                    v255 = v18.createElement;
                    local l_v44_0 = v44;
                    local v257 = {
                        Title = l_Localization_2:getText("General", "TitleOptInLocations"), 
                        LayoutOrder = v235:getNextOrder(), 
                        Boxes = v232:createOptInLocationBoxes(v235), 
                        ShowWarning = not v241
                    };
                    local v258 = false;
                    if v239 ~= nil then
                        v258 = v241;
                    end;
                    v257.Enabled = v258;
                    v257.EntryClicked = function(v259)
                        local v260 = {
                            Size = Vector2.new(l_Stylizer_2.dialog.size.width, l_Stylizer_2.dialog.size.height), 
                            Title = "", 
                            Header = l_Localization_2:getText("General", "TermsDialogHeader"), 
                            Buttons = {
                                l_Localization_2:getText("General", "ReplyOK")
                            }, 
                            Body = v18.createElement(l_TextWithInlineLink_0, {
                                OnLinkClicked = function()
                                    l_GuiService_0:OpenBrowserWindow((l_getPlayerAppDownloadLink_0(v66)));
                                end, 
                                Text = l_Localization_2:getText("General", "TermsDialogBody"), 
                                LinkText = l_Localization_2:getText("General", "TermsDialogBodyLink"), 
                                LinkPlaceholder = "[link]", 
                                MaxWidth = l_Stylizer_2.textWithInlineLink.maxWidth, 
                                TextProps = v20.Dictionary.join(l_Stylizer_2.fontStyle.Normal, {
                                    BackgroundTransparency = 1
                                })
                            })
                        };
                        if v240 then
                            local v261 = l_deepJoin_0(v239, {
                                [v259.Id] = {
                                    selected = not v259.Selected
                                }
                            });
                            l_sendAnalyticsToKibana_0(v71, l_game_FastInt_0, v72, {
                                [v65] = v259.Id, 
                                [v73] = not v259.Selected
                            });
                            l_props_3.OptInLocationsChanged(v261);
                            return ;
                        else
                            l_Dialog_0.showDialog(v48, v260):await();
                            l_sendAnalyticsToKibana_0(v71, l_game_FastInt_0, v74, {
                                [v75] = true
                            });
                            return ;
                        end;
                    end;
                    v257.Tooltip = v18.createElement(l_Image_0, {
                        Size = UDim2.fromOffset(l_Stylizer_2.tooltipIcon.size, l_Stylizer_2.tooltipIcon.size), 
                        Position = UDim2.new(0, l_Stylizer_2.tooltipIcon.paddingX, 0, l_Stylizer_2.tooltipIcon.paddingY), 
                        Style = "TooltipStyle", 
                        StyleModifier = v232.state.StyleModifier
                    }, {
                        v18.createElement(l_Tooltip_0, {
                            Text = l_Localization_2:getText(v65, "Tooltip")
                        }), 
                        v18.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand", 
                            MouseEnter = v232.onMouseEnter, 
                            MouseLeave = v232.onMouseLeave
                        })
                    });
                    v255 = v255(l_v44_0, v257);
                    if v255 then
                        goto label0;
                    end;
                end;
                v255 = nil;
                ::label0::;
                v254.OptInLocations = v255;
                return v254;
            else
                return {
                    InsufficientPermission = v18.createElement(v49)
                };
            end;
        end
    });
end;
v195 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Dialog = v24, 
    Mouse = l_ContextServices_0.Mouse
})(v195);
local v262 = require(l_Parent_1.Src.Networking.settingFromState);
v195 = v19.connect(function(v263, _)
    if v263 then
        return (v174(function(v265)
            return v262(v263.Settings, v265);
        end, v263));
    else
        return ;
    end;
end, function(v266)
    return (v194(function(v267)
        return function(v268)
            v266(v50(v267, v268));
        end;
    end, v266));
end)(v195);
v195.LocalizationId = l_Name_0;
return v195;
